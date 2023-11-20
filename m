Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181A4C54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACBikKPIRqzr9payxhpI5XM4jMhbiP2iolHg18i3IrE=; b=pKBqlTpHog4rGUTBzfJcsjTK0L
	YjIZHVP/oBbs24RfacYiCY02tjrWgoqkZXKi2k27hnQvavRuFgLlr1y1IM/gRZ6gMOishsFs0i08V
	TNF7W2ViZVGZ0vXfKpRJGcWESuHzE3fWqQ8PU/37LPQShfm19XXbDe1Wwwy8+I6cd81uEeKW0tcOM
	bvgvGVcjmZClaEgCaSBqIdsniKHjs/K63ogKTwOAsQSjzuLRQtMlp9UmeSbWX2FqmmV+yGrUYPQQ4
	tG/Ct9gFmQk7pZE4aJrx+CCzSuhQE4I5rauHxwhuHSvwwBi89u8jrobbtZIuesM2xKlKeYiuBsXGE
	ga7q9iGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51Bs-00BjYe-2T;
	Mon, 20 Nov 2023 10:07:40 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51Bm-00BjVm-0E
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 10:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ACBikKPIRqzr9payxhpI5XM4jMhbiP2iolHg18i3IrE=;
	t=1700474852; x=1701684452; b=D8UaxNwUpcRj9YE01tfqL2SZTnMkK9FcmhQ5VbUxQEBfnEE
	3ywYaBFkDGWBGgY/rey/Q6UGgegprGk4YxvOEbayPi6vsqcCuk+wT1zNVNWE32vVlCJQqY2aiUwBS
	el77t4AUQQn0jMR92hZAVTZy96GQKZhvsftHdE2e1eDrHpZjR3ZXRCCasfybWNLtc6OBdk3MxISGE
	Vkad50lu6VaxRW9a6R0EqYGam/czXX2zq364YjYwP8D0lYGNoQqfqha/dYpgtRAkzmig1JHJOUoaQ
	q7mTSJP2dAKU7dFyBEPtl3fJyY9cHlnELhtYYXn5Yg0IFUlEs9UeG7mwl2fmgtVA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r51Be-0000000F5C6-06Ta;
	Mon, 20 Nov 2023 11:07:26 +0100
Message-ID: <f246e61a32590b8b543f02fa810da32f2d1c9a81.camel@sipsolutions.net>
Subject: Re: [PATCH v2,2/2] wifi: mac80211: Refactor STA CSA parsing flow
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
Date: Mon, 20 Nov 2023 11:07:25 +0100
In-Reply-To: <e56d4b60d6b0e7305cc9db4f4b1e33fc44317ce5.camel@mediatek.com>
References: <20231113021107.13110-1-michael-cy.lee@mediatek.com>
	 <20231113021107.13110-2-michael-cy.lee@mediatek.com>
	 <2eaa04080702230b8dbe3b3541d6d831484c4f1f.camel@sipsolutions.net>
	 <e56d4b60d6b0e7305cc9db4f4b1e33fc44317ce5.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_020734_344457_BDCC3107 
X-CRM114-Status: GOOD (  15.63  )
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

Hi Michael,

> I will fix the typos and change all the =E2=80=9CIE =E2=80=9D to =E2=80=
=9CElement=E2=80=9D. The TODO
> for 320 MHz bandwidth is used for internal tests, I=E2=80=99ll remove it,=
 too.

Sounds good.

> We had checked the D4.1, and unfortunately, the additional description
> for WBCS Element in D3.2 9.4.2.159 is removed. In other words, D4.1
> does not change the definitions of WBCS Element and WBCS Element should
> be parsed as VHT operating information regardless of the BSS being VHT,
> HE, or EHT.

Right, I thought there were going to be some changes here.

> After parsing the WBCS Element, the STA needs to check whether the new
> channel fits its capabilities according to the operating mode
> (VHT/HE/EHT).
> However, the existing flow only checks the VHT capability after the
> WBCS Element parsing, which is incorrect when the BSS is HE/EHT or the
> band is 6 GHz.
> =20
> In summary, I will refactor the WBCS Element parsing part of this
> patch, along with other fixes.

Sounds good.

We'll have to figure this out separately, but I'm also working on
something else that will certainly affect this code. I noticed very
recently that the whole STA_DISABLE_* flags are very messy, and am
working on some improvements along these lines. The current version
looks like this, but it doesn't even compile yet:

https://p.sipsolutions.net/ccb552810b020745.txt

No idea if this would help/hinder you in any way, but I figured since it
has some overlap I'd let you know. I don't think you need to worry about
it for now, it'll take me some more time to work on it.

johannes

