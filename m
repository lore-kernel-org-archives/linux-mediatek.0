Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF01C48292
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJab5g8/Evv7HpDvMbyG1Wq09IDiW3cHdgtMVJpvi9s=; b=gzp4frRz9WKU+Byf3Q+Zo67lOI
	6YdPvj/mVK0TYWY6ps0R+SgPA/y0SXviq3+wuWkg9ZO/pWd8C8Nu/5weehia5ZW84QBsAzOgopQPv
	Z/Gt2V+PHdp8Ncn3fOE28kvyGlBNea74F+M10fbo4GXcuX6nxkDgL1bGxOiK5i+i4ug27RN1+FPoW
	Bg4Nvriin3JI128TtjPShO7P0UmdjA3bQafgphFSt2YreY539B87zAyEx7uT+XqjkpfKyDe9AVbxt
	d5DspQYDbtyXdGajOC+xfceH78aJJZLch9uVjpq6uMgAmm24NdfZxa0SUWWt5sbnfTmDN2Nlt8KkE
	auPDqyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2m3-000000049bB-1DHw;
	Mon, 05 Feb 2024 17:28:51 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2lz-000000049Zu-3238;
	Mon, 05 Feb 2024 17:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1707154114; x=1707758914; i=markus.elfring@web.de;
	bh=GnkX8qqYvyQMd2mJCkO1YmK0GeiquaSlbUasLbvc4nA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=PNUfyyDluiMQQZVE+qA9Hqx95hEFp//dcIyvG0wGtxmV3LvCwYKU2R+pdTBGShU8
	 RDqfUCVUHjupWNUOl/OpLlssMf0lwO8U06H8xiAUOqN9OANoBs78cM+SqpeK2Y9e3
	 fU5o75MsbYxnX0T7DGi2VBtPjhg7VFkUnPoFIfF/S8x9X/Bv7W38SxvTmoN3KSA6P
	 7xbf0eL4JajawtohwX13xiE/QGAMTJiZvofEyTsRCiNXrXIj5gkI8pOGTMofb7xaz
	 l3vmgIZuIaIT947FW9E/bzR0fkRRGxedFeZTTYSvacRgXpwvW1kXMVNHNO/diu2oy
	 /KjvN9HlOUDVO5sdZg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mgzeb-1r5O3z1pBl-00h3rE; Mon, 05
 Feb 2024 18:28:34 +0100
Message-ID: <8f011126-c95a-4c71-8bc9-a6b0a5823c96@web.de>
Date: Mon, 5 Feb 2024 18:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: Use
 devm_platform_get_and_ioremap_resource() in init_scp()
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de>
 <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JR4A/TH7VX+6fxHtk4rBvyvu9uUzxS01ZNx7ukYZ+MXC2RD7iz7
 c42oLIJFBks9maC2WA3glXfX3Svisu5ANYahLTso2aXW7mLjmwcYCJMJjCjzHEzeZJt6o6G
 zZj/nCidCVTYzvfmzykuHQbQLNO2dHYvbi2EPNp/VRZXpNiUP9D11s7VHKEIr0iWPurbLvr
 +QqHuwTptTwqS+UVH7r8g==
UI-OutboundReport: notjunk:1;M01:P0:U2xZDLOeXpg=;fiB8cvep5CQVXtqba7Q5BfUhD2n
 Kn0QoQ0j4AV5Wcko1+RW7eX0D5E53NTnVgm1TD1FESs3mxO+h7kMG8Y/6TVaciCY3d+2ZoQX9
 spEGXByyM8BA1MKx81+VFpWCpyYpksKtipQwFuiFLyZdKbVwzRURG2ODI+h9u09BBot418fzC
 msjvLu0mB7fA2Pr/iJCCfnPT8Bvks2t7O+UOWj2maJvMCfVfWGfNLr4HTwvjyfEk/3KUCMH2s
 HIiE3IYrsKJU/XzhztMSg8zbbSJPrgjmTP1X8hW/wi5HAOMrUHp5cUv/g8xa65Y6BgmxBxtmj
 1nfirQExAMlakx9sUxINFMfg6Icm2IWCVVVt/yhfF5mwYXXarp59XHYQmK3M8t/6MYdTgysad
 hs68CuYMQIgUxoD+el9yj3VGcor41CP7jAQlY7jVNka5RwPk8dpAgMxOZVIjBvae3T8mR4uVO
 kZ57mNYhOLzCPnU0zXOMO5OXA77saYa4t8EroUBgxEJl0YBJ1NYM2uqE9EqP7i0EmLVT09SRj
 GNPB/ky2OT/3p9+etLKJY+Q9X/udwNIsGpo4WZIQNfQ9UakV8+AlN8bcnjNPYkfGhEFlBNoN9
 D2mhuOldIaU8EqVqWlZA3F0uziKFPHjJV/nIn6tp8uDVl3ZqvH2aoJi1dUR6PafLGuzFh9te1
 vz2vrjGn9c55cDJqiLT3UvaQl4jZ4WS74bliP7p3JJsbbHCgtxLnBD7MG6l0pUYG3E95B5n3E
 +3ohmiFxOuab3yKNOdfgc4gCjfZrdr4wKgSp5FL4pMWcmk7MajTatjPSoU9x8uBXMf6hilusd
 /a5JN9G96FsHN9OybCn6V1gSCb1bLOauvZiKYv6N1U2a8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092848_141670_FB2F2984 
X-CRM114-Status: UNSURE (   8.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
>> @@ -441,8 +441,7 @@ static struct scp *init_scp(struct platform_device =
*pdev,
>>
>>         scp->dev =3D &pdev->dev;
>>
>> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -       scp->base =3D devm_ioremap_resource(&pdev->dev, res);
>> +       scp->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &=
res);
>
> Given res is further unused, please use devm_platform_ioremap_resource()
> instead, and remove the local variable res.

I got another idea after looking at the implementation of the function
=E2=80=9Cdevm_platform_get_and_ioremap_resource=E2=80=9D once more.
https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/base/platform.c#L=
87

It seems that it is supported to pass a null pointer for the last paramete=
r
(while this possibility is not mentioned in the interface description so f=
ar).
How do you think about to benefit from such a design option any more
(instead of the determination of a corresponding platform device)?

Regards,
Markus

