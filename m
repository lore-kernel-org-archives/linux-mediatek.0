Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9D1D1D494
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=; b=qqUYGrSfoVSltfB4mI8xtJ3NR8
	J2ecWiZInvTT78FPJcsu/0e0DC09kr4TMD/xPObR3EThNnrPA7CnCc2r03t4DKR3NVEleawCF4VgU
	xHtp7tJbK/JIlJALNQV/klgqzDsOWIlU2K4zGutiY+o0VDumuDD03683WiR627HtWluOAQbbZQ3zN
	b4CGGaE3XfgCWixtcL4iSWc/vRx4QdeUs+Xm7EbsAzUI6Yq8VcGhwsfzZWw0ZSynAwbEPa27gcn89
	B8Rg7bx35x/wvTaf1SWy2E5wshulzKa4bqdYHL+NeiWh3fzHkZ2ZLb4oY46aDHk68vtcCj7XA+DVd
	x7v3fhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxU4-00000000u7Q-01r1;
	Thu, 08 Jan 2026 21:23:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxTz-00000000u5V-45k5
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jan 2026 21:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
	b=bwHsY+kGAYLKxahTGgT0bkd9nRBfcItTjUzmRbkcl1TAB1OFATg57p5ZrJzeDAcHNyrCvJ
	vaoLicixhAv/sxyd6ijW0J5fWJBBhhlxpV3NEDpaSlIsnpLe0mwqv7xVZ5rec7OFCAj7Ls
	NCF8g1MVaKIPX0RI0sOVwYKFxityBE0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-Y1lRkTPjOEaHE62dJKnlXA-1; Thu, 08 Jan 2026 16:23:49 -0500
X-MC-Unique: Y1lRkTPjOEaHE62dJKnlXA-1
X-Mimecast-MFC-AGG-ID: Y1lRkTPjOEaHE62dJKnlXA_1767907429
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f5fe52b10so8189553241.1
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jan 2026 13:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907429; x=1768512229;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
        b=ki1RgjLru2p0rW1FqXc0qYJrCHafYaINF104quIS5nVie+a2BbCkr+CPTon9hrpN4d
         dRbrx4IEHI02633SjI6e7ABj0aEJwMSNK+WHbdKuwPUKNFQ/spj0RteCj+1Yuo4d+KVZ
         RJAO3VsRj0r6NfTVAAaF6OM509yZlUqpvr1ZrhbgHIs9uqblWC7ikpl1+9/vbDe6Fzb4
         lEdPIGPpiohRvWQQ1wFxIZ32LxnS9yWKE/i/dmPs8BFB7e4Q9zPDIN18wI+lB5pHtsOg
         Rhas7orHjGXqFJsdzcY2VVTBB0z1EqPW2UhKSBRKzgIJGPJJmrd2/C4TGqi1MP/eKkg4
         F8jw==
X-Forwarded-Encrypted: i=1; AJvYcCX9vuwx9cOyw4/H20ii/cadL0nQheTl0luHFS+udAdyMGFQyaDACsUcakBPDAKMNpyWIf7jP5a62NOcM1RwbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb/ti1h55NtjY3uSOENPECs0JxCKJe3PScI770s/17Sf2UD31I
	/ukt+ZFOxPh42Yr6r80oj4Fa++5A+ozoAsRGeYapUyuRAPuwSOYLnOU1fWzxkYPcmhZy99RXhdF
	onB05iQXWxVmfTJfSa/CLwdYb1vOXBF/K4lo//NnxFqKGZXfMYS/bvZ8aNyQbBE23izR7QiOm9g
	==
X-Gm-Gg: AY/fxX6ln1epPXx74ImrvLstqDow7/lFEvtWOpwEZTrBsEMMKgzd94yV0ywT8jwNTw6
	dTjNxu7e+26ytLX3RjM2vvfbVAn7CIplSmrEPHv+BNl4ifcgvNrk8Gsv6oZ9JyxpmMcCaCHzaS/
	hXAQ6ri46Bz6QTQeMLkkD044bcBAjDFef5ZwvMQOXHDD3TMKVqdE8J0xnrWBgl/jwmHu0qnai4s
	ZsV1v/4+/cett8SGvSDMZrzObjUgyZ8BGb+r5F3nZ/rSmJHi7BX6z83sWjh6t4dXUojOblH/rH1
	N2rNKNZHf2tElu0CnzVvWlKIJ9UmsRH68rLJExeX0/NLNZR2u4dIh5hJmX+717tfACxe82XdZWV
	JnFVBMv3k
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5eea76a8724mr1006302137.33.1767907429131;
        Thu, 08 Jan 2026 13:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9+XK5E3OQPztXIo7GPKPfvpra0LA99i0XMQua/Tc/8Kj6tPqIGZY+3/QAUKTGxXE41kQHWQ==
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5eea76a8724mr1006294137.33.1767907428708;
        Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Received: from redhat.com ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e322asm7790577137.13.2026.01.08.13.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Date: Thu, 8 Jan 2026 16:23:34 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
Message-ID: <aWAgVt599agpNqZQ@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
 <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
 <aVurM1XRqiYlzi1B@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aVurM1XRqiYlzi1B@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YPxuI3dCVpULD2wYJCqchXggiuMrTp1frlzHGFlYm6w_1767907429
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_132352_273092_35EEFF0A 
X-CRM114-Status: GOOD (  27.75  )
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

Hi Geert,

On Mon, Jan 05, 2026 at 07:14:43AM -0500, Brian Masney wrote:
> On Mon, Dec 29, 2025 at 11:18:52AM +0100, Geert Uytterhoeven wrote:
> > Hi Brian,
> > 
> > On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > on the cover letter of this series.
> > >
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
> > ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
> > in phy/next
> > 
> > > --- a/drivers/phy/ti/phy-j721e-wiz.c
> > > +++ b/drivers/phy/ti/phy-j721e-wiz.c
> > > @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
> > >         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
> > >  }
> > >
> > > -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> > > -                                  unsigned long *prate)
> > > +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> > > +                                     struct clk_rate_request *req)
> > >  {
> > >         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
> > >
> > > -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> > > +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> > > +                                      div->table, 2, 0x0);
> > 
> > Is this correct?  divider_round_rate() can return a negative error code
> > (from divider_ro_determine_rate()), which is not handled here?
> > 
> > Looks like several other users of divider_round_rate() use this
> > same logic, and thus are affected, too.
> 
> Thanks for the review! You are correct that this is a bug.
> 
> I had planned once round_rate is removed from the clk core to post a
> series to remove divider_round_rate() and divider_ro_round_rate() (plus
> the _parent functions) since they call the corresponding determine_rate
> functions. I'll bump that up on my todo list this week.

I posted a series that fixes the issue you identified, plus removes
those deprecated APIs all in one go.

https://lore.kernel.org/linux-clk/20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com/T/#t

Brian


