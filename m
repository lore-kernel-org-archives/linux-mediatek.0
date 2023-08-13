Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5055BC001DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5D0ERtpENLAoSBb0NpYZ2syoP+xoywzN9HcLRAsbn0=; b=KAvwpW1zEwJIpltDCa7P3kLcY2
	bGSL2Cy+wFodj+lhcYiuzjTTNTxfSBjDUAoIbtlO4N+dnk73pI0FjBxkYYqEVm4U8oXZNCKkD9Fxq
	9yErPO21rnRH8AsIpoP++Cl5hgWL+jIiTEaQ/8j1WdbfmslT385btcuv96jXa2i9KvkHsH5COrFV2
	ol1RRGclYxqwS6NN+suFY9eD3KrxRlhjpnMqIz8QXDK41keGmAq14dXt4BwI7u0af5TlC3q7j/8KF
	2iXrubfqg2LIwWFr7up7zf41fbZ3bqVR9XmPjKNb7A/JYYq2/IjbEa5Sgw4tMjRoGSztQQlSW4+qn
	HKebUs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGSU-00FbUo-0V;
	Sun, 13 Aug 2023 19:09:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGSR-00FbTp-2U
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Aug 2023 19:09:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so37268265e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Aug 2023 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1691953735; x=1692558535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5D0ERtpENLAoSBb0NpYZ2syoP+xoywzN9HcLRAsbn0=;
        b=scvdw0pSpfRGJCMg0BvhGqOR3OJpzgYLkmQCcCMF1now3MANkopiijpZwgiwxP4ab6
         voIIigZyiXR688hHh8eSPX3dSZ0ErOU8Bl8prTpMv+Sr5zuuguaDtSC8Gc3pNkScC/Ij
         zSucDVy1xOCma2Y1pYDarhI03AQ/1RVKP/SNLiGq/ZUhiKPJzXAnI2aw7kVMi3dyCndD
         gkSm0mIhWMHUrrKW5wNM7UiYyre7JoEGh+UkJ9DtJvoV4aWHmu/BFEM8VhA410Ylv0lt
         FKUPtJjFDwCRMAdE5eeyx2qiPAF8dDY9kp4tKxbABd0FCrLUsh65pQQaozFQwZcWo0xn
         bl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691953735; x=1692558535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5D0ERtpENLAoSBb0NpYZ2syoP+xoywzN9HcLRAsbn0=;
        b=B4nYK4XgQlq3mAy1MFyafREw/wESO3J9tHKk3R75pOL1fIKc3LJpKee6zEODgsq5MQ
         IcKqTK22y6t98clBaYXLh43tqpjjhdLw16I58aBoD0Mmd7a56/jljCeBCKOqkc7Y73N+
         OdYQt7zdJQYy2sMzh9VFpl9E/XWAMTMWA7ZMrO/FS1U67DMtuF/TMz6PfrWiuvatTd+s
         amOJ32dvr2sdhMQRxYvydt6GqAYoZxfXpC9ELPLJIO0pzWpBOUjMRg/3oEPKO9iJw4WO
         6/xL5+NajUifVPkIFyPfcZjZdF29Y5rO7YlemhEW3FEfOiJeg5Tt7ErJhVHgcP551h6Y
         gAjg==
X-Gm-Message-State: AOJu0YztptSwBDGKKhAvFBSgmsJ4PAKXMB4HB8DKwKxtvZ3z4B9k0+CJ
	6MmSJZUTi9gPhExBKGYmf4y/Aw==
X-Google-Smtp-Source: AGHT+IFKiWxS8QFsjAKe/GKVPaVjMJW81uuxW8E38kLmtsFjftnNcL+y86PpOY7I8APucHp50fc+xQ==
X-Received: by 2002:a1c:4c0e:0:b0:3fc:3f31:4233 with SMTP id z14-20020a1c4c0e000000b003fc3f314233mr6293550wmf.38.1691953735095;
        Sun, 13 Aug 2023 12:08:55 -0700 (PDT)
Received: from localhost.localdomain ([188.27.128.210])
        by smtp.gmail.com with ESMTPSA id c14-20020a05600c0ace00b003fe4548188bsm14919163wmr.48.2023.08.13.12.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 12:08:54 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aouledameur@baylibre.com,
	daniel@makrotopia.org,
	void0red@hust.edu.cn,
	aboutphysycs@gmail.com,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH] thermal/drivers/mediatek: remove redundant dev_warn in probe
Date: Sun, 13 Aug 2023 22:08:45 +0300
Message-ID: <20230813190845.49738-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_120859_815143_E76F6611 
X-CRM114-Status: GOOD (  14.22  )
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

There's no need to print any extra messages in the driver if
devm_thermal_add_hwmon_sysfs() fails.
If this function has any failures, they will already be printed.

While looking inside 'drivers/thermal/mediatek/auxadc_thermal.c', the
failure will be either be one of:
  'Failed to allocate device resource data'
or
  'Failed to add hwmon sysfs attributes'

Also, the failure will be reported on the 'dev' object passed to
'devm_thermal_add_hwmon_sysfs()', so it should be clear which device this
error belongs to.

Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index f59d36de20a0..55f7fde470e5 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1290,11 +1290,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (IS_ERR(tzdev))
 		return PTR_ERR(tzdev);
 
-	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
-	if (ret)
-		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
-
-	return 0;
+	return devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
 }
 
 static struct platform_driver mtk_thermal_driver = {
-- 
2.41.0


