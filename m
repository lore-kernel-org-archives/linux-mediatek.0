Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4341EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sAsGYX3J2Ywp9AFoeC19lv0Q2JC+XewfioV1XazBfU=; b=QVsB4PGhoLxjefx59miI4fmu8n
	qOLljNSmKRSz60encqo3q9rIzirCJe9p1e2Ed9AhLnJy6QQZzB2HmOc9Kpb/fVT6et7XX9O9jZlMm
	VAxefwbpFnF2VFET77DVI6SLFWN0ctAM8MC05cpv8X8HKxYasZJGOumkCHQAIyrA4OiVc8ITy4Kak
	Bh8lhjzVkaGNaE2xB9UBCQBMJyEgJ7ShDJJdaylIS8RMTs/4HUD+4vbe5YC4iBa7JlChdbO4uCml1
	pSYDmfHBwZB8z8MOZYBb66syDJ09tVZOiMvHXRIz7Me034vNCbbXjYCSz/W9BepMCu9N6+V8U4/Dr
	yHsw2IYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidbr-008Xdt-GG; Wed, 12 Oct 2022 15:25:27 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidbd-008XaX-Dn; Wed, 12 Oct 2022 15:25:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so2379485pjb.2;
        Wed, 12 Oct 2022 08:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6sAsGYX3J2Ywp9AFoeC19lv0Q2JC+XewfioV1XazBfU=;
        b=jgi1xr+4QST0cSoTuy8B71zEhLRujUBFMmA2BVNnhFBYOrwMJYkfeGc+6ZKyPK+TNP
         nrUdJF6SJsfr5h6R7MiA4nbWoy0HzA9PCrTVyvV9y+QArbRRkVxsINbjyDLNKtN9JJB0
         ewlXtu5d0yyASUjtnHtEOgR/zp17y8ysYLSwtChvEvoTi9+l1S1VAxlKIXQH1zA3yGGq
         8+6gTLZEpp6stncaM5fPBF7g0yEogepFARSQPunLTD0jEH7U81tP69d6lGXWS2vnK69m
         fNVz3iUv9qxziIiHeCIZpId3kwaWXT9HoUuqLQqejdX9/ribfs9Zjro6fFOgAE7oOkIh
         /Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sAsGYX3J2Ywp9AFoeC19lv0Q2JC+XewfioV1XazBfU=;
        b=xYTT0TjSt7P7Tv7W/d/DwMNd3R9eBK1b+4hI2GFejvSW8lNwQJusKPPypFkRbSc/YI
         Ijbx3g4MsG6dHjHfg7colOUrlutk3wG1kNuS1Ge2Yh4NxSW4heF0tloUj2EuIiS/e0S7
         CHXrpt3X5331vBCVIYGWuOPKYsaIAhzWiqrCO7nJz58NnT6U7UD+J0EFrBTU5mHh4ZR9
         4AHMfUkBVajjZ+Y37llG2n3lXt0WJ6sqx2XJX2V5lVo5/SfU3bzD7tQx0xUbfyT7HFN6
         HbNxbFJUopLCBoYIJTLeZzcUPCvIbrWLKaAFeydDpiFMnzgZXmbRw+Klv6YVonM/Cgt+
         3/zw==
X-Gm-Message-State: ACrzQf0YGTzSJjH+mz1RDMHwVbCG4ySsyZAR3MB1DbuC874fgzg++EVF
	2256DKEr3Qv5peYsFwZXpMg=
X-Google-Smtp-Source: AMsMyM5q5hLAeKBSRDeDIPS3wFojXBXzDAqLX57Ia7Z5Bbj+fAAsK05mNKIES79/ba29CBEIihr7/A==
X-Received: by 2002:a17:902:d589:b0:181:d0e4:3306 with SMTP id k9-20020a170902d58900b00181d0e43306mr19405557plh.28.1665588310827;
        Wed, 12 Oct 2022 08:25:10 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb90:370a:3fc:ad3:2951:4f00:9866])
        by smtp.gmail.com with ESMTPSA id u186-20020a6260c3000000b00561c6a4c1b0sm11536115pfb.176.2022.10.12.08.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 08:25:09 -0700 (PDT)
Date: Wed, 12 Oct 2022 08:25:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_7/7=5D_gpiolib=3A_of=3A_add_quirk_for?= =?US-ASCII?Q?_phy_reset_polarity_for_Freescale_Ethernet?=
User-Agent: K-9 Mail for Android
In-Reply-To: <12081856.O9o76ZdvQC@steina-w>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com> <20221011-gpiolib-quirks-v1-7-e01d9d3e7b29@gmail.com> <12081856.O9o76ZdvQC@steina-w>
Message-ID: <9266C00F-0F8F-4DE2-B4DD-08B2D7B1EE4E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_082513_497646_8B6013C7 
X-CRM114-Status: GOOD (  13.70  )
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

On October 11, 2022 11:14:46 PM PDT, Alexander Stein <alexander=2Estein@ew=
=2Etq-group=2Ecom> wrote:
>Am Mittwoch, 12=2E Oktober 2022, 00:19:35 CEST schrieb Dmitry Torokhov:
>> Bindings for Freescale Fast Ethernet Controller use a separate
>> property "phy-reset-active-high" to specify polarity of its phy
>> gpio line=2E To allow converting the driver to gpiod API we need
>> to add this quirk to gpiolib=2E
>>=20
>> Signed-off-by: Dmitry Torokhov <dmitry=2Etorokhov@gmail=2Ecom>
>> ---
>>  drivers/gpio/gpiolib-of=2Ec | 27 +++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>=20
>> diff --git a/drivers/gpio/gpiolib-of=2Ec b/drivers/gpio/gpiolib-of=2Ec
>> index 3200d705fbe3=2E=2Ec3d3fe4d927c 100644
>> --- a/drivers/gpio/gpiolib-of=2Ec
>> +++ b/drivers/gpio/gpiolib-of=2Ec
>> @@ -231,6 +231,33 @@ static void of_gpio_flags_quirks(const struct
>> device_node *np, !strcmp(propname, "snps,reset-gpio") &&
>>  	    of_property_read_bool(np, "snps,reset-active-low"))
>>  		*flags |=3D OF_GPIO_ACTIVE_LOW;
>> +
>> +	/*
>> +	 * Freescale Fast Ethernet Controller uses a separate property to
>> +	 * describe polarity of the phy reset line=2E
>> +	 */
>> +	if (IS_ENABLED(CONFIG_FEC)) {
>> +		static const char * const fec_devices[] =3D {
>> +			"fsl,imx25-fec",
>> +			"fsl,imx27-fec",
>> +			"fsl,imx28-fec",
>> +			"fsl,imx6q-fec",
>> +			"fsl,mvf600-fec",
>> +			"fsl,imx6sx-fec",
>> +			"fsl,imx6ul-fec",
>
>> +			"fsl,imx6mq-fec",
>> +			"fsl,imx6qm-fec",
>
>These two should be 'fsl,imx8mq-fec' & 'fsl,imx8qm-fec' (imx8 instead of=
=20
>imx6)=2E

Thank you for noticing this=2E I'll fix it up in the next version=2E

Thanks=2E

--=20
Dmitry

