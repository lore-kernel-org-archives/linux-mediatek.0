Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B228AC43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGKnBmk305NSRuntU0I+QCprRokP7yQBnjgoGca++DY=; b=Ema2+5o9/YEqaa
	iZCn4cWHua+iVg6bMULGyITXHMXINYxjXEVhgsxSE0nh65a4wJCPVHgzPSdUTh2n6TL1sio7u2vJq
	k4+EPJCpCUUbh2qAxwSOAZ1thNtoR0R4uyCAigFo4zQA6bkXcZTivzMJk+0POpb6BFir91J1URVB5
	7gDCM9tqx/1tUcqAOWA/2hw5zMuQ7h/F93CWCOQwhOsyQbCopAl2bRuT8xxxhntV6pdvFKzqimtM6
	XgIdoIzGIp4v+n1I/sG8fPDkLWO/GWGq25G8PcIiwkT6SAlwQVlbcd+LrcTsR4nnqK/j/yXBb3EeY
	t3e4HNHfkffSalIYfsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3Nb-00BPW1-Mi; Tue, 31 May 2022 15:01:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gt-00BAAo-Gk
	for linux-mediatek@bombadil.infradead.org; Tue, 31 May 2022 13:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=84B5l6CLEYOYUre8rq3yJnmiSsiXoAiqgOdGcXH7KzA=; b=di5iFICbb4a0ISW06ruOoHN38Q
	zUqMy/K9g66kGKMCHMUOWxl7wwMHJuoRj46VBCLIBIWHqTeVCoXHokNP67OLfsqqdHZitFU4JnpVu
	Hh8PR/JJV5d92a1BO46neat7sZJyMyBwS8uBfL77/hpetotRsZmNofdXpaQuOYYgo5ZBpe8cTY2Z+
	JYj3q+GFYj7DiwET1M14DbDX6pDUuPXyRz0EkdP31ruW1EEtt5GzsELTYL6sN5LclFNJHblm9Yxfk
	9zup9s/Wb2U5asn2S1I/r+m5XWf09Fnoh9iKMtyr5ZkP9xwPVQYdIUzk/EtYizEGLAonP9wnljUha
	qFr8Zz2A==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gm-003Sde-Vd
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:50:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id e25so8161261wra.11
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=84B5l6CLEYOYUre8rq3yJnmiSsiXoAiqgOdGcXH7KzA=;
        b=wjCDUvAzmwhW8ShvFMODKlOAJvENmeZCAsQFEBBjpmCjVefXiQwTBynBslAevnS/ar
         IXm4cXmqxylBQs193ugMlR1BjEOc3/Vk7U4T9LJteC5aqnNV4CXZ/jFlXuyrmnd+Hd5D
         VCNQQUjf1leoYsHvfEgfO63Psj1/Zace3a/H4c4v0Ewdmwjm2AWqWy+FkXHdgjohoAH1
         iYI0/ouaIN6JdlbiGEIUyAzSCsrHyrO24nEYivf97/369hIv7k81eCdJwjiidtXbLyUS
         /+R4GrIUqCJ7UoFADiWq/7vAKLkpPNArYC6LGy40/7qc4u3ixQEjvWKr2h+AZvt1+nts
         blQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=84B5l6CLEYOYUre8rq3yJnmiSsiXoAiqgOdGcXH7KzA=;
        b=3cDwY99aWIWW0HeA38Uo37qovprf5ykEvoH70d+Rk95HEVMph7tKqhcApgxq4GaVI1
         paawExYDcbwngLfj9UoMeF5R4laU2ZB5JU61968lfAEyLisCFv/4Dn8gGctrBLKuBGaZ
         P0IMXQUd4lLRnSeWPehqtMfnjN1zrzxqbrEEhRqD9I/mAxq/frO2nMOE4Ue3w//PITNw
         94W5Muv2109pf4ZJx3dmHnnH3gJuY2NIVcKRu1+58PjqiEpS3OlQHPRINXtm7tsunghu
         gka6oijI75v3yTR7IAmW620q7r7d9nhqZRFdRG0EWnOikCjmSQZXci8C4yxH784bMlxW
         yj8g==
X-Gm-Message-State: AOAM5338dbWlOdJLodPmvunz6ANhwbWseZq+VRDGeOTT4R2rQDalFU5f
	pfXW5v7AzAf0BT/jJHq7+pd5gQ==
X-Google-Smtp-Source: ABdhPJx1HdFDNNiPkbLkJv2ksIxQsCl1lQetWRtoVAAGpHCrR8geKFAxOVuea00BT4mrXnnAAW7uhg==
X-Received: by 2002:adf:ec84:0:b0:210:e87:113b with SMTP id z4-20020adfec84000000b002100e87113bmr20885976wrn.545.1654005047238;
        Tue, 31 May 2022 06:50:47 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:46 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	Long Cheng <long.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 05/17] dt-bindings: dma: mediatek,uart-dma: add MT8365 bindings
Date: Tue, 31 May 2022 15:50:14 +0200
Message-Id: <20220531135026.238475-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145049_701343_9785DEEE 
X-CRM114-Status: UNSURE (   8.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation in order to support the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index 54d68fc688b5..19ea8dcbcbce 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-uart-dma
+              - mediatek,mt8365-uart-dma
               - mediatek,mt8516-uart-dma
           - const: mediatek,mt6577-uart-dma
       - enum:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
