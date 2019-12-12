Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7916EC43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 05:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46867214D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 05:11:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZZTmJlA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jpNCkJf+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46867214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhMWhtrfUcBnzZ+1f6wnj9UKEvMc2wIncGa7h5Je9xw=; b=sZZTmJlAPqfJYw
	Sz+lHFaghUyoXO1lLgmWe0fYPm4gWo/BrcppvEgcOr1vBr1KJrSz9nrk6UW1KVos9kHhWLA/KiMBH
	cAObtzbmksIyU5rXJvm7rjMgqXwtZaQj+6veTz3U2P/LHnhgT3jv+5I1Rhih1Shln6Q0V3zXRwOpo
	KWubljsHoDVg3151n4dOah16kIiJSmcFm7HmOiBMAkNzjOLpfksbmR6RzikeMFqrshObEzyroTejp
	WYh3sBrXe51Ws0Ot8cRPOVYKFGE+u+32v1/qK4lXtw/hmmKzs8a3ZBfwxz7E1b8c6cEcrZhx4lAV2
	8pKiyU6+FYLJA9yAQVHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifGlH-0003Pj-Gc; Thu, 12 Dec 2019 05:11:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifGlE-0003PI-SL; Thu, 12 Dec 2019 05:11:38 +0000
X-UUID: 464234d66e5a467f97f95650bd20f437-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hYgDknyu2r/mt3htTKSKYIbRrUMLsVNx5WmsGimi8Vw=; 
 b=jpNCkJf+xNMF6UdoYNiecf4S+ImFj9CPi9Uvo2aE/E0Hmiy+YQtuFZBjDeqgzCTBe7APze4L24Q5/aDN3nEf+WuVudJlrOTYK7ITtTZZsjIDkksEbDN3p7Umm3z4FTv1QHVwfvIwuXVoUY7+m0F1sbjzoT31V0kVmU6/nM1oXPM=;
X-UUID: 464234d66e5a467f97f95650bd20f437-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1535154093; Wed, 11 Dec 2019 21:11:35 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 21:12:41 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 13:11:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 13:10:56 +0800
Message-ID: <1576127492.8315.1.camel@mtksdaap41>
Subject: Re: [PATCH] soc: mediatek: cmdq: delete not used define
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Thu, 12 Dec 2019 13:11:32 +0800
In-Reply-To: <20191211185950.31358-1-matthias.bgg@kernel.org>
References: <20191211185950.31358-1-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_211136_924377_CD4CFC49 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <mbrugger@suse.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias:

On Wed, 2019-12-11 at 19:59 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Define CMDQ_EOC_CMD was actually never used. Delete it.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 3c82de5f9417..1127c19c4e91 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -12,8 +12,6 @@
>  #define CMDQ_ARG_A_WRITE_MASK	0xffff
>  #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
>  #define CMDQ_EOC_IRQ_EN		BIT(0)
> -#define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
> -				<< 32 | CMDQ_EOC_IRQ_EN)
>  
>  static void cmdq_client_timeout(struct timer_list *t)
>  {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
