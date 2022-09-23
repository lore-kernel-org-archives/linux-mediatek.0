Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7375FC6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 05:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQSS4lFjVSP2jvMnVMQJEvmUFXRO7bYHADrnK5OzmhA=; b=SqzSwTYuM4L/sVrdax6EVUA0Lm
	7hSUUmde9Wahpd44D3oCGGGTWXIlOQrDcQ+gWtBr55x+J+fTo7uAh71fu0eoReba9Q2B8upH8s8Dc
	FXTL0IYq6py2/7ld9TysnGJiIxmQc44VIT1w6usdE+mccHOw6lqX7sWyM8UNbqUSg6SMRUzNt5BT5
	zXbOwlKhUPZvuySpgJWiFfyuxq0dy0uPdpuuUbX9w+w7AyaOLYveVOA36B0Yzsap9eBCh348OjfMI
	uksP2uZMIz3CcTwwUTN/XKScag6klKAnexG1fVYu9yNz3iB2p+y9RKB4l23CXqxT6LP4qc7yiwM0L
	o2q8ecCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obarB-002Gtf-RK; Fri, 23 Sep 2022 05:04:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obar1-002Gr5-2c; Fri, 23 Sep 2022 05:04:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BE08DB82841;
	Fri, 23 Sep 2022 05:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D20C433D6;
	Fri, 23 Sep 2022 05:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663909435;
	bh=PHDr+wDiM2EHB4+LpuPtHojr+ixo/WuKiAKue3B1Nfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ya1OHf3/RA+A8h42XFYRJphF4JmKCzrDQkXDrHhrDiGzlqT5iYI5c0ykeQk4EpOSy
	 ybbRVf2BEbAIMLdh8wnG5qPJgRoNnanTkb6Eb4aUZwGoNHatXt1K93cKbna0b21Ray
	 Ajt4d713ZczqW52OZH+Z8EKjCkVSEpSwCA6HKv2Ri5IXexFTiUoGh/SUStQ2gHWgMn
	 H/tWvjGriRsgsyc6aPIRQSYyjtu44u7shF/LYFP/0btftWWeGEa/DSMULezfbZdFfU
	 /LzDvUWHBAup7Xoii7IGMxuEmSZZnkZMIxBFEu6V9f9nq0IBmTB5FZp7vQ0+DUAHSW
	 /EsRfFQ/6FEtg==
Date: Fri, 23 Sep 2022 13:03:51 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
Message-ID: <Yy0+N13mJlGZE9E4@google.com>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
 <YyxGXXSp2JD9a6ah@google.com>
 <YyxjZ9nCBdVovkVs@sirena.org.uk>
 <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
 <978af4cc1a8bfa92675bb201947cfdac1e5429f1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <978af4cc1a8bfa92675bb201947cfdac1e5429f1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_220359_288762_594B9790 
X-CRM114-Status: GOOD (  26.62  )
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

On Fri, Sep 23, 2022 at 12:39:54PM +0800, Trevor Wu wrote:
> On Thu, 2022-09-22 at 16:10 +0200, AngeloGioacchino Del Regno wrote:
> > Il 22/09/22 15:30, Mark Brown ha scritto:
> > > On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:
> > > 
> > > > snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure
> > > > whether
> > > > it would introduce any side effect or not.  Perhaps Trevor could
> > > > provide some suggestions.
> > > 
> > > If it does it should be to fix isues rather than introduce new
> > > problems - I suspect the other operations just don't work
> > > currently.
> > 
> >  From my upstream tests, this didn't introduce any issues, that's why
> > I've
> > sent this patch.
> > 
> > In any case, let's check with Trevor, just as to be extremely sure,
> > but please
> > use an upstream kernel for eventual tests, as there are quite a bit
> > of changes
> > between 5.10 and current upstream.
> > 
> > Cheers,
> > Angelo
> 
> I think it's not a big risk if Angelo already did the test and
> snd_soc_pm_ops is also used in MT8186.
> I can help do more tests on 5.10 when the patch is back to chromium in
> the future.
> MTK also have a plan to support complete suspend/resume functionality
> in MT8195. If Tzung-bi has concerns about the patch, I can help submit
> the patch at the time.

I have no further concern as long as you guys are also aware of the change.

