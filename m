Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267DEC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B4PWewLwFvhPgA/g5BiED2BT3HTWS9F6JCR/JU66we8=; b=dDO9ZJTqi6vGuTiRAHXSBVeVsE
	pdg/JVxNJEmfXXW25CBri9WxqjsPoIOS41rh0C+RIkcz+Yq4fD6R7DNOrK/s5s7w2yPzPwXq5r9CN
	EcX+aLX4Y1l1axlGMCh2T0XsxpyNk7y3JvD3Af9lBNeAkzSSHFyY0GTf4PkFII066vfOvH8CQM7bx
	k+fAyoFOUE9nZh9MKP77X71L/Z5DPak8/oVMRvw5xU9BgRZk/7nMqQpuF06iWH0n6k2umYQjd5dYU
	w4vAhTi5cn1INA87CsMNl3n1PgqYfEgRzd0wL4tQpGNrfWzgHKm7YPhmi8uYzY9/ne8oZJeJzoG2l
	KR4AhaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApta-00EYaF-Ue; Thu, 29 Dec 2022 10:12:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAptU-00EYQ1-Pp
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 10:12:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id n12so5857171pjp.1
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4PWewLwFvhPgA/g5BiED2BT3HTWS9F6JCR/JU66we8=;
        b=B2DleHZVuSPcPWUD6oNq/HUS5bmKzL6BhQnqqL7ca9taihBXoh0DILjADWG3L2BlpK
         BTqGS/gjbNVA2mYiiPs7IhFKkmdBDJeMZILTB2K7RYRZKVPX3lNoYpbTHK/5Bzyonqtq
         TcPVME6rlp60Evj+hS6NC23sn7m0bBwC3LCss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4PWewLwFvhPgA/g5BiED2BT3HTWS9F6JCR/JU66we8=;
        b=Xj5+YghlksWMv66HIpdo9rzyjadySnvKu8d0k46+BrYId1LQoQmOk/cKoS5YDRmYDC
         g2F1jRatlOUTruOA0X2WAHjBdnWWgTiAs1O84OlQLB1XlMZku8mmi0XZR7sWB4Ci9o0a
         +OCjxbNVIDi1zeBRRi8oHDw4N3vXd4DC7bI6WW7RO9yXMH4weBYj/pRZU4r/cZmZcgUg
         eYqHSmy0DMNFRvVTkdC6z0T7TrMvrQeaF26cI3xrmZWWslsnopXtth7wNNad0Egm5hah
         K77qthVqGpFN7cTvf7iXAI0/yvaao/J9LIbUeyBr0xrEdNA7SNBx8aE7I3K6sSxlFi4+
         U/KQ==
X-Gm-Message-State: AFqh2krSfvSS0b+RREzqw216uNLEYfsY7ZqLrSLJ4NgRqou99Y8k8Z/L
	1HZMjFHSC8WhrQuivsCp5+5YpA==
X-Google-Smtp-Source: AMrXdXulMdiJqi+NjL53qAm03R3ExKKI+u/w+sYEV2B+ek9/J9EZBWk6aaRKiZ+Bn8BrTgjyt6X8/w==
X-Received: by 2002:a17:90a:bd11:b0:225:b29f:42 with SMTP id y17-20020a17090abd1100b00225b29f0042mr31599271pjr.14.1672308726759;
        Thu, 29 Dec 2022 02:12:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4f78:5286:f0f2:c795])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a09a100b00225f49bd4b6sm6072516pjo.36.2022.12.29.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 02:12:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2] arm64: dts: mediatek: mt8192: Mark scp_adsp clock as broken
Date: Thu, 29 Dec 2022 18:12:02 +0800
Message-Id: <20221229101202.1655924-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_021213_140593_D493B300 
X-CRM114-Status: GOOD (  10.01  )
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
Changes since v1:
- Changed "broken" to "fail"
- Rebased onto v6.2-rc1 plus v6.2-tmp/* from mediatek repo

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index dd618c563e8a..ef4fcefa2bfc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -644,6 +644,8 @@ scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8192-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
 			#clock-cells = <1>;
+			/* power domain dependency not upstreamed */
+			status = "fail";
 		};
 
 		uart0: serial@11002000 {
-- 
2.39.0.314.g84b9a713c41-goog


