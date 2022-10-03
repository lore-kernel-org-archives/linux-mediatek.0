Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667BAC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRoV6A325jxyR0HUM0rid5flyQf24IUrJ3Inww/M+Wk=; b=mwXm1IMjEb8y7wRui1UTGev3nR
	Lgi+KJ++pykO8CPA6NAPjIU7AZwKwJVII2s+ggB7hdEddIVT1g9AmJYnsQHRn8c8SJ8vNiX4I8diQ
	7aDkz70/3sqSbFJgy8e24FuiAWrBloelTOM7422pgrMkhLtYdSr95PmDx96XHoSiGTfkn0WrCywKd
	NCBeHFJgeowgfJtMqJt23cScu4lhraBKKgB0iq+NrJjio9K6daPOyHRt6k569uWNC/TDq23+Ycif4
	ffJX53yH04G33A5AmaPnIjOEmb0UPhIp3SPWrb3+DD/zX3vQYCaXk79/YCXLrWqYy/w6Kq5TamjyB
	6FiwOlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBaV-003Ynh-Uj; Mon, 03 Oct 2022 02:53:47 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBaK-003YmA-K8; Mon, 03 Oct 2022 02:53:38 +0000
Received: by mail-pf1-x430.google.com with SMTP id q7so1480216pfl.9;
        Sun, 02 Oct 2022 19:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=yRoV6A325jxyR0HUM0rid5flyQf24IUrJ3Inww/M+Wk=;
        b=mC/tlH/od72vvEWCug16uB+p+mC/v9flmy8QouWf5WlJDCV4k/OSTOHVthCQTb2O4v
         P/e0kjUbKCaBcsps2Q0eagT6xASS+YrHHI1XguzRqarzXunDXUa9avKG7POG/wnFU4AE
         ub3F6E9dsanzvI4r3bs/kvOZk7bEsg0V4awqSuovrmQKJ8964UQfvHbP8j/nTt2SLNHI
         0e/R/xPZIYexOkEVcp3asEqcqswBCijrOjJKy6LUGysBWpPjYxBoy4r8rL7q3ch+WuNp
         Rczs0+1GYmAqdRNfZvb429g/KF7hpenaTIkty7b3Zdq7HoURF0kpQtLVHyGBH8sM+sSt
         r4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=yRoV6A325jxyR0HUM0rid5flyQf24IUrJ3Inww/M+Wk=;
        b=Xv6sMw8Mx/SDQNvWs5o+cuGaXnxhIDUuSM1tZyyxkQQogVKVvsGFTEXqdN7khZysNi
         nojg3BfYa6ZSJiI0nu+uPW3pGqdKMtyzxaJK5LfpRpUjD7jyDQGitWt6LGwO+mFUS6hd
         iE/zw6Watj4rnoGHRz/judHIFey0lMjpJfnyZwr5PhfLdtsI++5gxSlYKJSlydzcsw1u
         eisATmd/jDDslAIdAsebh4RlrGa1GAduSMdpNOUU+lamR0u2dlwv4IFs9X3CE0e13Z9E
         G+kV2hpIWkBvHp3YyUc1DUr03UHkzgIYLAVm6mZ+BlQPsQlhEd33iZhjxZZ2nED9kQcX
         5v9w==
X-Gm-Message-State: ACrzQf1iDbxwmOCVnp5iBiCsh/jsJKYxv5qEYy2SftCMmfZLwquLEPJv
	wESMPmiNod8CLJ243DbjxYI=
X-Google-Smtp-Source: AMsMyM5cz6ZSFrhw9ZwKW64dwhaVwMVsudyg92p4ufDExrZg6uiHa6FJgtClHGDAyfVFCz0oL0QEnA==
X-Received: by 2002:a05:6a00:168e:b0:53b:3f2c:3213 with SMTP id k14-20020a056a00168e00b0053b3f2c3213mr20668942pfc.56.1664765614349;
        Sun, 02 Oct 2022 19:53:34 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-173-234.emome-ip.hinet.net. [42.73.173.234])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902f35100b0017a1145eec7sm5931427ple.157.2022.10.02.19.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 19:53:33 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	sre@kernel.org
Cc: chiaen_wu@richtek.com,
	cy_huang@richtek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: mt6370: fix the interrupt order of the charger in the example
Date: Mon,  3 Oct 2022 10:52:51 +0800
Message-Id: <cc89d749eba56c5f2489d1707f7711733561b757.1664792418.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_195336_722738_08D10646 
X-CRM114-Status: GOOD (  10.63  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Fix the interrupt order of the charger in the binding example.
Due to this patch modifiacation
(https://lore.kernel.org/all/20221001202918.me7z2qzm7cmrkzsg@mercury.elektranox.org/),
there will get some warnings in linux-next when compiling the dts.

Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
index 410e2d4..1f67e06 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -139,8 +139,8 @@ examples:
 
         charger {
           compatible = "mediatek,mt6370-charger";
-          interrupts = <48>, <68>, <6>;
-          interrupt-names = "attach_i", "uvp_d_evt", "mivr";
+          interrupts = <68>, <48>, <6>;
+          interrupt-names = "uvp_d_evt", "attach_i", "mivr";
           io-channels = <&mt6370_adc MT6370_CHAN_IBUS>;
 
           mt6370_otg_vbus: usb-otg-vbus-regulator {
-- 
2.7.4


