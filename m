Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA56C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:37:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B14961278
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B14961278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibLZtUPG2z0o4rLrUfKIVmcLvCCE47T0y1+gyrfaqKs=; b=v1S6f/kR08UDilpGUhck4Xyp+I
	F78b4WejR78h6aVCsUp/YUZCSeCiMvTROKbKVlNoDjq1EUm7Zb5G6lxgk2yrjB8wyk62P6V5mSVOt
	9rGpToicb6/YLFFGZGh/5eK8qV7wKQhn9bUVsr28gZzd+jqlYcNTt2YdgbLpHiTZTEXbfWs+tD5kg
	K0z5A8vq6SzY72vbkhOwwyCtn5Dw/RIzS6jK9fmdZgJ6Ee4JNI/IIGaNjFoEAZ5auF2eOddxEI/Mq
	l4yQLO1i+T8J9kI48Dmz6Uo/4Y1ju7VR6oLMyDP9IWtQg8QggyPFRNmyQ9/M2LENqaaQJs5aQ4/9T
	JiJq7nmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWYdp-001qAX-7u; Sat, 02 Oct 2021 06:37:01 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWYdT-001q93-FR; Sat, 02 Oct 2021 06:36:40 +0000
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
 by pokefinder.org (Postfix) with ESMTPSA id 16A332C01E6;
 Sat,  2 Oct 2021 08:30:38 +0200 (CEST)
Date: Sat, 2 Oct 2021 08:30:37 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 2/7] i2c: mediatek: Reset the handshake signal between
 i2c and dma
Message-ID: <YVf8jQPHoQtbCfth@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210917101416.20760-3-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_233639_710255_64B767BF 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: multipart/mixed; boundary="===============2470573649237002358=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2470573649237002358==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UvFvhvLUV2QKFT4X"
Content-Disposition: inline


--UvFvhvLUV2QKFT4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#define I2C_CLR_DEBUGCTR		0x0000

Hmm, I don't think that a macro to clear a register helps readability...

> +		mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR, OFFSET_DEBUGCTRL);

...

 +		mtk_i2c_writew(i2c, 0, OFFSET_DEBUGCTRL);

looks good to me. Anyhow, it is not a big issue. Let me know if you want
to change it or keep it.


--UvFvhvLUV2QKFT4X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/I0ACgkQFA3kzBSg
KbarWg/5AWa1p784FQB8L72nw+1vj1664TNbB4mDaDRNT748bnUy4ZrHl5XMROZi
u+L3Kb6drKfBHX1iiTN7908T6dss/s6lGfOiGx7IsTJAoTVmZNoG58OpvCptg8gc
xTlSls9twWk8S9sp/5LD/sRlsCLsbktcL8BZEP7FHWO9eNWhYNqLq/asy69kpnkO
hbKKQ2F/Ne+fLiwubzeLHsdkNb6AQBjmMnAB4Wthnxitgfnn6XgEXp3vZEBiCce4
D4+VtUrNdG2sQXuwuXogtLAnOZMankq/b4o68EE1EloCCBcus98EnXrLHYvbKj8A
1fUxBpoHg0uA5RrKtcyVrrp3e5hpE5rBLimFYdi+NQdL4W7wN1KWmdYvF6y2NWGY
i/9NazOqV0gep2cSRtH+KvpSP2jpAZyyTqFC5UGSK9BJJKl+E6hyS6+P9uj6Zos4
/yzLaW9Rk3Z13HAJQLzOmizdrCuFl3L+K+QnFDQCH2HRGhDJiOpV40SqHFWWUN+4
P9Zh2bAn71/S1+dHY1OldIHBEZaCwfY0ydfdhgn+nbrPLL8pI4AklJyJUiAUPiYC
FrvB1wc4tcq2PEn/16fiwLuhrHWqNY83qw1MdNCGGBwIB+OEp47F3kQOtWznepou
XecMzXpurwrvSS8IgUwPbY4X+XdN8FUCTbaqSaxbgr3LKMnC+gg=
=UHsi
-----END PGP SIGNATURE-----

--UvFvhvLUV2QKFT4X--


--===============2470573649237002358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2470573649237002358==--

