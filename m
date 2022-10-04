Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE204C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMFDoGhlqUSuOxOvjnKHrNvy+aVCACgU4ALT+g56mno=; b=nVklKGAakr3xHnKlSGY8gsdtAM
	5v64vRejDcz/nNMoCFVDLC8Qk0j9MyUwOY0sBmD5IKiIBu4qLI4VGGC5SeTwu/DaxHHhjPH0R3fHk
	Sb3dRkSe7AB/WWBLxGjSRXgR0i4sKCYSMpve22ScjKKim/RNbgZT43yi3GzDK3UGkiQsVHmuHZtZA
	vFK+9GwA5l9radQT6lzhnYL/bv/Bqwkurll/Dm3zETzBfuZbJr+R2exEijtkHOJucC1gszeC3N0UN
	QqUQQKrN11uBlvnU8BIkUzG5LbmWQfidc05k8vTjAqC3/0CsFhuQeq2tZD5DjB3KEatPQcBFetWTZ
	Gz5BVxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offCP-009Mez-TE; Tue, 04 Oct 2022 10:30:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offCN-009MeX-93; Tue, 04 Oct 2022 10:30:52 +0000
X-UUID: 16dfa3d490b741b0ad7213f92169becd-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pMFDoGhlqUSuOxOvjnKHrNvy+aVCACgU4ALT+g56mno=;
	b=UFul12xnjK1k8WaECgKQzZJr05Tn62aihWrPt4UOCaaF4gH4fOaGk3DxzJKjrXQgI0+chyORlTak3TAX4gMKx4lJ6azKr8rq8tcT7PrpkdJCroJliJq89AzQ3Qorcd5S60GI0NtRyAEdkA0jEB7jHdBj7cMOy6cYChruWLcnczY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1ce53710-e7d9-4cd0-9fd7-a44b01635072,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:964cd369-c578-4abf-baf4-d93ecc5e701f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 16dfa3d490b741b0ad7213f92169becd-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 485981451; Tue, 04 Oct 2022 03:30:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:30:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 4 Oct 2022 17:30:09 +0800
Message-ID: <f50a6a17377ada1417159eb9545960b2afa0bdf8.camel@mediatek.com>
Subject: Re: [PATCH v8, 3/4] mailbox: mtk-cmdq: add gce ddr enable support
 flow
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>
Date: Tue, 4 Oct 2022 17:30:08 +0800
In-Reply-To: <31b60ef83260b7f3d0761462c127d3fb34d4f8ac.camel@mediatek.com>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
	 <20220930160638.7588-4-yongqiang.niu@mediatek.com>
	 <31b60ef83260b7f3d0761462c127d3fb34d4f8ac.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_033051_357668_5C5C0044 
X-CRM114-Status: GOOD (  20.96  )
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

On Mon, 2022-10-03 at 13:04 +0800, CK Hu (胡俊光) wrote:
> Hi, Yongqiang:
> 
> On Sat, 2022-10-01 at 00:06 +0800, Yongqiang Niu wrote:
> > add gce ddr enable control flow when gce suspend/resume
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 04eb44d89119..2db82ff838ed 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -94,6 +94,18 @@ struct gce_plat {
> >  	u32 gce_num;
> >  };
> >  
> > +static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
> > +{
> > +	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> > +
> > +	if (enable)
> > +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base +
> > GCE_GCTL_VALUE);
> > +	else
> > +		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> > +
> > +	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
> > +}
> > +
> >  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> >  {
> >  	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq,
> > mbox);
> > @@ -319,6 +331,9 @@ static int cmdq_suspend(struct device *dev)
> >  	if (task_running)
> >  		dev_warn(dev, "exist running task(s) in suspend\n");
> >  
> > +	if (cmdq->sw_ddr_en)
> > +		cmdq_sw_ddr_enable(cmdq, false);
> 
> Why do you disable sw ddr function when suspend? Would the problem
> happen when you disable sw ddr function. 
> 
> Regards,
> CK

when all cmdq instruction task has been processed done,
we need set this gce ddr enable to disable status to tell
cmdq hardware gce there is none task need process, and the hardware
can go into idle mode and no access ddr anymore, then the spm can go
into suspend.

the original issue is gce still access ddr when cmdq suspend function
call, but there is no task run.
so, we need control gce access ddr with this flow.
when cmdq suspend function, there is no task need process, we can
disable gce access ddr, to make sure system go into suspend success.


> 
> > +
> >  	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
> >  
> >  	return 0;
> > @@ -330,6 +345,10 @@ static int cmdq_resume(struct device *dev)
> >  
> >  	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
> >  	cmdq->suspended = false;
> > +
> > +	if (cmdq->sw_ddr_en)
> > +		cmdq_sw_ddr_enable(cmdq, true);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -337,6 +356,9 @@ static int cmdq_remove(struct platform_device
> > *pdev)
> >  {
> >  	struct cmdq *cmdq = platform_get_drvdata(pdev);
> >  
> > +	if (cmdq->sw_ddr_en)
> > +		cmdq_sw_ddr_enable(cmdq, false);
> > +
> >  	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
> >  	return 0;
> >  }


