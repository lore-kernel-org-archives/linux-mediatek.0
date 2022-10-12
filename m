Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BF8C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 18:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dAMi5/mvpnx7OR0d/iFkXATxA1PKTD2Ztpj7qqwBAk=; b=BhawUlsHfWJCQ0KNm0xnkh/Nuf
	WrVU09S1fyZ8F/pcxn2Qc4K5J16JIwHivuwTLemzz8IJDNq9rwp7Lkd/ARF+dAk1B44mHxKyCKEDW
	m1ER8wG+j8rraBpOnrb5lKG8sKKorEXHgNNHWrkqM8PVK6xV94JB2yuCpLRBdhjFZeH8qKmeX39kz
	pKBlw4heVrTeYvCiHQlYRmIyNoxbTSJfB5/gguaOSXPLk5wT17D0kyNY7ztSChqPyeTkmTsMMUltv
	Fp8gGVxT8Zrvn6S1hTd2Zk/Iq9KjLwlc+l809X3YuU8ouEUIwv6SqeyDyGIVXhC1TQwtpf8xWAAX3
	TIwHx00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigtN-0093f6-CN; Wed, 12 Oct 2022 18:55:45 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigtK-0093dO-T2; Wed, 12 Oct 2022 18:55:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d24so17091243pls.4;
        Wed, 12 Oct 2022 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dAMi5/mvpnx7OR0d/iFkXATxA1PKTD2Ztpj7qqwBAk=;
        b=pS2iTkA5/q2REoYlw8Qrmn1Bx5rUg5ha3eAyUVdps/c7ALpArkDFtHb0jd7Gz/78Et
         dwcwRKGXRgl7YZvir+ErSb/SkwmyeSzTKfPBM5A+DEnqCSW5VkAs8bpOLnGY8uWuatZD
         MHB2TBO28THLzO67ncguwpoIvO858LqQB4nXOFz9bB0q0uMuFogQ5oNlQTkONipFTIn2
         NmmiQj4zPAqASQZi4P/7IyKbYocplFtpLsjGuhO4AOYR13DthHGUYWIh/01y2bys1ssV
         sdOjPzUvD3gF2PnMz5q+xUTqRkf6+L/hGgl7A1aGxXKX25MgTQs3Asuv0L8xSn350DOq
         Av4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dAMi5/mvpnx7OR0d/iFkXATxA1PKTD2Ztpj7qqwBAk=;
        b=JRHxGZsysN+yR5wWdb/lyqq0lN+d5HpnMhdfeEGnMmePFaoiHS6TczvC4mPqREdtSL
         OB1ZOVYyFplsQi0Ir0dURXJmO5ywsiO2kWlPf4BjnH/SG0AfamUc1Q99hLy1IwuXBpG5
         cooeCX8zDXkVoOo2SqUA8WKBunoSTdtnu7IPBsDip3eesjOaehEVHUeMmnxqXwruqKZ6
         ggJ1S5//i0g5qkchWWYDDj8a9p580Y0qUofZa/wlTiWE49lzEv8i0MvldwzyVK6dC+Ok
         BG8pT//VyLGRoQS8EX0B12wJMy3uqe+TWQYp3OfTxfbGfPocOpVwx9YLZmTAAg88xabC
         Kkdg==
X-Gm-Message-State: ACrzQf1OsGdKjl3qMamct0V5M462CSklcCPQm5ZGloOGPkxYpFJ9hEdg
	Zm5PB2uBegSsfrYxKadDh3I=
X-Google-Smtp-Source: AMsMyM5BtLR/wWpb3iG+V7bZPXJJH1Ke340SVWfrNV2hX11yO3vwimGboY7ERjAASJbUBDyar7bHXw==
X-Received: by 2002:a17:902:7894:b0:178:bb0b:5740 with SMTP id q20-20020a170902789400b00178bb0b5740mr32414920pll.65.1665600939579;
        Wed, 12 Oct 2022 11:55:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d4c1:686c:5489:5df9])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902f15200b00174f7d10a03sm10914153plb.86.2022.10.12.11.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 11:55:39 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:55:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] gpiolib: of: add a quirk for reset line for Marvell
 NFC controller
Message-ID: <Y0cNqBKm7LhZd28t@google.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
 <Y0aW7vDxfNa/8bAk@maple.lan>
 <Y0cLLraNFVXtD2/k@google.com>
 <Y0cMibfIomw3S5dc@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0cMibfIomw3S5dc@maple.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_115542_953553_019E0F2D 
X-CRM114-Status: GOOD (  21.78  )
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

On Wed, Oct 12, 2022 at 07:50:49PM +0100, Daniel Thompson wrote:
> On Wed, Oct 12, 2022 at 11:45:02AM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 12, 2022 at 11:29:02AM +0100, Daniel Thompson wrote:
> > > On Tue, Oct 11, 2022 at 03:19:32PM -0700, Dmitry Torokhov wrote:
> > > > The controller is using non-standard "reset-n-io" name for its reset
> > > > gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
> > > > so that gpiod API will still work on unmodified DTSes.
> > > >
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > >
> > > How/when has/will the DT bindings documentation for this hardware be
> > > updated to describe the new bindings?
> > >
> > > Delivering the quirks ahead of driver updates is great for avoiding
> > > merge conflicts but it also conceals the rename from reviewers so
> > > risks neglecting to update the bindings.
> >
> > I was planning on sending binding updates once driver patches land.
> 
> I'd have a (weak) preference for them being shared in the same patchset.
> Maintainers can either ack or the changes can land seperately but
> having them in the same patchset helps avoid having to quibble or check!

OK, so how about once we agree and land this patchset to gpiolib I can
blast driver patches + binding patches together?

Thanks.

-- 
Dmitry

