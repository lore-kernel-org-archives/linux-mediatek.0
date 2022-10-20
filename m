Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857D2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaS744uQPmWBXBI6ZqLder+xi41I4zdp+0x6pn9qEpI=; b=pS3Nacbd/4LivXk4/t+ZXgubNx
	sq+g27w7CviGWd0JaVfQYi9oeLP+mMp8C92aHuJax/yteCgok7lMkN6Fk/OjxXER6Cqa2rDhunA5N
	xE5fJsISb5/PoiFvmKy23ENLt1De4g5fviAqSiNtdsZ4hK2202hnGt/EoQ6FGBlc5z9EvolmOHHK9
	5U07SKNCh/qKIQkw+954SoLmGpz2PuB0qsxwzpwsKBnGmWH1VleV/+JfJcqycoMaUqX4CK4iGu41T
	nF6BC1kNSCdGl/dAzHDCQju8YZ/0G58zW/UOhIIa6XZbUimj2JurcBP/pCjYOCtTWqUTvdUt3drwR
	MbLiL2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYKD-000HdI-Hi; Thu, 20 Oct 2022 16:23:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYII-000GiU-AE
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 16:21:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id t4so220712wmj.5
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaS744uQPmWBXBI6ZqLder+xi41I4zdp+0x6pn9qEpI=;
        b=BiWAgX/Qr8Rtaa1n4HaNEsXokIi2t7akCjokMnnVo9izFmTT3d1OYSv7Wls0Jw0TVG
         wnHniUa/aJWLtVFhMN4C6h7OqT0SEHs/I+Qz/Nek5lUoSxieBitDj95Gs8p4//CxDAPM
         EFtIovz6/Bg77YsQPiSiA79FgW2uMp/5ohlF5p1VrVItPrkwOkQpSQyk+C2FBhrxPtpu
         WqHTyElGaawjZEW7CwY272Dm9Opr7cMu7GWpP8Gi3IC1zm1YeBT5C+6EaFZRp5B8iJVV
         XoU4pX9m689/ASxVf317uv+VaYvXCGtxT0p5pjOMgBO02+pg3ktPsiK5Q//EzxGOOZeA
         HReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaS744uQPmWBXBI6ZqLder+xi41I4zdp+0x6pn9qEpI=;
        b=3V9e3/V2EkDJ+O4P1JcmPg1Im0aVeViTvi+nyThxr/XFI2QAIlhmiRt+CjyHNM2pIX
         lqXlX630cTPavd66RrcolCzbS+2hKQsspjGZ/gwJ6MVXgCotsclvEat2BZv3FLGnE+L1
         8wmV7O3a0Xw2WCg4uEqWU3zTGjxEQ0HBeUOKJPOnwkCMEglJmM98Fi7QoDps9IAY/lww
         K9fc4YdP3FkcG35nJjYhPmIPOH901aqe8X+4z1aOulwSOnUA9IMtIncMT1vDubchwRTH
         55knaAfZDPNjBdeHgEkf85psCUpMl0vOjr95M5m1uCGCCIdMnEeSItYcdWaXayPK3GnX
         EHLQ==
X-Gm-Message-State: ACrzQf2IzkrW54YeLeDoUcZ9mT6tVEATb6brfXE96Ent/atw8PZfdtcS
	Rw72Y3ocpV2ua+mjcG3jb5SHNg==
X-Google-Smtp-Source: AMsMyM4zHtUzyycG6m90vzzUecGOcjVx/uHTBFmgXqMhKmqeWtCLahlCPFtUo1o9TPVoTLPotl4Wkw==
X-Received: by 2002:a05:600c:502c:b0:3c6:f5ff:e089 with SMTP id n44-20020a05600c502c00b003c6f5ffe089mr9915804wmr.108.1666282870743;
        Thu, 20 Oct 2022 09:21:10 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m14-20020a05600c3b0e00b003b4fe03c881sm208028wms.48.2022.10.20.09.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 09:21:10 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Oct 2022 18:20:45 +0200
Subject: [PATCH v3 1/5] dt-bindings: mfd: mt6397: add binding for MT6357
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v3-1-7e0bd7c315b2@baylibre.com>
References: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=uiI/lTRtppBO+0nDIciFuabIoTVXVizM4YxyzOA2AfE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjUXV0FVtsiYSeZAnNVIPphZdWfF4LyDG6G1xUR+hY
 qezaStqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY1F1dAAKCRArRkmdfjHURcbQD/
 9ZsaHlwgCKvcsyUDObkfQQjeMSZYlAX2q5PSCyCwS4vicU+djfUIZZZ4DYVVJLEeV/1jw8S8COwjtM
 /gQ+FT2Ud6no8KNQ9XvvXNS8/hES8mEFwnz+Ne25aHAw794Z+9oMYem49sSNY8rkVyfTfI8A2A3188
 TywOl73c/t1RNnLqrvQYq226VrdewLgd6AaHvOzejK+BHwUOI8OL71k7zIlkoW2fyPnZLYsqIS+66/
 KAp7FWzWXpfO+51hnaMIJRo6fGvXcn73LVUR+oExo3xIbwE9opKu8tv93irqLjzDjIE5+egOrBNIdf
 BWqI55Ib2NORmzfa05bH7l3MjErS7A0gRDAufHenjyV6xVQEc+xkzLx9a0X0QYq8PjGi5fOUKa9+ca
 jdFrhMs+jsCV3iyMbXa2xOXfqUtCVKor4TOPUO6o/lc4CYCIUfIfZRTysxAfyB2hp7mn6h5lab49RK
 pCeX/Tn1Mk1MvBRtd3TJR2UzE+/2hSaY8lh2Pi0Zxa2jzz1Q0P+pc0+QQAPNnB9ZZWDjZ0m51DgJ3X
 fkDmw8gqjpK+T6LiT/8GVLpdJ5PhHdDi+MfmlooHMayfI2t9Li85L9RDDKILZCR9aUO9t5RsxCVu8N
 HYmyzxXKz5+e7+YyEyWhJ03Xc1tLbKhpCIMTILDwPt5wFF+tNOifJI3+w83w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_092118_390950_31527D1C 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT6357 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 0088442efca1..518986c44880 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -21,6 +21,7 @@ Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6331" for PMIC MT6331 and MT6332
+	"mediatek,mt6357" for PMIC MT6357
 	"mediatek,mt6358" for PMIC MT6358 and MT6366
 	"mediatek,mt6359" for PMIC MT6359
 	"mediatek,mt6397" for PMIC MT6397

-- 
b4 0.10.1

