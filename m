Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616F4C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:43:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB0820719
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB0820719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fetLjFtavn5bsJAw79OcS/iUKxP4UJZJB2Ip0t5skp0=; b=2+lN1VVBt9WV7EKtIoUsCrIfT
	lxHE2qbI2q7OtkeyFQ1fOTil/e0hgY0/f83BgNOvcOl12DfhY/AXhLwYBetKx1a8CsAWSmy2VqfcD
	WgC131hyjpAt2c4E7IYfScQR9BMQ5rXALKmeFkoSIxgWBsb+BBMlbcW810SqbTO2XYUcF67PZkCI7
	Kw4TCtOV2Rsgi38I3t/jUDMdwqhuXzWFv28r0FNe13KuGVblU3lm4pHOqUix7MOgCoH5kXmu+dFpU
	oqVHZHHLBwvKSYaOqY3TuyIExASMGJvEoLmBZ2TU/j233U3AgB3X2a9ZaQ2lBZCBEYQlsTQgC3aMB
	SyC1eEF+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbkY-0003so-T1; Wed, 13 Jan 2021 08:43:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbkT-0003qV-03; Wed, 13 Jan 2021 08:43:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B65C123356;
 Wed, 13 Jan 2021 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527404;
 bh=8+yKvyuxptk1pipmKCR8+8bScEfAZHCFMfMegzhFIRg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PKx4bzbIjdd2A3hiNvX13tAGG2oavr+Diyd3+RRBc6pUL8vcl+MAb+SLzzj/yJD28
 WWuk/5fYLY0vwHwkUJaFrx8pwp1Cbg4PRQa/i/DJio+jjvWCejfspv4+CHw9x7NjZ8
 8yiVJzEPLNXhIqq1xIPDmSh3fJSAAQQynBsKbAxabZ0cWWXW6X4Zy+4lRFAKINWaT6
 +UDxx0zcGx7GMCs/HGFIsnTwAk6U8CvSP3LicMiObJnXV8w7KdSMMHrUia/A4BToMG
 HAg90iyiYHzCVhlaSLC4+5c+BjNw5xsLz7XuQK6yGbj0BGFm2yAhY8PU7KvHummQ3f
 xV798FKKg/jag==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 05/11] usb: gadget: bdc: fix check warning of
 block comments alignment
In-Reply-To: <1610505748-30616-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-5-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:43:16 +0200
Message-ID: <87eeip447v.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034325_160588_474867A8 
X-CRM114-Status: UNSURE (   7.57  )
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
Content-Type: multipart/mixed; boundary="===============4560965242432207466=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4560965242432207466==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> fix the warning:
>   WARNING:BLOCK_COMMENT_STYLE:
>   Block comments should align the * on each line
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+sqQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQa71g/+IXwmgnZqM0ZXbxmaTqE/LVIqJZi+eVDQ
A1FWYn3dGmyOA7pxRD+U3su3ZJa3peAMmVSuJqIT5re1Tew+ie1rjUvoa9AZEBjE
K/5cN8GC9TrDYhqsD3/Z+HRTnnJLxqeBs4qpeCKBB3MRJsHV5fUH0bi1uYFCx/eA
RiSU2t+SKqXhkWgoZd1JRTxejDGXb/gB/4Xrq7l3wkeUJygYNGuy2bZhjLoEsRsR
K53+CxaHrra3knwfrnEF0C/mRneEQLy0iQIkqISADCM31Zn0ddCjQM6KtYrK5eqo
bvquaEsqd8N60fgJE2OWZ/UjQSkkvn5VfgzQnYJw4AKkeb9o6cYOYp5RgySfkF1k
xOklNZNxXgXeXgoOIFlECvjr2TTdSHTVzo8rHFWH8QslwuvpzluQJ457nY19B+iv
Sy5b0eUmf3sBlfkCExZcZUEP93GXV1ipYKNUkxSvXwJlpfAh1N/bAHwOvSl2Z7gW
bgkXWS0o1gV64A/1vUQCOKnvlneyUBDrPr1pkv0ZvvOKNXY1xJyb/YskfzvWL+iG
2lW6Mz2+9SZNGWlCo7b0H8JT7WoHIiyMzZikrR+SEjZUnj+nJEQK+QE7izVyev2H
fFVVoYCYLs61plh5qRGA0WbxBaQhiT2eXYFMmyXfQN01y+DItssGlP1KsgQgWffh
V7nWUTzzAwg=
=B3ks
-----END PGP SIGNATURE-----
--=-=-=--


--===============4560965242432207466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4560965242432207466==--

