Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C099C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:07:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F8561245
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3F8561245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4v9CbjFd1hG6LmT6482/isIgUhs+U5Pzp7JYAL0ZKow=; b=m/21mDoik7+EJOb4vUamwEs28
	a6R6LvwvKwza0SRoo6Jm2PbtHGnhpsUWCLCSuMnQedz0xROwL1ya0UMhuQxJmY/RAHee78JZDVTiK
	wVf+FBKZMyupswzeL0LigBU00AqV81XnGavILyFAbB0klgpV5RaIdQZVLnU/BancTZXrMtMuBKRUP
	UbOGuWk6YKildWvO45ybORs3Rfm/ELYRe34FfusCV9NgAbZwuBBG/J4BgonDXphk13X4ciEKVte+t
	J6oCKupGrg5gXB3DsmP7eAPGtRoRCi7JpWucTkqFstxQ7Du9bSOnXfJNRLtRX6j39CtAglGOJtveD
	68n+Mrc9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXrE6-00692Z-BV; Sat, 17 Apr 2021 20:07:34 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lXrDl-00690Y-VL; Sat, 17 Apr 2021 20:07:15 +0000
Received: from localhost (p5486c83a.dip0.t-ipconnect.de [84.134.200.58])
 by pokefinder.org (Postfix) with ESMTPSA id 32CA02C0ABE;
 Sat, 17 Apr 2021 22:07:08 +0200 (CEST)
Date: Sat, 17 Apr 2021 22:07:06 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [PATCH 2/3] i2c: mediatek: Fix wrong dma sync flag
Message-ID: <20210417200706.GC9996@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
 <1618642012-10444-3-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1618642012-10444-3-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_210714_191929_E99EDB7E 
X-CRM114-Status: UNSURE (   6.94  )
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
Content-Type: multipart/mixed; boundary="===============3734382739455071009=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3734382739455071009==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 02:46:51PM +0800, Qii Wang wrote:
> The right flag is apdma_sync when apdma remove hand-shake signel.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Added:

Fixes: 05f6f7271a38 ("i2c: mediatek: Fix apdma and i2c hand-shake timeout")

and applied to for-next, thanks!


--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7P+oACgkQFA3kzBSg
KbZqjg//cH+CGtuV2QWgvjioNhD3zT66r+Dzln08mKxYwpj/4klFp/hMNOSBAZDR
3C40kFyRzfHDxTVtAaVXRye0NhBBxdLi2pbLCpdj+P2G+i9Xd3Buw3zb3Ln29goF
B67rM4+geHeQ4rx8tBFiV/i8YpT5Ps+GbUTX5tjcjLKJShviTUrdf1q+xWxxTtQT
Zn9ZnYctLaqC+UdKfPnZ2vZodDRz+8RGORnyHZVR8TqB2bgbR/tgjkYeehKnqTYH
FzFguRPreMqJZZG5nLy+meQQbGRPN3JPc70cEdHuF/PLIw0s3WuGSTtuuAWFO21C
abx0Dt3Ehy6Q8zKGdO7dm5ulH9APgV6X5Uuy2RMuBnh6GggaD/b9/ZCm25I/b9eh
pT0yS/sWi5Vv1FdR+EQDmRbUc6PjNXnnUlczcdLU9XaApkBmYD9YJDmIQqbwRKW9
vmrxxrqTPXYNkbEagE79yUkXHGK9vww+VGt+zrsRWObEDvxoQWYVoDbdm1LtYUFn
JsRAU83gr6WB5m3yNSjEfCQNCMHQADbFvVtDwnoSxV522dlrIIU5qi11brC5lws5
484tpaNiL0LBYnFPMfw2mp4A59h9ZzGf4bDO5wRdy/qZz7u7g1zarS4XyZHczbI4
x7JuHSjw882zizBuvSM8oAExNnRul7W/qhsjbxuy5abVQ4AoPB4=
=Mcoq
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--


--===============3734382739455071009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3734382739455071009==--

