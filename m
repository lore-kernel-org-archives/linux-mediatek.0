Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B7FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Qk0bFRbQ5AmR9QbdIkwLRi0dXt47rbwjkoBugSCUwM=; b=zzaoTkPAJWsQXmVcvAR3MGE963
	bj8UEDyVrFGIqjoBLVm0Fd6oFec/Urbqd2WaeuRjvCUV4lgtUUJ9SSYWYawIVqauCfamM1ZNhE6Ek
	DqZ2CGHkVDess0K/PebDXwG0I/IPvDJIdNo9+yZyS9hoj0C7v0TcOpVuf+biqPOBCs7hFvWWTBoum
	33o0F0yQcouLsnmtt2PcJE+N1VoGeXKZXeQ+gnwENXLNC2kHoNuzht/M3Gw5JsTzrvFWJfLZc3SfR
	TAjZJ+zP2J6Ws25jWsXHk+k5fBrqV/3Y1/Nt08M1s1ETCxAT06gFP8PUe0aIsa55RcMHfGwb3SvS8
	N6xY8DYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3O0-00FLCi-3k; Mon, 07 Nov 2022 14:46:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os2y7-00FB6J-Vx; Mon, 07 Nov 2022 14:19:21 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C4B97660239F;
	Mon,  7 Nov 2022 14:19:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667830754;
	bh=mif3qn3xqCd8aP/nkWjlrL1oW7XjaH5g2PK3HDhAi84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgBKXah+RA7SIC0Q4KCuj43Bx8oHJJahN8t+3IkG7Ran+4yxX4eKJfiYDeWRTG05H
	 XF8mOBWG7dBSxJX4EC2S7I7BaRYpuNlqJFEv2HvxArpu+ivWDq8Fyy/g84m6VjModV
	 7u5weXvP/Bj4IfiN8zt8MxD8ozAeakJ8FAa6WdoUGnvhu//odgGPMupz+1VsvY+6jc
	 trKaP8zfNs7rxJTvGBCmFgOHPibVES1yxSbWl85xaxrloXxM4E+jVpyH1bRhzaejsf
	 uMudsdFXoUMxNFcKmbvWC7ucJbxTBI4/cxnah0qnS3SSouArDSXLF6Y3RYt9LXumY1
	 OPKTB0GEqbFMQ==
Date: Mon, 7 Nov 2022 09:19:06 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernel@collabora.com,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8183-da7219: Register to module
 device table
Message-ID: <20221107141906.jrs5gwmwi2eakvvg@notapiano>
References: <20221104212409.603970-1-nfraprado@collabora.com>
 <63325548-63c6-8405-6481-3b019e7dd656@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63325548-63c6-8405-6481-3b019e7dd656@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_061920_323075_B03A130A 
X-CRM114-Status: GOOD (  14.10  )
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

On Mon, Nov 07, 2022 at 10:06:51AM +0100, AngeloGioacchino Del Regno wrote:
> Il 04/11/22 22:24, Nícolas F. R. A. Prado ha scritto:
> > Register the compatibles for this module on the module device table so
> > it can be automatically loaded when a matching device is found on the
> > system.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> 
> Hello Nícolas,
> I agree but.... can you please do the same for 8192, 8195, 8186?
> 
> Getting them all in one series would make absolute sense... :-)

Yes, I was planning to do that in a following series, to avoid extra churn on
all SoCs in case some change was needed. But perhaps I was being too careful, I
can add them here for v2.

Thanks,
Nícolas

