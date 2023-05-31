Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CED3C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j4nc3W4SI7d/HcZGsXX157wdAbHs0EiK5je8w50UqyQ=; b=upJsiaYv0IGBBw6vWwEAe61iWz
	Y8LkYxwo2LjKcNP4UORzOaGAHerPxWYfclEaQFKLzt9ZAawME9cJpTRoiBaumd95b4kAb+NSKvtms
	hIVEUf95HZoRCDT8UKSy2SPuyWco4fW7tjLT+Z6vO+5RKbjV0zC1TK4iZ5smzyDwLnnLHzLvfSu8f
	DhOkgV2ibHahMogPMr9JwI+Tz5p9+Dv2V0WUX5/kFO6fgDPbS8YPTcJSL/c0d6Z/zipHwS+akUUcO
	4p7rNZn5SFhaLSJvaBDoVn4cnabLUARXqHV13hw7XOfJwAxgJP5HgWdgQDMq/DSQhM1aIihsxf6v9
	p9IwrpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GVV-00GUZu-0J;
	Wed, 31 May 2023 07:44:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GVS-00GUXi-1x
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 07:44:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b011cffef2so47911345ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685519067; x=1688111067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4nc3W4SI7d/HcZGsXX157wdAbHs0EiK5je8w50UqyQ=;
        b=NTvt2q5xE99luFijzCiaKdgrJpfmjmv65/TgTQck8seI3zdcz2O0+d9d53gBoulgmj
         Q8azOkszB+GhpKVJetOCb7uT9OpHB9aVghwW3gzcvys8enS9ICkccqD40EXLgB+d38pR
         jxLv1bnFxJGe4RkAm8TUbfUH1kXV4ms5fTYDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519067; x=1688111067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4nc3W4SI7d/HcZGsXX157wdAbHs0EiK5je8w50UqyQ=;
        b=MLM7DNNKDqbPyC6q8a3JAyVRMx9sEdZPke3hLhwwGD2Dm/ugrtSCe+h5zl8bzoFU9x
         lV+6QoE3cw4zfWgIqqreEYbuowP1rB+oMObv0jEuoQmM1ot6lHXTHbiD/0IJShBe2Nrz
         eRbuunES9BfFRMG2WpD6b8WZZkLhpxXX//r5NR20uus82WKAYSE2EGHL2ljaWPmYBlSe
         4jlx9//y+8G76L42/6tCMi6E2dfqpyt9EmysFVbkTYzxFCRqEFBbRdy65ozaQUhBp9dn
         9SSjIy4/6Czv4+WsGjdDiYRCxmURysaz43Z37HfLwf+cvciaU0Xgr2jbNmsHbWvPPcSs
         aeQw==
X-Gm-Message-State: AC+VfDyA50tU9zUQguPazFjCW8x2LXImghZiGKCuE2cuNHpSv7EOcJsf
	kyX4N5y+wFrlQEG6FZoQPUYNGg==
X-Google-Smtp-Source: ACHHUZ5zzqgCNrh8XTUiFC/pDJbMydQ/sOdQ8Cgd8+eUrRvEpiSm6wVHUrcKlPo0bdwkNGNG4NPCUA==
X-Received: by 2002:a17:902:ecc2:b0:1a6:a405:f714 with SMTP id a2-20020a170902ecc200b001a6a405f714mr5385355plh.63.1685519067154;
        Wed, 31 May 2023 00:44:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:fbde:7ab0:3462:1188])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d48300b001b050db1894sm647616plg.36.2023.05.31.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 00:44:26 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH stable 6.3] arm64: dts: mediatek: mt8183: kukui: Add scp firmware-name
Date: Wed, 31 May 2023 15:42:44 +0800
Message-ID: <20230531074421.888652-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_004430_649335_63A1EDCF 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 63952c1251dfd..7b2b175370443 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -822,6 +822,8 @@ &pwm0 {
 
 &scp {
 	status = "okay";
+
+	firmware-name = "mediatek/mt8183/scp.img";
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
 
-- 
2.41.0.rc0.172.g3f132b7071-goog


