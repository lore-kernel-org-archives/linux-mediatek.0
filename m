Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C408C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6AdrG61fFuk3qFrjsmnmW/v2lHEYSKDOmlc3Uttj2I=; b=ylCFu7JUj3Xjq2reBVOdDEYMKF
	smmSIyzq61B6Tqg5OuP1bkOGOS7c9FHe3oC99g7dirlCnSwbe9/H61jhN/YwP4MlrHiBd+5PNAGDW
	36+Ms6IvUvbE1zlCQLz+uDB9j/kqhzrmWBR8DAQ7Auc0TXvvylor4dh5eo3x/aeA7aLX3vn70GCdH
	b/gsr33WmqduNRhNVNHozCUoBiKK2H8W5IKLirWUzE/EsNw4yv0x17onSar1f/TZq+rJxg9lKBwGL
	dVIikw761HJqO33vaTGMpKze/WS/9nP5WxV42u7X8XJDWoUGuMCYrNLSqoT3ADZkpg6mr0Aviecv6
	5HhpCEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8Ra-00FS03-Tr; Wed, 05 Oct 2022 17:44:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RP-00FRuE-R6; Wed, 05 Oct 2022 17:44:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id j7so21660598wrr.3;
        Wed, 05 Oct 2022 10:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=J6AdrG61fFuk3qFrjsmnmW/v2lHEYSKDOmlc3Uttj2I=;
        b=jiMuHvxyLhrd3kGwgfpUsnOt7hf+tBiYex6HV/Mo3+9CfzkqQDf6kj0FOvI6w7IOgx
         8rOazqdOFH/IK4kOu/nGAE0Gwd6tz9zqFRiK5SfaUIJXNPBb+cLIiRxK/dzP8zBDbTh0
         bmJ+RXjS9uoWTvXUf6lO8s7sgUeuSv5Q/CzCWgz4PuqV+33o4K14FqNUgpr5tuaGFjwD
         9rRwMirpE+krkiGstEYsvIXsCx1PSUOdPjdDtnA1aNLOvgETT45mqxJRkjIucnOTEr7r
         HS1oYEmDw5gNgzR4CYmaL+LIiOyijjWsOWxkmgiROpWTPe/B7erVlKS7bcDDlOvOR1Yh
         +pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=J6AdrG61fFuk3qFrjsmnmW/v2lHEYSKDOmlc3Uttj2I=;
        b=6k9wVFgTGndWN7SCRc3MlZY0Ecg6iZCtys4Id3Mms+WqRSgSOMRq6YGvTdW9q9tCQ8
         Ee5GX/9a9a8mCv8aLEdjbT68Yi03A2P4Xn8VPBiqikFv54/f+9H5ZUf597vcVO3M+tBB
         i3YsFxP37Gwl+a4b07chqrVVJvHVDoAVjoUeZeifd66XQsWoif5YsOxxjtucduCAaosN
         WECjsAPIy1AKvW5BKqEnvll5KoxHFJr3S2fI70HrdDnBBJyjTfAvURuWtQi1MZIyNR/J
         ooaP36yu97OC8Tip6HepZ3+SMEJC5UmVl2kEiODGqSEChsc+N3GExF89c91xS7gRJbGB
         SUpA==
X-Gm-Message-State: ACrzQf1M8nEo5hnOMN6cx6/gjE2FbttN+Exk49Vm7z9lQX43MbmtC/9Z
	t2+/RNBZncW/LrWUrj+jaL0=
X-Google-Smtp-Source: AMsMyM7LORL+FOnuDtH5sB3TJMSNlDx7UAQ83NOa0L/mNBleJUp+Cs/QLwJCYNTum2QiG1rzKE0y+A==
X-Received: by 2002:a5d:474b:0:b0:22e:3180:f748 with SMTP id o11-20020a5d474b000000b0022e3180f748mr520389wrs.504.1664991856242;
        Wed, 05 Oct 2022 10:44:16 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:15 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] arm64: dts: mediatek: mt6779: Remove syscon compatible from pin controller
Date: Wed,  5 Oct 2022 20:43:34 +0300
Message-Id: <20221005174343.24240-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104419_897174_9866FD3D 
X-CRM114-Status: GOOD (  15.24  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Remove syscon compatible string from pin controller to follow
DT bindings and pass checks. Adding the syscon compatible to
the DT bindings documentation instead causes a different check
error due to the syscon document specifying a maximum of 1 item
in the reg property, while this has 9. Nothing is using the pin
controller as a syscon at the moment so it should be a safe
thing to do.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 9bdf5145966c..a6fa5212da4e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -160,7 +160,7 @@ infracfg_ao: clock-controller@10001000 {
 		};
 
 		pio: pinctrl@10005000 {
-			compatible = "mediatek,mt6779-pinctrl", "syscon";
+			compatible = "mediatek,mt6779-pinctrl";
 			reg = <0 0x10005000 0 0x1000>,
 			      <0 0x11c20000 0 0x1000>,
 			      <0 0x11d10000 0 0x1000>,
-- 
2.38.0


