Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F006C4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOfkL7MyOeQeSrJ2F21ekedGlSVWVhq+E3DdO0nm1r4=; b=taCeJAKwtACCKxxUNhfrfbmVqM
	2ptaR3xhcS6mrVqtTcb4ybGZYQkfwk5ccrhA4aTd7F/xw68ggKNfQTCrL3VeWPbau/deioqmXiyI3
	Dn6UAoJXB7Ti6eMDXOn4zZLxRuV34vRilDazzu8pEgmC5Og8ojmojedCOjiR1VfSdfd9uXGXQ56TT
	QZXH3VnCosSua7UN01maMHIvuytjVdO1v+RQVEQ9FfK0Wj0pREicKjPFFTbLltzxGWjV0lp+dIrC3
	MjTo6A/b9aBxnQm2AVnD1wwjQ+STy2r45abVcYOqsMepusyxgWPoGT9nRWWxxMAjHGtEodjXdGx7Q
	uFyBKMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWgx-00ESsY-VH; Thu, 05 Jan 2023 20:18:24 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDNRM-00AbhU-3S; Thu, 05 Jan 2023 10:25:41 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id g10so2432896qvo.12;
        Thu, 05 Jan 2023 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TOfkL7MyOeQeSrJ2F21ekedGlSVWVhq+E3DdO0nm1r4=;
        b=c3GVsPT+wysvPStVKkYnBNMJlfpAT8IQ29T6m2mBmXZfX1sVJts/3K/QOPnib88xoe
         DbBI1krlALLHuqtaDPBh9iKcRDT5sbvXKDixd3n4JLKplH7ln1Vqn/4GsnqlGNheXgDc
         yuUt6UhqoMS3ynCFK0mbjy31O0Wyl+abWSim81r3HI/tYzijPDH7HjrNkEVb745g1C/7
         irJToeSxFZ7wRNrfARCNuYpF5IgliaPOT+wPgG4qBctVMsjpU1PhTPbSlzJWqsRvnsAJ
         wkhThC2XyIN2joFBPZQOgeX1+hLd8HUdKg5CnR+gcPxDb3jH7vtxFDhWitKan8ZKbRAS
         +FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOfkL7MyOeQeSrJ2F21ekedGlSVWVhq+E3DdO0nm1r4=;
        b=yHOZU7BXJato8x1RUsxPLEqO/RVLe5rtByFO+NkoIbp1ZUtiCPdlNBYFTLbtxteeRl
         EfhAF+ShiGssbf8omPx5zmN9KhJ+ge9ik45ZugnS+8JDD0ZTEXdFkGsl2G4fzAwG+JQz
         KLedv4TfbvLSLx7vIZ6gXGPym4bDdagcyAmuH57FZhUXAVRKUU84acO05/YiZamSiD1i
         Ig9cl6m24IP7dmpaqW6z5MnnXY42lPQjjm8AK06K4sPHwh31318P6gW12Afr8F/T13Up
         65Ccj10cUu4MtlbCBxPyScTqPpanMGxLmn/46waZ0Gr6j8cORWV2KoVD214c9zRQqUJI
         zSIA==
X-Gm-Message-State: AFqh2koopNEOYg2diIcnN1Eh1PdUPn5gkIBAqe3hg9c/+uDv7LMdKtCX
	SdYoViCbJNdur+khyi+qwNy4NrJaM/+jHe9GsrY=
X-Google-Smtp-Source: AMrXdXtvC0Bt/DBCsyOcP0u0xHxoN3Qc+QonoeKkfiWauqM5Fa1hRedoh3ln8itCPshJjSL8zDCzwwy9cTcze4ueQ6A=
X-Received: by 2002:a05:6214:3313:b0:531:c954:a557 with SMTP id
 mo19-20020a056214331300b00531c954a557mr522380qvb.13.1672914337262; Thu, 05
 Jan 2023 02:25:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672728620.git.chiaen_wu@richtek.com> <c1c6d3e51c93c15620ded0e2a53dcbe5de066ec9.1672728620.git.chiaen_wu@richtek.com>
 <Y7QoNpbFRsK3bW6V@smile.fi.intel.com>
In-Reply-To: <Y7QoNpbFRsK3bW6V@smile.fi.intel.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Thu, 5 Jan 2023 18:25:01 +0800
Message-ID: <CABtFH5KjksZ6GSOMafU8aS5mJzGkd8SDGEzH5irFUEFceQTWtQ@mail.gmail.com>
Subject: Re: [PATCH v15 RESEND 2/2] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: pavel@ucw.cz, lee@kernel.org, matthias.bgg@gmail.com, 
	chiaen_wu@richtek.com, cy_huang@richtek.com, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, szunichen@gmail.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_022540_198113_472CE75D 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jan 3, 2023 at 9:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> >  obj-$(CONFIG_LEDS_RT8515)    += leds-rt8515.o
> >  obj-$(CONFIG_LEDS_SGM3140)   += leds-sgm3140.o
> > +obj-$(CONFIG_LEDS_MT6370_FLASH)      += leds-mt6370-flash.o
>
> Can it be kept ordered?

hmm... I found "mt6360" actually did not keep the order either...
Do you want me to put it after "max77693" or after "mt6360"??
Thanks for your review.

-- 
Best Regards,
ChiaEn Wu

