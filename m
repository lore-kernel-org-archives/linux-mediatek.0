Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BECFC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 01:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/GnsvYzCny+dmNEkGgCTHzZXDk1Ni5cyCk/C+scny4=; b=OCk6RfbXzHjbpXlmNBZMMxi4qf
	K/Qk5quBPoZO0jZlt2HRpDDjcsmQbfAgswLP++QH/M3jNx0YCA5xt4q9nR5Hplb3dZvr3gXOr7aAt
	NmJOk8c8citGjMTBWH9MmvFRaLl3H/528HRBpZeXByvHK5qfTsqyF7XqGElS/ydE71qAqURD2UvDY
	geMun2iBL3Ub5p2bgXTTtBBxEPr4E8uD9hAbhdGOxS0bMWwB+wgRPzO1OLZSYBBqBXTCD9AYaCaU+
	MjF5TaikqBwdf78gfFZJ8vfku6OsGSubv+qzzBNSK00h7ppZjg0XFd7Cy/bYh9/W88G6JNKBYPhV8
	uF63eYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogcAl-006Q6Z-Mr; Fri, 07 Oct 2022 01:29:07 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogcAa-006Q4A-PO; Fri, 07 Oct 2022 01:28:58 +0000
Received: by mail-qk1-x730.google.com with SMTP id z30so2127593qkz.13;
        Thu, 06 Oct 2022 18:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2/GnsvYzCny+dmNEkGgCTHzZXDk1Ni5cyCk/C+scny4=;
        b=IvwFqG6QTISSBPWrff3K0Yby7ayx52bqFJHGFO//qR4HBeOA1JXm4BWw+7SmmPlDo3
         b34Dpjuq1Q5wy10h6jHJZRpcPCJqvsQAmmRHgZ7BiFJcf7F8KWCYPtowKste1uSmcKrJ
         upUcDf3MhctPe9CQie5bXHVfFsCJFeVGNNQ/ztZMg2ImXo/+PxmU79m+hTNsvrSr8Hsz
         QPt7D4Cq6Qfo73/vthAyqsDvqtfX0XWUwzZS89OXGOwLuuzTz9EqHhnhYkEX3RDMLxaL
         7z2/voo8CugkZXPLKdyNMRIDzoIFoUjHysv9jlrZXUWEybuyQtbtekjc9VKCtnAo1ZLB
         MDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/GnsvYzCny+dmNEkGgCTHzZXDk1Ni5cyCk/C+scny4=;
        b=jqDSIOrcA5S7RJzJ9UEfZ9GuFXtKdz7d40gphJZIIfB9ccvWFlbumBi5+kRbGwitp3
         qTQL7yiQRL17ZrH3BDDQMwHQgNAR62emMrBXD0uUK6NrT2K/CWGJybhK9vUAIYxPju11
         hApGLXTFit9imaz80Toi/TxIvtXbACBAS5UgnJcmzo4lTMAjeUnw9z64hO9RLOrPE3eu
         QJhn8NRI5/rLJHjY9miAKuVwWTV8xKIUeST9Gj3tTMZWDJib7HjOcN22K8277LFUhUWM
         v2OQbn1pxvmx7/4e5+lhGWFSh0LR9F11fQk+hdTAR5VAsXgtBaA4++/tAEQW3ySAMVDx
         Op0Q==
X-Gm-Message-State: ACrzQf0ip55d70XSBIFGjci/Yu5i3Z1ve/wy9tPK9EppajQZ1SrGuPTC
	p0rCNFfm6Bv1M3BkepACDOtxTnPDrceeyWUmetU=
X-Google-Smtp-Source: AMsMyM5+Qt0mAKsm6JZ0FNZOg7WcADIEReJ8PsguLHKw330lri9d1l77gvVWvXsGj3Sle/+oqHSPJhUiyjkUSjttX0Q=
X-Received: by 2002:a05:620a:3720:b0:6dd:beba:b3a1 with SMTP id
 de32-20020a05620a372000b006ddbebab3a1mr2262149qkb.138.1665106133111; Thu, 06
 Oct 2022 18:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664991040.git.chiaen_wu@richtek.com> <1bcd19dbd09650ddac7b96b0fe2932698be2731e.1664991040.git.chiaen_wu@richtek.com>
 <Yz11bkxz9lK4wOHE@smile.fi.intel.com>
In-Reply-To: <Yz11bkxz9lK4wOHE@smile.fi.intel.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 7 Oct 2022 09:28:17 +0800
Message-ID: <CABtFH5J2r=Qq1kNb=yp6Hf7=oKJH9qeiwsO+4ejy5m9N+ZODXg@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, jic23@kernel.org, lars@metafoo.de, 
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, szunichen@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_182856_862028_AC5A606D 
X-CRM114-Status: UNSURE (   9.17  )
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

On Wed, Oct 5, 2022 at 8:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

...

> > +config LEDS_MT6370_FLASH
> > +     tristate "Flash LED Support for MediaTek MT6370 PMIC"
>
> > +     depends on LEDS_CLASS && OF
>
> Why do you have OF dependency?
>

Hi Andy,
The original idea is to use the "fwnode_property_*" related function.
But this side may only consider just "Build Pass" (?)
I will remove "OF" in the v14 patch.
Thanks for your review.

-- 
Best Regards,
ChiaEn Wu

