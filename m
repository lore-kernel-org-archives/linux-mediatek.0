Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA03C28B2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDYQHSpmiLl1/ragWnSJn7Ry61REEHBIrGbQHrUMEsQ=; b=IJfn30BSMqd7+yaTIUKhp0/bJV
	h7HMB5nENo8I1hYT4TqTEqxOs+DzKbqlGUbiHhrtw57Ug3lefetHzotsUPQKqYw4SaDtiXusnqMKH
	WRZun32A9PJNEGQs8t6hfuwR4dhUGmpV2KDANJKk4G0UYmg7ThyV3ATVzxZ51pQHHED6J5NWoWeaD
	OsMJIvF19T8KazAOjyrCMJPcr9NF75DaQdZWnj6pIjO4Zaw2MHqJGq7eByTaUqpPDG97pjR+QeRMT
	iS7hFALy5JVdT1zgtjMucLjZHmsSra2LsYiM/XNrnKNbwghNuDIlKcI3xQNvElw7hZ2PjJKTNI4aN
	lY0WX75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP5vG-00Ambt-7i; Fri, 19 Aug 2022 17:36:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP5vD-00AmaM-39
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 17:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=nDYQHSpmiLl1/ragWnSJn7Ry61REEHBIrGbQHrUMEsQ=;
	t=1660930598; x=1662140198; b=HVUltvjm5RREE+y+ZcR1U2u5n+0BZVMpC7ZzBcEfyearD8q
	HUrg3BYZUl17r3f+HELtbC9OUE36DMA25Oet1VW/FAgK4G72dsN47b1SM+Urx4JxgGupxFNesErJI
	gLRFn5GaUiSPTslrIsyw1ZcGRXYvEbZgcGXVhLCvFA4HVdoZQzfKwGJJpKDiBvkUFq1jUmENloN1X
	SdYqvz9yNR2bZSWmh9yIQ1AYq4YwzsadDPg9LhECzQYa6s4tODe+zMPUJ7MrQsZfhAmcv9QY/7MJm
	1KCTP0MMwILjNl9KF8y0vjAYYawjSZ4d2ZossdZsJ5ciOaGZ1xyge7TN53JJQnlg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oP5v0-00C72f-2M;
	Fri, 19 Aug 2022 19:36:26 +0200
Message-ID: <d2d51f2b8afa5f11fbb6be5940c745be3907efe1.camel@sipsolutions.net>
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
Date: Fri, 19 Aug 2022 19:36:25 +0200
In-Reply-To: <096c975e7287cbe22fd355bcfd4b3889c890bdc7.camel@sipsolutions.net>
References: <cover.1660606893.git.objelf@gmail.com>
	 <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
	 <edd45a1e732a0eef1894b9f6eda2d4e3c692359b.camel@sipsolutions.net>
	 <CAGp9LzrqYsXAPsbZvTy-_3Tnu23oc11KHdxNs9WvYfe0JHQaDg@mail.gmail.com>
	 <5b24421363048bff1a9f03174cb0223b3e226bf9.camel@sipsolutions.net>
	 <CAGp9Lzrag1b3G+QfW0RCQPGLnR_WzGSg4k+Zdx4zi4b_oeunRQ@mail.gmail.com>
	 <dc45daf23fc8084596f1da8cb41afb422b24160d.camel@sipsolutions.net>
	 <CAGp9LzqmFKs8wp-g7WsJ=uUj_OqucQskdMDwM6yf2dZyuP0ABA@mail.gmail.com>
	 <096c975e7287cbe22fd355bcfd4b3889c890bdc7.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_103639_152739_D25F5BE9 
X-CRM114-Status: GOOD (  19.91  )
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

On Fri, 2022-08-19 at 19:16 +0200, Johannes Berg wrote:
> Hi Sean,
>=20
> > > If we really, really need to allow changing the ops, then we should
> > > probably make a much larger change to not even pass the ops until
> > > register, though I'm not really sure it's worth it just to have mt792=
1
> > > avoid loading the firmware from disk before allocation?
>=20
> > Thanks for your input. I thought I'd try to write a patch to follow up
> > on the idea you mentioned here.
> >=20
>=20
> I think you will introduce a bug into mt7921 when you do this, and I'm
> curious if you will find it ;-)
>=20

Actually, no, clearing WIPHY_FLAG_IBSS_RSN in mt7921_init_wiphy()
actually does nothing, I thought it was required.

Anyway, the point is that now we set some defaults in alloc_hw(), some
based on the ops, and then the driver could override those before it
does register_hw().

With the proposed change, that's no longer possible, and I'm not sure I
(or you) would want to audit each and every driver - WIPHY_FLAG_IBSS_RSN
was something that showed up easily in grep though.

So I still think you're better off doing it in the firmware file :-)

johannes

