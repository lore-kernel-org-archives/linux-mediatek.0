Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwrl/3f7wGfqHWGf8Oif/TRg7dNz8gBaF6eMoR5I/kc=; b=hrsmagxrS1L+WC
	koRq1yzbb7OySV0PP1Jl4efRHZ085jdXMOinAcPjdf3A/nJZx/KXIwlPdNOE5U5Zr4YEKzsLDaMvO
	6NrI+iFDaclPWLqd6eT2rd1TVEq7mZsmwPhkesFUifA+U7rpSHVukFqpS1S4LeV+CW4az858CayHX
	xlzyhWDqSX5Zz8hvrGAh3AXCYMe9MR6guxxyVJqK9rut6VNZJ74PZLcbjblZfoC3OEIRG4xjljI52
	D+XTe3XsC43bgvCW3hogXJgp5W07g22Mqu5gJVmqeFJ+u/gS+LAKzfQlQggXU3UMlIBJ8orBuxfzN
	bgoShQV52W8A3Sf8jy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvhzy-007b9e-M5; Mon, 30 May 2022 16:12:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvhzv-007b9A-Ru; Mon, 30 May 2022 16:12:05 +0000
X-UUID: 572dbabc80044e209126f33a060d0fd1-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:d24a635d-0f92-46bf-aa56-1a0625e144fd,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:14,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:14
X-CID-META: VersionHash:2a19b09,CLOUDID:afbdceb8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 572dbabc80044e209126f33a060d0fd1-20220530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1150428056; Mon, 30 May 2022 09:11:41 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 09:02:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 May 2022 00:02:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 May 2022 00:02:15 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <fparent@baylibre.com>
CC: <chaotian.jing@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mmc@vger.kernel.org>, <matthias.bgg@gmail.com>,
	<ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: mtk-sd: fix typo
Date: Tue, 31 May 2022 00:02:15 +0800
Message-ID: <20220530160215.8749-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220530123857.692076-1-fparent@baylibre.com>
References: <20220530123857.692076-1-fparent@baylibre.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_091203_927168_544E2966 
X-CRM114-Status: UNSURE (   9.57  )
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

>Fix a typo: Fianl -> Final.
>
>Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

>---
> drivers/mmc/host/mtk-sd.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
>index 195dc897188b..c7d196f805ec 100644
>--- a/drivers/mmc/host/mtk-sd.c
>+++ b/drivers/mmc/host/mtk-sd.c
>@@ -2318,7 +2318,7 @@ static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card
> 	else
> 		val = readl(host->base + PAD_DS_TUNE);
> 
>-	dev_info(host->dev, "Fianl PAD_DS_TUNE: 0x%x\n", val);
>+	dev_info(host->dev, "Final PAD_DS_TUNE: 0x%x\n", val);
> 
> 	return 0;
> 
>-- 
>2.36.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
