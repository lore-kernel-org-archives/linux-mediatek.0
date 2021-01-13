Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CFEC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:41:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC48123340
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 08:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC48123340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4LHa4vlMP8mVksfrrDloIjHuITPyB/P4xxBK4wTMqWI=; b=dSrGqnY0FXxQ2rFo3OkMeMV8U
	krX9dqYfTx2ea4FnP6fiER+iDKTGZ+HMPurPwdUnlZmlQ2MeOEg+O6cfTwCIVAJHZI1Bu47dhyNMx
	bU+QDuu+WA4cXWeq0+DL7VyckcuXneOKbWR/b0ocgbsgcNy7+HuqKnYzAqxemgn8soZf+2lwUwBVJ
	Fwy0Vi6nNv07qwyJNPizUINIZIWW2HHDp1L11DNL+BKDEhjYrFyOl4aJvmgpyvjnZWnYVgaLdjAZn
	KUqAOTt2DJNxsJoKxsaqL2avGu1LeYLNVMao0MRy6JcWjgyw1eiLU+SPie4RZCpB2FTrXaWafIoEW
	IxsNhltrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbiB-0003E0-9l; Wed, 13 Jan 2021 08:41:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbi7-0003Cw-Jq; Wed, 13 Jan 2021 08:41:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A37C920719;
 Wed, 13 Jan 2021 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610527257;
 bh=dTsZF39Nf+fdYEmRGhq+1JcvfbZkxUZaN7AXNb0cDq8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BUMPVgEIMWDBzxMgixEtxCeyXcF8mm07/unBODK4XWYvCjkwC+6sLX7eyVMqubxtu
 YIz+gT+mTIIFvHBCpW64FyoHvm74b5k5UTh8igGAASfXRGQB4GfKFOMG/fSoecZ+zc
 HIObSvnuv4n+juU+2JeiYkiRqeXLPz5K5etgBi1ONq/2G0PHJoDlT28u0U6k0xdTQq
 BJbfupr6BfIhwmXsep5T3XhLuPxQcOUPtm7T3/4k4fYOQPXXACgjaRu+E5ePsMSja+
 ZFr6lAG3W/nR7n5iwuE+dOVGPhMqJrGLKjIHFu86Wb0vo0wOvKdw8yW+HE9NBSOG6z
 /0zhW1/GJtxSQ==
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v4 01/11] usb: gadget: bdc: fix improper SPDX
 comment style for header file
In-Reply-To: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
Date: Wed, 13 Jan 2021 10:40:48 +0200
Message-ID: <87pn2944bz.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_034059_766045_C831EDCF 
X-CRM114-Status: UNSURE (   7.27  )
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
Content-Type: multipart/mixed; boundary="===============2967802985846484918=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============2967802985846484918==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used).
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+shARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQavuBAAg30ZpKD5auMw0mLPTT1xg4DL63rJ4KVr
CW8ln8OQVGoj6mXYlJmALMw0UPGGYMT5RPzL7Cnu8NTl5Ft8UH9rAjmO1kTM1fN/
RxZXmbuei4n08W0BvkLCIaPk8aBjYHCh853ckseV1yPk1v2ihRga9FVKa67ZbNBd
OyuYlxjflMdZ1ZAcB1Sda1FQI7sIw2VPxti6NAC/g0jYME6GrQQGyEdo2T7PnKup
tEl9d2geaIGbgC87du+S9ojB/lqhFoasecZj/p62OF7UMYohyEfwr9H4GSSko6kg
pWf5DHf8PSFTiH/vWzCiNRIVRSZ3VRbXDp6osacPPEZ2vUAhScI17MZw0r1zFDrS
xWZn8y1Kzkty5UKOt9S1p/cfsluub+wUIE4pYtik47Swb4iPbpusDKfAMN75QQ/K
4uiILFoALlZqavJsBpXF0bhct91iG/JvoSiqUpy6TsXHnwTcHy7uTSgh9o6rE5FE
cQvVARSkGS8GEiDH2mnOutrcCdKKwee2/yk5uYRW/2SsMC5/Wd6mxxzX62Vjx2UM
l76HxnweYziy1OvT4sDgz3aHd6B0Wk7jyx5gBWVACmwC+QjvP9Woww5wqGlV4iXI
cARf1BgOXH1v0Hk0bzLjasE9GYpolu8fqlKMQtKYGG7IKM9XUDUk0OUbC0HaGAfV
rToxNkIfQNA=
=QIEo
-----END PGP SIGNATURE-----
--=-=-=--


--===============2967802985846484918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2967802985846484918==--

