Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E2EC4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 07:50:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB512396E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 07:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdUZhEIj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjYVF89N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB512396E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uh71KRJeCW1LVYsG1HEa9RBTluNHx9gAtlb0Qs832Dc=; b=tdUZhEIjchc2IOHQT+emzpUGm
	ZGYfDgGGpgA6oJ/ned/Wg6mL/RA2uABjFEC5k/ZI65U2jckuz2ZnaaPu6xT00ou+7Q4xHaWKNImaA
	pZEeQmH1sRKfgvCfkKdiWOUnFNckIQ+SdFw8vmHxnVk7UQ+2eCCx20VuH5MQl8Kw1SKjLLMQ5k6Ws
	16cb7nfRk4TzZ4Dw1PipQK59WMQ4aqKFU4XRJmueQ/ii2Ia7ueF5k8UYSLw+T6lusv7ZH2tYImBuu
	o2tzQIME3MeGdoOMm2s7i20YUjIcdKxxYVJAZ1hAxGUgs2k0TjQkF/LwZgIbRxqpvWpROITOyJKLW
	mlSOzsxDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLM1D-0007wL-8V; Thu, 24 Sep 2020 07:50:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLM18-0007vU-QC; Thu, 24 Sep 2020 07:50:15 +0000
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 450D223787;
 Thu, 24 Sep 2020 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600933813;
 bh=EDjYMV8KmqhHDfc18vRcIBfCGu1ru7i/0ipQ5QtZxBU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JjYVF89NuT3d6EptD2DTH36vkfyAmIko2Rbmge1k4vYhYcqhDREfE0pcGDZaEVRbK
 FWZ7hhYyRjZzOEAjmdYvNaS1QHyseEgwMOSN1lNHw3bdXB6CggwLpjTz7K1d6ISewj
 KYY4Jox51lnvC5XBcTZRdl66iReHHGSoClp3IB80=
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: gadget: bcm63xx_udc: fix up the error of
 undeclared usb_debug_root
In-Reply-To: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
Date: Thu, 24 Sep 2020 10:50:05 +0300
Message-ID: <871rirehqq.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_035014_929922_51223D62 
X-CRM114-Status: UNSURE (   9.01  )
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
 Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0966556724055455389=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0966556724055455389==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Fix up the build error caused by undeclared usb_debug_root
>
> Cc: stable <stable@vger.kernel.org>
> Fixes: a66ada4f241c("usb: gadget: bcm63xx_udc: create debugfs directory u=
nder usb root")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

$ patch -p1 --dry-run p.patch
/usr/bin/patch: **** Only garbage was found in the patch input.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sT60RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYl0RAAhvT4mybhJjUYpcnZfXCSsQy+6QZmgHHx
sSI1DBFkX2dbY2mgLsMBMzPRR41WYVZwwupSin6wex79hPmtAafeNyc9ISF2+tWd
gcN9ejg8RuxAoxoGQ19SRVuOvTIK/YzlJho3kCrpUtIoI6n19fdGRLzoaZQ1ziJ5
giZGxhN2jfqZTCcHE3XHPgsaKqQrmvxeksCQkOiCjXg/EvvdFLatvdyAeh8hjdWG
i7HyLRTe/sVzde9TqBJs9pvLNpYrStyDIGD2w+kYMhJCWip29DZMV00rYtpUGMUd
Bgcybsq3GaVOTsMcQQDZdlzdBlE7FSZfzN5JMzCmQLMG/pMgciZyXEKGZ1fwXPCf
ANcZgEFV6HLhJBFHeemuDbOI3qg4YgNx0LVicKfCUW7TXYbpmwqeffnhtu2FjsBF
jb1AmZa16aq/tSMd5/v3r6Xz4m4swMTwvKV3sE0KwfjGKkQF7K7qPU9qEyvoJxio
kZix6Nnm4oWEsrPpn1g3ywhiPDJrR/8cAeSTUs3Y6lVg7P6efTeKztTFOWXpLML9
9Ml+1+dOYcNrG6nMrFQCstV1U3xTevtFqseJEe8hwhX975PaxW/jJrMlE/mxIdB9
7oOzudMXHW23zRegM5NuailZuqYBjuwBAVGaBCJdGP2++GgqkAjwY/dm9JaI67n4
4qo4oVh4EXw=
=Qy5Y
-----END PGP SIGNATURE-----
--=-=-=--


--===============0966556724055455389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0966556724055455389==--

