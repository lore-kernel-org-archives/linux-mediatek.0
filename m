Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c810vYTdWYy0ypaJBnxfiRLCjutp2ghu2/jnZP8w26k=; b=p7qY8TSKhahcP84szEvWb9mR3q
	96ssVb1l9AzDw7LYpm2i7vt1Yb14FWRAKKmUeHuZivHV0uX47L+jEw2FzJk4rNLYfpdZUuygTKmFk
	t/x7U0Nf0GkBtpJjTXF0autc4OIJLF/ZdRV+gMwBfKmhWg2XaGcuo1SYlHFzNDUx0vhenqbOfT74w
	1qxvOvnoKVeeMmXZndMTPd2oSgyAWqeh4eHgFNIvH/zgBLOxAbFcHhVvUyp8xyBuz8pobmeWsZ3eu
	9stOudLUoBKhhKuJsIxO1I6JnoN+4UBn0xwkXmbMGX551ReGJMdqp40XOo8+s6mTE3WfSNrEezLST
	meGhW72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeQO-009AvN-O9; Tue, 04 Oct 2022 09:41:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeQI-009Aqk-1F; Tue, 04 Oct 2022 09:41:11 +0000
X-UUID: c19687e11f804b41ad157d95e205baf5-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=c810vYTdWYy0ypaJBnxfiRLCjutp2ghu2/jnZP8w26k=;
	b=Zr0dA6dtvL9CjbK8faC91Jgg24xRPT3BNFrvsM1MV8AE1p63wjANG+iPfzpJXh6xCDQtL1urzZ6KVZfulR2RArHTGRcVeWOB3HgyfGVkrI9mrdC9QbKpedsqcwBGOe7j18ef3NIO/hjZMlURJ1yBIhLaSSVMmeD+J4094XXPET4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:0f93e880-5716-4d6b-a957-4441d22894fe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:69a10c1f-b96c-4512-b576-5860f4fb25e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c19687e11f804b41ad157d95e205baf5-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 807854078; Tue, 04 Oct 2022 02:41:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:20:27 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 4 Oct 2022 17:20:26 +0800
Message-ID: <e0e0564a63310c9e540c149de1adaff88ab5d087.camel@mediatek.com>
Subject: Re: [PATCH v8, 2/4] mailbox: mtk-cmdq: instead magic number with
 GCE_CTRL_BY_SW
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
Date: Tue, 4 Oct 2022 17:20:26 +0800
In-Reply-To: <6812059d-fb1f-f594-7f9e-eb62defadd09@collabora.com>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
	 <20220930160638.7588-3-yongqiang.niu@mediatek.com>
	 <6812059d-fb1f-f594-7f9e-eb62defadd09@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_024110_127150_6066B7C1 
X-CRM114-Status: GOOD (  11.76  )
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

On Mon, 2022-10-03 at 16:49 +0200, AngeloGioacchino Del Regno wrote:
> Il 30/09/22 18:06, Yongqiang Niu ha scritto:
> > instead magic number with GCE_CTRL_BY_SW
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Please fix the commit title and description... an idea:
> 
> mailbox: mtk-cmdq: Use GCE_CTRL_BY_SW definition instead of number
> 
> P.S.: I agree with CK, please send this as a separate commit.
> 
> Regards,
> Angelo
> 
> 


this clean up patch will be moved as the first patch and fix commit
title in next version


