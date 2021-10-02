Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F6BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA4C561881
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA4C561881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xi85L3kOZpo8vVr+BCXV7kCCuu5Jhn1E8yLR/NMD4BQ=; b=2XmDf8aSFHWB8/UUFT2QzkQIWg
	7OKGLGTrAFL3bY+YgCCBHnW/eabi6Ys31ldhxe6gI5ZU3Aj67lIwhQ9MEHUc0vcb3AuscMDmDXFXS
	YXk6ZO4+PVEzUdQJqxFi8tdhQDMunyQHrfjm6IiyEUCnLcA3ct0sm0cjuKt2yjQS8R87XZsxMcAve
	jq36U1fE7cCA94gn/+AWnnlQHpLY7rKgqIrnacPW3ciC5e8rfvdpJO45+RfY7xn6NbcSw5b3RCOZt
	zW9FkZ4m+eL1giczUoNo4KbiJuDrcMZAzCmqE0/G9pNKt3iVELX8HCD0lSLLL5JfDHK6YKfzQWbsx
	qwQ7jIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWYgz-001qyG-Np; Sat, 02 Oct 2021 06:40:17 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWYgn-001qwM-S8; Sat, 02 Oct 2021 06:40:07 +0000
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
 by pokefinder.org (Postfix) with ESMTPSA id 25C7A2C01D8;
 Sat,  2 Oct 2021 08:40:05 +0200 (CEST)
Date: Sat, 2 Oct 2021 08:40:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 5/7] i2c: mediatek: Add OFFSET_EXT_CONF setting back
Message-ID: <YVf+xNG8yXRJNmA0@kunai>
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
 <20210917101416.20760-6-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210917101416.20760-6-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_234006_088541_336E9A8E 
X-CRM114-Status: UNSURE (   7.92  )
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
Content-Type: multipart/mixed; boundary="===============2363209822390229795=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2363209822390229795==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdPPXQ8lIS5bCvDz"
Content-Disposition: inline


--bdPPXQ8lIS5bCvDz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 06:14:14PM +0800, Kewei Xu wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), we miss setting OFFSET_EXT_CONF register if
> i2c->dev_comp->timing_adjust is false, now add it back.
>=20
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--bdPPXQ8lIS5bCvDz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/sQACgkQFA3kzBSg
KbbapRAAlO5F/fxxo9sQZIVaAXMTDPcHsKC2xquAN7db153EjC/0gPCSu0ZHIRr0
wPZ3vEYifZ5ZM3rvDpqTlkCMKFJ1EAsF9Iz4V26teKhROMTLHMBXIExKsn77uK91
gRGudtWd3K6fZsXCQRmTRUWcW1L6eIgcVoKsi4XqAp7iuwoOa8RhQWo5Q1hR5fds
6rAyHQmE3i4v3Cv21ObmeZMhjaRIsSt6IfhrmCQijUcIGQXwdsTA37CcIAX/eldf
lM9w0tUFxhXrGZLefbGXTX6QHA1bCpVZpwBWTx76as2A81inuyq68JG64URpNEIj
U2klXv1DWa/KMOwbR4URVK+pEpLpGCrHgR2JjX1SQDeqHck5SkHbQCUl64ZKPoVT
06Q2DT9wohf9sdqV8lhtG0w9qjGOm0+BLptE4O7MMxxi8GGWrl67SReALY9IHwX5
1fjRTJqKWP+XiYtvPIWDElMLrhatcgTnRliKCIQLwqQrQaW+J92v9GCRe1kGa2Zc
vECvAtf3HGsmOiH7ioX2gdTfKybpl0FqBjJ3wut0PPaZFcefn/3hf4BPGLX7s7op
PeajqF9UVcJZWRsyMyuqKNLC5KbbgIoUzq3QBOZ0B5X8RMlKHJiX8O/B13Dy9JsI
1FQPCX11MVtxL3YG1npu+jklofnJ9QJ4GkwCgRTSqr2FVVfunfw=
=/rCL
-----END PGP SIGNATURE-----

--bdPPXQ8lIS5bCvDz--


--===============2363209822390229795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2363209822390229795==--

