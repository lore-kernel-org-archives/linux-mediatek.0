Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9741CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPmCBAoYo/SvijzHh8m4DgczLlWWwvz+aXsPc+AfFck=; b=4tkPPk1BUaOgFb
	ixNJOkSpGyssJ6NthyC4C3LAJDJnFfbRvJBsHU+6jhPP4r9Qjv5lJjzm0c4DjGmQz2r+ogDBjNX5m
	1Q7oQU9JbQdo/bcZQ9RkaQB9aBAmAFKBe4NcLMLBkgmFp+128HT+BG2KR2eg/Zi3ijtLFFBSs9oQR
	HfIRMO2b2N6TOTA9gf2AFxmNQ4dUAtdaDymUniMn+ONLSgkTv8/fp59T96Pgg/1fLyfEubL5c/nML
	PAGhKLYYQ9LpUR1vo8bBxuTNEPjCfNj6LFEE313g8+3imrOdOK3wgobzS1feHCyqQ7nWtP6gDIDPV
	T1acj4xON65oY+q+wq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZxt7-002zv0-7j; Thu, 31 Mar 2022 16:43:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZxss-002znQ-0f; Thu, 31 Mar 2022 16:42:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 37B131F46FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648744970;
 bh=URWjFVGuhj7D7yW7QoQujZTyYenlCr2X2sTuRt6fC3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RO54O5YSsWYUptq1X3xB04zFY9DhyE83AizRRkWUHoeb9a9jg2LqinfrF9WaracUH
 +A49n9g8myP2zuvmWtifEQh4cG4OLcJtjeUU3D8V7kMYFGF6Ej17/e1uQNRI5g3zLf
 yKLl+lMqebNRVTz7lIv7MDkVzoDHbLvM3qNCF06SgDxswDVrDkeLo43uIycl1BynOf
 4+rq4yCEw68PUAICcxEZ4yNy07haEu2QydCt/RmZ4vQolzoOmqC+aIpfTAKRIIjbqH
 j9gxj9vT3MboEarZLOO24PweRlRuvjlnzSP7h9KPSeukkCKfG+BsnRg7dNR55UB0Zb
 Amy6QzfvWapHQ==
Date: Thu, 31 Mar 2022 12:42:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: mediatek: pwrap: Use readx_poll_timeout()
 instead of custom function
Message-ID: <20220331164246.qwi3xqvunesxnexy@notapiano>
References: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
 <20220331075817.7122-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331075817.7122-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_094254_362394_03C89504 
X-CRM114-Status: GOOD (  21.81  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 31, 2022 at 09:58:15AM +0200, AngeloGioacchino Del Regno wrote:
> Function pwrap_wait_for_state() is a function that polls an address
> through a helper function, but this is the very same operation that
> the readx_poll_timeout macro means to do.
> Convert all instances of calling pwrap_wait_for_state() to instead
> use the read_poll_timeout macro.
> =

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

(tested on mt8192-asurada-spherion)

> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 60 +++++++++++++++-------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
> =

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index bf39a64f3ecc..54a5300ab72b 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -13,6 +13,9 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  =

> +#define PWRAP_POLL_DELAY_US	10
> +#define PWRAP_POLL_TIMEOUT_US	10000
> +
>  #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
>  #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
>  #define PWRAP_MT8135_BRIDGE_INIT_DONE3		0x14
> @@ -1241,27 +1244,14 @@ static bool pwrap_is_fsm_idle_and_sync_idle(struc=
t pmic_wrapper *wrp)
>  		(val & PWRAP_STATE_SYNC_IDLE0);
>  }
>  =

> -static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
> -		bool (*fp)(struct pmic_wrapper *))
> -{
> -	unsigned long timeout;
> -
> -	timeout =3D jiffies + usecs_to_jiffies(10000);
> -
> -	do {
> -		if (time_after(jiffies, timeout))
> -			return fp(wrp) ? 0 : -ETIMEDOUT;
> -		if (fp(wrp))
> -			return 0;
> -	} while (1);
> -}
> -
>  static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
>  {
> +	bool tmp;
>  	int ret;
>  	u32 val;
>  =

> -	ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> +	ret =3D readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret) {
>  		pwrap_leave_fsm_vldclr(wrp);
>  		return ret;
> @@ -1273,7 +1263,8 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u=
32 adr, u32 *rdata)
>  		val =3D (adr >> 1) << 16;
>  	pwrap_writel(wrp, val, PWRAP_WACS2_CMD);
>  =

> -	ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
> +	ret =3D readx_poll_timeout(pwrap_is_fsm_vldclr, wrp, tmp, tmp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret)
>  		return ret;
>  =

> @@ -1290,11 +1281,14 @@ static int pwrap_read16(struct pmic_wrapper *wrp,=
 u32 adr, u32 *rdata)
>  =

>  static int pwrap_read32(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
>  {
> +	bool tmp;
>  	int ret, msb;
>  =

>  	*rdata =3D 0;
>  	for (msb =3D 0; msb < 2; msb++) {
> -		ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> +		ret =3D readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
> +					 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
> +
>  		if (ret) {
>  			pwrap_leave_fsm_vldclr(wrp);
>  			return ret;
> @@ -1303,7 +1297,8 @@ static int pwrap_read32(struct pmic_wrapper *wrp, u=
32 adr, u32 *rdata)
>  		pwrap_writel(wrp, ((msb << 30) | (adr << 16)),
>  			     PWRAP_WACS2_CMD);
>  =

> -		ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
> +		ret =3D readx_poll_timeout(pwrap_is_fsm_vldclr, wrp, tmp, tmp,
> +					 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  		if (ret)
>  			return ret;
>  =

> @@ -1323,9 +1318,11 @@ static int pwrap_read(struct pmic_wrapper *wrp, u3=
2 adr, u32 *rdata)
>  =

>  static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
>  {
> +	bool tmp;
>  	int ret;
>  =

> -	ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> +	ret =3D readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret) {
>  		pwrap_leave_fsm_vldclr(wrp);
>  		return ret;
> @@ -1344,10 +1341,12 @@ static int pwrap_write16(struct pmic_wrapper *wrp=
, u32 adr, u32 wdata)
>  =

>  static int pwrap_write32(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
>  {
> +	bool tmp;
>  	int ret, msb, rdata;
>  =

>  	for (msb =3D 0; msb < 2; msb++) {
> -		ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> +		ret =3D readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
> +					 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  		if (ret) {
>  			pwrap_leave_fsm_vldclr(wrp);
>  			return ret;
> @@ -1388,6 +1387,7 @@ static int pwrap_regmap_write(void *context, u32 ad=
r, u32 wdata)
>  =

>  static int pwrap_reset_spislave(struct pmic_wrapper *wrp)
>  {
> +	bool tmp;
>  	int ret, i;
>  =

>  	pwrap_writel(wrp, 0, PWRAP_HIPRIO_ARB_EN);
> @@ -1407,7 +1407,8 @@ static int pwrap_reset_spislave(struct pmic_wrapper=
 *wrp)
>  		pwrap_writel(wrp, wrp->master->spi_w | PWRAP_MAN_CMD_OP_OUTS,
>  				PWRAP_MAN_CMD);
>  =

> -	ret =3D pwrap_wait_for_state(wrp, pwrap_is_sync_idle);
> +	ret =3D readx_poll_timeout(pwrap_is_sync_idle, wrp, tmp, tmp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(wrp->dev, "%s fail, ret=3D%d\n", __func__, ret);
>  		return ret;
> @@ -1458,14 +1459,15 @@ static int pwrap_init_sidly(struct pmic_wrapper *=
wrp)
>  static int pwrap_init_dual_io(struct pmic_wrapper *wrp)
>  {
>  	int ret;
> +	bool tmp;
>  	u32 rdata;
>  =

>  	/* Enable dual IO mode */
>  	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_DIO_EN], 1);
>  =

>  	/* Check IDLE & INIT_DONE in advance */
> -	ret =3D pwrap_wait_for_state(wrp,
> -				   pwrap_is_fsm_idle_and_sync_idle);
> +	ret =3D readx_poll_timeout(pwrap_is_fsm_idle_and_sync_idle, wrp, tmp, t=
mp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(wrp->dev, "%s fail, ret=3D%d\n", __func__, ret);
>  		return ret;
> @@ -1570,6 +1572,7 @@ static bool pwrap_is_pmic_cipher_ready(struct pmic_=
wrapper *wrp)
>  static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>  {
>  	int ret;
> +	bool tmp;
>  	u32 rdata =3D 0;
>  =

>  	pwrap_writel(wrp, 0x1, PWRAP_CIPHER_SWRST);
> @@ -1624,14 +1627,16 @@ static int pwrap_init_cipher(struct pmic_wrapper =
*wrp)
>  	}
>  =

>  	/* wait for cipher data ready@AP */
> -	ret =3D pwrap_wait_for_state(wrp, pwrap_is_cipher_ready);
> +	ret =3D readx_poll_timeout(pwrap_is_cipher_ready, wrp, tmp, tmp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(wrp->dev, "cipher data ready@AP fail, ret=3D%d\n", ret);
>  		return ret;
>  	}
>  =

>  	/* wait for cipher data ready@PMIC */
> -	ret =3D pwrap_wait_for_state(wrp, pwrap_is_pmic_cipher_ready);
> +	ret =3D readx_poll_timeout(pwrap_is_pmic_cipher_ready, wrp, tmp, tmp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(wrp->dev,
>  			"timeout waiting for cipher data ready@PMIC\n");
> @@ -1640,7 +1645,8 @@ static int pwrap_init_cipher(struct pmic_wrapper *w=
rp)
>  =

>  	/* wait for cipher mode idle */
>  	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_MODE], 0x1);
> -	ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_idle_and_sync_idle);
> +	ret =3D readx_poll_timeout(pwrap_is_fsm_idle_and_sync_idle, wrp, tmp, t=
mp,
> +				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(wrp->dev, "cipher mode idle fail, ret=3D%d\n", ret);
>  		return ret;
> -- =

> 2.35.1
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
