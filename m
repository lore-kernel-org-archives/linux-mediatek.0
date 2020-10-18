Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A652C433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 18:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C1642087C
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 18:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0t+rQ+mx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VB2Ag15G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C1642087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rb7/vf8MZ5BVXL7IllLkP9MDoEv4EXjyKbBt99PYVGc=; b=0t+rQ+mxOx02XvjTCuEGwQTsV
	EBz/hlVtHLbLhxQqqz29hUY0SjTw3k/knsfScUzjMPIVch+8APcx/ihp+YaRaasLjjzWCrG7WrY3V
	adpVSiDHzazioPHQIobzAM3SQJx4+eMejurtjvSnYPVLzm5g2jilmUb3AAPKhPfxEajTYUUwyMAa5
	PEX2gyiSg+WeWYpvjlp2Bw4lytiJmbz18j6gcPiahi2oyeZXrFEX8Fz7d+dqjoS02eDFoRMBb7d1l
	tG67MRx9lw/XG57S6R0LjXRdl9mpfUFupCyBe8VbS2V+yEKaY31SWjIJp46xDzuaBdbYMof2hrcTk
	AwZJ1t1BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUDUm-0000ux-7V; Sun, 18 Oct 2020 18:33:28 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUDUj-0000u7-VT; Sun, 18 Oct 2020 18:33:26 +0000
Received: by mail-pl1-x643.google.com with SMTP id h2so3835605pll.11;
 Sun, 18 Oct 2020 11:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0SrAGDyFK2BtNvaUQ65CcmVzLfIt/f5Hvduu3nRwUdw=;
 b=VB2Ag15GmAzpJXuXh/iym02MciTot9l2fl+pc6XM5bOK7OPRdiykb7AKYo9fIUnRP7
 hOWMciGEd1qdenktWa0UyCr0Kv/wSy6LjWPGLt+a+F5xN9pI8MXwvUhXasGbLmmJzExL
 cMFPu0rd/1lehBji8g7bez6LDDQ8lNS4Dlumq7aUwdkhpsIB137fEoTbYR0uThA/IclT
 EvWIMYTXSyoVVR8zDfrj0C2g3SsWj0imX5MF0nbeXA/z2XsEcg8PF2Zofp2kK332ljDp
 5K3w/TntEfYGYI0PfLG4/HPNCSE7wDQSdeLNzOVfTmBs1FyL7nj8QcdHRYCWprALypao
 Vpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0SrAGDyFK2BtNvaUQ65CcmVzLfIt/f5Hvduu3nRwUdw=;
 b=MeXsVhVgnel6yoTwCY4BD1G7Yx0Dr7dKeAuC5PeLJWsZ1OTytFlOeDmmVP+v84t1fi
 PgfdNF5WcRuQmeWJl6raTtvCiUi+3g2YYlvCW7bmxR9I404drWROjkBiI75h0HQqJNKU
 7D/imhfrhYsygvSY5PmTrtH3qsofdRnNPKl+awgXGj35zfw13A1XsxGS3EOfmOA5l+gb
 Ks3X2pG60yHwNuhR6h0287NDjF/NCDIdHX5UJ5gUnJPTHYFItE4jkEZIog0VFG7FpKUI
 UpCU4EPNhJlQM2bDOKGGNSSahGzQh97K+ASA/1siBClzVgTxxrj99WNSYELhpbA6+C/u
 7jdQ==
X-Gm-Message-State: AOAM532T+FxdH2qaK4K0rtRJNlgmUeE8Ua8zGeC1iVLVuPigFQ4bd5P8
 bv9pUcJICVHPgD5nA+UshUyjwenLAtxItJb7I8M=
X-Google-Smtp-Source: ABdhPJypeDUZ9reAGTE+LRn4S1EdN7M3XMYdbpqrqhgMlq3vVZ/xmPqYOcYlt663OzGWlvWpihVjCdE36fP7laIhiLA=
X-Received: by 2002:a17:90a:be11:: with SMTP id
 a17mr13500911pjs.181.1603046003874; 
 Sun, 18 Oct 2020 11:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201018171545.3190476-1-fparent@baylibre.com>
 <CAHp75VfJUhA3WmmirctmrieQfZKSNerFa=nwPmBYvffXUTRp9A@mail.gmail.com>
In-Reply-To: <CAHp75VfJUhA3WmmirctmrieQfZKSNerFa=nwPmBYvffXUTRp9A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 18 Oct 2020 21:33:08 +0300
Message-ID: <CAHp75VdFw5jy10QSOFbJVyObqEmiaavFM=BFd92kw1AH4rMxqw@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: mediatek: fix unset field
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_143326_084082_66C2AF92 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio <linux-iio@vger.kernel.org>,
 chun-hung.wu@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <jic23@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 18, 2020 at 9:31 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Oct 18, 2020 at 8:16 PM Fabien Parent <fparent@baylibre.com> wrote:
> >
> > dev_comp field is used in a couple of places but it is never set. This
> > results in kernel oops when dereferencing a NULL pointer. Set the
> > `dev_comp` field correctly in the probe function.
> >
> > Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
>
> Shouldn't be a blank line in the tag block.
>
> I think Jonathan can fix it, but be more careful in the future.

One more serious issue, you forgot to add tags you have gotten in the
previous round.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
