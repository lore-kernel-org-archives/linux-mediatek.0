Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CD1C43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ggl5GnJW5r8zpcno8Bg7VatgVa63OuBazQq9en4f4Q=; b=I97W6RyKGNMMUV6HZXFC2J/KhY
	mvI3LMuv20ukndU6ndmb1dQnC4lkj8mDHawX0n4YsRyqG2dZWHA/ETELEMM2x+ICGvRUawKy8w/5N
	Cr7EgiNZ7aLraVHGxjJxOUqzS/gH0hUb0xRyrGQJ5Qw/u6NNz7qjYgWkDqZvQejgCmEpUuwXHlPua
	Vsze7B/f+fckfyAeluYE7rHlvhr6HaSVISeBuCEeR3p4rjIC1ly607dShynqJ7o9JpA+iYx1/50WY
	05y3z9TN7WW6FzCVU+OMDug6fmgN/yOkYSOd8nb4gfilKm1miJPyDVUQkuhiqXJKOkX5R+QN00mtY
	WIsPtBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYIJ-000Gnz-CU; Thu, 20 Oct 2022 16:21:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYID-000Gj0-V4
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 16:21:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id n12so35224296wrp.10
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ggl5GnJW5r8zpcno8Bg7VatgVa63OuBazQq9en4f4Q=;
        b=vLTlwUnpIWIwuvgi0iyBzDgogj1smwA6hhFgkNvK1JQ5gnNPG3XeP5FaxtLrguiiUI
         yuymHez2yeU703/Gjhglf/3/sijnGdCsN+WIyQt514KEm3HfrfDOnmUt2Evo0ez2pt3V
         BXp/ighRuejFCYjQiAT05SPZiV+7IrxKHh96ZFXjRzhohOAOcPpHi/scyWj0Iyp365+0
         jKxiPxuoFGS1Z/g0d9sCsq5M2fObmFAD+CFgiK2uJ0p+elwWT8P2+ECMzQxeclCPkuyd
         w8GDrWTdqzpFkBBguosfVea6TmJ8aNiuiG3WFo5fSAzdp/+EVdDo7GkaCYQRZ013tg7T
         1piA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ggl5GnJW5r8zpcno8Bg7VatgVa63OuBazQq9en4f4Q=;
        b=Il7FmKdkNfwG2Jmr7o7u34+6MnZYy5+22MBsXAhdQGAEtkg+0ILjrcVniJVok1nKGr
         UDJliCoQT8BJoNI/m5Z7y90V4+CYgYPu17sRqvTCeX34TtiFCQcr5W86oekq52yiYieu
         cyJYoHWjiqNk4inXK7PoS2UApVOICXeSUe+0fTLxy0KfJMWxoTYyExTfUhqrMYmBaRa5
         bxJBa4wIvTwvnXaiRc9dvwOcodtNO9eDIcBHQi3qB7T6Fy/Yd+fEjQ7PRTCtKE1zlaY2
         8Wdxa0g52wZrMYzco0mqJcvpY3G8Gse8gaQaJ5HB/kOUtuWyqwRNZNQLvzZUsJWk2KWs
         7oFQ==
X-Gm-Message-State: ACrzQf0XphCWVaHYw5mBTownB/utj9GU2tEde+flOKhfAh9Jpag39lNV
	jF5iKozCvHdj+jnJbLMYiDfK3w==
X-Google-Smtp-Source: AMsMyM4LQ/lxoEIrH4UMCDFt1jKZSgIbbOISLRtCxbzdlIaBowCjGyQBQrDj/m1gYIMGc+i23FCohw==
X-Received: by 2002:a5d:5084:0:b0:22e:2f15:b521 with SMTP id a4-20020a5d5084000000b0022e2f15b521mr9753215wrt.271.1666282871926;
        Thu, 20 Oct 2022 09:21:11 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m14-20020a05600c3b0e00b003b4fe03c881sm208028wms.48.2022.10.20.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 09:21:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Oct 2022 18:20:46 +0200
Subject: [PATCH v3 2/5] dt-bindings: input: mtk-pmic-keys: add binding for MT6357
 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v3-2-7e0bd7c315b2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ZkZQij7/0Z3X4e9uF6B+oZckE7xcogOJfck3q8uBCAI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjUXV0ZNXXgbhkdAz1a55MOKc3KBoIZOBnUZ+E6y1y
 JpYKd/SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY1F1dAAKCRArRkmdfjHURcv3EA
 CycWh0zpHUbo0QCMDsyag2SfUDfWm7eNlPNHiLaKRoRrhUeE+UqeevDHVNlTozvLo0kXuCbRjEP2hy
 ZUNh5+mCUEdLGEDOMprZ7XGAd/+K7t2bxtDY3FIWvGb8YH3AXaGl8G3/PFUf7iKKtQlcRoCCa91gmu
 bVHu0Wf5ldEGvH351G2QGfvAr3PDibh+11F1Vf8v9f8r1tpBAVQr+N3PhQ4oo73rL3Et1d4BIuhuv6
 qZXnNERdqshdBWa20jHiLrTwNWPcEp2cD4n+O3ThRJ0QBLkg0eUupn+RzwkoGJxABAvKQA/NdDQcG2
 VrM+CEUIvJDE6F8PdJ1T4nXVflxMVj7auEXljbGNmbIii2ZEFBIf8mV7OMJOdd3sW+MLyhMIk3jFI9
 HvEKE2gny3luDvml5/Xiku7YydL3dxMY9aYW33LQhsrXQi4E+kCIREhSp2V4P787KCshWfwOABQtRt
 D3ZXVgSpcv37zt6NUIFhrlF+rpjdmudKWkGmzQ/YoUoCj03FESVcllQIti11iAHW+z8TRJyEBRXL1N
 h0eBNbYo+C5SvCDFQJNp2MohOakK8eCFPM8SxJofKIoijZmr/UlicMkewYYERvs/CVbW/QSJLSdm5P
 9UWhvEfjmn/4m4G4nCOgJjHgjFB58R1kaG1iqdro4xI+6xN4jAoMXlmoxMvg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_092114_251493_3FA92655 
X-CRM114-Status: UNSURE (   9.38  )
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

Add binding documentation for the PMIC keys on MT6357.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 2f72ec418415..037c3ae9f1c3 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - mediatek,mt6323-keys
       - mediatek,mt6331-keys
+      - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6397-keys
 

-- 
b4 0.10.1

