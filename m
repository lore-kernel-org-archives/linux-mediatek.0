Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BACC28B2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/4mvViWUl57A1az6fHnkvC2V1VDyS0ZsWKbuu9P7NM=; b=yVfpqqWOyC8vPLyNKjuDcrGMA7
	xmhIVAulpEzK5Xc6c8FUfLJhoeOYLym3hRswve/EUU8u8flbK8xh8sBrKg5+t4dUs0XzYXFOFCY+x
	i2fEVnUwONUHnPPcTzGhproWeko0d5Al82SxudKsfpkdL//Oj4q61IHbT6doEoktc/2cHhOcp1JAZ
	149Z056XCOTjitav97OO3YA9zRd58HKF4M1/EhS8sQCUplIe/7EogvdctFIf/3KlXWjS3hJ3JSTEb
	wd9yjuFnh1001x8JCQBA8LqMsL8Q+rSW4BJjdqb98PzE459fjacgow1eVprbKpbFIQsyBkIn3Uo+8
	fyNe4cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP5cW-00Afa3-Mk; Fri, 19 Aug 2022 17:17:20 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP5cT-00AfWo-Q7
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 17:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=H/4mvViWUl57A1az6fHnkvC2V1VDyS0ZsWKbuu9P7NM=;
	t=1660929434; x=1662139034; b=Mq4LbLId5UTQOoW+iVRgSO2buFt6ZcVJ/wJKtSXR97I72xX
	6XwukQjIspTG+MpSE3Qwba0g74oqXUcoUhCIFpS0nq2h7Jo+kiEYKUQzXUX8/5nbxcX0Ma2W/4pP+
	zlgKBQPWo0sossAuYmcLTjITz4RjLhBxEGNk2vm4IhtsrxCf6ftmmaeGsX/nupvBxX8O3xXG+aOnp
	Iln8AuCLME5n1+HKMFZX2xKuXwix1V3G2y0dQjeRt5eVpgBJH2mmYHaiY9ZQv0cxB7aVQV0wIBIJg
	rBZGCQScNWqIwnFjdQRWC/PZF4S03ahs8gwrJqcFgZFM4f0d4P8xKKI01PVVsGrQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oP5cB-00C6oW-2V;
	Fri, 19 Aug 2022 19:16:59 +0200
Message-ID: <096c975e7287cbe22fd355bcfd4b3889c890bdc7.camel@sipsolutions.net>
Subject: Re: [PATCH 1/9] wifi: mac80211: allow enabling chanctx until hw
 registration
From: Johannes Berg <johannes@sipsolutions.net>
To: Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang =?UTF-8?Q?=28=E7=8E=8B=E5=BF=97=E4=BA=98=29?=
 <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
 lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
  Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren Wu
 <Deren.Wu@mediatek.com>,  km.lin@mediatek.com, jenhao.yang@mediatek.com,
 robin.chiu@mediatek.com,  Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com,  ted.huang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com,  steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, kuabhs@google.com,  druth@google.com,
 abhishekpandit@google.com, shawnku@google.com, 
 linux-wireless@vger.kernel.org, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Date: Fri, 19 Aug 2022 19:16:58 +0200
In-Reply-To: <CAGp9LzqmFKs8wp-g7WsJ=uUj_OqucQskdMDwM6yf2dZyuP0ABA@mail.gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
	 <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
	 <edd45a1e732a0eef1894b9f6eda2d4e3c692359b.camel@sipsolutions.net>
	 <CAGp9LzrqYsXAPsbZvTy-_3Tnu23oc11KHdxNs9WvYfe0JHQaDg@mail.gmail.com>
	 <5b24421363048bff1a9f03174cb0223b3e226bf9.camel@sipsolutions.net>
	 <CAGp9Lzrag1b3G+QfW0RCQPGLnR_WzGSg4k+Zdx4zi4b_oeunRQ@mail.gmail.com>
	 <dc45daf23fc8084596f1da8cb41afb422b24160d.camel@sipsolutions.net>
	 <CAGp9LzqmFKs8wp-g7WsJ=uUj_OqucQskdMDwM6yf2dZyuP0ABA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_101717_884464_AEF45E5D 
X-CRM114-Status: GOOD (  16.21  )
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

Hi Sean,

> > If we really, really need to allow changing the ops, then we should
> > probably make a much larger change to not even pass the ops until
> > register, though I'm not really sure it's worth it just to have mt7921
> > avoid loading the firmware from disk before allocation?

> Thanks for your input. I thought I'd try to write a patch to follow up
> on the idea you mentioned here.
>=20

I think you will introduce a bug into mt7921 when you do this, and I'm
curious if you will find it ;-)

Seriously though, this approach also seems fragile, and I don't even
know if other bugs would be introduced. And splitting into three
functions (alloc -> set_ops -> register) also feels a bit awkward.


Is there really no chance you could add bits to the firmware _file_
format so you can query the capabilities before you actually _run_ the
firmware? I guess you could even validate it at runtime again (and just
fail is somebody messed up the file), but it would make things a lot
simpler, I'm sure.

johannes

