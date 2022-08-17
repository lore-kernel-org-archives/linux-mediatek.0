Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3825C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUXMUJa82Y4IMLdzC18iKA2e80pkPuOgUxS/S3ws7QQ=; b=j6TWY2bkWOHVzBdQwNaUeuL0fm
	EHjpEHmCJ6jH0kXrd/8VEUcwZY0m2v6qnM+h4bu0XqdxbsyLGfRESyhCwkyJI7yzCLfTWu9nQU4Va
	Lei/t3u0/fjDMxV0h8lCV/Q+Fe6gcKfMoCI2crn3jeiXD560hpngRXnP986umJow+spCxRV/INx3o
	QfuuUZhns7s9+DrOuM7rsR9V+la3ZlYge9omPXp6coOXdERzYLoZ0XTVuRMify8n8/EKHvoVn1ELT
	DdbbVLOpnmiIyEVYYeW0IpCHb24E7fpfCxC37fB/HJ7eY7FP1XVv124+OqLO6NwHGGuG8tj+QjqB/
	xbKke/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOERz-00F8tW-NN; Wed, 17 Aug 2022 08:30:55 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOERv-00F8gU-Gq
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 08:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=pUXMUJa82Y4IMLdzC18iKA2e80pkPuOgUxS/S3ws7QQ=;
	t=1660725048; x=1661934648; b=UJvVUAFScSCwwhat/wV2fRdQirLD+DMxkuoZ1YNUgX+9fBG
	hNrRfUyp5HsuR9sNeGjPB+zDWubQpOv2RhZlCxo8OevePj6JlE3OjyBXOU3XXLeYMD639B5cItgTB
	9+Qf+bTn/mNQZtM5W92SyAXiIj98dwyj7tHoX1mL6i3zitOSBkDK//Dxv4VZzlum0VmAkBlNW7CmO
	MTOaGIHtV39Y4nLFNEVoGF7Dn1AlStPfjqRlFRfx8kMXg3KLQPhH8N+Bzi2pLANXOy9kbImsQ6w8h
	JbIyEv/fT4sJ5WcjhS+6mTGMzA+n+34aYxbcHZTZrAnkGa2YcWfzCvMfV/e1C7tw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oOERb-00AIBn-2i;
	Wed, 17 Aug 2022 10:30:32 +0200
Message-ID: <5b24421363048bff1a9f03174cb0223b3e226bf9.camel@sipsolutions.net>
Subject: Re: [PATCH 1/9] wifi: mac80211: allow enabling chanctx until hw
 registration
From: Johannes Berg <johannes@sipsolutions.net>
To: Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang =?UTF-8?Q?=28=E7=8E=8B=E5=BF=97=E4=BA=98=29?=
 <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
 lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
  Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
 km.lin@mediatek.com, jenhao.yang@mediatek.com, robin.chiu@mediatek.com, 
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com, 
 ted.huang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, 
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 kuabhs@google.com,  druth@google.com, abhishekpandit@google.com,
 shawnku@google.com,  linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 17 Aug 2022 10:30:30 +0200
In-Reply-To: <CAGp9LzrqYsXAPsbZvTy-_3Tnu23oc11KHdxNs9WvYfe0JHQaDg@mail.gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
	 <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
	 <edd45a1e732a0eef1894b9f6eda2d4e3c692359b.camel@sipsolutions.net>
	 <CAGp9LzrqYsXAPsbZvTy-_3Tnu23oc11KHdxNs9WvYfe0JHQaDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_013051_596057_7EAD14EF 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2022-08-17 at 01:28 -0700, Sean Wang wrote:
> Based on mt76 driver logic, alloc_hw would be needed before loading firmw=
are
> because alloc_hw creates an instance of "struct mt76_dev*" the
> firmware loading relies on,
> and so the firmware capabilities cannot be decided before we alloc_hw
> in mt76 driver.
>=20

I don't really see why you couldn't change that though? There's no
fundamental reason you need to load the firmware before registering with
mac80211?

And fundamentally, I'm not even sure how you are achieving a change of
the ops - you're meant to point those to a *const* ops, so you need two
versions of the ops, one with and one without chanctx, and point to the
correct one at allocation ...

johannes

