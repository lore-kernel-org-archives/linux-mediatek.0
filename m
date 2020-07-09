Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E317C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 06:40:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DC720708
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 06:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HV9t5LPb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6luC//w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0DC720708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cuEuQQeRyuFSsL3kQp8+EJ6G1mrGRavtoPnj7QbMtxk=; b=HV9t5LPbHBNiRWcW5MeHc9knX
	HSi1hUbH/RKjRlbmACNxhjnzGaW0sqFynlxFIBW+Go3Pp97Ye3Rdn4OFL/xGBWB7ohzjDQlH5FxeE
	dCOx0xeXUMH26WTMG7oWgGotYOpn3k5vZjt1zvFTpHosdmwaAkhUlItQItyShYiMMmakOm4+AW/LA
	YuCvMBMGjTEuVImTq1B89EH2CNVqLmnhwbm8L+QPgiDCMeq0vwPdxJ5DgOdxASvBygk0ddV+HORie
	TSTESx3FIC0Txhu5ENvX0UCRpKaL+HL9FJu+SX7M0jQi9sy6MVkh5qtHc6f1kw27qGPyR2y1WdtYc
	QZ9ymucIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtQEJ-00065m-CO; Thu, 09 Jul 2020 06:40:23 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQEH-000659-4J; Thu, 09 Jul 2020 06:40:21 +0000
Received: by mail-lf1-x142.google.com with SMTP id t9so518163lfl.5;
 Wed, 08 Jul 2020 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JEqg8XUJLNq8qB1Kes2DnczYajQSKRC2ciMQNpupK3A=;
 b=B6luC//wHghseuMOTK86eTGuZD4GEzNj9Gkmp7Na7hEpZlMG62wYvJeOvWkdQLXpjg
 xQrUKWeCyF82KJy3G8/SvC8nxQ4oOOuJJTuSCeptEqnLo49xUwCjg8iTgbJ6CYtygiNJ
 CTR1jaSPu56UqkYvUdIJeK0UF5FH+LUvvUER9y1E6wvOAPwXr0dymEEcJUnCxkKYD74X
 JwlRZwudnFM4MBgPTBwRqgmn8Eqbq6EWX/u83/OxO07hbecEflenrmLgKR1PL4Qaznhp
 rJIeyW9ZzEXemjEbJMfVFcUht11S3gpjDd3ZYizpzRB8NyqDLdlib2RurHhO99D8PbEn
 FeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=JEqg8XUJLNq8qB1Kes2DnczYajQSKRC2ciMQNpupK3A=;
 b=JRX6ba1QUky6tVnJrZTPbpQj3PDNLHNm9sw41rKs+Hi7U8e5DnsIZt2F3AyZM9iEYG
 ZwNeJGln2Mq5dIVp7lOJKhHvDgvF5ft/SKRy2wPWQio1Z+H1bhasgsTPdUgKKLHYUO4I
 kKLOTeskn+JjVCgaafb0TPoEpwFtPPIsUN7YSq+pMrYk5cC/MHvOBEXfjdgl+6QqJEMD
 a7jSBhJMASUCglaHDqwJGwt0MQ3aKsO+zyGeAmiuSeAI1xr3b7II3SB2lYEyW7zrmjB5
 ynJGJyqabhHqmSjYLMgx9Lucs2zV78PHpnRGFUKZUwaS/PbvHO1/rrr5VcKs6rK0S2UU
 xqjQ==
X-Gm-Message-State: AOAM531ndz0fH4N8mgDKHAFx5gRvG5LI/0TIrvfYJLH+vNDBrCTs4XeJ
 FLfjEIBMugAAs2nbrKjQPDk=
X-Google-Smtp-Source: ABdhPJzTmzxoKPVynOsAyRx9LmPvMS01GVkn19ko3AbczzbJ4spuWs0M7v+U/ylGgyb5jW4HllwRsg==
X-Received: by 2002:a19:c8a:: with SMTP id 132mr38716938lfm.23.1594276817989; 
 Wed, 08 Jul 2020 23:40:17 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id o5sm740932lfg.27.2020.07.08.23.40.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jul 2020 23:40:17 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [V2 PATCH] usb: mtu3: fix NULL pointer dereference
In-Reply-To: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
Date: Thu, 09 Jul 2020 09:40:13 +0300
Message-ID: <87lfjt6vjm.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_024021_199847_169431D8 
X-CRM114-Status: UNSURE (   6.23  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4141400441718117106=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4141400441718117106==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Some pointers are dereferenced before successful checks.
>
> Reported-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

do you need a Fixes tag here? Perhaps a Cc stable too?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8Gu80ACgkQzL64meEa
mQZPNw//XvJFpYfPEnu2HUlYe9cJSn/Gy4Xt86/O/W3mVrhmHgoYtcI4Z7mETVde
ipA995WGFkSgitYtsU18p5WgZLk1dQu+OvjxGwosumMJ9psLDjDtGFW5Q3dS3U14
OS5Moh7kxC0S5O93QwZu4PLSzIg5ise0L832MQGr5RRpw6xvcn+B75np763QbHtu
XwQzreKxXi+XBK4dkP6T7C+4zyRi8Rgq7h0TdDme/TSX9C/OJyBOoEbP5OzdFUr/
EDt7ej684t2pzUZV3lV7eUQeISPZx1KH4N3gdKLIsMzWC4zn4VCg8fK2DF9SMd6z
NyDvFR44XTg3hz54ATKCu2CwIthC5C/DORPGFllxIhiM6FLZwv6phYYb3VaJ5nC4
YysgboUCNnOO9Ih2O4xrVVkXrfOhcaZZFq9xY7mB8AHtDFjuC5kfl6coh/U3jrHH
1ctordpih8XhvSFmkXpvBKVoG4KRi53bDvwWsJk3rBRXnlPX4qrvIdkaiVOvMXh4
Gk7huQiAOcl4ddbho3mkql4SRrW7B93swFwy1SQDGpb4iZi4zLk/0Jn5HKGniRS9
wK1+k9hNc2PB+Ts7mwMh5UeAt3zBxnWWBp/UAd3k36wF5jmHG9wUTshR/2IyFUOX
pLIN0bMZ71sRhFznAegSEAuKQS36qdkRVSeTkuV1aFlhI329t6M=
=LsGT
-----END PGP SIGNATURE-----
--=-=-=--


--===============4141400441718117106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4141400441718117106==--

