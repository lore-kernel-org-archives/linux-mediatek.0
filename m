Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2E3C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBzk1r0qfWFWFO9fv+i28eGbwC7q2nSc0bcZjmqYIrI=; b=wHFyz2eD99BudNNdImW6Lpyu/S
	Vrw8FK23ERnCDEvtQQALkNpoF3ahC3BVoa1DcN3Ir7ZX5UlpX7rLjXIts4JjNgvBtTD1CnhcW9lbM
	REF5KnIpx7AsL64pD1E8ZOzy+aLYw/PRXtT4Wjau9AFs82ZBk9379fpg+1rxPo03vKY6xpBDkJn9d
	baEfchQzKqLgByGDoDBe515Hcio6TsyIVHtfMp+EFgoXTx663JhixBQwOzu20MZSQvlJ9QdfAdgWJ
	n4nKLrQGKaxl4JA8Ayy+47SI1Ng2Ij83pmKPldZwrRs6e5FZLkl1B5zsqfYvXBTQ41emhIhM7qCxR
	AV5NdHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQsB-00AsTg-01; Mon, 15 Aug 2022 03:34:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQs7-00AsRo-RN; Mon, 15 Aug 2022 03:34:37 +0000
X-UUID: 302ac3ef27b54e2981ed1e5d1392061d-20220814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=iBzk1r0qfWFWFO9fv+i28eGbwC7q2nSc0bcZjmqYIrI=;
	b=fElHIYYVGgsllFuXKQXF2hBEtv93P0O2fPw7wuXNJkK/rgMEkQDDuKXhs0EKjOdgBUIBevXa+aK12m7keAqg5mNFBIIrBviqFbVGJ49GLk+YhHcLWf/yX9PScKKowTQR8T6yY1TIo8y8swt/qe5SfFkoGO2CtF7tws2qV12DJ7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:5f029c9f-d8d3-47f8-bcdc-03ce94912e41,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:e85fa79c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 302ac3ef27b54e2981ed1e5d1392061d-20220814
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1206808811; Sun, 14 Aug 2022 20:34:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 11:24:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Aug 2022 11:24:07 +0800
Message-ID: <59b7b695b781b583fff8236c5d37cf26016efce2.camel@mediatek.com>
Subject: Re: [PATCH v1, 0/1] fix gce timeout issue
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
Date: Mon, 15 Aug 2022 11:24:07 +0800
In-Reply-To: <20220815030740.28899-1-yongqiang.niu@mediatek.com>
References: <20220815030740.28899-1-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_203435_924113_EE4F3522 
X-CRM114-Status: UNSURE (   7.88  )
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

Hi Yongqiang,

Please don't send cover letters for single patches, thanks.

https://lore.kernel.org/all/YuJsDI8rqkHuysIT@sirena.org.uk/

BRs,
Allen

On Mon, 2022-08-15 at 11:07 +0800, Yongqiang Niu wrote:
> base linux v5.17-rc1
> 
> Yongqiang Niu (1):
>   mailbox: mtk-cmdq: fix gce timeout issue
> 
>  drivers/mailbox/mtk-cmdq-mailbox.c | 57 ++++++++++++++++++++++++++
> ----
>  1 file changed, 51 insertions(+), 6 deletions(-)
> 


