Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF03D2A523
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfM5Wq2OTSJ/F2WIbGgBOvn9cMTRd+mZm/psoKRTIV8=; b=D7nbYQWnLhZc+Wy4YssdTgzfKX
	hobIdMOyeFyQ20ulAOPOwZ4UCe4Xi3zRsq/TPs1pCafzt5bpm+kuy40AcTo42Cbdk/+DpMINWt8Ly
	d9YD5Hjdh2uVAFZDw4PUj6Syys6ug4DJmTfny+uq/iGn0vka1BEyWyJMsV0K+wJmH3rtL60cdb3VZ
	ibYTCxNQyyZMG04Gt/WJ/xsekf/zUU5jM1Ya34WllHnVNpJtpcocdyfvO2PcSWi3ydhuVTCZKyyxx
	To5kiNjuAQy+lszxT8tgCJcU9MpEEnkuc5Rx7puZUP/bptgcayzgQZTuBFKJJaF+VBNiIbnM/kmb3
	65C+IWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t158J-0000000C5kK-2i5p;
	Wed, 16 Oct 2024 14:36:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t156j-0000000C5Kg-3Tfw;
	Wed, 16 Oct 2024 14:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF33BA43DB3;
	Wed, 16 Oct 2024 14:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1F7C4CEC5;
	Wed, 16 Oct 2024 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729089276;
	bh=/Q2Fdo3DQMDJW7+zCNQDyn/3Ues5Xdu5MPKqpemcjCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwMc9f4yT9P5bQ7c/FT4vnvjbycz0SNLuDaYnusdNchhUT/Th2/v8nyYzAei+paPC
	 U90HnaU97YXI88xPaFaUqe2F2+93Mj25Xqv6Vwvo8o9vaKdEtE+ONzgY6DPJ7+nocE
	 4WsUme/lKbHP5zzQj9CL+c41EqiqikX4ngyVDLSOsAGKnf0RAOga9zK+Su6JltJsOI
	 u7bVLq0mcZVv2j8DA0Alop8bAHVS9lllvlGiNPfqjcSHuZHrL0l/FyzWxv0Iw8ziPm
	 SelPbykMzcHENeMNAvQCMYlkkaEDHlQ62LdvHqZiHtM4kNs2sJ6j7kLZZfptch2Cvl
	 Ul2TvbC5TDsHg==
Date: Wed, 16 Oct 2024 15:34:31 +0100
From: Simon Horman <horms@kernel.org>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 1/1] net: phy: Refactor mediatek-ge-soc.c for
 clarity and correctness
Message-ID: <20241016143431.GJ2162@kernel.org>
References: <20241014040521.24949-1-SkyLake.Huang@mediatek.com>
 <20241014081823.GL77519@kernel.org>
 <d2c24d063bea99be5380203ec4fafe3e4f0f9043.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2c24d063bea99be5380203ec4fafe3e4f0f9043.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_073438_015514_58A9E6DD 
X-CRM114-Status: GOOD (  27.27  )
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

On Tue, Oct 15, 2024 at 05:18:49PM +0000, SkyLake Huang (黃啟澤) wrote:
> On Mon, 2024-10-14 at 09:18 +0100, Simon Horman wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Mon, Oct 14, 2024 at 12:05:21PM +0800, Sky Huang wrote:
> > > From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> > > 
> > > This patch does the following clean-up:
> > > 1. Fix spelling errors and rearrange variables with reverse
> > >    Xmas tree order.
> > > 2. Shrink mtk-ge-soc.c line wrapping to 80 characters.
> > > 3. Propagate error code correctly in cal_cycle().
> > > 4. Fix some functions with FIELD_PREP()/FIELD_GET().
> > > 5. Remove unnecessary outer parens of supported_triggers var.
> > > 
> > > Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> > > ---
> > > This patch is derived from Message ID:
> > > 20241004102413.5838-9-SkyLake.Huang@mediatek.com
> > 
> > Hi Sky,
> > 
> > I think this patch is trying to do two many things (at least 5 are
> > listed
> > above). Please consider breaking this up into separate patches,
> > perhaps
> > one for each of the points above.
> > 
> > Also, I think it would be best to drop the following changes unless
> > you are
> > touching those lines for some other reason [1] or are preparing to do
> > so:
> > 
> > * xmas tree
> > * 80 character lines
> > * parentheses updates
> > 
> > [1] 
> > https://docs.kernel.org/process/maintainer-netdev.html#clean-up-patches
> 
> Hi Simon,
>   Reverse Xmas tree style & 80 char preferences come from your advise
> in  
> https://lore.kernel.org/all/20240530034844.11176-6-SkyLake.Huang@mediatek.com/
>   Parens removing comes from Daniel's advise in 
> https://lore.kernel.org/all/20240701105417.19941-14-SkyLake.Huang@mediatek.com/

Ok, sorry for the mixed messages.
In this case think these can stay after all.

> 
>   Because previous patchset(
> https://lore.kernel.org/all/20240701105417.19941-1-SkyLake.Huang@mediatek.com/
> ) is too large, I guess it's better to commit this change first so that
> I can handle the rest. And this should be "some other reason"?

I think it is sufficient to bring to our attention that there is "some
other reason". Sorry for not remembering it.

>   And since this patch is simple clean-ups, is it necessary to separate
> it?

I do think that would be best.
But if you strongly think otherwise I can try to review it as-is.

