Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD66C2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 00:43:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C488E206C3
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 00:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQOqzcfs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Htgg3Gnc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C488E206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W8zOS1yYEDxnfr8rrYHHLY9YD7aOQ1bhE+q6qhEfK0Q=; b=BQOqzcfsToWS+HS5X8FGREZIj
	h4tBSZQ8JIAKMG0iyWNhbhLN11s+LMLl6SLdmBtk+LcwHEuYvoYXj+5UbOFOnb4NZdhad8NYJ3K1K
	w5YCL5ZxMhJuFTaCjCtF86fNUMEGgVxYQqYR+fMlYCbT5tzwY+eqhjMqaz2+srlQjz4AtoB7SmI4D
	dKlJjpCa21L9q5HsqvB16VQvrSuNfbYn/BFwEUpNHgIHvhNPVCd9viMtLC7WvUwYWzEZbDwD8ODSW
	1tNkBwkuIo8z9zZrGSuZwLdt/rpRLNGg8wG0Kf3t2mOG7kjSjauM9vc/KbpI6fFHNmSl/ANgy5Hq5
	IJUREgO7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKtO1-0006FB-8R; Sun, 05 Apr 2020 00:43:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKtNu-0006AP-Nu; Sun, 05 Apr 2020 00:43:36 +0000
Received: from earth.universe (dyndsl-095-033-168-093.ewe-ip-backbone.de
 [95.33.168.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 006D9206C3;
 Sun,  5 Apr 2020 00:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586047413;
 bh=zJ2PFpEYB9JE8j9pPZ9xRtBENIAE4PP4mrsX1laAi0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Htgg3Gnc/7wV1P1qXpt8Tw4WpHHXo6EPJQM14fi6qFri62INtV7b2hOvfJXkxrsEt
 Cd/UWVa9ZgyaRw3FaKL1w6v+aKcIzdzvJ0/5emB/ExlcLli4kHahUmoxE30Ea9R6C/
 dijN2pHPWYvmMSkk18V72eQ8sPXyczWFL+h/EinQ=
Received: by earth.universe (Postfix, from userid 1000)
 id 39F4D3C082A; Sun,  5 Apr 2020 02:43:31 +0200 (CEST)
Date: Sun, 5 Apr 2020 02:43:31 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v11 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200405004331.e55z5gobskjerz5f@earth.universe>
References: <1585627657-3265-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1585627657-3265-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1585627657-3265-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_174334_819396_7B3D5CD4 
X-CRM114-Status: GOOD (  21.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Fontana <rfontana@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 linux-rtc@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============5862545830090862528=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5862545830090862528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2bxduq5dd7on66yi"
Content-Disposition: inline


--2bxduq5dd7on66yi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2020 at 12:07:36PM +0800, Hsin-Hsiung Wang wrote:
> From: Ran Bi <ran.bi@mediatek.com>
>=20
> This add support for the MediaTek MT6358 RTC. Driver using
> compatible data to store different RTC_WRTGR address offset.
> This replace RTC_WRTGR to RTC_WRTGR_MT6323 in mt6323-poweroff
> driver which only needed by armv7 CPU without ATF.
>=20
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---

I expect this will not be merged through power-supply. No need to
provide an immutable branch for this trivial change.

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  drivers/power/reset/mt6323-poweroff.c |  2 +-
>  drivers/rtc/rtc-mt6397.c              | 23 +++++++++++++++++++----
>  include/linux/mfd/mt6397/rtc.h        |  9 ++++++++-
>  3 files changed, 28 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/=
mt6323-poweroff.c
> index 1caf43d..0532803 100644
> --- a/drivers/power/reset/mt6323-poweroff.c
> +++ b/drivers/power/reset/mt6323-poweroff.c
> @@ -30,7 +30,7 @@ static void mt6323_do_pwroff(void)
>  	int ret;
> =20
>  	regmap_write(pwrc->regmap, pwrc->base + RTC_BBPU, RTC_BBPU_KEY);
> -	regmap_write(pwrc->regmap, pwrc->base + RTC_WRTGR, 1);
> +	regmap_write(pwrc->regmap, pwrc->base + RTC_WRTGR_MT6323, 1);
> =20
>  	ret =3D regmap_read_poll_timeout(pwrc->regmap,
>  					pwrc->base + RTC_BBPU, val,
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index cda238d..7f3dfd2 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -9,6 +9,7 @@
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/rtc.h>
> @@ -20,7 +21,7 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
>  	int ret;
>  	u32 data;
> =20
> -	ret =3D regmap_write(rtc->regmap, rtc->addr_base + RTC_WRTGR, 1);
> +	ret =3D regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -269,6 +270,8 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	rtc->addr_base =3D res->start;
> =20
> +	rtc->data =3D of_device_get_match_data(&pdev->dev);
> +
>  	rtc->irq =3D platform_get_irq(pdev, 0);
>  	if (rtc->irq < 0)
>  		return rtc->irq;
> @@ -325,10 +328,22 @@ static int mt6397_rtc_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
>  			mt6397_rtc_resume);
> =20
> +static const struct mtk_rtc_data mt6358_rtc_data =3D {
> +	.wrtgr =3D RTC_WRTGR_MT6358,
> +};
> +
> +static const struct mtk_rtc_data mt6397_rtc_data =3D {
> +	.wrtgr =3D RTC_WRTGR_MT6397,
> +};
> +
>  static const struct of_device_id mt6397_rtc_of_match[] =3D {
> -	{ .compatible =3D "mediatek,mt6323-rtc", },
> -	{ .compatible =3D "mediatek,mt6397-rtc", },
> -	{ }
> +	{ .compatible =3D "mediatek,mt6323-rtc",
> +		.data =3D &mt6397_rtc_data, },
> +	{ .compatible =3D "mediatek,mt6358-rtc",
> +		.data =3D &mt6358_rtc_data, },
> +	{ .compatible =3D "mediatek,mt6397-rtc",
> +		.data =3D &mt6397_rtc_data, },
> +	{}
>  };
>  MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
> =20
> diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rt=
c.h
> index 7dfb63b..6200f3b 100644
> --- a/include/linux/mfd/mt6397/rtc.h
> +++ b/include/linux/mfd/mt6397/rtc.h
> @@ -18,7 +18,9 @@
>  #define RTC_BBPU_CBUSY         BIT(6)
>  #define RTC_BBPU_KEY            (0x43 << 8)
> =20
> -#define RTC_WRTGR              0x003c
> +#define RTC_WRTGR_MT6358       0x3a
> +#define RTC_WRTGR_MT6397       0x3c
> +#define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
> =20
>  #define RTC_IRQ_STA            0x0002
>  #define RTC_IRQ_STA_AL         BIT(0)
> @@ -65,6 +67,10 @@
>  #define MTK_RTC_POLL_DELAY_US  10
>  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
> =20
> +struct mtk_rtc_data {
> +	u32                     wrtgr;
> +};
> +
>  struct mt6397_rtc {
>  	struct device           *dev;
>  	struct rtc_device       *rtc_dev;
> @@ -74,6 +80,7 @@ struct mt6397_rtc {
>  	struct regmap           *regmap;
>  	int                     irq;
>  	u32                     addr_base;
> +	const struct mtk_rtc_data *data;
>  };
> =20
>  #endif /* _LINUX_MFD_MT6397_RTC_H_ */
> --=20
> 2.6.4

--2bxduq5dd7on66yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl6JKaMACgkQ2O7X88g7
+poXSw/6A/hFwFRpm7tI04tkDezVAWK+d2kPK2/7BIIqjbwpXbI1fVn9z58XVYI5
NJVAgFjdCS8sfwl2cTTynfCm7Vk64a9kyUacYLNvfufgCEg6M0EeRNeZ3s6AU6s6
YyE5+X0mV/ioZh2hDLghQBvd6Re/qletLi/Ku8R99s/aqmLp00FklHWN1gXMnWsv
sKj7gQkPqw1bGW31QQWJKs2cotojGscMfI4g2ncXguz7jLa8zohgP4T85fm5i3Ik
ute+YbwbgoCoXWGbgJ8JrbMnfP/FreiZ0DsuyQNlbi8oA1Sr1adwUg11PB/E+wU1
YPBQ4qfGitvXtoQ8nml8am+0+rr4WKdzGJ92aio5DBYD0amVbFTV86zk1CSU1J8o
2n678g2xYyw9ZLmjP0G+Qy5pVBVP7jBd65WEPPQZYBwTSdUxOwXMcl9rxYyqY5bt
GzK7NbqjDUQJJtMi9VU4kqkTF0ZjO54h0i/eMOSXyM3hS2CB59EGZABsRQG7WcO9
b6VAAM/WHuDmg+oW1QNt9wn6CaRoxS3FFePo+J2rXejzHqpTOrnw99Mn9LmVZLZE
plxt+XcsN1o+TOm6AmSB6OEi2sMCl/22ApUMyrV+2J0DUVJqCDpW1jXP+ol/RH1u
bC5+zJNxe1OSesRx/Ia7rl3RpmP9wQC1UQAX/HDBuyWmdikiXTQ=
=c+EE
-----END PGP SIGNATURE-----

--2bxduq5dd7on66yi--


--===============5862545830090862528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5862545830090862528==--

