Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8274061AAD
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8274061AAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFDZNv3zn9E3LjA0U2giznD8hOz3Sj51kZOKU5lAsiA=; b=3H0B81+W4m3XuOBFKbkXXZCA+f
	oe2KChGtb6Ed97B70exxtNvjz5CbcTOSKIaW6Zlxmh8gvFrzUzi3YPxgEzsCKHCvZ+5U2HIH41g2u
	0JSYjBa5BGao/9DdsAQIlwOODND3yRiTZRYhzEImw2snTOgG0H7yXKEszXk1yH/9DCjcfC7yzzLWd
	o9D4s1D37gOBHOjiDsJSyTQCO2JPt5cKRBw1I4WUPNo/rzZo2iE+KkqQdsi+6Pg65ris73pCP2Cv0
	+yLD7QX3dN5bkBY68SLlNXa1HTmFIMQGXHu7M98CAHsZ4WWn/LM5tH5otdySYn3kVrbXKG4VvenW9
	/1I+CBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWYhk-001rAH-Qp; Sat, 02 Oct 2021 06:41:04 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWYhY-001r6g-OA; Sat, 02 Oct 2021 06:40:54 +0000
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
 by pokefinder.org (Postfix) with ESMTPSA id 0A60A2C01D8;
 Sat,  2 Oct 2021 08:40:52 +0200 (CEST)
Date: Sat, 2 Oct 2021 08:40:51 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
Message-ID: <YVf+83LdUEPjoLdI@kunai>
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
 <20210917101416.20760-7-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210917101416.20760-7-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_234052_967724_6A91386E 
X-CRM114-Status: UNSURE (   9.54  )
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
Content-Type: multipart/mixed; boundary="===============7316476298589943270=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7316476298589943270==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+erojwrcEqBTpKxl"
Content-Disposition: inline


--+erojwrcEqBTpKxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 17, 2021 at 06:14:15PM +0800, Kewei Xu wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), the I2C timing calculation has been revised to support
> ac-timing adjustment, however that will break on some I2C components.
> As a result we want to introduce a new setting "default-adjust-timing"
> so those components can choose to use the old (default) timing algorithm.

Why can't the new calculation be updated in a way that it works for all
I2C components?


--+erojwrcEqBTpKxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/vMACgkQFA3kzBSg
KbbgTxAAsQj8w7VTGVuNghWtRnRUYzsv+yrT8l0xbXYTWaJyoty5NtJoFgR4epKb
xvzwypsMJb/LDJ7MmM//yR6p7myQXh+mTRbP2RxBOmBqJk7WyQc+NioQ8/N857Sb
c/9USo5ie/l8KLHHWfL5cIbhyXEfIDNc9yqCr2Gnzva20D6KDAZAdcN1a8obGo4V
rH1JSpOlvQt5q0idamv96D1bswvLUcwp5VPus7/gI752fBxaUcVEFv03bA+JNgT1
C39M/KGd2CDRzSeOHOPxT71SLir1iBgvj/4ioQN4blln+gzmHSamzAAcxLREBppJ
Y3qfRUY+E/xJSj7uvuh++74LEYNOMH+LN//BuCG13jn1Rb1BZEyyMQkAqpC+ZqIM
ASSMWUPeZYOONV8XZshMybYVKrA411kmQEdg7Qz1CTms9Jl8Zwg9BW6rHR6l2mrf
csDILr6aXdW4QliPdh6NSl7QbXIDoNFyB3tQFA9PDBgITzX3JHF4bmGMh2UmmzAJ
NqkD/8fy6aO9b65KxHGOrXutHwcSv83fE35aklFYtzWtVkKWr2rgIBQ4+2sCp1hM
VvPI3w+6lr1HKNDA3qRhCRt3m/jrpkUB2Fy7lfdLp7uhoroc3ryNgjJTKiVOBZ+S
noQe7ZqE8URbQO0l5Y6cBxOi4jLqFy3cGCVcvALeMvQBolI8pM8=
=4to8
-----END PGP SIGNATURE-----

--+erojwrcEqBTpKxl--


--===============7316476298589943270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7316476298589943270==--

