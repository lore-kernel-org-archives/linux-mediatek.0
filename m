Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7490C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B704460F14
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B704460F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBcDAtAFdfyH+kThZkwwlQTiGs6GLo+t+NJ5CUDKiow=; b=CWJaBf3kXI3VBgcgEJIhYAba3S
	pRIA3aoNquO3e5FV6S/C/l+F+k+E32MUGKKUPOpVy0jP72gNinD+letpvxKGridUP2S6mMNd4H1OT
	uToM3cBlfyHnyqR/xya69s8NlJWGDensjNm65+5FKc+vwoDGgw2pcq9s1ow+psHJuEUecyu7X2CR8
	WhdT6fwLAVtydKZecXu7z48HxXZOkb+J33jQt0Np0M9uzZKe9fHTUNCbPTM/DKMgkt0BvTqc39/6g
	YSHmNnYJv0x0HEdyQu75p7LyUdrankOOMks31oLirDV35so1OlDYaDGBdGYPoR6X11R4aOO2uUuZm
	S/xi41UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZsjz-008slY-Jt; Mon, 11 Oct 2021 10:41:07 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZsjn-008sih-5u; Mon, 11 Oct 2021 10:40:56 +0000
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
 by pokefinder.org (Postfix) with ESMTPSA id A69DB2C00A6;
 Mon, 11 Oct 2021 12:40:53 +0200 (CEST)
Date: Mon, 11 Oct 2021 12:40:53 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v8 1/5] i2c: mediatek: Reset the handshake signal between
 i2c and dma
Message-ID: <YWQUtUALm+p32bui@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
References: <20211010070516.26763-1-kewei.xu@mediatek.com>
 <20211010070516.26763-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211010070516.26763-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_034055_401067_7044828A 
X-CRM114-Status: UNSURE (   8.51  )
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
Content-Type: multipart/mixed; boundary="===============7443455851562080182=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7443455851562080182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TggNdb/jhd7lklB"
Content-Disposition: inline


--6TggNdb/jhd7lklB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2021 at 03:05:12PM +0800, Kewei Xu wrote:
> Due to changes in the hardware design of the handshaking signal
> between i2c and dma, it is necessary to reset the handshaking
> signal before each transfer to ensure that the multi-msgs can
> be transferred correctly.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--6TggNdb/jhd7lklB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkFLUACgkQFA3kzBSg
KbZ0nQ//fejqkK4MR8ztJDpUH+a24oeWRNYjKA1JUibK8o7Vc6HBcI9j2Jxpsnoc
k+YN4CvmIqcONm/SXoTBrNCcXoHN0Tj+uPrh2ATTSltyghL4qn/eAkaU4imbBTxA
NdG5GsCJS8aTpE2iPls8VQd6AY5Bk4DJFXax/XqIY3GcBWz4Bv6FEt0AZnj6h4DL
m1eF+T+YI1Hme2dWljv1hMRR+AIC7OUp3CZFkBDjrZD2Xqp3akDv05LkSONlbSrt
FqXW8UoudEZ67ERKwHKyfngARylCTTiJkpJiDxQw1EiKFQ2yzGPiJ8rhMgHa3fKy
D5YSBcotOroR31RcFAzVG6icOECh8D834YA4sms0hE3ew5p/akMAdBI3nCM6Oq34
F0/NU+MDliYoGJM1noSyfVM3ppIzO6CFyAW7xtVMvANruqIkBgeNMDzmALf1y+pq
s8T/f7mr/Hth6PEDEosPV74+CDVm4X0Sh+5DZ6W1fNDHMhVIWYmBArflGp9s27gX
4WTsyCW0YPmdzCvYIrhYEk3hkGCjfrJiayy+2ukbRm07r88J6+hO0lA/mGs+GQLo
Y4lpxLr66NgnVg7n4r0r6sYz7azDU43k8Du/eWeZeS7rtNpTAv79yqe73dkkRT2l
2qvr7xq5QbT6PiM9mneMbQ9zShkzC3MBP8cUEZmKsgI0D6gm3Rs=
=VPLH
-----END PGP SIGNATURE-----

--6TggNdb/jhd7lklB--


--===============7443455851562080182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7443455851562080182==--

