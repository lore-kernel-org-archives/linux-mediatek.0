Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E17C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 03:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xnw6MILr6W2VKVd3Jp7ZUysLH8fGhtVKg7zkvqQm4t4=; b=N6o8lMLrpX6eNIQZeN3AcNc0C0
	LyjFC9+e4AJ6/OZGvz6sIOeB1CpVJiXn4rii01E4EO3fECdB+dNYC/aYN9ReKOKiB03ZzuXFYsXnS
	h2yFjJcz72AeSzW5KOycgWZvGdOZXomiRPYVxXP7zrr1ah4j8Ux2BMdG+bdp5GlWrQp1xiLBjE34u
	HlDXJZok4YlSzfLyZX0HhnBMmgMe5NVRxQfSwyEjNfAt2EOqCOrUXNDZhdjiNgzb9WzwKoOI4Ghph
	43DUx9j5rw/XDl01apThWY9QT4Gj3ejcCZ0lrD27Nuqorp23Nz2timamqK1aAPW55F6McwlJn+d4m
	RPdNY9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Dbo-00CUHO-5J; Wed, 30 Nov 2022 03:18:04 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Dbd-00CUD1-0U
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 03:17:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so668630pjp.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 19:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xnw6MILr6W2VKVd3Jp7ZUysLH8fGhtVKg7zkvqQm4t4=;
        b=bRhKhWobAh4lRjLZ/Vft0dJoKCd6KIEgvIe+0eYUS+mdCP3ZyjWxtBx6+sspQjs/cl
         HYQI6Y8koUdlZ92rYxh8dxf8QdDwPECI3MJ73eaoQ0gj2NzBrBoNI12oKn1hsI49U54g
         TJDjxFDg2LPeV9U60npgw73PtV18wfwxBPMf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xnw6MILr6W2VKVd3Jp7ZUysLH8fGhtVKg7zkvqQm4t4=;
        b=HeQtT6PmyZmS+QIHteRsTarB2qMkbxiZaqe/uekrpCpN2mtbn52Y/KQY6zIpBPVhWE
         LLly/WKz0G5TBvUH/7Jfd+w5RIObB9buyBZUYPjaRAAoDqhcCAiI8nXjCO9fD9x30y5x
         3YO6V4SmnSYMUSnrFrc7999KYsRvlEcCy3XHjMiS0u5lzcn2cxHuOfk8P/o9uJ1pd4tN
         dr+/R++MSg48FoqYsCzM2khIJRPja31S9ugBuaIm3dvvhl2HC3NOt89IiS2JjXbtWTGm
         m9+LoBmphLMGXgcGAsAeIpqD6kjlcbR05PeMpGkX5F1wU7TV2FtjsH4Ha6PZIf8SNC0O
         J5Vg==
X-Gm-Message-State: ANoB5pkxghvhqiEeo0k/OXy85SHNkNfZt1C1ZD+dIu4coz5fQCQH0sz2
	qkEsGPGhafuscEByNLeHqPUqmw==
X-Google-Smtp-Source: AA0mqf75iEv1cvE44fzlVJSZmOtOaAJ1uldMqzY5I4PqRRATBV8mNJueKUPwyw2/lZIlkd2A/7APAA==
X-Received: by 2002:a17:90b:3687:b0:219:468e:88ac with SMTP id mj7-20020a17090b368700b00219468e88acmr9351959pjb.105.1669778269941;
        Tue, 29 Nov 2022 19:17:49 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5acc:e86b:9bc6:1770])
        by smtp.gmail.com with ESMTPSA id 135-20020a62148d000000b00528a097aeffsm212329pfu.118.2022.11.29.19.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 19:17:49 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH resend] arm64: dts: mediatek: mt8192: Mark scp_adsp clock as broken
Date: Wed, 30 Nov 2022 11:17:41 +0800
Message-Id: <20221130031741.3176853-1-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_191753_060019_625AC7EE 
X-CRM114-Status: GOOD (  10.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The scp_adsp clock controller is under the SCP_ADSP power domain. This
power domain is currently not supported nor defined.

Mark the clock controller as broken for now, to avoid the system from
trying to access it, and causing the CPU or bus to stall.

Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 6b20376191a7..ef91941848ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -575,6 +575,8 @@ scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8192-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
 			#clock-cells = <1>;
+			/* power domain dependency not upstreamed */
+			status = "broken";
 		};
 
 		uart0: serial@11002000 {
-- 
2.37.3.968.ga6b4b080e4-goog


