Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C60C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 02:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6ayAk2MA0k9aAkL5cbO/QXfzUc2TcgV9okQxI0pHc0=; b=IFwf1Zu+2G3T2CTZbla5QWo7fP
	fI5f2A9VROiSExZ+BpZEl9SqkU4zjoEpGpM2XrfJpsVEddElBZT0r7ZGeny0b2IStYED35o9P7qHs
	ezOFoS78DExjqe1kSMayyb5YVQu44VFv9Uq/XLQl32kTauaMlg2wOI1j2b+qkuvwgRCcr5NzBOPgi
	n9UfhaA3LwvphnEb0e8rw84vdGQDpqXOwvyPzXuStEW8/p173u9vs9tzaATXE0XpsEpxxz3rOPk5v
	EBq6AzHQe2XRRS2fW15cczRXDeX2TEQkLxeY0ZXJLeJ9R8ke/g49yMXPwQZHgAf5hIhayvGj22QHC
	MXP13tug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqrb-00CRcY-UQ; Fri, 17 Feb 2023 02:52:43 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqrR-00CRaq-J6; Fri, 17 Feb 2023 02:52:34 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PHxDs51LYz8R042;
	Fri, 17 Feb 2023 10:52:29 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 31H2qGcS089971;
	Fri, 17 Feb 2023 10:52:16 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 17 Feb 2023 10:52:17 +0800 (CST)
Date: Fri, 17 Feb 2023 10:52:17 +0800 (CST)
X-Zmail-TransId: 2af963eeebe1ffffffffca4f417e
X-Mailer: Zmail v1.0
Message-ID: <202302171052175449856@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <broonie@kernel.org>
Cc: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <chunxu.li@mediatek.com>, <jiaxin.yu@mediatek.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?B?W1BBVENIXSBBU29DOiBtZWRpYXRlazogbXQ4MTg2OiBVc2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 31H2qGcS089971
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID 63EEEBED.002 by FangMail milter!
X-FangMail-Envelope: 1676602349/4PHxDs51LYz8R042/63EEEBED.002/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63EEEBED.002/4PHxDs51LYz8R042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_185233_801266_E1B2BD64 
X-CRM114-Status: GOOD (  10.79  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to Use devm_platform_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 41172a82103e..96be444d1000 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2815,7 +2815,6 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8186_afe_private *afe_priv;
-	struct resource *res;
 	struct reset_control *rstc;
 	struct device *dev = &pdev->dev;
 	int i, ret, irq_id;
@@ -2836,8 +2835,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	afe->base_addr = devm_ioremap_resource(dev, res);
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);

-- 
2.25.1

