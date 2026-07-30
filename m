Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0285CC55162
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=; b=2SlbUvM5QVhDTqvOMPFzOwf612
	bn7lUlsVomxOvQx3MoHFHbNAg2SwENytstYQsDGq1KjOs3XE+0pTVrFQV4es2sMTVu4gExz4LJzjM
	uY0yrHo1Yb/F1tojajQif3kSEmh0dTeZX/WjLL7m4hUwanCFPCSJq8GUbLO7gBFYgFkAkt9k4xCig
	Yr/DokZTAwopDHuI/3R4GKceGEM/RWnDGXFAopLI4+vC9fL1IFzFoTNlZ0Uv20Ad5YFu1zWgSAeBx
	q25zR2wQknIwABWEex1yupctd9Ig1LDUM2hzFvBl6InovX0ivYXOLdYaCbHugcS1KkhTGteMeZSDJ
	IlDT8e1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTOn-0000000Axf8-45KI;
	Thu, 30 Jul 2026 16:14:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTOj-0000000Axcj-3KFP
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 16:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785428056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=;
	b=LPpsBI6rGFsXritNlwyU6n2wOVuHWpwBtRen6c8ayCu3cVl6k6Tgj0mNp+ieXN8OSLRipq
	B2+ngPEvJhPZN1hQZmi45Sp+LHErc/7IQvYnnKyKdqQOcrhyxNZYw/s3zCuEMzaLJypyn2
	4uNSxerKneVn2T9oUnGCXPiAz/6MzXU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-jesqcCwINyuHPI_3TBNZ1g-1; Thu, 30 Jul 2026 12:14:14 -0400
X-MC-Unique: jesqcCwINyuHPI_3TBNZ1g-1
X-Mimecast-MFC-AGG-ID: jesqcCwINyuHPI_3TBNZ1g_1785428054
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7fe835353acso37935157b3.2
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 09:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428054; x=1786032854;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=;
        b=f7mJ26JjOOfXfY9Yd2A+kG+FUdp/SL4h89chFGE0Yqtf8Kf4CsEfYihiRVVoNgPfKm
         VhBhu+YhR2KDf528LOe0JodQwiOL4C7eB8/4LgEEdulbZ8ldo0TuuJcVl75bnsz7sFN4
         0U5yQitJwe0eur/cds2y9OzsEwsLHbMcmcSEE5zPatGvNXI0cs4n+wOaDBdouKvb3Bzb
         euZDKQt1CASB7z6lOxPmXJzdXXZ1crlUIRt9z1qw4N+eQ349NoafESHTvA0RITJYgK9R
         PMLiabKl0hqbsU0xa/MS81eqkuDtnxKm7xOBY6Wc1ZMm7WjkgkAnORTLho2xcppdrQf9
         eZYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7DiFbErazJIIU/2mvZ0HRDFtRKvMNHFAvwrv1cJ6YWrsGOEV5FSnLxlg0Xn1DdH7s9eAqYSsEutPaV9TcJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi1hBEruAlS8gCLmbDiWV++krgeDaJFRRpatrk6AajvUw2iMJF
	q3l/AXrrGCWQj+pzWll8UqD10Wr6FhG2vJrAqWueYetz6apvgA5jxjOfLdTclHaWUVhrRwGYmmT
	k65m6eheQ+WbUY5wymIEZ7Io67H83aBLjiNrmVodMW2rB2nBwEb3Hll9ebxRPYZTGPE2Z6iEOng
	==
X-Gm-Gg: AR+sD102DeVOhqQRa2yXfoC8X/RksKYbo/RMmOWm5xSiXvPhZeMGMbbqYmLrez7R+vk
	xaFISmS7TieUVvauN+DsPHz51rtRCJLlc+cTlXK+lrZNAL3GfcbodTfKN4d3wqfp7SSGwHw9HLj
	6DlwPYZ70uMM6xe6tVMb6sBqtp7i0Y6NlPq+xVDM4SFYIxcqmpIJk38Sv5AjdUde5IAq8of+hHW
	/VeADRQxH+1PZBcjPWZG/1Uhh82i8NOtwjIcJNq+XACM2UO97+PGVdRq4oTq9SxsA9pbj5FOJYh
	AhwuUZXbXeI6VZYsdXniCVaunfGVm3N++0jdgGoxbLPCO4LxQrNem/TKnzsGi6m2/P62ML+j3mY
	mu3hFsaPv9Cm/acrjk1aMCyKck/O4dnst+hg=
X-Received: by 2002:a05:690c:c1e:b0:81d:bc5:4624 with SMTP id 00721157ae682-81fb8953397mr23680447b3.25.1785428053868;
        Thu, 30 Jul 2026 09:14:13 -0700 (PDT)
X-Received: by 2002:a05:690c:c1e:b0:81d:bc5:4624 with SMTP id 00721157ae682-81fb8953397mr23680137b3.25.1785428053319;
        Thu, 30 Jul 2026 09:14:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8abd480sm12784947b3.36.2026.07.30.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:14:12 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:14:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <amt4UpSfiMwxNTBS@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
 <amjCTJguiANLY0vj@redhat.com>
 <amja9vnEoRTstmGN@buffalo-ssd>
MIME-Version: 1.0
In-Reply-To: <amja9vnEoRTstmGN@buffalo-ssd>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MRh1lt-8kzBNddN73Hp-m8zfP7yrrLh6XNSRRSLQIqk_1785428054
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_091417_904987_5BE293F8 
X-CRM114-Status: GOOD (  29.82  )
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

Hi Akari,

On Wed, Jul 29, 2026 at 02:02:59AM +0900, Akari Tsuyukusa wrote:
> On Tue, Jul 28, 2026 at 10:53:00AM -0400, Brian Masney wrote:
> > On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> > > clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> > > platform_set_drvdata() during their driver probe callback,
> > > but their remove callback calls platform_get_drvdata().
> > > This results in platform_get_drvdata() returning NULL,
> > > which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> > > This leaves clk_data unreleased, causing a memory leak.
> > > 
> > > Fix this by calling platform_set_drvdata() during probe.
> > > 
> > > Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > > ---
> > >  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
> > >  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
> > >  2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > index d7d416172ab3..65dc4489a09c 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > @@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
> > >  	if (r)
> > >  		goto unregister_ref2usb;
> > >  
> > > +	platform_set_drvdata(pdev, clk_data);
> > > +
> > >  	return 0;
> > >  
> > >  unregister_ref2usb:
> > > diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > index fa2d1d557e04..8b69009e1965 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > @@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
> > >  	if (r)
> > >  		goto unregister_clk_hw;
> > >  
> > > +	platform_set_drvdata(pdev, clk_data);
> > > +
> > 
> > This patch doesn't compile.
> > 
> >     drivers/clk/mediatek/clk-mt8173-infracfg.c: In function ‘clk_mt8173_infracfg_probe’:
> >     drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: ‘clk_data’ undeclared (first use in this function); did you mean ‘clk_gate’?
> 
> Sorry for sending you a broken patch.
> I accidentally built only with ARCH=arm and missed the build failure.
> 
> While fixing this, I noticed that clk-mt8173-infracfg.c can be converted
> to use mtk_clk_simple_probe()/remove() instead of adding driver-specific
> drvdata handling.
> 
> The helper currently lacks cpumux support, but I have a reviewed patch
> for it:
> https://lore.kernel.org/lkml/20260304181024.738391-2-akkun11.open@gmail.com/
> (Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>)
> 
> Also, adding PLL support to the helper should allow more MediaTek clock
> drivers to use the common probe/remove path:
> https://github.com/TeamYogaBlade2/linux/commit/d991a61887ab76fd83708dffe8e48192e01023d5
> 
> Would it be preferable to extend mtk_clk_simple_probe()/remove() with
> cpumux and PLL support and reorganize this series around it?

Yes, that sounds good.

Brian


