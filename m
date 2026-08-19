Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6E5C5B572
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 21:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=; b=TdLsr0TeUQJ1XeizeJqSk1h08U
	+WBQsyl1ErEdXEV9WvQn0EDNor7JxAS7ha9ksiqvIuBjUtlL2wMqAudahizRLRArwStOvfWgBNucj
	yXynZoQURZvWn+SKknw1MmamvLkgaicdDggdcaXGLzhAniFoEqJc2bWQyecWPLCDEHUu0k+A/BMJH
	J69d81ucMqYIl5IFJVbhCzppK9TGjutWJIyIZJcuo3aGfs4wBKpZkbNeWOCEzmBJGEFWBivUZPlBp
	i2Gb/cAYryNOV1hKCv6/eXfZjkvVL7vAc9jT+5CZwRohMdeMLE19uVm95lma5WPlFqyEcuxLdffFz
	XZyQzd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwo3v-0000000AZYY-1J2E;
	Wed, 19 Aug 2026 21:43:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwo3t-0000000AZXr-0J9X
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 21:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787175783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=;
	b=EsbEEKWWCmEezrYZlPJSt1/HFdzq9ooclIbWnYh2cXHGxkyKppLrfYgz0lnnjH2KUFpcev
	3ZAMv4ze8ixv5ooF21qP/q7qYl8tZkEfCUqxP1vErAKZAGrZRy4iwU6sZhv/AL/MrRASWp
	IdgLNlLmPsk9Lw69+Wf6O4Z2GMDvDoA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-jH-cPOtuOkOfWQITIbnlhA-1; Wed, 19 Aug 2026 17:43:01 -0400
X-MC-Unique: jH-cPOtuOkOfWQITIbnlhA-1
X-Mimecast-MFC-AGG-ID: jH-cPOtuOkOfWQITIbnlhA_1787175781
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930dda91cbdso289705385a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 14:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787175781; x=1787780581;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=;
        b=gDwZu3I4++B6X4x/YHZYTeM4Auk6hzjC7ItUczbxjlUtHdL5CCYZyHRftkBgx6fyCN
         0M1BB+fGo8l4yJ4vuXqC8SAVyROfbMWaTkrDIWQ+JLpBw0fM+jvNymcJt6RAAFaj2ggX
         v7UXJIPBRgwGdi+G6u7ALKdc6AuFYXCDEU71MrtpNOx6PHR/0n8YmgoBhtzAxdyeyfwC
         GBNeoPJVsbgyNehVXSsinIT1d4z22j0mXGnlJRRGUHSj6DoFfgxMKov9agC7+w9Dk7HO
         hdWK84mUDI/5IjgkhEC2DjneAKpk+wLXB5E6nBA9qGRkvgUSPrJ3IfLz2h4I7AnbqHwN
         gNYg==
X-Forwarded-Encrypted: i=1; AHgh+RrHqjB2wkZ7exHE8S94mpBpQ4KCyj51+i8S1wPpYUs/hkajNzIxXYeCJxESKz1C+JsDxlxhfXIdit/x7OOoew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8mK5yOi2ycZ9IsWxqYQfOvKlEUigDizEikXNozhWMQenB6S97
	z23aZbNCNRB/YQvnnarzDiLQlS1oWSOy+Cbbi6mu9selBwZIQlim7VnyxaUYAWoZec8znzaMNVr
	2Z1U+QOfQxjZPsJflAtmkmIwiXtwl+OYcwGd+sVw7GF+WlCwHuDXXRtM+yKtbPKiNuP5v1+QW7J
	OZIDfn7w==
X-Gm-Gg: AR+sD104It3RuhtBbC6usZ8cbBs85AqNJEvuhvv1l1KFWA0ioTEkfdnvbos5DKW2OHM
	RhGbSjzdpvVuxSwXZLBFq4XLm/DedtW2cUBVXHXWHty660WszuRHbLWkrG3Wt2awc6XpxSXSHKB
	iCrFaz6FmfFM4GVJ4kHVi9X9g2CK6413ltcPS/1BDFARzM7Lt05LLsmOvW1adkxTOpM/UlTxIzx
	vqkw9ummNzIanfOTDZ4ATw4Xaqs+niJYCbrZqaW0LBvUZwrboS5qI0xSzCWw7EjTaib6I+vIZrk
	d4cSrPpaF0JMIO4yCDSEJGeKk5GFAVyz0PkNZYIwc8ZP8x9lBvelCmiI9AYpuT9sJw6GKlzcz6I
	9Qa65/LZjPZLWzJe0nQDoCTjlMubN4FVBc4E=
X-Received: by 2002:a05:620a:2688:b0:92e:4470:f6a7 with SMTP id af79cd13be357-9371e1f7187mr727422085a.10.1787175780967;
        Wed, 19 Aug 2026 14:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92e:4470:f6a7 with SMTP id af79cd13be357-9371e1f7187mr727417785a.10.1787175780441;
        Wed, 19 Aug 2026 14:43:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9372056b803sm225396385a.23.2026.08.19.14.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:42:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:42:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag
Message-ID: <aoYjYYpQ50JAgokb@redhat.com>
References: <20260813153113.3952621-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260813153113.3952621-1-ruoyuw560@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lG9mtWR0UhNTfPllI4V5KNDrLnh4av3KNEpzhGQMqhg_1787175781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_144305_192362_BEF6A293 
X-CRM114-Status: GOOD (  18.76  )
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

Hi Ruoyu,

Just one more comment on top of the Sashiko review.

On Thu, Aug 13, 2026 at 11:31:13PM +0800, Ruoyu Wang wrote:
> The MT7629 clock driver calls clk_prepare_enable() for six clocks that
> must remain running. These calls create permanent references owned by
> the driver. In topckgen and apmixedsys, provider registration can fail
> after the references are acquired, leaving them unreleased.
> 
> Mark ARMPLL, main_core_en, the AXI, memory and DDRPHY selectors, and the
> UART0 gate with CLK_IS_CRITICAL, and remove the manual enable calls. The
> common clock framework then keeps these clocks enabled without
> driver-owned references. This preserves their always-on behavior and
> avoids leaking references when provider registration fails.
> 
> This issue was found by a static analysis checker and confirmed by manual
> source review.
> 
> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt7629.c | 36 ++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
> index e154771b1b8bba..627e8017fa642f 100644
> --- a/drivers/clk/mediatek/clk-mt7629.c
> +++ b/drivers/clk/mediatek/clk-mt7629.c
> @@ -48,8 +48,9 @@
>  		_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,	\
>  		NULL, "clk20m")
>  
> -#define GATE_APMIXED(_id, _name, _parent, _shift)			\
> -	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
> +	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
> +		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)

[snip]

>  static const struct mtk_gate apmixed_clks[] = {
> -	GATE_APMIXED(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
> +	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),

We shouldn't put CLK_IS_CRITICAL in these generic macros for defining
clocks. Your commit message defines specific clocks where this needs to
happen. Put a flags argument in the macro, and pass the critical flag
in. 

There should also be a comment with the code describing why the critical
flag is needed.

Brian


