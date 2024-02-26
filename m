Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19252C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbjmA3CiLRroXlURNen2Q9heOG0oE8s68Au04uxxO0s=; b=TrlJO2LkzaxhQ/SmRHF6mJK9AX
	/KTKkyx+k4CXx5eT3oJKmBOsQxFx4qIeEFAY8Y0IpxPe2yfo1tjUqh9U4b4RN/PQrXW8COxcnVGRg
	lXNkxl2u3yOiwT2iOtiazfmeAK0PDv6Vjhw0vNvXJU/f8701Me0B6vY58cboWB/GK1WNZ1e4e3t/M
	XwbP6+g8m8HxOsfIld+n1FC+L5vhIdZBdfPrXbFbtjEVKJf9d2R4DncVjHvAkkVaT3zLpuvTaOr/1
	8a+pGRly3KqkT1ytPQU5sbHF9ZnFd80LGFb+iP2fEdSwrBUwbVMKic+fX7ArktCgAqIlPL3BM2gmX
	zLGgLiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebkq-000000013u7-1DX0;
	Mon, 26 Feb 2024 14:14:52 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebkk-000000013o6-3pP1
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dbjmA3CiLRroXlURNen2Q9heOG0oE8s68Au04uxxO0s=;
	t=1708956884; x=1710166484; b=AWLiT9VDskC1NY5dKnXsbASRI2zCziUM6IBy9JQCw8GxmHM
	H2ZsLp23rVC0iKs94kk/4GxHwxE8gmFC0HTn2am4Oc3Wwc2zGiZcHnud+fwN51IAYvAf/Cjl1xqzb
	VehEhb2hp7aNGPzs5bxp7rEPAtXFbEsv2761dwAZGGQ48z8MZbtbsft6wwFdKSvLWdRmptviGPb1k
	6hmgOwLPaW/wdWRW1uoTUQ2JWLKktjtbyVfmBFcNG0MrBaI+8vx2t130Ar/YpjAZe+KthHg+orKve
	34mQEOqL0tVNsZJtZU4AIDlpXUKGi0QTB7IccnPclEPiIQDS0+th9sYuZVUIIydA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rebke-00000009Hch-0bZB;
	Mon, 26 Feb 2024 15:14:40 +0100
Message-ID: <51cad25c273b27885f5387f995db48ef97df2996.camel@sipsolutions.net>
Subject: Re: [v4,2/2] wifi: mac80211: refactor STA CSA parsing flows
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-cy Lee =?UTF-8?Q?=28=E6=9D=8E=E5=B3=BB=E5=AE=87=29?=
	 <Michael-cy.Lee@mediatek.com>, "linux-wireless@vger.kernel.org"
	 <linux-wireless@vger.kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  "nbd@nbd.name" <nbd@nbd.name>,
 Evelyn Tsai =?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
 <Evelyn.Tsai@mediatek.com>, "lorenzo@kernel.org" <lorenzo@kernel.org>,
 Money Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=AE=89=29?=
 <Money.Wang@mediatek.com>
Date: Mon, 26 Feb 2024 15:14:39 +0100
In-Reply-To: <765fb43a372825f6063894809f204150d87d4d18.camel@mediatek.com>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
	 <20231222010914.6521-3-michael-cy.lee@mediatek.com>
	 <b74f21d22a41b2ca635e64f04c06d5db6d38d920.camel@sipsolutions.net>
	 <765fb43a372825f6063894809f204150d87d4d18.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_061447_281766_17B116DA 
X-CRM114-Status: UNSURE (   9.59  )
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

Hi again,

>=20
> In fact, we have plans to study and implement puncturing on our MT76
> driver. We're currently working on the AP side, and we expect to start
> the STA side maybe three months later.

Unrelated to puncturing, but if you're working on the AP side now - also
perhaps on the AP side wrt. partner/other link on MLD, i.e. one link
doing CSA another advertising it in the MLE per-STA profile?

I'd really love to have your input on that in this thread:

https://lore.kernel.org/linux-wireless/3c550ae335a9762a9cbd0c8109b6dd99faeb=
8f6f.camel@sipsolutions.net/

But also - if you're working on AP side for this, I have some changes
I'm working on for mac80211 to parse the per-STA profile for CSA on the
other links, to e.g. track CSA on currently disabled links, or if one
link just didn't have beacons received for a few beacons, or so...

Would you be willing/interested in testing any of this code? I'm
currently not really able to test it, so not sure if I should push it
out.

johannes

