Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9BDC77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIW2spNKQHoaWo5bzZyygaUnAYHQ1S8BPzr5pgx85f4=; b=GrrdDRuF0VpO8ZUnDF7w3o2Np8
	f0BrDDiZ3r14Rxb5RUlUJDszqcg2NvNe2XRuWgg5TphHYug4OAd4has9PC1VGL2djVlns2IHfJvc8
	/5K9UuolVdHBDx5UgwqPw984hiwdasjnqL8g51b3WXQCAIM8hYgxCfH6ei4kxlAFytyaTl76MNFMo
	je6T1XuCe4XxRrzBERaEq5bqEF0eOImco3UfNXUbPS7fh6fmYWluAmcCCdY2ZNZMmjS1DX6IjIMaW
	FrsFraONqQ/cPSPtVpGLopMY3z83LZ52K/MQ52MkoMUHQ+BthFVy+8VxFSgv1ISZv5sG0Cor1tZsu
	O7IJFLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLwD-00FhzO-0z;
	Mon, 17 Apr 2023 10:18:21 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLvy-00Fhvm-0Q;
	Mon, 17 Apr 2023 10:18:20 +0000
Received: from smtpclient.apple ([172.16.0.254])
	(user=void0red@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33HAFCBJ018476-33HAFCBL018476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Apr 2023 18:15:12 +0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable to
 devm_clk_get_enabled in mtk_thermal_probe
From: Kang Chen <void0red@hust.edu.cn>
In-Reply-To: <cfb7743b-03b0-96c4-fcc3-7095694f6fbb@linaro.org>
Date: Mon, 17 Apr 2023 18:15:02 +0800
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
        bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn,
        error27@gmail.com, henry.yen@mediatek.com,
        hust-os-kernel-patches@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
        rui.zhang@intel.com, void0red@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6108982E-A3DC-4B7E-829E-20BBAC9C503F@hust.edu.cn>
References: <b2e5ef14-9a12-15d5-8016-d0994c1177c3@linaro.org>
 <20230411063531.3976354-1-void0red@hust.edu.cn>
 <20230411063531.3976354-2-void0red@hust.edu.cn>
 <4fed91ef.3c256.18783c407e3.Coremail.void0red@hust.edu.cn>
 <cfb7743b-03b0-96c4-fcc3-7095694f6fbb@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-FEAS-AUTH-USER: void0red@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_031806_531916_20B35131 
X-CRM114-Status: GOOD (  23.14  )
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



> 2023=E5=B9=B44=E6=9C=8817=E6=97=A5 17:52=EF=BC=8CDaniel Lezcano =
<daniel.lezcano@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> Hi,
>=20
> this patch does not apply:
>=20
> Analyzing 9 messages in the thread
> Will use the latest revision: v3
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>  [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable to =
devm_clk_get_enabled in mtk_thermal_probe
>    + Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>    + Link: =
https://lore.kernel.org/r/20230411063531.3976354-2-void0red@hust.edu.cn
> ---
> Total patches: 1 (cherrypicked: 2)
> ---
> Link: =
https://lore.kernel.org/r/20230411063531.3976354-1-void0red@hust.edu.cn
> Base: not specified
> Applying: thermal: mediatek: change clk_prepare_enable to =
devm_clk_get_enabled in mtk_thermal_probe
> error: patch failed: drivers/thermal/mediatek/auxadc_thermal.c:1182
> error: drivers/thermal/mediatek/auxadc_thermal.c: patch does not apply
> Patch failed at 0001 thermal: mediatek: change clk_prepare_enable to =
devm_clk_get_enabled in mtk_thermal_probe
Could you show me your work tree? I can apply it on mainline-6.3-rc7...
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am =
--abort".
>=20
>=20
>=20
> On 15/04/2023 09:14, void0red@hust.edu.cn wrote:
>>> -----Original Messages-----
>>> From: "Kang Chen" <void0red@hust.edu.cn>
>>> Sent Time: 2023-04-11 14:35:31 (Tuesday)
>>> To: daniel.lezcano@linaro.org
>>> Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com, =
bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn, =
error27@gmail.com, henry.yen@mediatek.com, =
hust-os-kernel-patches@googlegroups.com, =
linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =
linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, =
matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org, =
rui.zhang@intel.com, void0red@gmail.com, void0red@hust.edu.cn
>>> Subject: [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable =
to devm_clk_get_enabled in mtk_thermal_probe
>>>=20
>>> use devm_clk_get_enabled to do automatic resource management.
>>> Meanwhile, remove error handling labels in the probe function and
>>> the whole remove function.
>>>=20
>>> Signed-off-by: Kang Chen <void0red@hust.edu.cn>
>>> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>>> ---
>>> v3 -> v2: remove some useles func calls.
>>> v2 -> v1: init
>>>=20
>>> Notice the devm_clk_get_enabled do the clk_get and =
clk_prepare_enable
>>> at the same time.
>>> I'm not sure if this has any side effects in initialization.
>>>=20
>>>  drivers/thermal/mediatek/auxadc_thermal.c | 48 =
+++++------------------
>>>  1 file changed, 10 insertions(+), 38 deletions(-)
>>>=20
>>> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c =
b/drivers/thermal/mediatek/auxadc_thermal.c
>>> index 3372f7c29626..995837ce3ea2 100644
>>> --- a/drivers/thermal/mediatek/auxadc_thermal.c
>>> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
>>> @@ -1116,14 +1116,6 @@ static int mtk_thermal_probe(struct =
platform_device *pdev)
>>>    	mt->conf =3D of_device_get_match_data(&pdev->dev);
>>>  -	mt->clk_peri_therm =3D devm_clk_get(&pdev->dev, "therm");
>>> -	if (IS_ERR(mt->clk_peri_therm))
>>> -		return PTR_ERR(mt->clk_peri_therm);
>>> -
>>> -	mt->clk_auxadc =3D devm_clk_get(&pdev->dev, "auxadc");
>>> -	if (IS_ERR(mt->clk_auxadc))
>>> -		return PTR_ERR(mt->clk_auxadc);
>>> -
>>>  	mt->thermal_base =3D =
devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>>>  	if (IS_ERR(mt->thermal_base))
>>>  		return PTR_ERR(mt->thermal_base);
>>> @@ -1182,16 +1174,16 @@ static int mtk_thermal_probe(struct =
platform_device *pdev)
>>>  	if (ret)
>>>  		return ret;
>>>  -	ret =3D clk_prepare_enable(mt->clk_auxadc);
>>> -	if (ret) {
>>> -		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", =
ret);
>>> -		return ret;
>>> +	mt->clk_auxadc =3D devm_clk_get_enabled(&pdev->dev, "auxadc");
>>> +	if (IS_ERR(mt->clk_auxadc)) {
>>> +		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", =
mt->clk_auxadc);
>>> +		return PTR_ERR(mt->clk_auxadc);
>>>  	}
>>>  -	ret =3D clk_prepare_enable(mt->clk_peri_therm);
>>> -	if (ret) {
>>> -		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", ret);
>>> -		goto err_disable_clk_auxadc;
>>> +	mt->clk_peri_therm =3D devm_clk_get_enabled(&pdev->dev, =
"therm");
>>> +	if (IS_ERR(mt->clk_peri_therm)) {
>>> +		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", =
mt->clk_peri_therm);
>>> +		return PTR_ERR(mt->clk_peri_therm);
>>>  	}
>>>    	if (mt->conf->version !=3D MTK_THERMAL_V1) {
>>> @@ -1215,38 +1207,18 @@ static int mtk_thermal_probe(struct =
platform_device *pdev)
>>>    	tzdev =3D devm_thermal_of_zone_register(&pdev->dev, 0, mt,
>>>  					      &mtk_thermal_ops);
>>> -	if (IS_ERR(tzdev)) {
>>> -		ret =3D PTR_ERR(tzdev);
>>> -		goto err_disable_clk_peri_therm;
>>> -	}
>>> +	if (IS_ERR(tzdev))
>>> +		return PTR_ERR(tzdev);
>>>    	ret =3D devm_thermal_add_hwmon_sysfs(tzdev);
>>>  	if (ret)
>>>  		dev_warn(&pdev->dev, "error in =
thermal_add_hwmon_sysfs");
>>>    	return 0;
>>> -
>>> -err_disable_clk_peri_therm:
>>> -	clk_disable_unprepare(mt->clk_peri_therm);
>>> -err_disable_clk_auxadc:
>>> -	clk_disable_unprepare(mt->clk_auxadc);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -static int mtk_thermal_remove(struct platform_device *pdev)
>>> -{
>>> -	struct mtk_thermal *mt =3D platform_get_drvdata(pdev);
>>> -
>>> -	clk_disable_unprepare(mt->clk_peri_therm);
>>> -	clk_disable_unprepare(mt->clk_auxadc);
>>> -
>>> -	return 0;
>>>  }
>>>    static struct platform_driver mtk_thermal_driver =3D {
>>>  	.probe =3D mtk_thermal_probe,
>>> -	.remove =3D mtk_thermal_remove,
>>>  	.driver =3D {
>>>  		.name =3D "mtk-thermal",
>>>  		.of_match_table =3D mtk_thermal_of_match,
>>> --=20
>>> 2.34.1
>> ping?
>=20
> --=20
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for =
ARM SoCs
>=20
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog


