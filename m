Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0710DFA3740
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 15:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7oAtX5m4KRDvZe5G+7BiZhTVf6YOlrWpt0PqqCqVOs=; b=QchgEpra+cOb6rRPjIhoJlptpQ
	twWeD9N3xJhhDvabvnUJleJVJkUWeiAQhACUBDWHMG/YP+jZTwDTLHc5sRwoL3pyd6UE1j37nvidD
	9fPD70mIhepsudRjFiHBt08pFOU4KbFdtHC3C/VGyZhmpOge0F7Y1cOASzXnBHp/4rHTIuoEezURE
	+lqyOFbasIRFeU7DNnfiMO5FB793p7Me+bPbwlYVNAvycNpDol/nZe669sgWGWzqUUtjJsdaGzWe2
	x3NaAv0JiFXDda8hQC6F58CfRTLghOIsny7egvjppp3kVbWWQNxcqaEapPM3EM7kDkBeDZISqfEzv
	Ty+E/mrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olu7N-008iHp-G7; Fri, 21 Oct 2022 15:39:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olu7D-008iFz-K3; Fri, 21 Oct 2022 15:39:21 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F082660253A;
	Fri, 21 Oct 2022 16:39:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666366757;
	bh=mcY5W1aNUc9TuXX/LiaYgX6EI84dVVWfCrHpt2rgnVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLhRbjf8DyKpkWFIx+b9FPkQ8VjrOX7guQ5DttHx6UQ4tJrPP13ddNYsn3udJ9tkq
	 hqmSdMhhi4VB/5TxgnizC19+q9Ss+6wUNNzUZ2KZwmDRsm3qW3m8EehpGJ+WCwKaan
	 Gu4NK1kSlQVDM4l3W0nGMHvmHsbdeMrDpr18tMFVhVbnbgtYqRmxA3stdZd1+Lsxfs
	 JfrFeB5OVPwjzXXijkW2g628u/mRHMMJEVzQxlXqce93v77tzEQuSN040ozHRF6nQF
	 cL/cW3hElLDjSLm7UtZtcnzSiK311AFtiKC8OzOLHw+9EZfIorkwQ/TkT5hZJSbadL
	 CfUs5tT+/CCWA==
Date: Fri, 21 Oct 2022 11:39:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v12,2/3] drm: mediatek: Set dpi format in mmsys
Message-ID: <20221021153912.bddr5g4tm4kch7dn@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
 <20221020164022.vtnumo3fob2sh54w@notapiano>
 <2e1899236144774d4a1c0224532b11ef7e1f9862.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e1899236144774d4a1c0224532b11ef7e1f9862.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_083919_805726_6FC923FE 
X-CRM114-Status: GOOD (  26.04  )
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

On Fri, Oct 21, 2022 at 08:18:25PM +0800, xinlei.lee wrote:
> On Thu, 2022-10-20 at 12:40 -0400, Nícolas F. R. A. Prado wrote:
> > On Wed, Oct 19, 2022 at 10:52:15AM +0800, xinlei.lee@mediatek.com
> > wrote:
[..]
> > > @@ -448,8 +453,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > > *dpi)
> > >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> > >  			     dpi->output_fmt ==
> > > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> > >  			     EDGE_SEL : 0, EDGE_SEL);
> > > +		if (dpi->conf->edge_cfg_in_mmsys)
> > > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > > MTK_DPI_RGB888_DDR_CON);
> > >  	} else {
> > >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > > 0);
> > > +		if (dpi->conf->edge_cfg_in_mmsys)
> > > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > > MTK_DPI_RGB888_SDR_CON);
> > 
> > I know this isn't one of the formats supported by MT8186, but since
> > we're using
> > platform-agnostic formats now... This else branch in theory could
> > also run for a
> > format like MEDIA_BUS_FMT_YUYV8_1X16. Would it make sense to set
> > MTK_DPI_RGB888_SDR_CON in that case?
> > 
> > Thanks,
> > Nícolas
> > 
> > >  	}
> > 
> > [..]
> 
> Hi Nícolas:
> 
> Thanks for your review!
>  
> You are right, I understand you think this MTK_DPI_RGB888_SDR_CON 
> format seems useless as it will not be set, I confirmed with the 
> designer how the setting in mmsys affects the output format of the 
> MT8186, this mmsys setting will not be used by other ICs.
> 
> As mentioned earlier, the mmsys setting will make the MT8186dpi have 
> four output formats, even though the MT8186 dpi may not use them all.
> 
> So what needs to change here?

We could check that the format in the else path is a single edge RGB888 format
like MEDIA_BUS_FMT_RGB888_1X24 before setting the mmsys config, but there are
also other formats possible, and I actually don't think it's worth it to
complicate the logic further to protect from an edge-case that can't be hit
yet...

So just leave it as it is. We can worry about it when/if a non-RGB888 single
edge format needs to be setup on mmsys.

So,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

