Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36435C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 13:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F395820772
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 13:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T99wYm6H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F395820772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cRkjSpO1pnvG11Lt7IuQtoaqDFOn7M2OxjCskONmw88=; b=T99wYm6H2k65R848iS+lgYAh1
	kvyHk20mnCxbU+3AReVZZxxOBjVq5/uA5Y3fa7rp+Ypl1opdeJsS0wXuQIZ2kNn7qHA4SWY7vp8CU
	oU8DvQ0vT/uwK0yUKH810v+6XJEhA7a/SJWhgAXIBUpkMI/LGMF80pym6WBX1YmblExlTNO0mjEaa
	1Qk3APB3QcCCa1Etm8fMog0Aml57cE7Oj/GrIRXNZmgDZvNdDT/+nAlEyfD/r0xkB2XpWZeDMGm5X
	/19jGMAbL8BpwHzjQQ0A9S4l769aoV0l0I0AMnRDIsq/1c+tgpOo/vEorYpt/W8TuRN+ntMk9K/L5
	OX6WF3b0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgqHF-0007ia-Pt; Thu, 04 Jun 2020 13:51:25 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgqGe-00072f-TF; Thu, 04 Jun 2020 13:50:50 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 613EF1C0BD2; Thu,  4 Jun 2020 15:50:45 +0200 (CEST)
Date: Thu, 4 Jun 2020 15:50:45 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200604135045.GH7222@duo.ucw.cz>
References: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_065049_094143_E07B2819 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, matthias.bgg@gmail.com,
 shufan_lee@richtek.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============1230632638355726758=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1230632638355726758==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline


--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +
> +#define MT6360_LED_DESC(_id)  {						\
> +	.cdev =3D {							\
> +		.name =3D "mt6360_isink" #_id,				\
> +		.max_brightness =3D MT6360_SINKCUR_MAX##_id,		\
> +		.brightness_set_blocking =3D mt6360_led_brightness_set,	\
> +		.brightness_get =3D mt6360_led_brightness_get,		\
> +		.blink_set =3D mt6360_led_blink_set,			\
> +	},								\
> +	.index =3D MT6360_LED_ISINK##_id,					\
> +	.currsel_reg =3D MT6360_CURRSEL_REG##_id,				\
> +	.currsel_mask =3D MT6360_CURRSEL_MASK##_id,			\
> +	.enable_mask =3D MT6360_LEDEN_MASK##_id,				\
> +	.mode_reg =3D MT6360_LEDMODE_REG##_id,				\
> +	.mode_mask =3D MT6360_LEDMODE_MASK##_id,				\
> +	.pwmduty_reg =3D MT6360_PWMDUTY_REG##_id,				\
> +	.pwmduty_mask =3D MT6360_PWMDUTY_MASK##_id,			\
> +	.pwmfreq_reg =3D MT6360_PWMFREQ_REG##_id,				\
> +	.pwmfreq_mask =3D MT6360_PWMFREQ_MASK##_id,			\
> +	.breath_regbase =3D MT6360_BREATH_REGBASE##_id,			\
> +}
> +
> +/* ISINK 1/2/3 for RGBLED, ISINK4 for MoonLight */
> +static const struct mt6360_led_classdev def_led_classdev[MT6360_LED_MAX]=
 =3D {
> +	MT6360_LED_DESC(1),
> +	MT6360_LED_DESC(2),
> +	MT6360_LED_DESC(3),
> +	MT6360_LED_DESC(4),
> +};

While this is pretty interesting abuse of the macros, please get rid
of it. I'm sure code will look better as a result.

> +static int mt6360_fled_strobe_set(
> +			       struct led_classdev_flash *fled_cdev, bool state)
> +{
> +	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
> +	struct mt6360_led_data *mld =3D dev_get_drvdata(led_cdev->dev->parent);
> +	struct mt6360_fled_classdev *mtfled_cdev =3D (void *)fled_cdev;
> +	int id =3D mtfled_cdev->index, ret;
> +
> +	if (!(state ^ test_bit(id, &mld->fl_strobe_flags)))
> +		return 0;

Yup, and you can abuse xor operator too. Don't do that. I believe you
wanted to say:

+	if (state =3D=3D test_bit(id, &mld->fl_strobe_flags))
+		return 0;


> +	if (mt6360_fled_check_flags_if_any(&mld->fl_torch_flags)) {
> +		dev_err(led_cdev->dev,
> +			"Disable all leds torch [%lu]\n", mld->fl_torch_flags);
> +		return -EINVAL;
> +	}
> +	ret =3D regmap_update_bits(mld->regmap, mtfled_cdev->cs_enable_reg,
> +				 mtfled_cdev->cs_enable_mask, state ? 0xff : 0);
> +	if (ret < 0) {
> +		dev_err(led_cdev->dev, "Fail to set cs enable [%d]\n", state);
> +		goto out_strobe_set;
> +	}

Just return ret; no need for goto. (Please fix globally).

> +static int mt6360_fled_brightness_set(struct led_classdev *led_cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *lcf =3D lcdev_to_flcdev(led_cdev);
> +	struct mt6360_led_data *mld =3D dev_get_drvdata(led_cdev->dev->parent);
> +	struct mt6360_fled_classdev *mtfled_cdev =3D (void *)lcf;
> +	int id =3D mtfled_cdev->index, shift, keep, ret;
> +
> +	if (mt6360_fled_check_flags_if_any(&mld->fl_strobe_flags)) {
> +		dev_err(led_cdev->dev,
> +		       "Disable all leds strobe [%lu]\n", mld->fl_strobe_flags);
> +		return -EINVAL;
> +	}
> +	if (brightness =3D=3D LED_OFF) {
> +		clear_bit(id, &mld->fl_torch_flags);
> +		keep =3D mt6360_fled_check_flags_if_any(&mld->fl_torch_flags);
> +		ret =3D regmap_update_bits(mld->regmap,
> +					 mtfled_cdev->torch_enable_reg,
> +					 mtfled_cdev->torch_enable_mask,
> +					 keep ? 0xff : 0);
> +		if (ret < 0) {
> +			dev_err(led_cdev->dev, "Fail to set torch disable\n");
> +			goto out_bright_set;
> +		}
> +		ret =3D regmap_update_bits(mld->regmap,
> +					 mtfled_cdev->cs_enable_reg,
> +					 mtfled_cdev->cs_enable_mask, 0);
> +		if (ret < 0)
> +			dev_err(led_cdev->dev, "Fail to set torch disable\n");
> +		goto out_bright_set;
> +	}

Should turning off the led go to separate function?



> +#define MT6360_FLED_DESC(_id)  {					\
> +	.fl_cdev =3D {							\
> +	 .led_cdev =3D {							\
> +		.name =3D "mt6360_fled_ch" #_id,				\
> +		.max_brightness =3D MT6360_TORBRIGHT_MAX##_id,		\
> +		.brightness_set_blocking =3D  mt6360_fled_brightness_set,	\
> +		.brightness_get =3D mt6360_fled_brightness_get,		\
> +		.flags =3D LED_DEV_CAP_FLASH,				\
> +	 },								\
> +	 .brightness =3D {						\
> +		.min =3D MT6360_STROBECUR_MIN,				\
> +		.step =3D MT6360_STROBECUR_STEP,				\
> +		.max =3D MT6360_STROBECUR_MAX,				\
> +		.val =3D MT6360_STROBECUR_MIN,				\
> +	 },								\
> +	 .timeout =3D {							\
> +		.min =3D MT6360_STRBTIMEOUT_MIN,				\
> +		.step =3D MT6360_STRBTIMEOUT_STEP,			\
> +		.max =3D MT6360_STRBTIMEOUT_MAX,				\
> +		.val =3D MT6360_STRBTIMEOUT_MIN,				\
> +	 },								\
> +	 .ops =3D &mt6360_fled_ops,					\
> +	},								\
> +	.index =3D MT6360_FLED_CH##_id,					\
> +	.cs_enable_reg =3D MT6360_CSENABLE_REG##_id,			\
> +	.cs_enable_mask =3D MT6360_CSENABLE_MASK##_id,			\
> +	.torch_bright_reg =3D MT6360_TORBRIGHT_REG##_id,			\
> +	.torch_bright_mask =3D MT6360_TORBRIGHT_MASK##_id,		\
> +	.torch_enable_reg =3D MT6360_TORENABLE_REG##_id,			\
> +	.torch_enable_mask =3D MT6360_TORENABLE_MASK##_id,		\
> +	.strobe_bright_reg =3D MT6360_STRBRIGHT_REG##_id,			\
> +	.strobe_bright_mask =3D MT6360_STRBRIGHT_MASK##_id,		\
> +	.strobe_enable_reg =3D MT6360_STRBENABLE_REG##_id,		\
> +	.strobe_enable_mask =3D MT6360_STRBENABLE_MASK##_id,		\
> +}
> +
> +static const struct mt6360_fled_classdev def_fled_classdev[MT6360_FLED_M=
AX] =3D {
> +	MT6360_FLED_DESC(1),
> +	MT6360_FLED_DESC(2),
> +};

Yeah, well, no.

> @@ -236,5 +241,4 @@ struct mt6360_pmu_data {
>  #define CHIP_VEN_MASK				(0xF0)
>  #define CHIP_VEN_MT6360				(0x50)
>  #define CHIP_REV_MASK				(0x0F)
> -
>  #endif /* __MT6360_H__ */

This one is unrelated and not really an improvement.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj8NQAKCRAw5/Bqldv6
8tGJAKCk/tQlh2dphyQmGz3W4P1KLZfCFgCfW2DcYsCMqf6HOjZrQg7Tw9n6pDg=
=oa9M
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--


--===============1230632638355726758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1230632638355726758==--

