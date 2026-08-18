Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BCC5DF74
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 05:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0YhvxrTBybFCJOyKw4CeuxSV0om/PxfxriRtGrnZuA=; b=g72iouNq09HTE7Mvpwkhaa6haz
	qfoBBdMa1GexE8D12HROJRqo5osvwgXolrbruRhgpb39Ft8ElXw578Mlxoy4ezzlpfsy5BUeiOfk3
	u3fRIEldOf3ifmv6V2LN/y7878L4P0l0FxPQ+MhUOfD67fZFS35c02EqLf2dCa9hlVSaCPPgBW+KJ
	EVTJG9GgJMXrFgb2XoihPvitd1RH+LdAWdUItppu7w0d9scEn3NW6f54KA36zEPLDs93w28MYzZ6z
	2kdzePtptFTjRXvonRXRLnF557jkvfhaSh8pKbeLYXKzUJjKTZQaQqKoU1f/LtoGiZ684JM22qd5u
	gok8Tg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCCd-00000007Kuz-1g0J;
	Tue, 18 Aug 2026 05:17:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCCa-00000007Kuf-1mTZ
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 05:17:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc891373e0so54781635ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 22:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787030251; x=1787635051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0YhvxrTBybFCJOyKw4CeuxSV0om/PxfxriRtGrnZuA=;
        b=NDKgTs8w8ZTudnQLHnXc+BFtVKKHAC61xC5SDIWuu6Gg03PtBgC1Y+tfXz8tv+nG36
         cIW4Sgm5CNpY9QBQ/lEV0dQyRmEL5r2L5Ct/dcGGlnR3sEPIl++ArWcYxBrm+PPF4L3N
         mo+4jZ9Bp3A4GGY6YgT5rL5fLRLSHvazgQzRaDef+eoctS/PdA/6z8ocp4+wyNgow1z9
         ZmwpdRCJ952nSlea+TVokq1JfaTN9Ez5U9EzNMLvm18rox0OrkR25DOTKI6idIP+OiUv
         6tRSeF4iF0Ve2jimzkaH4hqLbDXEly8D7ZKo3IDHVcypfHKcnTkaQ64eagciNu0zcNlb
         AWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787030251; x=1787635051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0YhvxrTBybFCJOyKw4CeuxSV0om/PxfxriRtGrnZuA=;
        b=fBx1C2v1+bwtIyJlgtYy7ZbQGppBS5c80iHeAbGfEDrVIcGCGqeKAdVpCFPGG6H7h+
         GCnvioBboN21KE2o8LgSlMhWQHgy8v3Y+inXLDN4pjch7t6/Uz0tQmgG27CBhdiTvf7D
         JYgt3hQITTXLw70v+w32vmicxh04wHWiSTdPx6y8wfFOaZZCmS8HfZAvE3HvlUmSC+ax
         At7Ehoy+3sOHjoso2TQYmJxyDjm0fHe3n2VwCZaGK6/jPW4736X3mf4jZdqYBXFCu7kT
         ZVqpEIiGvgxN/gV0zSlu6eNvXU8ZYBtYNjioT9Ehw0vcCfHxpAoqh2pNtRJ15sNcbXn5
         Hfww==
X-Forwarded-Encrypted: i=1; AHgh+Ro+uS+Bh2iRi5NpiDkjQhjrqwrSFGfNbUri7DSR3Y5CpytbkeZUoQm5aHJrXGnuhWUw06EV9W+6MOKMNiok3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzagB41VEx0u3+F6EfDAnyo9BVClQ5NbntKFGJtftFq8bfpboI7
	Yzc571MthF72vxb8XSYf2hgqBY4/7J06rN5ZXU+/UNxScluVOepQKngg
X-Gm-Gg: AR+sD10hYOkixdJ05yykP+CArMmOiDREh+ug1C8jt0Ddh4uPM79x+MdOJHX6wHhEd3a
	SL24C3mz6Efy6t0AujqE5rZSYwpeS1yD/AEWhM+vnp/tuV4AIKOJlb5qAZ1r0XTvyflM7lwHKZ2
	A/JFCLwlWlTkzLMTXjKJIa8Jo8/HjydwTTbilQEtPHnrlRRM6JTjLq7wIK1FI1NCf2HT5GNH0vR
	/I50MZKYZ1Ir1IZqhuXIWglHc0MafGqw4T/RnCR5X+0Yq6Zr4TlG8/BH5oBUo5odfnnTkJCWtYB
	+aGwMTYHXerQt0lG1RYCy/tgXtNIkSavrPOli74Q9ieKLyBY3ottPrg+D85DJe8OJG3ClboVxjW
	s+tJsMyJGjZt1pJYEbldAkhLJV1kOy5lIS2n+Fs4/G6/cIoUnsr/AyLcqAlu8EK9QVadzjLqUA4
	t/1sOnt2lCvZeGO8U/JATpyS29THQf7ESkBf52XUrheEw1mSGcmeEv5ni1vRaOpcL/4DeSZu6QG
	Flhfw==
X-Received: by 2002:a17:903:3885:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d3b0d78794mr319291935ad.5.1787030250915;
        Mon, 17 Aug 2026 22:17:30 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([59.93.231.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528e5sm9880995ad.50.2026.08.17.22.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:17:30 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:17:24 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linusw@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] pinctrl: airoha: limit GPIO interrupts to
 interrupt-capable pins
Message-ID: <aoPq5F8dVl/FQ6Yp@DESKTOP-TIT0J8O.localdomain>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
 <1cd344b3-22a3-43d2-83b6-2eb01b3245d3@genexis.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cd344b3-22a3-43d2-83b6-2eb01b3245d3@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_221732_467980_715054F4 
X-CRM114-Status: GOOD (  18.47  )
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

> > +{
> > +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
> > +	unsigned int num_irq_pins = pinctrl->num_irq_pins;
> > +
> > +	if (num_irq_pins < ngpios)
> > +		bitmap_clear(valid_mask, num_irq_pins, ngpios - num_irq_pins);
> > +}
> 
> I'm not sure if there is something that gives a sane error log if this
> trigger. Maybe make it explicit?
> 
> Either way:
> Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>

Nothing logs the limit itself, the -ENXIO only surfaces at the consumer.

However Most of the  gpio_irq_chip::init_valid_mask implementations in the
tree log nothing at all. Only pinctrl-baytrail does, and not for the valid
range.

Happy to make it explicit if you prefer, at probe:

        if (pinctrl->num_irq_pins < AIROHA_NUM_PINS)
                dev_dbg(dev, "GPIO%u and above cannot be used as interrupts\n",
                        pinctrl->num_irq_pins);

Thanks for the review!

Linus, since  the merge window is open. Is this still worth taking for v7.3, or
would you rather it soaked in for v7.4? 2/3 has no DT ack yet either.

Ahmed
> 
> > +
> >   static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
> >   					struct platform_device *pdev)
> >   {
> > @@ -362,6 +383,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
> >   	girq->default_type = IRQ_TYPE_NONE;
> >   	girq->handler = handle_bad_irq;
> > +	girq->init_valid_mask = airoha_gpio_init_valid_mask;
> >   	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
> >   	irq = platform_get_irq(pdev, 0);
> > @@ -848,6 +870,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
> >   	pinctrl->grps = data->grps;
> >   	pinctrl->funcs = data->funcs;
> >   	pinctrl->confs_info = data->confs_info;
> > +	pinctrl->num_irq_pins = data->num_irq_pins;
> >   	err = pinctrl_enable(pinctrl->ctrl);
> >   	if (err)
> > diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/airoha/pinctrl-an7563.c
> > index 40cbbe90cc46..f011c6c9ccce 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-an7563.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
> > @@ -1069,6 +1069,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,
> > diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
> > index 2fcf88106e11..bfb777594811 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-an7581.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
> > @@ -1441,6 +1441,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,
> > diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
> > index 2c3a75c35915..1cd0f442ddc1 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
> > @@ -1471,6 +1471,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,
> > diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
> > index 5aa39bacf460..b0c5e60f0aeb 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-en7523.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
> > @@ -1113,6 +1113,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,

