Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF0EC25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y6rxIFbS2oHLTEjNSqTrbs0KEbAmAoWTDldNWpN3PM=; b=NMOG1KlzCmDkyjfHzprm0GdfNO
	RIFkI8ovF/U1rPG3Db518M/3Z99/rgV/HSvDYQ+HehwuZu6Tt+So0XNEhudq1xlQStAXzUqx8VoE1
	Ek1pe587PDJmqI/+cCXffrVTUTmmVGPACa5tgGEiEBMU72c3TmX8pgygIiiQjdflbvaoUKpp7aru6
	dDdleuOl56WlVuCuF8e5FxFN7BanECXfpUFNprLhJtLcMhWvWWHZIGx1Fx7Olnzfn9sBZBIffMOdI
	racp4KbkSIldTk3WwGHr5yChFO0UBlwNGK6ZVuLcDrlzLEk48ws1YSIMx+lI2LWrVZCAlpDuzuZWM
	10smmm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEQc-00F6Ye-8P; Wed, 17 Aug 2022 08:29:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEQ9-00F5YG-17
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 08:29:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97786B81C65
	for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 08:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C420AC433B5
	for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660724933;
	bh=NfEazfKiz9tI/UbDx3opYeVqOgRtBHkrOLzzgPvvlDk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Aoee0nFAD14JUtrcxjDv+8GaUMtR/sFDljKGtoffd0UECDzgBV8HzHjicD3spWydg
	 ng5RP/nj5aUm6zJEy86cQ17sHOdtmtr93NYCkREuoaZxvqGELikidckMyc0u8pjSnu
	 DvZcCKVNpG9/H0wVmx9LXFQMxWbJh2WdOXY74G6Bw2fBuu6azlQa+PFvn38rFPAJhf
	 j0VfCyoor5Cbs+d2AT0ROz87XrDJpSgfG2KSg6xX1IOcgKWqHjCBX6RAMvKvAg32+K
	 tmBcxVXhFx9ZKQx4AtYbyUB7fMAXmJaYwKf6JOLL5gDyAwVCFhdwU6t2fN+cbnFq9F
	 0k5upY5WbwQ7A==
Received: by mail-wr1-f53.google.com with SMTP id n7so4149176wrv.4
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 01:28:53 -0700 (PDT)
X-Gm-Message-State: ACgBeo0G+R3sRavCz/NrSPG7gk8gJPJunr4TIglEeuOfRYJYd+9LrXqC
	AxRjvnMxEoQO86hbTh1/PhWT9ppsHl92/Z/wH/o=
X-Google-Smtp-Source: AA6agR61OJZM3fGBROkiHMMfY4la7OjXFAkjkIbBDYUIDGf4lVRcQp70H5v+gHqzg10DvAWVU3T3Lwh66vReUrCVhhc=
X-Received: by 2002:a5d:6f08:0:b0:21e:cfc7:bfd1 with SMTP id
 ay8-20020a5d6f08000000b0021ecfc7bfd1mr13862153wrb.329.1660724931945; Wed, 17
 Aug 2022 01:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660606893.git.objelf@gmail.com> <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
 <edd45a1e732a0eef1894b9f6eda2d4e3c692359b.camel@sipsolutions.net>
In-Reply-To: <edd45a1e732a0eef1894b9f6eda2d4e3c692359b.camel@sipsolutions.net>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Aug 2022 01:28:37 -0700
X-Gmail-Original-Message-ID: <CAGp9LzrqYsXAPsbZvTy-_3Tnu23oc11KHdxNs9WvYfe0JHQaDg@mail.gmail.com>
Message-ID: <CAGp9LzrqYsXAPsbZvTy-_3Tnu23oc11KHdxNs9WvYfe0JHQaDg@mail.gmail.com>
Subject: Re: [PATCH 1/9] wifi: mac80211: allow enabling chanctx until hw registration
To: Johannes Berg <johannes@sipsolutions.net>
Cc: =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
	Deren.Wu@mediatek.com, km.lin@mediatek.com, jenhao.yang@mediatek.com, 
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, 
	posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com, 
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, 
	frankgor@google.com, kuabhs@google.com, druth@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_012901_424779_D9322AEB 
X-CRM114-Status: GOOD (  26.75  )
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

Hi Johannes,

On Tue, Aug 16, 2022 at 3:22 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Tue, 2022-08-16 at 08:03 +0800, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > MT7921 device can be supported with the channel context depending on
> > the newer firmware so that we need a way to enable the chanctx related
> > methods until hw is being registered.
> >
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  net/mac80211/main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/net/mac80211/main.c b/net/mac80211/main.c
> > index 5b1c47ed0cc0..98d05ed1a081 100644
> > --- a/net/mac80211/main.c
> > +++ b/net/mac80211/main.c
> > @@ -1011,6 +1011,14 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
> >               return -EINVAL;
> >  #endif
> >
> > +     /* check all or no channel context operations exist */
> > +     i = !!local->ops->add_chanctx + !!local->ops->remove_chanctx +
> > +         !!local->ops->change_chanctx + !!local->ops->assign_vif_chanctx +
> > +         !!local->ops->unassign_vif_chanctx;
> > +     if (WARN_ON(i != 0 && i != 5))
> > +             return -EINVAL;
> > +     local->use_chanctx = i == 5;
> > +
>
> Not sure I understand this - this just *adds* code, based on the
> description I would've expected you to *move* code?

It can be done and looks better by *move* code instead of *adds* code.
I will change it in the next version. Thanks for your input.

>
> In any case, I'm not sure I see how this makes sense - ops is supposed
> to be const, and you're supposed to pass it to alloc_hw already, so how
> would it change?!
>
> Also, conceptually, I'm not sure why it's needed to alloc_hw before
> loading firmware, we also have a lot of things depend on the firmware
> capabilities in iwlwifi/mvm, and so we alloc/register HW after loading
> firmware.
>

Based on mt76 driver logic, alloc_hw would be needed before loading firmware
because alloc_hw creates an instance of "struct mt76_dev*" the
firmware loading relies on,
and so the firmware capabilities cannot be decided before we alloc_hw
in mt76 driver.

    sean

> johannes
>

