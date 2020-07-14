Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFC1C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:39:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C5E2064B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OSysN5un";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVoCKRwI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37C5E2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5S9aIjWYtLMdNclAYaq4KIeh+EZ4MzGcJJu1b161pmo=; b=OSysN5unLuLHG2zIhKXJoDeXx
	gRnVkfxNPdmt0pkTY7NlIVd3DtAm/YDHzKhzIcyil3LeEhYjbnkDUfr2Ar4pYy0ZePVDRD2t67Q+r
	rTMl8LJWTMRvtXx1McW9QvuIwLH7b+bWGleHlFoGmBJAviWVXCPBlxC4INm1InFW/nVeOjvRupMlW
	K2Pv9mo9KYthwGcHMYSu3QJO3BYDYzrEPuiKrm84c8N5px8Xv7v/WUlZ3+ZmH69/zEAjTQShg014d
	kjGBARV8vTqDu3XRSUSaFe3jSBKCvETmU2FwEzJOMg2VLtNVU9qY5Wkxo08ruBXhEyz8HYK719Jai
	rt3b4t9Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvRiH-0007on-28; Tue, 14 Jul 2020 20:39:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvRiD-0007nF-GP; Tue, 14 Jul 2020 20:39:38 +0000
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E77252074A;
 Tue, 14 Jul 2020 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594759176;
 bh=vsJoqLN3SowqXMSj14UqCf7GoNEyfVmFAh/NYPKXAZ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fVoCKRwIV4K7Wqykziy83jgg8ZZqIGWNoAzVJrsWSJ9J3MATXaP/ZlMMq44nyCN0V
 UTy8QkOea86rNZsPfFMKiUS6W31rrvcGmhMLmcm77Dp7t+FR9G8tfjnvYxygM0XC19
 jCdziyY3J/aWpsbddB1xYA6aG5Iugkc+lfKnAgTo=
Received: by mail-io1-f47.google.com with SMTP id a12so18716182ion.13;
 Tue, 14 Jul 2020 13:39:35 -0700 (PDT)
X-Gm-Message-State: AOAM531NDK5v48/wv7hmrUQBl7MfQFIS9LI8O/r9d2nVoIsOfR+/2pPB
 /jHEJJ2PDaa6wvL85pj4nN+TVUJUn4a5VfHR0B8=
X-Google-Smtp-Source: ABdhPJzCMOZaBUcXd8oqTwkKwaQnQ2GH27rKGys1KnzCXRDOUXcH2ttDkAm5+RLVmZLkn0KwR0sY4hSHIuHuW0tQ1mk=
X-Received: by 2002:a5e:da06:: with SMTP id x6mr6817841ioj.196.1594759175401; 
 Tue, 14 Jul 2020 13:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
 <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
 <CACRpkdb5TyictD3j_PE5JtBJmxX87Bk04YkxF1ErsbHwO4TSOg@mail.gmail.com>
In-Reply-To: <CACRpkdb5TyictD3j_PE5JtBJmxX87Bk04YkxF1ErsbHwO4TSOg@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 14 Jul 2020 13:39:24 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpbSjJ2f=rKMhfsrgXcVgiWzmyMvcXfrMmxBchezARNag@mail.gmail.com>
Message-ID: <CAGp9LzpbSjJ2f=rKMhfsrgXcVgiWzmyMvcXfrMmxBchezARNag@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_163937_736319_4290A28C 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > Sean if you're OK with this patch I can just apply it separately.
>
> Ah nevermind since the next patch has your ACK I just applied this
> too since it's a dependency. Yell if this is wrong.

The patch looks good to me too.
By the way, I didn't see those applied patches in for-next branch yet
I just think Hanks should send those patch based on the top if he has
the next version

>
> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
