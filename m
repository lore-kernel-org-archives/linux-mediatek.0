Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2213FC2D0B1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 07:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F6020838
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 07:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="thrZx3mZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz2yOEz3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F6020838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VQySIxuy/meKHHDAAmgtR6XP0u3YUU/BurdocwDrfw=; b=thrZx3mZKxj1L8
	ayG535HJW0tyR1FMCF6dQRzsYTmABuL89FcX4KZVEQaMp+PlDZKN3J0VsWWHcor0QvKsGLi2mo2q2
	dX94Oha5wuQfiH7c3U0dqoiUgJr5fyvaYTZejxwsG/3Q7orF97wEer633RleN2qPEOQhTiCw3zIA5
	YWMpHabiLPVOibhUNCNuS39RBi2kQgDLbO/WzF7h7FHvJjx9rZau0oF4ggo1lh1DARTW9jVhFh+9Q
	fCkcjwDBrNPFi6pU12C0joO7oGRvkxC22FxNmcshuyi2coQFd06kJCSDT0k743zmXo4fPfVLzGYSq
	DfOP3DRF+QjyqZu80gHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izbyP-0004uH-2C; Thu, 06 Feb 2020 07:53:17 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izbyM-0004tS-3P
 for linux-mediatek@lists.infradead.org; Thu, 06 Feb 2020 07:53:16 +0000
Received: by mail-ot1-x341.google.com with SMTP id a15so4646296otf.1
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 23:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TzW6dHQjSfGvyhr9jvkDeTU/fqID38DqFrV0O6n8BYI=;
 b=fz2yOEz39A46Nic9NDCQj8Ps0Alpb0HcDMSfX5hQP1amWqxUYeh52V8Ip8OfX597wW
 olh+MYnyXbImoLPyztSyR9kjRId73OUVDCq7KtM2HpBYUtXaEE47uRrUbEeVafIC4R7n
 MwFzDKwSBnTaB7Xr6t8hk03Ep0IqfTwDwa0PXljXjx1UTYzxb5YH23r54J8T1N7thOEU
 iPdDNoa19HDYHosEWWCV/1FAnNmOj/6LgMhq5arvwfBgjk9exsfBrTFpVTfJJtAhc8QK
 6zsQoCVsFH+0frbgFhTLqU0vkocPisG/v55PQz4SF8UVak1uiIYDxFBhB7KR568sGT6c
 K1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TzW6dHQjSfGvyhr9jvkDeTU/fqID38DqFrV0O6n8BYI=;
 b=Hl/0GE9YnG9yF3zZ0Xs1pUCYh5pNNd0EPNRKWhKDzRHUYnZJCWXUqoGttf6e3bAloY
 g2ZUXXFo9UMyfJ3UZK1BQJI2tD2m4nI++l7rnEy6jOULnGpF5MMpaY+PvtLhHWQKTJaI
 e4vM5DVwvJHbXmcESekxJmPyEPUttEC2F6stW7k5DNocMpnq8+Pwz2wh0vzUgHV0AGdu
 Uu315zDI2ly07xy0O+NDlgxR4W3VE2VWwkUZugi8pjMJuEABU8V5rh1y5zz10j1YUp4Q
 pEYPDdAAUFAl+F5lxgjppgnK/Xn+E0EbI8BLQrcIBxABK9JiA4JLEBRmq/9nqHOasaEx
 RenA==
X-Gm-Message-State: APjAAAVMLlA1fxkZ2D4X1eSf5wH3Foc7HGB4M3JCXQoUu+PARwtW8wRN
 7g8Txl/eh3hk4nvEs4BiLGRED6gUxPs7TGgh3Vo=
X-Google-Smtp-Source: APXvYqx9glLF1qZqDriJ3CVIwTku2+BXSPCnAZ0pW0nTinxUEWmlDrIKG9QaBGHVyfCOXQhHe7ezJr0WzBnnQ4yDkJ0=
X-Received: by 2002:a9d:4c92:: with SMTP id m18mr28265420otf.168.1580975592187; 
 Wed, 05 Feb 2020 23:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20200204090022.123261-1-gch981213@gmail.com>
 <20200204094647.GS1778@kadam>
 <CAJsYDV+b1bqc3b87Amo8p2UzVi4fpbRv6ytus8A5Y0r4K-X0hw@mail.gmail.com>
 <20200204103456.GO11068@kadam>
In-Reply-To: <20200204103456.GO11068@kadam>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 6 Feb 2020 15:53:01 +0800
Message-ID: <CAJsYDVKQFB-X-mMRCZ44ypGyoWOQdSsYpfVsCPkg+TYDSw=4KQ@mail.gmail.com>
Subject: Are people from linux-mediatek also interested in Mediatek MIPS SoCs?
 [Was: [PATCH] staging: mt7621-dts: add dt node for 2nd/3rd uart on
 mt7621]
To: Dan Carpenter <dan.carpenter@oracle.com>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_235314_686499_434DEF4A 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 NeilBrown <neil@brown.name>, open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 4, 2020 at 6:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Feb 04, 2020 at 05:59:21PM +0800, Chuanhong Guo wrote:
> > Hi!
> >
> > On Tue, Feb 4, 2020 at 5:47 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > Please use ./scripts/get_maintainer.pl to pick the CC list and resend.
> > >
> > > The MAINTAINERS file says Matthias Brugger is supposed to be CC'd and
> > > a couple other email lists.
> >
> > According to get_maintainer.pl,  Matthias Brugger is the maintainer of
> > Mediatek ARM SoC:
> >
> > Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
> > linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
> > linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
> >
> > I specifically removed the above 3 addresses because they are all for
> > Mediatek ARM chips
> > while mt7621 is a mips chip and belongs to ralink target under
> > /arch/mips/mach-ralink.
> > Code contribution for mt7621 goes through linux-mips instead of
> > linux-arm or linux-mediatek,
>
> I would have thought that we would still CC linux-mediatek?
>
> >
> > I thinks this is an incorrect setup of get_maintainer.pl and should be
> > corrected.
>
> We could ask him...
>
> It's always easiest to fix MAINTAINERS instead of remembering all the
> exceptions and rules.

Hi Matthias and other folks on linux-mediatek:

I noticed that get_maintainers.pl reports "ARM/Mediatek SoC support"
e-mail addreses for MTK MIPS SoCs (mt7620/mt7621/mt76x8) because of
"mt[678]" name match in MAINTAINERS file.
This is confusing because these MIPS SoCs clearly don't fall into
"ARM" category. Is this an incorrect match or is it intentional? If
it's intentional I think we should remove the confusing ARM prefix,
and if it's incorrect we may need to figure out how to exclude
mt7620/mt7621/mt76x8 from "ARM/Mediatek SoC support".

Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
