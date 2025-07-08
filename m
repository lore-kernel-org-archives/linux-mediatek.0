Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DB5C8303C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FDGGat7DSIAxa7cgP2V9wEpPTgLHuvbPii0mExepSE=; b=A5rPE4tYqFR7NuW6P7olT1t2jg
	26BBqEQgc9oiJO05g05zgrN54Ss9o6+5738aKcBlg94tvI4WJ6/L4XKvSt0u1vreWYtn/gFtuUb5T
	mgYd+zuwDEaw1PvnEZOhi3PK2J3REZTOBBVg8pW4fkhgqkWaknUj5XCJbnBNCK2jHxXVpIiYE77L1
	vI1JfufqtbBiQ/XinXSZOQAMvNL61zMLo48dWIAzhXF5mWs7qCqBwtuAvds8hjcgyg92L9cte+Swu
	Dgo8t5v/Vxb8U4Wn5ElZXlaMO1sTVGaOd5jCvDZPoIUndSDKxWeE/83th4axfZo4NBLaI4trbmsSC
	zKRV1oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3c8-00000004jXU-2ODF;
	Tue, 08 Jul 2025 08:23:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Zz-00000004j37-3b1x
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 08:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9FDGGat7DSIAxa7cgP2V9wEpPTgLHuvbPii0mExepSE=;
	t=1751962891; x=1753172491; b=cbRo2fVCgIU6//gY/qTclj2wv20lwMosAE5NcY1n/4bhnjg
	GQ1Pe+/hUR6kKICnUGz4rtf3zWwAEV6ZJdwHBtr58JChCqslARVGpazdTPalGPm4p8wo1oMNK2/ih
	mZkg3LUb6y4Sdm2QkAm1DqtW0jP9jv3OrkVldVkjyjTWQp89IqE/a5NDWcn44RHwve0zHHwdye5y+
	vhC6enk8lp6/cDr2dA0ZFq6F3Sgj0DaAGnEDMewpILpagF0l6LFzrPpkX+vquFS0WujzLzmirET/W
	p499ZBgaV5x2S6xr0v6EmupMUkWfRftH7oabxo3XX9BNusdBMTPqXxCI5PO4dsvg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uZ3ZS-0000000BjWB-3H1r;
	Tue, 08 Jul 2025 10:21:01 +0200
Message-ID: <c28ccc70b5baca6aff28a520d3f8810e196daa21.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: determine missing link_id in
 ieee80211_rx_for_interface() based on band
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai =?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=	
 <Evelyn.Tsai@mediatek.com>, Money Wang
 =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=AE=89=29?=	 <Money.Wang@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Date: Tue, 08 Jul 2025 10:20:53 +0200
In-Reply-To: <54df1d3fe61bb861b97c897aaa4a2a3e08f71e62.camel@mediatek.com>
References: <20250702104403.2738634-1-michael-cy.lee@mediatek.com>
		 <6c666ab6d83ba45f9f15643eeffed5d0f4770867.camel@sipsolutions.net>
	 <54df1d3fe61bb861b97c897aaa4a2a3e08f71e62.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012131_900956_E5F6F84A 
X-CRM114-Status: GOOD (  21.67  )
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

Hi,

[btw, you're sending HTML that looks like plain text, seems redundant
and also made the links non-clickable here? maybe try to change that]

> > Hm. Qualcomm has a similar thing with frequency, I think, and that
> > probably makes more sense for them since 'band' isn't unique for the
> > radio:
> >=20
> > https://lore.kernel.org/linux-wireless/20250612121127.1960948-3-maharaj=
a.kennadyrajan@oss.qualcomm.com/
> >=20
> > Or is it not related?

> I think they're related but address different issues about group-
> addressed frames.

OK, fair.

> The Qualcomm patch seems to focus on preventing frames from getting
> processed on an interface running on a different band. (referred from
> their commit message)
> For example, a frame from frequency 6135 MHz should not be processed by
> an interface that does not have a link on frequency 6135 MHz.

Right, it's just in some way I thought many frames should be processed
for a link in the first place, though I guess you're thinking more
generally, and the other patch was explicitly about data frames for
which that of course isn't really true.

> On the other hand, the problem we encountered is that the interface is
> going to process the frame, but the "status->link_valid" is unset
> because the driver is incapable of determining the "link_id". The
> "link_id" remains its default value of -1, and the frame is handled by
> the interface's default link and is dropped because an AP MLD interface
> is not using its default link (sdata->deflink).

Right.

> In summary, the Qualcomm patch focuses on avoiding frames being
> processed by unsuitable interfaces, while our patch aims to determine
> the "link_id" so that the interface can correctly handle it.

OK.

> Additionally, we also think the 'link_id' can be determined based on
> 'freq' rather than 'band'. What do you think?

I'm starting to wonder if either should be in mac80211 at all, but I
guess if you both need it why not :)

I'd say we should be consistent, and use the frequency because there are
(likely? going to be?) devices with two separate low/high 5 GHz links.

johannes

