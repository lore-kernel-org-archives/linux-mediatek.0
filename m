Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5462FC761AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ml5B2U6Ayt/83AXXZe1u7W8tityg955LidmdKtC7+Fw=; b=FOMxDTiCphLtWVd/v15KrXQRGr
	cA91pQ/RnZnQFgu7q1apQanz6h7DywFQQFi4dBmtEXxdtmJvwIMdCBU7LIMb3+yerxs5ps0EJGHbW
	tExjHT4Wq/oHeWMZdWCRAmz7Hg+0WLKqeFtyJR4Mu1Lqu+CwGZDLu6VuznNJglaQzAIVhQvatL3/Z
	cVY9Mt3BhZwGGui1Lxy9V4tUOYlUOXtm+31U1cROb2fDJO0FcaHrRCmO0EsFgzNF5+6LmoBbawPPM
	9eNMtGStXDG1oEIeD/VWEC09T4OzAckr7R2yyvEW4I6ct8MKwoFQ3flLHdiEsq9i6dCHSZT9tJqoO
	skInSYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPCq-00GIBw-27;
	Mon, 03 Apr 2023 18:47:04 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPCp-00GIAl-1I;
	Mon, 03 Apr 2023 18:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ml5B2U6Ayt/83AXXZe1u7W8tityg955LidmdKtC7+Fw=; b=Yq7Lwu9vcDZHTDYHTy7SyWsfGF
	qAe+KLbZupGXPayyuYs1gsVEq87bV6ZzSfZaAk1ENXwYaJrSG/FUkACqz+dQWuD9p/GMskmdacIej
	xU55liHhU50AsX5lc1+zNNmp2VtBbrrBmOHkIeNEf4Jvhba7n5A4gbO/c3gzyOjQea3z209Y6m7mP
	a8WCrkHwsVZAm1ZgG4M30VS2+L2PcFSMpp9qcleNvzPrv6n6YjUwFm7g+51MY+uJINm0g4xYp3Veq
	35Nwi08eZL/LQ/Tc80XfLvoCi1sJ+17GbcXFqId9A3NmL2zi7/8IlQCRlUP8deWnZOemX+UX8H7eD
	V54jTfbw==;
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNLD-008wd5-1a;
	Mon, 03 Apr 2023 16:47:37 +0000
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
	(user=void0red@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 333GkBiv000418-333GkBiw000418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Apr 2023 00:46:11 +0800
From: Kang Chen <void0red@hust.edu.cn>
To: daniel.lezcano@linaro.org
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
        bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn,
        error27@gmail.com, henry.yen@mediatek.com,
        hust-os-kernel-patches@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
        rui.zhang@intel.com, void0red@gmail.com, void0red@hust.edu.cn
Subject: [PATCH v2 1/2] thermal: mediatek: use devm_of_iomap to avoid resource leak in mtk_thermal_probe
Date: Tue,  4 Apr 2023 00:46:09 +0800
Message-Id: <20230403164610.3608082-1-void0red@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6e3c59c3-8ad0-9c53-62a4-7be6f55a7c02@linaro.org>
References: <6e3c59c3-8ad0-9c53-62a4-7be6f55a7c02@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: void0red@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_174735_914777_369998F2 
X-CRM114-Status: GOOD (  10.72  )
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

Smatch reports:
1. mtk_thermal_probe() warn: 'apmixed_base' from of_iomap() not released.
2. mtk_thermal_probe() warn: 'auxadc_base' from of_iomap() not released.

The original code forgets to release iomap resource when handling errors,
fix it by switch to devm_of_iomap.

Fixes: 89945047b166 ("thermal: mediatek: Add tsensor support for V2 thermal system")
Signed-off-by: Kang Chen <void0red@hust.edu.cn>
---
v2 -> v1: use devm_of_iomap instead.

 drivers/thermal/mediatek/auxadc_thermal.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index ab730f9552d0..df5e2e354408 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1142,7 +1142,10 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	auxadc_base = of_iomap(auxadc, 0);
+	auxadc_base = devm_of_iomap(&pdev->dev, auxadc, 0, NULL);
+	if (IS_ERR(auxadc_base))
+		return PTR_ERR(auxadc_base);
+
 	auxadc_phys_base = of_get_phys_base(auxadc);
 
 	of_node_put(auxadc);
@@ -1158,7 +1161,10 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	apmixed_base = of_iomap(apmixedsys, 0);
+	apmixed_base = devm_of_iomap(&pdev->dev, apmixedsys, 0, NULL);
+	if (IS_ERR(apmixed_base)
+		return PTR_ERR(apmixed_base);
+
 	apmixed_phys_base = of_get_phys_base(apmixedsys);
 
 	of_node_put(apmixedsys);
-- 
2.34.1


