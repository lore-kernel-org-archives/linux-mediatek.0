Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F1FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 02:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vONuU2pab5GQ7YgJJPuGj5E4IMi9T4UtvmYRBEDwIU=; b=E83r/OQZf1u3i2RCJn8w8AB1Q1
	6Z3NHCgnAemgQQ2moSD63ny1OTChjcrPfefVLsPrlbefSCkqePWxpqEUfN5RhTKybpKbEzULcnoQY
	bZmYkBrs0rNna+J1uQa//JGDvptGrDI0McGQjAAX2UJXfZFuKbsueuSq65Bwu3x7eeTERvrRblZN7
	JxFZgtBu0i3el0Pyl6ndPcPWVoLWcGkLCzZ/QzYBMIKIRhHj+RgFUJPAQ8yAKyTb8+iUHP7IQhSvv
	6nmC6Cz2oqOKsv0RXoAOKHNxyjDFyBKRCOA797D663UC2uhnUyiz0y9za5c9cBtvF6vG5Wu+Nvpyj
	bVknZHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBW1-003Y7Q-VF; Mon, 03 Oct 2022 02:49:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBVx-003Y6C-Nq
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 02:49:07 +0000
X-UUID: 21ef687841224f72818811ce1ce7ea7d-20221002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2vONuU2pab5GQ7YgJJPuGj5E4IMi9T4UtvmYRBEDwIU=;
	b=uGVDvN+Ihjijrz0GHz3cwqueRPDjrvaJ3XtwrrToFKZVVd+Wiba8kknWUpgi6N0jzyId3P91IeqLWfd/zseYYuOKP04haPDYvlz3xvCxKl1yiTOqGBW/l4plW+UuKqlL8d+O9HwnB8WMUolb9mkqpx/NcV0B4ZK82HGxRm9ewU8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6fc01beb-3940-41cf-9ce7-04f9abd3a30f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:f251c007-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 21ef687841224f72818811ce1ce7ea7d-20221002
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 633131153; Sun, 02 Oct 2022 19:48:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 3 Oct 2022 10:48:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Oct 2022 10:48:19 +0800
Message-ID: <ff5ce171d32d70a939603ff700b44f140baab9c6.camel@mediatek.com>
Subject: Re: [PATCH v1 2/2] media: platform: mtk-mdp3: fix error handling
 about components clock_on
From: moudy ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 3 Oct 2022 10:48:19 +0800
In-Reply-To: <8afa9c8e-079e-6e50-a8d7-21e0b1698f76@collabora.com>
References: <20220930102306.13201-1-moudy.ho@mediatek.com>
	 <20220930102306.13201-3-moudy.ho@mediatek.com>
	 <8afa9c8e-079e-6e50-a8d7-21e0b1698f76@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_194905_792249_92213A1B 
X-CRM114-Status: GOOD (  23.02  )
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

On Fri, 2022-09-30 at 14:12 +0200, AngeloGioacchino Del Regno wrote:
> Il 30/09/22 12:23, Moudy Ho ha scritto:
> > Add goto statement in mdp_comp_clock_on() to avoid error code not
> > being
> > propagated or returning positive values.
> > This change also performs a well-timed clock_off when an error
> > occurs, and
> > reduces unnecessary error logging in mdp_cmdq_send().
> > 
> > Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3
> > driver")
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  4 +---
> >   .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 24
> > ++++++++++++++-----
> >   2 files changed, 19 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> > index e194dec8050a..124c1b96e96b 100644
> > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> > @@ -433,10 +433,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct
> > mdp_cmdq_param *param)
> >   	cmd->mdp_ctx = param->mdp_ctx;
> >   
> >   	ret = mdp_comp_clocks_on(&mdp->pdev->dev, cmd->comps, cmd-
> > >num_comps);
> > -	if (ret) {
> > -		dev_err(dev, "comp %d failed to enable clock!\n", ret);
> > +	if (ret)
> >   		goto err_free_path;
> > -	}
> >   
> >   	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
> >   				   cmd->pkt.pa_base, cmd-
> > >pkt.cmd_buf_size,
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> > index d3eaf8884412..fe6a39315e88 100644
> > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> > @@ -699,12 +699,22 @@ int mdp_comp_clock_on(struct device *dev,
> > struct mdp_comp *comp)
> >   			dev_err(dev,
> >   				"Failed to enable clk %d. type:%d
> > id:%d\n",
> >   				i, comp->type, comp->id);
> > -			pm_runtime_put(comp->comp_dev);
> > -			return ret;
> > +			goto err_unwind;
> >   		}
> >   	}
> >   
> >   	return 0;
> > +
> > +err_unwind:
> 
> For this label to be clearer, I would rename it as `err_revert`, or
> `clocks_off`, or even simply `err`, as the `unwind` word may create
> some confusion here.
> 

Hi Angelo,

Thanks for the suggestion to rename to "err_revert" and make the flow
more readable.
I will correct it in the next version.

Regards,
Moudy

> > +	while (--i >= 0) {
> > +		if (IS_ERR_OR_NULL(comp->clks[i]))
> > +			continue;
> > +		clk_disable_unprepare(comp->clks[i]);
> > +	}
> > +	if (comp->comp_dev)
> > +		pm_runtime_put_sync(comp->comp_dev);
> > +
> > +	return ret;
> >   }
> >   
> >   void mdp_comp_clock_off(struct device *dev, struct mdp_comp
> > *comp)
> > @@ -723,11 +733,13 @@ void mdp_comp_clock_off(struct device *dev,
> > struct mdp_comp *comp)
> >   
> >   int mdp_comp_clocks_on(struct device *dev, struct mdp_comp
> > *comps, int num)
> >   {
> > -	int i;
> > +	int i, ret;
> >   
> > -	for (i = 0; i < num; i++)
> > -		if (mdp_comp_clock_on(dev, &comps[i]) != 0)
> > -			return ++i;
> > +	for (i = 0; i < num; i++) {
> > +		ret = mdp_comp_clock_on(dev, &comps[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> >   
> >   	return 0;
> >   }
> > 


