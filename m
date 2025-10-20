Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D2DCCD1A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=; b=eiXMZ6l6Tf+mmSmvhkk8vOdN7S
	dcrCilyU+7m1M+BwyAOyFw/aYJxd6iqYvxP1kr0bGSPLFUEiWvOJhhrv+9gLMXjEPciSjjK7GQ5Dq
	YGHlVXsUTJ4Gyc5xyL78Vm5xO3CzbqjEdgtADnP2w2gFr/DzBPlHpttkE6IBoTcfAudNFUY9M4BKa
	AA0JffM33h+Vr751rXHPBT8zvVU6prjoh/m4t7e4lB6FSTeU1ikRgWDVRwMuSDInAk2Y37ZEpXqgu
	R4/sS7YAbovD6DchvNAPo1TgKH8bV58qycQDJqCuicAB9J0V1GcoFSHFjwgvxqKTB55M4fBad48eM
	Xb5LdUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvgZ-0000000EnfE-382Y;
	Mon, 20 Oct 2025 19:36:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvgX-0000000EndW-0vZC
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Oct 2025 19:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760989007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=;
	b=SLxKsZLeFrUy2G8+Xmcm25oAQ1AfxdoeKnnHFdmco8Nv+7eq0bxPAHWwba8weZke/YLQTH
	UiMMucZlztLQIezZDo0R9Tok/OV9lPsd/4ZkFo4Dg+a4PhnbQOzB6hCuWymH6BH0EcIqeA
	5UtiGhMzOWpA+zq+MOaGyJuaQGzkFAI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-4EvEVf-pPhOChLXi7ezuUA-1; Mon, 20 Oct 2025 15:36:45 -0400
X-MC-Unique: 4EvEVf-pPhOChLXi7ezuUA-1
X-Mimecast-MFC-AGG-ID: 4EvEVf-pPhOChLXi7ezuUA_1760989005
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8904a9e94ebso1878495185a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Oct 2025 12:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989005; x=1761593805;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZiaSM2PnoC+EdbhzADV84+t+uutkx1Amp/dmBBeJxQ=;
        b=vmYFUdWKIliMAD+NFQbnj0PYn6Xp7ygjVv6iIhycgvHESI48QdQ2XdpgC5sypgcuFv
         4wZVhb8fhiX+ziKaYRcK8JlWDRM4HN+yl+C4o9FUWYt3LrsmHTvu7weNwvknVFUr+b5g
         4xdwaHXRMScMtsUaiyWBM8DtR/6REZqRdTd55SfkHy+za5Rt6uGGJtlCoHVr4US3/E21
         igBujGUGOg002IR0ZTJ+H59WOPVTfEMqdlb5fC1YhroO4aysGwe+t2leA4TaA+q5kzCu
         CAkmsc/bRMKOmQQ34QK926ki07KdpoYCm80WODXlgIvTXdW/KMeA6rfbF7YJcTn+76Jf
         coTw==
X-Forwarded-Encrypted: i=1; AJvYcCUwOdY1T6/4KSMko8GgZxW/g4ECAoG9nKL+hkhkVUzPHPFIRXFpopkqZsxBpWsJzMAEmFa5MMSGyF64Zb57lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHJ0K2T2FiLoqcD60e9ZQqanpmJXfbp5MxXb7VAWYA5/JzjRsn
	6v8DFxrFVjElabsXeOnRWL7+xKI6F5Hg0mUNUFfBbO7s2RRFAI7WRDhzwQyP3KPI5gHOr3Wit8o
	695JmAdL3rxG5GZOBPyAsmkPz03sJCnfNqvRpPi+Li1+aQWAEQnnvxp5we1WyBOftJj7Z05RpRg
	==
X-Gm-Gg: ASbGncu7VOmUlV3tiWVKpPm4cNzsQCAIQOWqGaWGTD8NZEREDm2PMidC+KxIYL0R/nk
	fJxm4WsiLKBavvh/hP5Veb1Lx1dfCPTSTPY6TTn4KuYDq8huCXU0ocycLl9BqzuFzUmv7396NbJ
	SMQl2v2WVqafL936i+/JPGoy3VSQLTc1/hnWru4J0aMH5wOV9Ppwl3qfd54U82FpOXcTommAKgr
	/8TV/VX469EwGTkw+1FJXnNupv9fWJf9XfOR5EPm61IRTMfX1StV5hNMUKiF9WU/pUE3B4nPEJ3
	Mk4zSVIzu/8LY9MtdOwyOOyfkS9YPvx1rJIWZkRduMc7ebh/WXuL5WSbAj+9HM+33LipV5I3Jl/
	dYUpWx4UzOcMjxluariE3mkmWstJtyw==
X-Received: by 2002:a05:620a:372a:b0:859:be3b:b5ac with SMTP id af79cd13be357-8906e7b97famr1467033685a.4.1760989004792;
        Mon, 20 Oct 2025 12:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNNiKmKY9peurhzlqev2tF6KISu0JNaKtgEbeRgj3Y5mOQwBz7wnSHOaZ0F5uLAZ7ugJitg==
X-Received: by 2002:a05:620a:372a:b0:859:be3b:b5ac with SMTP id af79cd13be357-8906e7b97famr1467030685a.4.1760989004383;
        Mon, 20 Oct 2025 12:36:44 -0700 (PDT)
Received: from redhat.com ([2600:382:7726:4296:a56e:fe07:ce3f:d5f0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8924e082780sm537713185a.51.2025.10.20.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 12:36:43 -0700 (PDT)
Date: Mon, 20 Oct 2025 15:36:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <aPaPSeClhiq2WYJN@redhat.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
 <aPFbDl_JKyDay1S5@redhat.com>
 <3342669.irdbgypaU6@workhorse>
MIME-Version: 1.0
In-Reply-To: <3342669.irdbgypaU6@workhorse>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cqQ7r3vutzfV_JPdGAAQKoBalx6W_dO2JKF0Jzk-YQs_1760989005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_123649_321699_13B02B3A 
X-CRM114-Status: GOOD (  41.19  )
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

Hi Nicolas,

On Fri, Oct 17, 2025 at 02:21:55PM +0200, Nicolas Frattaroli wrote:
> On Thursday, 16 October 2025 22:52:30 Central European Summer Time Brian Masney wrote:
> > On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > operations, such as setting the rate or switching parents. However,
> > > another operation that can and often does touch actual hardware state is
> > > recalc_rate, which may also be affected by such a dependency.
> > > 
> > > Add parent enables/disables where the recalc_rate op is called directly.
> > > 
> > > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> > > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/clk/clk.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
> > >  	unsigned long rate = parent_rate;
> > >  
> > >  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> > > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > > +			clk_core_prepare_enable(core->parent);
> > > +
> > >  		rate = core->ops->recalc_rate(core->hw, parent_rate);
> > > +
> > > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > > +			clk_core_disable_unprepare(core->parent);
> > > +
> > >  		clk_pm_runtime_put(core);
> > >  	}
> > >  	return rate;
> > 
> > clk_change_rate() has the following code:
> > 
> > 
> >         if (core->flags & CLK_OPS_PARENT_ENABLE)
> >                 clk_core_prepare_enable(parent);
> > 
> > 	...
> > 
> >         core->rate = clk_recalc(core, best_parent_rate);
> > 
> > 	...
> > 
> >         if (core->flags & CLK_OPS_PARENT_ENABLE)
> >                 clk_core_disable_unprepare(parent);
> > 
> > clk_change_rate() ultimately is called by various clk_set_rate
> > functions. Will that be a problem for the double calls to
> > clk_core_prepare_enable()?
> 
> I don't see how multiple prepares are a problem as long as they're
> balanced.
> 
> > 
> > Fanning this out to the edge further is going to make the code even
> > more complicated. What do you think about moving this to
> > clk_core_enable_lock()? I know the set_parent operation has a special
> > case that would need to be worked around.
> 
> __clk_core_init also needs special code in that case, as it calls the
> bare recalc_rate op with no clk_core_enable_lock beforehand. It's also
> wrong, in that recalc_rate does not necessitate the clock being on as
> far as I'm aware. (if it did, this wouldn't be a problem in the first
> place, as enabling it would enable the parent as well). Changing the
> semantics of clk_recalc, and therefore clk_get_rate, to also enable
> the clock, would be a major change in how the common clock framework
> functions.
> 
> In my case, the __clk_core_init callback was the one that crashed,
> so it really needs to happen there, and I really don't want to
> refactor every location where `CLK_OPS_PARENT_ENABLE` is used for
> a bugfix just to avoid potentially checking the same flag twice.
> 
> Having `CLK_OPS_PARENT_ENABLE` cleaned up such that every clk op
> that has potential register access is never directly called by the
> clk core except for one place, an accessor function that does both
> pmdomain and `CLK_OPS_PARENT_ENABLE` checks, would be nice, e.g.
> by keeping the clk_recalc change and then having __clk_core_init
> call clk_recalc instead of the recalc op directly. But then the
> __clk_core_init logic needs further refactoring as well.
> 
> I'm not sure I want to do that in this series, because it's quite
> a bit different from just adding the missing check and parent
> toggling, and has the chance of me introducing subtle logic bugs
> in what is supposed to be a bugfix.

I agree and that makes sense. Thanks for the explanation. What you have
is a good compromise.

Reviewed-by: Brian Masney <bmasney@redhat.com>


