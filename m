Return-Path: <SRS0=RWvT=LA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37D7C4743D
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 22:54:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC9761421
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 22:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FC9761421
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgjLaM9PjMz/mzl4ZC+DsqbAZb6Lg1pMdHDeRj7wFmI=; b=nAbQcJueft6gV8
	hZYIXYyByAKH15ar7Es5BAslv38WKBu7cF3T9/+BZHLsw8rqLJEcVZI8dFKqhYMEIizl6+c8v//cO
	haBDMy6oPnUqIcvHuk3kwDeYfu+T7oZ7rSATVfsiudLraboM+s2xtRAKrt47gkaUQhCqHAMPRjdE8
	CnvrAMhv+UsziW8g4W8YCUkhZ9cae0sZYeZCaoyUkgq1X95TPzcwtVEI47XN2U0eDxqoGTA6aTBZo
	hreq341lt4ggfo2Jq28ecP50eq7buchH4w0zq3cAretHAp9FHLWnuWq/9i8n/Pe7DRe0/W5UxuGSK
	kXguGKpTaRYnlKj9cCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq1d0-00102o-TG; Sun, 06 Jun 2021 22:52:22 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq1cy-000zwo-Cc
 for linux-mediatek@lists.infradead.org; Sun, 06 Jun 2021 22:52:21 +0000
Received: by mail-lf1-f44.google.com with SMTP id i10so22998265lfj.2
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Jun 2021 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iEbRc55cDF3GuY6tvDFWk91oaBVpX0Pho0ibTrUBkXQ=;
 b=cDwD7oAayWVEY0p53KOvA3tzeOOJztne+kX7Zzy05xi1ORszH0ab92iLQPN8fupuDW
 G4bJtFoiXz1cvMn2DYNj6h3Y7wy91Kct7O6rRiXk9kAnyLxuxuaziMG/3YVRlMU3AZSa
 kkGNwR/RtMYBQ0X6eFKE8DKy2Ts6aVLgzoo+XR86JgqP+h5+HU1iIs4nXJJUX1NYwgjP
 eBfK5t1R2VA2hNeB1I/2tjCiNivVVQ7XfoaiOZV+1xK9HKvd1pLa6WZ/L3Y13qYFxEhQ
 T45b2pg9wc3dA5vdoje64KJJZVDqgpFHZcYuDpoYwq8DFUbG4VGQWyhk3a0crVYeUsG7
 5RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iEbRc55cDF3GuY6tvDFWk91oaBVpX0Pho0ibTrUBkXQ=;
 b=WdOMlL2YGo6CCA7saBoWtOG37aS77l30kDNBHN7+mkoM9F+x3Vh91icxOB0dr3doaz
 ChuqGYe098DrOiWnKnkZrAo35WXFlQq1JPmAJhaaMRaEww/WFfaKxhe/sD5EjCGiP9IK
 AJ8YSsmPGzFdL2OQgKhr8t10QVAMhqG3wGvcoj3g+N3WVKXYrnT7FH1V7AXCBDAq4OAG
 XtQexOD7ziwrGxHcO4VV37FHl+WKD+jlUtbZ1W5P8r8UZGZZwR8PvE9I2eXLlv/wlE/K
 YWPt+UizXiN4AJi6CoJNa7Rovk6o3R+ufKh8a0RAVLZyZejaiJZHXpEA6GT1y1K9OR7X
 9xVA==
X-Gm-Message-State: AOAM530v/goo2D69XYMel4BCyh4kwi7Gzt+g1rR8Y0XAkg7H7cBxExi2
 t4p5bctfeGGjQB0E0qJlZ8kz+fIFC7pSiJf11vTaKw==
X-Google-Smtp-Source: ABdhPJwmi9KUXwEWgKvoIxJJ62knUHrUccA58g0GYY6WYgHiqv2yc6ZOps26gsdtMvQV2DAfAlPWWIoiaEhxDzDbt4c=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr9876471lfn.465.1623019752440; 
 Sun, 06 Jun 2021 15:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210528091945.411471-1-linus.walleij@linaro.org>
 <b3d9f92d-a311-0093-4243-b21f2646997f@gmail.com>
In-Reply-To: <b3d9f92d-a311-0093-4243-b21f2646997f@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Jun 2021 00:49:01 +0200
Message-ID: <CACRpkdY_jfYe1PNLrbrFMQBbcL+oucxOMxbREb8-LTCdANRv1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: move bit assignment
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_155220_453094_0BCF38E0 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 2, 2021 at 2:34 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:

> > -
> > +     bit = BIT(pin & 0xf);
>
> I see this is already applied to linux-next, but I think the correct fix is to move
> bit = BIT(offset & pctl->devdata->mode_mask);
> just before calling regmap_write(...)
>
> I can provide a patch for that, if you want. Just let me know if I should base
> it against linux-next or if you will drop the fix proposed by you?

Just patch it in my tree, I merged more stuff on top and this
was just my quickfix to get next working.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
