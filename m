Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA73C25B08
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 00:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ku7R+2tnT1/PcWq+UB/v9DdP1lt1rkcxhef05o0ooII=; b=12Xbmncksne6jClHxyBQI6j5p4
	6ELCPTODl17EOsq/ojZT0HL9ieggkNYlGE7mltnXYp7ipaYBDvD+Mr7TadnM5AzOCOUCJMi95LTn1
	JLuER1SswpHLG1/hKOy4Kj1uWpiL9tpWVGrqDGyuMa7jBgIQqYKmEac1FWf/a11L8Vgb0qtzoRNKz
	5xYaf/vj1odRWcr51bexa/p0jL/2oY+JR3b/McgsRAzTITE9zrbNRL7PlRa3uzVgWIh69HZT3AONy
	iDzavWH3lObWxAKRL0b4yn9wsTEA9cNJdZc4Ta1DLMLUoqkwtrP9kLwYVhkS2Asp6vpwV0jLtbpg0
	bLUoXTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOT8i-0094Op-UC; Thu, 18 Aug 2022 00:12:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOT8f-0094KC-JZ
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 00:11:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D3917B81FCD
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF38C4347C
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660781514;
	bh=Ku7R+2tnT1/PcWq+UB/v9DdP1lt1rkcxhef05o0ooII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HR1nx7iqPCnyMVmkN3PP/0lGjh1kAJFRWmTF7SZakyggGSK6tCJGiUYmVkdCiCGjN
	 mJw/yLX9vKXxZ8xA2VkZYloqY6VbXlhOLMD0ne5FEgEXjYnkMc0pNQJ7Y0MYxTvvpl
	 j6odjTYic92jT24bXJtUq9zaU+kTKukV/eCQz2jQvs4vwNORYE4Lp4Jd7Hv2f3ejdg
	 BhxcWsGKrjPDTtqIsM7rJwxxTpWtmeS5BU+6sTIA6TT8qyt7pU7ThyPsoMJWxI3JfC
	 0p3PCvzKTBWakeir3E68CrZ8WuD869ZtaUuIzYxL3bd68hL7EJ6oIzedZ7a4bqRm1t
	 mcLFpwTRJchAg==
Received: by mail-wr1-f44.google.com with SMTP id bs25so17922868wrb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 17:11:54 -0700 (PDT)
X-Gm-Message-State: ACgBeo1SQmODAswUWm/DXymt/P+grTijNdCeL28EI3+7fAJFDc5nbYaA
	kyMIJJPwNypL8rErTWKkqatrAZLH5OMM2H4HtHw=
X-Google-Smtp-Source: AA6agR6CsWfdjBKQD5ZqOtuIcydzYKdrcHHF/JH7gTE5dMbJs3tEciW5hJZKUau/Qn+2TPBnkGasGScaW6I+D+vYrGo=
X-Received: by 2002:adf:d238:0:b0:21e:c972:7505 with SMTP id
 k24-20020adfd238000000b0021ec9727505mr193529wrh.536.1660781512698; Wed, 17
 Aug 2022 17:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660606893.git.objelf@gmail.com> <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
 <edd45a1e732a0eef1894b9f6eda2d4e3c692359b.camel@sipsolutions.net>
 <CAGp9LzrqYsXAPsbZvTy-_3Tnu23oc11KHdxNs9WvYfe0JHQaDg@mail.gmail.com> <5b24421363048bff1a9f03174cb0223b3e226bf9.camel@sipsolutions.net>
In-Reply-To: <5b24421363048bff1a9f03174cb0223b3e226bf9.camel@sipsolutions.net>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Aug 2022 17:11:39 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzrag1b3G+QfW0RCQPGLnR_WzGSg4k+Zdx4zi4b_oeunRQ@mail.gmail.com>
Message-ID: <CAGp9Lzrag1b3G+QfW0RCQPGLnR_WzGSg4k+Zdx4zi4b_oeunRQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] wifi: mac80211: allow enabling chanctx until hw registration
To: Johannes Berg <johannes@sipsolutions.net>
Cc: =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
	Deren Wu <Deren.Wu@mediatek.com>, km.lin@mediatek.com, jenhao.yang@mediatek.com, 
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, 
	posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com, 
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, 
	frankgor@google.com, kuabhs@google.com, druth@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_171157_985863_6FF04E6B 
X-CRM114-Status: GOOD (  26.24  )
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

On Wed, Aug 17, 2022 at 1:30 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Wed, 2022-08-17 at 01:28 -0700, Sean Wang wrote:
> > Based on mt76 driver logic, alloc_hw would be needed before loading firmware
> > because alloc_hw creates an instance of "struct mt76_dev*" the
> > firmware loading relies on,
> > and so the firmware capabilities cannot be decided before we alloc_hw
> > in mt76 driver.
> >
>
> I don't really see why you couldn't change that though? There's no
> fundamental reason you need to load the firmware before registering with
> mac80211?
>

It could be changed but it would break the consistency of the current
mt76 driver.

mt76 driver does the things in the following order
- ieee80211_alloc_hw (where an instance of "struct mt76_dev *" would be created)
- register bus operation into mt76 core (depending on struct mt76_dev
to provide an abstraction layer for mt76 core to access bus)
- read chip identifier (depending on bus operation)
- load the firmware capabilities (depending on chip identifier)
- initialize the hardware
....
-ieee80211_register_hw

If firmware capability is needed to load before ieee80211_alloc_hw, we
need to create kind of similar functions to read chip identifiers and
load firmware.
I know It may not a strong reason not to change, but if we can support
read firmware capabilities after alloc_hw, it provides flexibility to
the vendor driver
and helps mt7921 look more consistent and save a few changes across
different mt7921 bus drivers (mt7921 now supports SDIO, USB, PCIe type
driver).

> And fundamentally, I'm not even sure how you are achieving a change of

I kmemdup the const ops and ieee80211_alloc_hw with the duplicated ops
the duplicated ops would be updated by the actual firmware
capabilities before ieee80211_register_hw.

> the ops - you're meant to point those to a *const* ops, so you need two
> versions of the ops, one with and one without chanctx, and point to the
> correct one at allocation ...
>

If you don't like the reason and the way I proposed in the patch,
please let me know. I still can move on to the way you suggested here.

> johannes

