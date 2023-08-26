Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE83C83F15
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lW5JiU3OBo1fpU5FFkkuisIRL20Eimt0nkU4ubNxKCc=; b=BAdl8wVJ0ZNfoXSNRBi+Pyrkwg
	0nPjeRxzzla2Ebr9Ot6nvfBtQHRx2kv5fxAn/UO3O2/4te1LfCVshbgRhb07SkDifEj6fkndLgtTi
	4qg3kZ+7ZCNeDL8qxdFJmjaMxKM39eeqH/pA8skwO20sxoTdkn4UC8bCh21me5qdFlmaof25nz4Nr
	XYNCEf+zq2TVwvvMcd1YxiBR9Y7wMvMzoll0IFpFGte8erf5nmM1+u2hjajJNlElSFB8ua8yrTA5O
	2ZQyL137rKgKMLMa5GP/HPFQkkcBbG3AnC0DNPa2sRm62kJmcsMpMrQHyQQEeUgux40buw8USF+gb
	yguZ6yyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZwpN-0074y3-2K;
	Sat, 26 Aug 2023 17:12:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZwpK-0074xa-2p;
	Sat, 26 Aug 2023 17:11:59 +0000
X-UUID: a4df493e443311ee83ed1395ce914268-20230826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lW5JiU3OBo1fpU5FFkkuisIRL20Eimt0nkU4ubNxKCc=;
	b=XLidcVyErnKrwBnMcnBZ5X4A4asghx6tHcizZqkUI2tQ81nl87Ks8lTnOY62LS+bo4+SiuUgV4EgNNmRslWWK5Y+AfkH0Al4yEKvEpyvNvjozoIDUxXz4ezLG3dKLH96wIb+42CDskQ0lqnOr9E8eBIOBwVeYfHjpWzcX0eyZ3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f15a0753-929b-4277-8f06-635ccc9bf0f1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
	N:release,TS:79
X-CID-INFO: VERSION:1.1.31,REQID:f15a0753-929b-4277-8f06-635ccc9bf0f1,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:79
X-CID-META: VersionHash:0ad78a4,CLOUDID:3560c71f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:230824185604G6OMGZAT,BulkQuantity:57,Recheck:0,SF:48|64|29|28|17|19|
	102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,TF_CID_SPAM_FCD,
	TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC
X-UUID: a4df493e443311ee83ed1395ce914268-20230826
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <sharp.xia@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 430543731; Sat, 26 Aug 2023 10:11:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 27 Aug 2023 01:11:46 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 27 Aug 2023 01:11:46 +0800
From: <Sharp.Xia@mediatek.com>
To: <wenchao.chen666@gmail.com>
CC: <Sharp.Xia@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <shawn.lin@rock-chips.com>,
	<ulf.hansson@linaro.org>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
Date: Sun, 27 Aug 2023 00:54:54 +0800
Message-ID: <20230826165454.1196-1-Sharp.Xia@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CA+Da2qxaCJwZhn0C7VxZzx8TB1VDR_xa2P0cDXUaNA9=YzSJYg@mail.gmail.com>
References: <CA+Da2qxaCJwZhn0C7VxZzx8TB1VDR_xa2P0cDXUaNA9=YzSJYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_101158_926289_9DD15B6D 
X-CRM114-Status: UNSURE (   7.70  )
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

On Fri, 2023-08-25 at 20:23 +0800, Wenchao Chen wrote:
> 
> 
> Hi Sharp
> Use "echo 1024 > sys/block/mmcblk0/queue/read_ahead_kb" instead of
> "blk_queue_io_opt(mq->queue, host->max_req_size);"？

Hi Wenchao,

User space does not know the max_req_size of each mmc host.
And when the SD card is hot inserted,
it is complicated for the user space to modify this value.


