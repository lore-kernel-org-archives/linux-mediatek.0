Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4675EC433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 12:29:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E507B61582
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 12:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E507B61582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c7AO8Enc+KIqbPVWNDr+3UvUGGchxXJk4CQlicvB/q8=; b=XW1N9PxYJwgqUUX2HX1JpFLD7
	Av7EBV/4dJFzH0VSxfU33zsKEha1nCvfNbQAR3+uWqF6980TacMCNRK5UQE0q3eqnCFJPpOu7Sxsz
	VYcYX5vXMUC94MkDh73nMfE7IYFr+3taaIzznpJ5qbxzJZyPVYyCJeHa+RSFUe9niRlpt9YX8v9nS
	4LA5cvzj99d0b4noAzLWaQ9WxtBH6djZSkAdgfhvg8au7cUvr1PUrnaswVxOyaRvim2p5bxxhakLW
	5Oc1ZTPren6PrSZKDBideJP1XIOa3UMAYwho94DuAuhOi6uj5AQ0X8nNNZBLR/ZHv03dDcL8fqsrM
	WiurZo5Bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPP7I-001Nq6-B1; Thu, 25 Mar 2021 12:29:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPP71-001Nln-8R; Thu, 25 Mar 2021 12:29:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CFA261582;
 Thu, 25 Mar 2021 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616675350;
 bh=nft8tr30HZq9nXI1FChxCciEQBQ02Qli6EbN444l7bk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z326JnL1YBI2HTBx9TcJMmhTcleJZWah6y1tlzRvaaEL87deuLUAZBNOzYxpBL1UV
 4ndKQrMmhZDdvfuA4wm/Bl6+cgJgtdMH9gETuaEZt9pek1K1lFOK7l63C7gxWWp6nS
 CJ+DBU5/R/AXbsqsTJRloj6ciZ6EWzAVJoB8ryLvxICqMoMOZ5Yo7YeGZ0WCv5MA4Y
 IExDdODilMdS8+4+qq/qM6Uxi/UgEHazrBP7kZCRFj/JqS7xNFrqd3DxjUdIyINAdQ
 WacbFlTY23RNXtgly9tZ0MgXz0kZ+Hv8uDh3OSHGAjK9So1foW56VGDG1z3QDlp7oh
 0WRyiSn88zNbw==
From: Felipe Balbi <balbi@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Jian Dong
 <dj0227@163.com>, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: Re: [PATCH] regulator: Use IRQF_ONESHOT
In-Reply-To: <9428d264-aafa-793f-8c6c-86c55213f5f9@canonical.com>
References: <1616501538-120724-1-git-send-email-dj0227@163.com>
 <9428d264-aafa-793f-8c6c-86c55213f5f9@canonical.com>
Date: Thu, 25 Mar 2021 14:29:02 +0200
Message-ID: <87v99fju29.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_122920_469724_E3041DD9 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Type: multipart/mixed; boundary="===============6763031701212055362=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6763031701212055362==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:
> On 23/03/2021 13:12, Jian Dong wrote:
>> From: Jian Dong <dongjian@yulong.com>
>>=20
>> Fixes coccicheck error:
>>=20
>> drivers/regulator/mt6360-regulator.c:388:8-33: ERROR:
>> drivers/regulator/pca9450-regulator.c:781:7-32: ERROR:
>> drivers/regulator/slg51000-regulator.c:480:8-33: ERROR:
>> drivers/regulator/qcom-labibb-regulator.c:364:8-33: ERROR:
>> Threaded IRQ with no primary handler requested without IRQF_ONESHOT
>>=20
>> Signed-off-by: Jian Dong <dongjian@yulong.com>
>> ---
>>  drivers/regulator/mt6360-regulator.c      | 4 ++--
>>  drivers/regulator/pca9450-regulator.c     | 2 +-
>>  drivers/regulator/qcom-labibb-regulator.c | 3 ++-
>>  drivers/regulator/slg51000-regulator.c    | 4 ++--
>>  4 files changed, 7 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt=
6360-regulator.c
>> index 15308ee..947350d 100644
>> --- a/drivers/regulator/mt6360-regulator.c
>> +++ b/drivers/regulator/mt6360-regulator.c
>> @@ -385,8 +385,8 @@ static int mt6360_regulator_irq_register(struct plat=
form_device *pdev,
>>  			return irq;
>>  		}
>>=20=20
>> -		ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->ha=
ndler, 0,
>> -						irq_desc->name, rdev);
>> +		ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->ha=
ndler,
>> +					IRQF_ONESHOT, irq_desc->name, rdev);
>
> This does not look like trivial rename/replace fix. This should be
> tested but it looks that you just did what coccinelle asked for, without
> testing.

Right, but it must be done. If things work today, they work out of sheer
luck. Also, which evidence is there that $subject wasn't tested?

>> diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/p=
ca9450-regulator.c
>> index 2f7ee21..d4bc1c3 100644
>> --- a/drivers/regulator/pca9450-regulator.c
>> +++ b/drivers/regulator/pca9450-regulator.c
>> @@ -780,7 +780,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c,
>>=20=20
>>  	ret =3D devm_request_threaded_irq(pca9450->dev, pca9450->irq, NULL,
>>  					pca9450_irq_handler,
>> -					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
>> +					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>
> How this is related to the missing IRQF_ONESHOT?

agreed.

>> diff --git a/drivers/regulator/slg51000-regulator.c b/drivers/regulator/=
slg51000-regulator.c
>> index 75a941f..3f310ab 100644
>> --- a/drivers/regulator/slg51000-regulator.c
>> +++ b/drivers/regulator/slg51000-regulator.c
>> @@ -479,8 +479,8 @@ static int slg51000_i2c_probe(struct i2c_client *cli=
ent)
>>  	if (chip->chip_irq) {
>>  		ret =3D devm_request_threaded_irq(dev, chip->chip_irq, NULL,
>>  						slg51000_irq_handler,
>> -						(IRQF_TRIGGER_HIGH |
>> -						IRQF_ONESHOT),
>> +						IRQF_TRIGGER_HIGH |
>> +						IRQF_ONESHOT,
>>  						"slg51000-irq", chip);
>
> How this is related to the missing IRQF_ONESHOT?

agreed.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmBcgg4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY8kA/9HGCbG0EumvL8wuCCIOFu4yF1PMxrdGGR
lW+2nNwf5fvukqzU8/5t4XC1DQnwxoLntrnB6oXcTc8eBSuqrAX93dlhZmSoBUs4
g4OE27VGJx0+18pN3JR8eQDjFp/Y84zjPlEiJQ7UjB6SJLAdbzUp4q6w1gvT68fd
FXWdangAhoV+lSF6idIdZ+4nHLPxu81fKmBJC5hs2XNDydXC8pVq1XrZSc9WbACA
lcRQ04GJeWk0n/X5zTjabLspc+f5GgtHes1Kmk4p8TfH4pTbrX7J9bvigaCb2ODU
kE2N+Vqe/owbeLGmEwnS8LYdPSAZzAiMUeb1eRD74/cgYgp+0CSFxiZSG1m3zckC
hjmTxT79eqTD5nq+n7b7W/lPJVxZ9e/BKqbvoUpmxpnFVj0yZYCSouAUbUK9pHos
hl3wG+ZbEZtHTwE/F0bfpTbnbp6V8SyyGx1jMATUDzPt+LcjLyDc8Ac8BYfcRdEw
hXgTf2IAgxc8FICC3lkWZk19yGefs0g+LHkMII5tFEoMtCBGCiYEQt8/r6/MBK5u
eaEJ3yXfuUCcDZfBAYQXmUwyUT3GYaTr71OsJeDX2rGP9HufFmip71cvAbZ7jZ9S
czu7YN+oy071bO878qT72bjcYBYXELnBXs5GHyeNZFy0gcAxDV8PFMG1nuSiAMoa
SallkfPoA0I=
=R8GZ
-----END PGP SIGNATURE-----
--=-=-=--


--===============6763031701212055362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6763031701212055362==--

