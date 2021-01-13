Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECCBC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:46:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121F02336D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 121F02336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0H0i9VRorKOU6sQfA9xvtFajg142sCy2VeNW7Zy0tJY=; b=KBVK1ShkGcFQ3xE1ZoYKMaU7e
	AkfgPzWAHjWs31caZeGZDJ4ncbg1XQ/RY4J7oeD+sp4VHNVFQElUtsl0sIUWbSx3rwE5NQgaD/n1+
	JplYItpmdpqHYAdDguv4w0OKwEd7sryoHOlv4PMZRiQZVJZQETn9OX/YfsPnNw8iy5O3QFzOpLPmH
	0rIPQxGhCqJds7JYS2jAmhIeJjJQO5KFy454M2mIwsx3slej2H57PQOID5XM2QLvixIUV93qTKKTb
	UX5rrnMH1c1wOMCyip9wofY7O2GOWDaBgI/SM3GAShNkvIA22/kYvC6ma4vtvm391xkVNEIPR2tsg
	wm+nhwGuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbnM-000589-Kf; Wed, 13 Jan 2021 08:46:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbnD-00054B-6C; Wed, 13 Jan 2021 08:46:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3A9F23357;
 Wed, 13 Jan 2021 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527574;
 bh=dWBhkEGaY1sKa/1IcotatPi+FviatCbdyCOdfaKKVyg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NKMshoGHMh7Fqj93A1DiYEHYG5m/IzIPYOAlCVtuM5yOHVehiW4I5OpXUPLVGqYXS
 7VXdojgtQG+B2YofPN3Y4RkTcWCvzcFDjQnEWatyvqBsaJlpIyHRYdvQldzjrpHN2E
 r3Ob5/InLfMMDSb3vCieaQNAQUUX3iCR/h3RyPO+DNlBiZWEX6WSXVmYuf+B7RjOqq
 8uw1FlEs4YR7cHQceKfdQIYAjgqcKH60TkNtkfoDtUH4HYniCOuE5AREu6KXEF3QK/
 V9gateFPL7psTDb1JTpVtixQYNJW22hHPlINi+eAZMncW8tCvlvDGlb1CN3BHdwPqy
 a1ko/Nt89qD+g==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 09/11] usb: gadget: bdc: fix checkpatch.pl tab
 warning
In-Reply-To: <1610505748-30616-9-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-9-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:46:06 +0200
Message-ID: <8735z54435.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034615_346674_A2BAEA17 
X-CRM114-Status: UNSURE (   6.50  )
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
Content-Type: multipart/mixed; boundary="===============4891910288028335859=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4891910288028335859==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statemen=
ts
> WARNING:TABSTOP: Statements should start on a tabstop
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+s04RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQaARxAAkN8Iw5o5MHQ04cBBuO/bjxsg8XK9Sqmb
1xc7uQsIu6pveNQqvI/xMRFZj1CvxMriWutSTfm7S9pnNtpD63V2+LY3ORD6u/E/
eBKnGmqPIRoe5QV3//7U/cKB/cpg8aLJxRr6Aj1Y/PetuUfb1WiwP5xL5IdA2Sla
WLcg9y3it8WZ1qBwbFuU3M4hieVfV4FLxe7+75y3RILkRhxljY0D1ucpDhZldLRF
nL+nrvcgDWTpBxvehZKSsmgwG3vmMX2Rr113Vw0OE0yzZryJwgti5k2N53656I7P
qs2Fr/4KRdYi6DHL4jWj/+WYb4MByG3ZfjITRWft5DOwIusFt0YbbdC+uRbylmAv
4qcUlTBXd0NTGmHj4H7xbu68uvme0Bv0SSgt+Y0GgYk+Pq4+4zNNVFv6m7O49M+f
mxGUjL/VhED8aenSRka3MXSPrptdwiJs0SSu0Qudr53rTFeGn0+4CUX8GPVwOo5K
O42l9wwu09rICdfO1ZSHPy4O/Gu32gPcU7ee456uPmW3FdbddoZPrRwwFeDkSULG
bZ+ixR74omEy13iEsMa+dCyY47z/ohe1lhSYTHMtvIKcbuTJ1LLKEB8KfWhBaq0o
NyAnMK5buM4oriTSGviiBlZdBB7h9JLjNaRu0f++AQyHYqYg40TSOn5vvFz3rcc8
ZWDG5ChoESc=
=yHMR
-----END PGP SIGNATURE-----
--=-=-=--


--===============4891910288028335859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4891910288028335859==--

