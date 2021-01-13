Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93B1C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:42:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F1923356
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F1923356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aq3h6uxxXJFvKtq3CjxzX6Caw93u/dBuA2xy2nn/8Xg=; b=ZQqrZy7u01GdlEqEDi1zShqEl
	Uu9GkoQ4M+oJ3d5ZUWGA/dyYl6n5ZxuyhreNOq6DfsAWSgepwrrAJt9Cob3H/SV+zC6vDQKe/husF
	zIgliZECRShm+EoHfaTZj9mWZQVW4/CXJFe1wa9vpxinfmct1svtEkZn5q92wUmwcQvc9bSYj7CE1
	8R2GYS6kJtC6Zx7JI0GAI8Gvis7borh2Kzj7Udi0aNY/l/mHU4r9X+qv7LxiW9OoVSuFz4bvbbWoE
	W9aua20IA4u5s0NRTdJTXRGO3IfbDkse7qWHoCZ7gk5j7RxynLIAAwmPZyxyM4KGRho3tsjEW6k3p
	75SkHMfpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbiw-0003MR-0R; Wed, 13 Jan 2021 08:41:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbiq-0003L6-OY; Wed, 13 Jan 2021 08:41:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9B6320719;
 Wed, 13 Jan 2021 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527303;
 bh=UBeEHhwjMpwzR8qlGgYmu/wtrE8922DVkLRWwf8BFBs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=q0F7p1MGDgVvK6VWJZdT4LYYAyH6r3/82yBp1wXxsedktWDP7ZMQo6UqW68Smu1AV
 PRDsrtxja1L+Vb/aZq8pm72UUPA6A2F7jOeuP6N9l/2G9BTq4EZ4BpkLEp7g8hY8TQ
 3P2m8zS2YXJh5BGOLZGTehICK+22Y0gRlKILZ7VgNk27t+AV01FXcg11HvBweKWoxj
 uvtG3UVxuIGnSXAnmt6OZvaSlIjjWgShbjxf51A+g+W0lIAuU3D07we7I83lI7avSv
 unW+OnDkSNUEGcjxClk6L/Y1ZJ4cSG+OVIkNwkblslWiukkFnj9HbbiCc4TML8wzXG
 ymg/oo/oNnVdw==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 02/11] usb: gadget: bdc: remove
 bdc_ep_set_halt() declaration
In-Reply-To: <1610505748-30616-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1610505748-30616-2-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:41:35 +0200
Message-ID: <87mtxd44ao.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034144_896152_16EE54CC 
X-CRM114-Status: UNSURE (   6.14  )
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
Content-Type: multipart/mixed; boundary="===============5544842809578992888=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5544842809578992888==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> No definition for bdc_ep_set_halt(), so remove it.
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+sj8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYMchAAjJXRHz+hDcN8OKrC5mKHu4MzFsCCvMC5
Hm2JbtVgh3iQyGjTQvxJh+AW9vTxeBv1UNhhSmjZHkvhk/L5pmf5ZNbout9qOa8C
Dh283lheX1/qi8AwwUE12k27KkBeXSKHO6hS/ycsnYWJsMEd55bhN0U3KpKmCPPr
UL8hRWcPNZL+O9auzcfHJjJxIqf4Hmgx3X8/7K+i+Qu8wkylQQ8bK83yxixHlrRH
bqhZf51X7qvigqCfhriIoMaobK7+/VTHfDXkeO2dbVsVbz7/vCLudvGB3nnq9Ubu
4t5f6pt+dnebBIsWpqsvGpZeJcMWPYQ3RTbzLDjfWkRtDKi66eQQWR5nc1P05in3
CCx2t/t3cpqOx4T65mfQF6M2NMr5mifKCARfITLC+mpyaN+oovVtwIdTZwOj2pqG
2oOAGqt4bXJwY//WAfsz6JaYOs6SiW7/BaH0x5HRP0AMZRowd9ajMbs9pPCih+o1
k/xIGWacB5msXnxrJJC5CSOOEWfGhlD9YFkzkRpPmW33BylgLQesitiUNuQf9QxY
4mq8+yGTXSBBon3kvF5cNjEDeQ7BtWNIWIjQR9f7Iul+GD0PEl0deUmA4QU0oWhy
o0pOhbT1LtPFEkjCgkbWPk1FUyq0RxKU/gUFFGIo9zPHgFOmPZKQZpUy3kuuwIwy
VPfL0dfWLsI=
=+7SS
-----END PGP SIGNATURE-----
--=-=-=--


--===============5544842809578992888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5544842809578992888==--

