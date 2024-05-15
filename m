Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D6C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gI32NneuDglRtuym67lklPkDJE0SOpucgczOWKx+VI=; b=IpCKN+Jx/WGU2WdfYim4ug/N7A
	+KypGusKSDxxE8dNGEvEvHeK5f1ruyeCiYLfW/25SF+CbU4n0iuTjetWdthIoUuMc2IEZWHIAz5E4
	TRQv/1sxLdUpqKwsPZx9/QQ0MoNon0SiqxlkgD6P02uinUxfQQfrKKrFiNKPkwDU+GXoWNfulqbnG
	/PYkymiT+TG2S2LQZQHXubTdB7lVebtP7TIR0/vsJnwJvaPBVL5xbf9pTAj2qLL/X+KtuCg99iZfy
	fhHtq8rSmp7t1JMADBD5eMl3EtoayPtehnZrvA7khsGOB56UcXMYoT9sgtyv/fATGo0nVVv0htWxH
	9T0HVjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Un-00000000rDP-2Gom;
	Wed, 15 May 2024 07:56:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Uj-00000000rBj-0hxQ;
	Wed, 15 May 2024 07:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8ED9F613F7;
	Wed, 15 May 2024 07:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30B8C116B1;
	Wed, 15 May 2024 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715759772;
	bh=uKH9u89PoqokIDK4hendehhmL2WZxBfsMlAPWgg6f+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wEXcOsbGtnz+ojx0BNc/2zRSPDwPLyn1XBD2DAkHLe68AEQ/X/y2SnL+dKj7Y46E1
	 yBIzeaVDOPq7VLDeY1++cb4rNPJPw7Pgicdm7fH8mq2Qf25paw6QzwISKsbqtAbsKV
	 YRxlekXHo4KLzY7nL39DZ1OAVSczApONOYRmyP1I=
Date: Wed, 15 May 2024 09:56:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
Message-ID: <2024051552-subatomic-roundup-fccf@gregkh>
References: <6061263.lOV4Wx5bFT@natalenko.name>
 <2341660.ElGaqSPkdT@natalenko.name>
 <60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
 <2200096.irdbgypaU6@natalenko.name>
 <a603a67b-6703-4f63-93ee-98a05c605d02@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a603a67b-6703-4f63-93ee-98a05c605d02@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_005613_275469_CD0C8C30 
X-CRM114-Status: GOOD (  17.80  )
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

On Wed, May 15, 2024 at 09:40:40AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 15.05.24 09:15, Oleksandr Natalenko wrote:
> > On středa 15. května 2024 8:23:35, SELČ Johannes Berg wrote:
> >> On Wed, 2024-05-15 at 00:51 +0200, Oleksandr Natalenko wrote:
> >>> Also /cc Johannes because of this commit:
> >>>
> >>> 6092077ad09ce wifi: mac80211: introduce 'channel request'
> >>>
> >>> On středa 15. května 2024 0:43:40, SELČ Oleksandr Natalenko wrote:
> >>>> Hello Felix, Lorenzo et al.
> >>>>
> >>>> With v6.9 kernel the following card:
> >>>>
> >>>> 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax PCI Express Wireless Network Adapter [14c3:7915]
> >>>> doesn't work any more. Upon mt7915e module insertion the following splat happens:
> >>
> >> 6.9 didn't get commit 2f7cf3b61d85 ("wifi: mt76: mt7915: add missing
> >> chanctx ops")? Huh?
> 
> FWIW, seems there was and earlier report about this that I missed:
> https://lore.kernel.org/all/CAAMvbhGHe4PM5M=JJZRQ2m5_aVZ=4DPG76MT+q5qi3HA+7_wzQ@mail.gmail.com/
> 
> > Yes, you are right, this commit is not present in v6.9, and I can find it in the "next" branch only.
> > 
> > I can also confirm this commit fixes the regression for me.
> 
> So all we need to resolve this is to ask Greg to pick up the patch for
> the next 6.9.y. release? Then I'll take care of that in a few hours,
> unless somebody else does it first or I get some kind of "might be a bad
> idea for now" signal from anyone.

Now picked up for 6.9.y.

greg k-h

