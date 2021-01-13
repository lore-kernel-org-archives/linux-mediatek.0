Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686D6C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:42:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0475320719
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0475320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FndOAhhK2Oyz2nKNWB2/FLXgp14c8Bvoqdq/I4v/GH0=; b=ZuS67E7D6jkJlAWgkTksHasUN
	765IpwzfS4uBXmXtvk/w98OoE3/bBc/mE5VQ1+OF/9gN4/QFFbVkmhWUmYNVLXxBkeAmki+S5ftHf
	welY8gQn/AVuHo+lSOxX19CcuE8UfO/2ysP6Pchvo6dCpXtLROo98EALiNiBkGHYqBRsK3P3PZcFS
	pPfueGs74aeiIT6ilYfrgbg896o0F0NWZmP4AYFghLSR7LrVwkL5wEsLLDep6BCIpwtG2x2Zc+/ZZ
	CbmiGFk07KiKXDSX99OeFGCiCOSYY4YwQRbR/CuQjzUWm/Em+7/CKgMvhSZbIA5NG5l6oHyslp37R
	Qs/eECROg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbjJ-0003Ts-VP; Wed, 13 Jan 2021 08:42:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbjE-0003Rj-8k; Wed, 13 Jan 2021 08:42:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF85923340;
 Wed, 13 Jan 2021 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527327;
 bh=+o6TzP0nndi2fNSkUToIVPdHCEVZXxgMvHv50ZLtAbU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=P9W0F+gMnvNMnIOg4TAHS+/fodhMja/o4R00hQCZI4YSF3QJFVDz8oT/pZj0Jw5K6
 ckU85NNJ6oprSQLGYjjZnZ8xxzPDkVIAZceOwtG6qm5Az4l37khA/mwL/DYFMQJCZS
 rJAh6xZpUHAmEKvIA63hPSEb7jbOIe3oaMQqqCUNPMGYaLlaDeJ3MytiuE78K5z22R
 UcH/jM+C4DYVV60cevfzGZ53hHDGLgOvdJeY4OYY4WbwEjVShjaL050/fGQnMMd1DG
 tWaBO8X4H5GyQEqBCITa5vMhr//mwl57KzLwcwgJQxBp9BTtzUU9lltXY50ZgkUiK+
 kRu3o9N6mH1VQ==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 03/11] usb: gadget: bdc: prefer pointer
 dereference to pointer type
In-Reply-To: <1610505748-30616-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-3-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:41:59 +0200
Message-ID: <87k0sh44a0.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034208_415271_E5A27FB7 
X-CRM114-Status: UNSURE (   5.83  )
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
Content-Type: multipart/mixed; boundary="===============1678605951920536247=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1678605951920536247==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Prefer kzalloc(sizeof(*bd_table)...) over
> kzalloc(sizeof(struct bd_table)
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+slcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQaK8hAA1BEVKIDixWHvpuNPU54brKOvFJpMwHVP
RDJko1UeJ3Ol2ndhplwKE8JkoJxZpSN0WGjOa9ESzOGDT937iE1MFWgFh04ypBtr
TLeOEbKVV/6pe5eod6KXtbg24SguepmiZuhnxubQKgqdszST86zlK+qcAZfI0yrc
/jFGFwpopcXCWRJu1dgUceaj4a/eBYGRsgIs4+el6rYAlSDRCxb/VaVBSy1dE7Xd
1wVTwfZyKZ/Vf7HVPh/b9ALBwkxosJIDGS9HTOcKsRg+msAMpNDH0GwDAuLR7AnI
zC6fx3MMsaSdvhONaD4S9+4Uq3n6Les33MEckgyUPWKoBSNGDuANzHBBSqvSWKI7
253W1D1KBN2GnI6Qu1Qe3pMKMh+sy2Qpqe1Jvw2ePHumklt9ieeTqi7ox5vtbDAn
lqOoYfotlWN7+JnGpnB1TmnQJa7ReHvCRYMeRdowt6lS9vJAj6cnGurRbRLJ0L/J
mPbSrwzOjLz4pbjpb1hU7cJrwfHLO7RlSoJ+pNnfL4e51UhMCr1LjOWZNFfCDf0e
AEvH7Yi560ZMZXLRYXH6g1oRAn6QiJ5XxF+H7TP5PZF0ZvITVOBlHpS5lhSFQa9q
YDTd06aJZYpB6+NhFBfRkMXpxsfU8dChvWVniEZEKrJV/vq8kcT15x/LklCP7oCM
JTq7C3DztGM=
=lIKo
-----END PGP SIGNATURE-----
--=-=-=--


--===============1678605951920536247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1678605951920536247==--

