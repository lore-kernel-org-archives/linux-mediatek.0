Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B270CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 04:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5mAiyADDc2DidWk0AqJU38sGm4o8L96Ab5qHS2x5zY=; b=eoaAJeKBvh+vyt
	jVwAtzsfOx2UgCvm6AxAWTZrdnmeH2YRVWTH3E8t8DISQS6SLd8LYDUaABS4ES95/IHqx1ebGXst7
	IGzftvhZ3TeB9T42bunBkjuzcoB/BcjhpmXb3u2tRGyUjwL/iPsK0Rm5OHsFxy79Lc8whJAth4Y1h
	kNvRtAPFhIdFK+pZeqY0AlU/JJDph2hhsJs3lC8ttvG0EUtnBnA8dFv8+Q+4fFTql2abvkR8mL/D8
	1G4PaCCSV9w105omNWw+KmquPnVc5Xd9idkB6UVhHeRBx05+ocL3tDtb1Xr/YLK+pOXh0+mFoAp21
	14GN+4Oxnk583PYUxxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKY3v-008tkm-Lc; Thu, 17 Feb 2022 04:06:35 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKY3i-008tfR-HR; Thu, 17 Feb 2022 04:06:23 +0000
Received: by mail-io1-xd2f.google.com with SMTP id h16so2211268iol.11;
 Wed, 16 Feb 2022 20:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUSoUHSjJMmplw4ZjLL+BTqGLSZGqO8tdAI7uDdrahY=;
 b=UYiGhdWEhgHiJjsOB0bDbRCJ1zOUL1OgbrBA5OeIavQp6/7KKSDbRu5Uo4BdZ1mHq0
 ebZxyXZEYOMa7GBZcnqcaUMdxjsejCMGpG7WwQqGSLKPRL+y5KtR3A77UKxDKeIZBaWs
 AVha5oqKOLU9YYWM+7owD97Xo7Xq3XBSxXyHgzpUgDWNVQHfEqqtgqQCynB8Ko/wvsgJ
 mdEjnQ2ncNqqCfwlmzV9+cIyXduBmz8uDizsLg6qkytymfVz8xnU44SJawU6oM+ToC3e
 iAM7NGTggh8L/Gb8NTrl+cYl2TWrTpYfGOREen19/6qyfvMckBrrzlCKKaLjgLbGmo53
 TwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUSoUHSjJMmplw4ZjLL+BTqGLSZGqO8tdAI7uDdrahY=;
 b=uMzd5AQpj9gdd1xfz8YF5OU0DmpwYB4wwYs2AhrUucu9T0fGZhDqVUdUtXttNVmgDl
 PGx1fZK/8L3jy7Qfjr6kO5PQiIgvXQPn8kZbHBQECHY03TqUlyJy7EgPX78NTX0v7C/c
 p13oHfhNqEymLf1m2SGZkMaj3V8uIygLGaLf6ky+P6yW9S/SO78rR2pXZuKH2OFuXXHi
 RdfddUqnlhQ5M6aMiie73LF1HgpsLyPylzzui4ew1ucVfrGMT+wpsuYkHDhqe630CoRg
 eQCSRd1tRWMweyPWqe/ZqbDMxHPb7NQXjbxU6kvx8ILyT3yq7kr1vAjwGVvp2BlfDrrs
 lKOA==
X-Gm-Message-State: AOAM5315tZ2cFPENh9zKEilgjFTZlJWerE4OI2A8oikB1F0DGkyhxHda
 zogVu9/TWauKO3scXpV1fuaekvEFbHsftSssKZY=
X-Google-Smtp-Source: ABdhPJx187pKc6+DoMP2EEChkSUVbFdwtcAYM42qX69rLIAIylW4QfCWKbxmGNW6de2pHCO2YXluGQ+nWYcuShjy6gM=
X-Received: by 2002:a02:b903:0:b0:30e:49cb:e65c with SMTP id
 v3-20020a02b903000000b0030e49cbe65cmr750449jan.164.1645070780775; Wed, 16 Feb
 2022 20:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20220211001345.3429572-1-gch981213@gmail.com>
 <20220216195423.GA17551@alpha.franken.de>
In-Reply-To: <20220216195423.GA17551@alpha.franken.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 17 Feb 2022 12:06:09 +0800
Message-ID: <CAJsYDVJw2DJX97cRwoAofzq_jL0GhyaC5j7UuT6OzC=Lp8WkSQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, Rui Salvaterra <rsalvaterra@gmail.com>, 
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_200622_610493_F3590280 
X-CRM114-Status: GOOD (  21.44  )
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

Hi!

On Thu, Feb 17, 2022 at 3:57 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Feb 11, 2022 at 08:13:44AM +0800, Chuanhong Guo wrote:
> > It's reported that current memory detection code occasionally detects
> > larger memory under some bootloaders.
> > Current memory detection code tests whether address space wraps around
> > on KSEG0, which is unreliable because it's cached.
> >
> > Rewrite memory size detection to perform the same test on KSEG1 instead.
> > While at it, this patch also does the following two things:
> > 1. use a fixed pattern instead of a random function pointer as the magic
> >    value.
> > 2. add an additional memory write and a second comparison as part of the
> >    test to prevent possible smaller memory detection result due to
> >    leftover values in memory.
> >
> > Fixes: 139c949f7f0a MIPS: ("ralink: mt7621: add memory detection support")
> > Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  arch/mips/ralink/mt7621.c | 36 +++++++++++++++++++++++-------------
> >  1 file changed, 23 insertions(+), 13 deletions(-)
>
> applied to mips-fixes.

Oops.

As I mentioned in a previous mail, this patch has two cosmetic problems:
1. misplaced bracket in commit message "Fixes" tag
2. incorrect second test pattern: I meant to flip all the bits in the
first pattern,
   but I used "!" instead of "~". Any value will work just fine but it
looks weird
   to construct a zero using !MT7621_MEM_TEST_PATTERN.

Should I send a second patch to fix this patch or send a v2 of the
original patch?

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
