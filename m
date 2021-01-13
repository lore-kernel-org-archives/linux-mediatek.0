Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DBAC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF6223340
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DF6223340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yjTH4c91Y24IDwnXz9WF07F+aqfqF3kpHWmZojspLec=; b=JtMxM9Lxf7MGgZPFjBXV1RJXR
	CYjfUS4fiAuIZUvsHn1hUKg8my0dZbijH6noPEcENpWvQLRp3X7t4D5J5RoaJqphRaWqsglEgPy8n
	QaxPbzgdZkfCfzQvL9y0C2+ximYcv/Y9RiDos8DVsxNI38jGQv48hH+xegGPVSitrGsDlPmn9Mx1W
	s2b7ANkmuIUcU4mCGEy2z3V65IlWINTmGYH1ApXpe090x+7MDJAUCdqVYp/zO+4FXDd1gewJElsDE
	tNfoMxm2htMAGo7B0f7me9rZMqUqNnNfreDtwhveTJAJlDB63z2tGD0Yi/bOAfMXfS3/VYOWm71F4
	iKupyHSJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbkB-0003jw-Iq; Wed, 13 Jan 2021 08:43:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbk5-0003hJ-2b; Wed, 13 Jan 2021 08:43:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD1FB20719;
 Wed, 13 Jan 2021 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527380;
 bh=uzTumP2kvE3BQoDI4dpMIiVnwMO9qMGM6S23cnn4MXw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IdUDLrMYN9YW2dwHiXJ0j0ppskcV4TLXxsA4WwxJ0FvUVxkF1fmmzOkOBO6WPbGIv
 kmnhbMiXdcPQjHCH3WcbAQkrdp+Q4xlBrgDFkeBWLxSJPDuICIFePlcoFKxIRab+Ty
 MEshtE8g1U4FBUz7oLyBa33ex51JOaqDGC7fLqQRwumNiVEpITmgnRSw0K18JcSfMg
 JNTu0CBkkEBFLWlf87NreQBPMM4Cb5xsvKy7C3zRdVzynLn2PfL+NKjju+Yg313pE1
 xpyB/p4aZgRVgluf4nDU8V16zJW7WKX7ZK+nVJeTLAlzsasEGTiauU5rsZFDHRN30e
 cLupFbMwm06cQ==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 04/11] usb: gadget: bdc: fix warning of
 embedded function name
In-Reply-To: <1610505748-30616-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-4-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:42:52 +0200
Message-ID: <87h7nl448j.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034301_201866_0D50A74C 
X-CRM114-Status: UNSURE (   6.01  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3526321709360804032=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3526321709360804032==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Use '"%s...", __func__' to replace embedded function name
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+sowRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYCbA//RE7VtciEWWUu8xODTD9cXd/EaOpXbw13
xg+/bB0PLm8KBzs2TkS3M9WR7Mx7hSmg7SrfEL3M+RtYp2lcks5bRuryUXYQKjx8
BX4nHtmhj4NIWvmXMW+BiqgLn/9xVJUGOCc7xWePP0cT4cAju3Cnb4YXgtldZHKg
Yy2xTNd0478pOdb7B+24fxdgWAP+jp5Zlzhsrnrpvdw5jCpLEohwPeE2ZxuRD/l/
7Stpug6+PbX/u7abLphP9j4esannZiPKl/ZJPJ46Y3o/NfiN/Caqjw06Ujvwk7Pr
eGOrXVhoKdkQlL2bkMBxvioDgRzLiqkebb/tc9ipaRGQznvdgm8nQdIjZ2MzMnGq
kAgaap049nGkHspbOq/lcqyRfJ9N5lkJqjy/Jea6rY+pfB7A7aEcX6dPkCrw4+Ot
CtDvJQcFc7ZVqCtLKOV0kDZ//u2pjtZZc/SHspicXc6KL5OE5Vp83f6XudxJa4SB
tlhI06yjX6iLqURc9arkL2DUn+LKs6TQEEes5tgPZG4b1jKVtDnDiRISxJJbPx6W
rrIxRg2JYE8E1ZZ2tVHzi3CTMXPaJ7Dme4k+cGQLoSw6TBvs4RFonQek1fY9BKs+
KbTXfQYL4DUwrClsKCmEmA6NUNwzYF6CNR2bjN3zIcL16DCBNRi4RHQhk+tncN6y
jGfXreVDI3I=
=OG05
-----END PGP SIGNATURE-----
--=-=-=--


--===============3526321709360804032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3526321709360804032==--

