Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677C7C55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 18:37:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D833520729
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 18:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taRVKBZu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2DVdS4mH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D833520729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FMlMhhAYntSMGSpvgrm/ZMHBS0Lw0mOSTUutTCJBO1c=; b=taRVKBZuoiLyA80fcjoKdLPob
	ROKrdQ8RA2henFHdJrlqSlrGNwlGYxtkQuUpM5cuocQA6WRdbAKR6MbakRveibfbJimhTip6A6yF/
	Zz5dawGnQBVaTJLF1dSkcv66bPlm4kl21cDgMxDMmoEOY5lCztkdTseAO4SijdQJC7Z6LUSzldjjv
	EmcsTDcBw8CiBDF0t27tAwaLwhOhpcXKzEO3AzjOsJZGzYQHEKxRIJ7IwgrN09jxVgl7RCba0GKfl
	HPCzDyxtEgSl1STM+a2XaicxWYTJ1xR9ZXwV/e01Lz3apW1XucLrz/w+YqAjtGZuBxHkwnYTMNZKY
	V8nKLZWeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZGi-0003Tx-NV; Fri, 30 Oct 2020 18:36:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZGe-0003SY-JJ; Fri, 30 Oct 2020 18:36:53 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55F342151B;
 Fri, 30 Oct 2020 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604083010;
 bh=Ij7toGsdodJH+g5af0r9MiYPy/qpAd3YN5F+RhUxgsY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2DVdS4mHCoUE4JHIUSmVHAmvB594iwVT4qjbLAdq0KaYWtLmkAcQzyhvgZg75ag0n
 PEWhdDNqSIOTh1JMt0AAzcJ00Ze5LokKTaV/So8QMlv7X6uZVpJF15tiGGivE0hh7O
 RCV+AWVeb5MnfC3QnfBRznxcfwWg7DAuaQExdjBQ=
Received: by mail-ed1-f48.google.com with SMTP id g25so6835678edm.6;
 Fri, 30 Oct 2020 11:36:50 -0700 (PDT)
X-Gm-Message-State: AOAM531Gd1afViLWBEUqkXQpbCulu3IVTDO22VKWkLIxFLL0HTmZnOA3
 RQRpTf5le2NACBMcDxspZLvEW8KVDfmaRfA79cI=
X-Google-Smtp-Source: ABdhPJzlGGUy2WAzm1IY09sGJUjxwv5CeNCRC+4gAdJEbqaWeaJ5HOn9h3HyxBxr7WDmVj09M2PsHz3ShD//bDdRLiY=
X-Received: by 2002:a05:6402:10d5:: with SMTP id
 p21mr3957562edu.327.1604083008757; 
 Fri, 30 Oct 2020 11:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201016204019.2606-1-linux@fw-web.de>
 <20201016204019.2606-4-linux@fw-web.de>
 <CACRpkdZrUbq6h4uDoxfN70mzfbeWAeqo5KAdTWhiHbsb7VTbJg@mail.gmail.com>
In-Reply-To: <CACRpkdZrUbq6h4uDoxfN70mzfbeWAeqo5KAdTWhiHbsb7VTbJg@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 30 Oct 2020 11:36:37 -0700
X-Gmail-Original-Message-ID: <CAGp9LzosDB1V-b5ek1epzxkvvuow-7YCDHsgS=2WsvT_aZYHdg@mail.gmail.com>
Message-ID: <CAGp9LzosDB1V-b5ek1epzxkvvuow-7YCDHsgS=2WsvT_aZYHdg@mail.gmail.com>
Subject: Re: [RFC 3/3] pinctl: mt7622: drop pwm ch7 as mt7622 only has 6
 channels
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_143652_720867_051BAA98 
X-CRM114-Status: GOOD (  14.42  )
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
 <devicetree@vger.kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > mt7622 is reported by mediatek to have only 6 pwm channels
> > so drop pindefines for 7th channel
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>
> I can merge this patch to the pinctrl tree if I get some kind of
> review response from one of the Mediatek maintainers.
>

After confirming with the internal team, MT7622 actually does not have
the 7th channel. Thanks for Frank's catchup and patch.

Acked-by: Sean Wang <sean.wang@kernel.org>

> The rest should probably go through ARM SoC.
>
> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
