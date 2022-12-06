Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4EDC47090
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 09:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJxvDNqME4HLwK63BjlApI5V0fLbyU7e3Q8DCpk+uiM=; b=wpQf7YMIdzpf86wzSlbUVKx6KL
	Yh7d/b8pSE25tmSwQnH61A9OssUsKx05/zbYyH0UfiwVYZ58qDwJ1Rm0CeMFKLAo/FM3UiN4Xh/2g
	Bb5O/8fRlK285uV1HN1gv9IxF7H6GBmjwsxVKQDWgF+D/gegqT458qA1xDmvv4ApLpP4oEbGtBe9b
	MBPJOZ+Bkt041SABzwlqTFUFXfNNUW/gI9CrZHlzwYTLM9iTFkTtbrUGxErjSoAcIQqD+6CT2eiVo
	APcaYro6vuUPkpE0eyeB5MpiTWPiMjDYRF5iRGxrT+WvtBwuSDYAL+d4kEotH5yXrkUf0yojIT0eh
	luGN7msQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2U5p-005jno-GV; Tue, 06 Dec 2022 09:18:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2U5k-005jgD-N0
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 09:18:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h7so16537572wrs.6
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Dec 2022 01:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJxvDNqME4HLwK63BjlApI5V0fLbyU7e3Q8DCpk+uiM=;
        b=BvNpx6HDdPQJvNI4yCVRmuRrbf5yvuqcfmbWZKryhwaZFrgJe90Ke/Bnjo3Fw8rKHy
         /6axj0Sq5Pp5jO+uFE9/2Olf3pvD6qJsR4L1Q0pq3aDzbqVU/ZSG0UMccgCkpafbY3ql
         t9DB3z/2E+jvJjw5YtzVX5W3YbCm1e4phUvHWB7cypPZE/V8Y/ifGNKKnrQfG6oVyvma
         uVJyPSxxJbNodRqzOjOADVxRL0EsCfDYQPQ9zOb0WHdI1m6kHIoE8yS0oXRqJ7Kbh0v9
         w6WYZ5DrlMDP5gkQbIcSBafS449uoEsUTPhxcojg8qv0gU1JsPju2R4gFjt3z62lMoti
         FjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJxvDNqME4HLwK63BjlApI5V0fLbyU7e3Q8DCpk+uiM=;
        b=3WBydAMlWyoIEJ9fVhzNp3ujAWTWD+m27YjUf28uODuZCka+tXiJToRdN/yBIzYp7n
         yXGPpwz3vuZY1WWUWOpkfliNiPPdQ1HKWgLPVveApU+l2gJeBHQ02HSpQuaNWDKtPP63
         qLWYLQkEE/RcotQOaf+TLg2v+9ppWCzkNgTlB/JD5kJ/3WvmVCNXrw/R4NZLdHSWpVVM
         lgJkNMw3afWdvCUkekLnY0EXW2aTpQC6cOwerYtWIbV1lffXHysBCAcJ+pCSUyp6pKyk
         WLyUgAotBUCU7knpShnT6RdRYf6K1QMx++JEDOIlzQN2H3WdftQvbjmD6dZYqgyD0UNk
         Wb0g==
X-Gm-Message-State: ANoB5plajeWA6y4jDE6akG/WaREJAzUeFV9sYKfEtDagCu6MD5a+RHn1
	IoHKE6ivhv9Gef9qzVSBeFOXRw==
X-Google-Smtp-Source: AA0mqf6yWGh+e4aZfAaxY0tHaOpsltaO7R75d6T1kKnnCJImPIMbnTryfLjeLSs3ohJCPJAyXxEtvw==
X-Received: by 2002:a5d:4284:0:b0:242:135a:7db3 with SMTP id k4-20020a5d4284000000b00242135a7db3mr24883946wrq.689.1670318296965;
        Tue, 06 Dec 2022 01:18:16 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q14-20020adfdfce000000b00241cbb7f15csm16478235wrn.106.2022.12.06.01.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 01:18:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Dec 2022 10:18:14 +0100
Message-Id: <COUMF3IZ9Y63.LA3KFHJSUZIC@amjad-ThinkPad-T490>
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
To: "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Amit Kucheria" <amitk@kernel.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>
Cc: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Fabien Parent" <fparent@baylibre.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 <linux-pm@vger.kernel.org>, "Rob Herring" <robh@kernel.org>, "Michael Kao"
 <michael.kao@mediatek.com>, <linux-kernel@vger.kernel.org>, "Hsin-Yi Wang"
 <hsinyi@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
X-Mailer: aerc 0.13.0-78-g9db3710dd73b
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com> <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com> <4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org> <COTTJX635TNF.1WL2TEZN7VW9O@amjad-ThinkPad-T490> <adfe41f7-00e5-876b-7803-3127919fba13@linaro.org>
In-Reply-To: <adfe41f7-00e5-876b-7803-3127919fba13@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_011820_777061_C2F8B0B0 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Daniel,
On Mon Dec 5, 2022 at 8:39 PM CET, Daniel Lezcano wrote:
>
> Hi Amjad,
>
>
> On 05/12/2022 11:41, Amjad Ouled-Ameur wrote:
>
> [ ... ]
>
> >>> @@ -1161,11 +1197,24 @@ static int mtk_thermal_probe(struct platform_=
device *pdev)
> >>>   =20
> >>>    	platform_set_drvdata(pdev, mt);
> >>>   =20
> >>> -	tzdev =3D devm_thermal_of_zone_register(&pdev->dev, 0, mt,
> >>> -					      &mtk_thermal_ops);
> >>> -	if (IS_ERR(tzdev)) {
> >>> -		ret =3D PTR_ERR(tzdev);
> >>> -		goto err_disable_clk_peri_therm;
> >>> +	for (i =3D 0; i < mt->conf->num_sensors + 1; i++) {
> >>> +		tz =3D devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> >>> +		if (!tz)
> >>> +			return -ENOMEM;
> >>> +
> >>> +		tz->mt =3D mt;
> >>> +		tz->id =3D i;
> >>> +
> >>> +		tzdev =3D devm_thermal_of_zone_register(&pdev->dev, i, tz, (i =3D=
=3D 0) ?
> >>> +							     &mtk_thermal_ops :
> >>> +							     &mtk_thermal_sensor_ops);
> >>
> >> Here you use again the aggregation
> > I addressed this concern in V6, could you please take a look and let me
> > know what you think [0].
> >=20
> > [0]: https://lore.kernel.org/all/5eb0cdc2-e9f9-dd42-bf80-b7dcd8bcc196@b=
aylibre.com/
>
> May I misunderstanding but AFAICS, this patch is setting the=20
> mtk_thermal_ops if the sensor id is zero. The get_temp is computing the=
=20
> max temperature in this ops which is what we don't want to do.

Correct, but I think that is out of scope of this patchset, as the current
driver already uses mtk_thermal_ops for sensor 0. The focus of this patchse=
t
is to add support for the other sensors.

Besides, what do you suggest as a clean implementation if the current one
no longer meets thermal core requirements ?

Regards,
Amjad
>
>
> --=20
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog


