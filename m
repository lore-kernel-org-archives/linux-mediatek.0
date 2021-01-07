Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F6AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 01:50:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497642223E
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 01:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 497642223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oRbHcy+eonVnHEmFDCCqdRbg3HimHlbO+uReTHwvlGk=; b=iqynYc5kG5wRmX4PUol6S/jFx
	XogEEbLss3PDLbiJfcs/GkHSDHpgNOZgj4h7Cz0mfli1KOoijytgu5ciUwk1O27mDcA5AU6RmlpCD
	z8HIyLxvx9ctSMi+8y2Ssp57r6WkMAFiIWL6V81wfoe4hsGgCAMj2n5d7BUFmq8HQx3YxEttK/6fz
	7IYRuOmwxsJopSB7uMwrtTYR/D0QuFnUGKj+6NW2hARcUFhRSSy1Y8siU5mSQy3KcF4elnJXa76dj
	RrzY6zw5/3yvqajmBGrPzpgYUsk67R0459TuhlrjgkHIzuJXJNZShO/45430lCmNT2S5u7nRXoqaD
	CivSp7Vbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxKRi-0005F2-NS; Thu, 07 Jan 2021 01:50:38 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxKRf-0005Dd-W0
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 01:50:36 +0000
Received: by mail-io1-xd2c.google.com with SMTP id 81so4647231ioc.13
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 17:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2P2u9jEjWHYVU1qxKrf4iKIpSUfUX3zNuv6jnN50kWY=;
 b=o9uaPPJjdoOqqWjDoF+6zow7bpzZM5nAd4zCN8YCAQETkDD3CrOk+M0aOrjER+Ma1P
 K+8feL8e1xUQrEePD7AMiNB2UaGYxrQFfbptq3Rgav+7h5GLeYHgxrN99bj4CZ0+HFl+
 QJW03cwujyZUkSKyslBTbIadFmtgAaGiMjmNOv78ZTLyjk1yo24TOx3kGRpYdcQk5dqR
 /xNf8s9seXFP/0DJrVhnvj+MmHCKBe3lvA1L431DZ0p3xKpegyJxMDzTTCjlIua5UL5f
 7wNU8HC650Eq0eCbp6nmzGqbLLtXJEnfxQqYb16lclGBr7XvlJYejMLfUeDhj0s5iG5+
 G5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2P2u9jEjWHYVU1qxKrf4iKIpSUfUX3zNuv6jnN50kWY=;
 b=sQb5LHQU5+PtlCJi8nRKsir8rOL0k1WBdp01wca3JJKzsCmoMzpGsSBPcpXXVjYyqX
 8/kQ9tlOVS3aG9ohKs6RvDs4MKuPylxNa0AjT7jkhZtAb7oxsfXjc5u/ZXjrI9sH0+dO
 9I+UFeyYTLociApzvqtPCE7SRqs+nWg2PsdFNDAAUvHtYxZ33mK/QkOUxYxXnruCEbpR
 EXPZEPAp/YYPqc4KJFQi58rmmtXuRwpOriW2roQfAmlZQqeoOIEcOo51YyHZD1BbPwRZ
 1BKKFgwIbAykPRlnK3YvhoEsoTUc/gmF5mPqpOP54t3VABvmn1DdAyp7LXPiGB+NWi9W
 VFNw==
X-Gm-Message-State: AOAM533E8QQZEJbUGKJtTyTTFuZ6zLmGf4MfxtouTIlx0boe7VvW9an+
 HYgGb5KxiWcpGsyMMUkPzN5dUmP3+KhmRIKXmgV9TQ==
X-Google-Smtp-Source: ABdhPJwnLMZbzPVzAP5dJqQf/bIvgS2HPh2LtxSQphRjCMi9klzEWcLCchHZzWTLlzo2OiyqneoUmKEGjiuJIzgTWAE=
X-Received: by 2002:a02:c804:: with SMTP id p4mr6149995jao.110.1609984231882; 
 Wed, 06 Jan 2021 17:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-3-tzungbi@google.com>
 <20210106231513.GC9149@xps15>
In-Reply-To: <20210106231513.GC9149@xps15>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 7 Jan 2021 09:50:21 +0800
Message-ID: <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_205036_238738_EC78898C 
X-CRM114-Status: GOOD (  14.10  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 7:15 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> >  static void mt8183_scp_stop(struct mtk_scp *scp)
> >  {
> >       /* Disable SCP watchdog */
> > @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
> >               goto free_rproc;
> >       }
> >       scp->sram_size = resource_size(res);
> > +     scp->sram_phys = res->start;
> > +
> > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > +     if (res) {
>
> As far as I can tell the if() condition isn't needed since
> platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
> is capable of handling that condition.  As such the code to parse "l1tcm" can be
> the same as what is done for "sram".

The "l1tcm" memory region is optional.  The if() condition is for: if
DTS doesn't provide the memory region, kernel can skip the code block.

>
> With the above:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> > +             scp->l1tcm_base = devm_ioremap_resource(dev, res);
> > +             if (IS_ERR((__force void *)scp->l1tcm_base)) {
> > +                     dev_err(dev, "Failed to parse and map l1tcm memory\n");
> > +                     ret = PTR_ERR((__force void *)scp->l1tcm_base);
> > +                     goto free_rproc;
> > +             }
> > +             scp->l1tcm_size = resource_size(res);
> > +             scp->l1tcm_phys = res->start;
> > +     }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
