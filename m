Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89172C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJjfak4UG2kt7LD+AoFzMT7Gsf1sr+ZsaQfW8YlBLvI=; b=yqxazuTpFEfCziFd3McG4GYtPr
	QifE1aLsVFlSCFneHybsiuQeOClSiMC4gLoaQA17PJsv+Q5DidoyA0dAZ5047Zhw/DWfe/yqB6dmK
	yasu6P14u/r4Nnl19qPlAyceeoqmEl3qTPWUVMK31iY4+qVHhKC7S89ZDthhfDSNWDQWvfCWDunM4
	LXmvA1xrhoF338s/j/N+JZkDdtwPZ76JDW6qk5HD2sHkefaZj4EcRWVUg9Fv8tiM8wcH0K0P2yNSj
	0SwycJri8oORadrxDcgiEDZ+tVvNqSFBFstRy8DSc/FXmQHGkzJHCOAw1qGvyZ47DUT1IurlWV6aA
	Vo8aS5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBi-003j3w-0B;
	Wed, 05 Apr 2023 08:08:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBf-003iud-2M
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso640541wmr.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJjfak4UG2kt7LD+AoFzMT7Gsf1sr+ZsaQfW8YlBLvI=;
        b=OCkUFW+mhgiZ+PUIVfbs11cDivBeCORYii0nVLvMvW3OS66SS8BoYvtzb5hRrt39i9
         reXTYadSz03nF0fYGRndHClKcTqdG3gjmOifCrOWHgF7R5ZJR/DMwSQCFMxERYqoLtqf
         Hcyq358sdsshob50bGFiPmc2rE33JPFa/zMXK4g4ZjJ7IPo3isi/7OtMAWvt8pg88UvL
         WZTJ8IE2I1QGSUCoYrNbkj5pKYy1GIGyVUYVOuVk5yD+DZO6HSlPDIMRjftSIAxi6a+6
         w9DhcEsDMS5jnBj5pRmYphqjC4gIpH5YejJYmTnJRUJSSHoIZNLxRWcG2i18NaRLmAXP
         CbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJjfak4UG2kt7LD+AoFzMT7Gsf1sr+ZsaQfW8YlBLvI=;
        b=H8Aal2ld7MkheTN0Uz6B2lq89IE6Vz3/WGZhGz0PksnVzaWueOJqB4vvQUNnly/FgA
         7x1clZBEYWfGU7r+p2GyziQe3Mq7IkrG+G/w33uq4ZdJY5zvBbjdrJEQBAHdLIJXBse3
         8iuxxE9j+NxmOURXii/VZEV1wVtW7m1nGGjFSaPzMMfRHBLYazxbUTPwIEX8Jihr6FoT
         v/bc019ATmPqUL6rTKSpXHrCpxbCeztQYs+H3iRU77VR6uFW23mN41t3gAOy2cwn8tiw
         mcCM6GCLqdiqql5UoNvXjGCoGTqIYyyjD5QCsLOR6ATxB+S42ttl+LY3f+AoJ3LJqtx6
         RJ8w==
X-Gm-Message-State: AAQBX9cI9YEockxzoCdPtrAP/Knj8kkIonM0EC1Z9DhGHIXEJ9ZTqF0+
	wb0WJJi0SD2egAo1ycQ4ckk7dw==
X-Google-Smtp-Source: AKy350YW7AQIPOkgBErc/VmRz3hML7NF7jikubeOIa+PdbQN8TrAl5wHjxnD7FkQ/tilP6etDizoPg==
X-Received: by 2002:a7b:c8d7:0:b0:3ee:6161:7d98 with SMTP id f23-20020a7bc8d7000000b003ee61617d98mr1192258wml.16.1680682069557;
        Wed, 05 Apr 2023 01:07:49 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:49 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:43 +0200
Subject: [PATCH v2 01/10] dt-bindings: memory-controllers:
 mediatek,smi-common: add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-1-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vTUD/c9kbSLzmx+cLlLgYeDYjimwFLetURuSQCdLVkc=;
 b=owEBbAKT/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxSlglySpw8EC8jWMtiz5EoWRKGnIP273K6KU7P
 s0nj2uuJAjIEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUgAKCRArRkmdfjHURTXID/
 Y7o7mc0fMazZGCSJPm6JbpC6TUorPZDTIeAsVxgKVo23aCja1X3pmsg7tnFKxqN4DzlMproxKdocOY
 pkX865KHbsPD9LOHET25U+9GSAhnIkPF+8K6+vAdd24mSOcgkSiukihQg+QAS99HExeO9Kyg5p/1sc
 Zzl+CmuHfpaBoriCgsWfSnTnRniIpRKX4ZMShiyEtgT3+/nBQhKY746la0dooX9ovrRgT+Rs+clTXv
 Eirqh3FjzcMOA84m2EayxDVLvl60ldkYWV20IO4J4yM3mxvRY/wq/Ror99b2TikQ7BDzMxrSakHNvH
 YL9CDjndvqWL60QowK7Q/EyJcCSkytGRlszZ2kGEkoiNR/Vnthxqu4bSoBe6PYkl2mJgVxuNDNWzoj
 bj7vCVqizWfcymGQdcBSDedSVMuTkVV3sdl+drGYYnWGZTSWFJNS7pSz2jwiVAxR5lETU/QpQpa1Lv
 uAfnf7dNSk+2Q8g84yZ5DIee512FcMeb7J9vobtTNK1fn69DcdvmQ1W2PtPcKZtTWIAIVlyG60aOS8
 tx6Ny0Yhl2D9Tf9zWuShU64xiGa4Ud0Gy8sqrWnpN7D5liXxMmWIsMYNLhXAzBu1zbr2maEezJIWeX
 R5kUnYvm6NCRaAuFPD+TyzVGWFtOV6r0JFi0o7KjEyf+hvnUTOGmxuqBin
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_010811_803920_C2FB6AD4 
X-CRM114-Status: UNSURE (   8.76  )
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

Add binding description for mediatek,mt8365-smi-common

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/memory-controllers/mediatek,smi-common.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index a8fda30cccbb..2f36ac23604c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -43,6 +43,7 @@ properties:
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
           - mediatek,mt8195-smi-sub-common
+          - mediatek,mt8365-smi-common
 
       - description: for mt7623
         items:
@@ -133,6 +134,7 @@ allOf:
             - mediatek,mt8192-smi-common
             - mediatek,mt8195-smi-common-vdo
             - mediatek,mt8195-smi-common-vpp
+            - mediatek,mt8365-smi-common
 
     then:
       properties:

-- 
2.25.1


