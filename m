Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BFAC47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 22:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66DED610A1
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 22:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66DED610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BunTtzbaHM/NOWrNqy0Y2xTsrBgWEJosbM4nmB0/MJQ=; b=Gpq1lOO2e9RmHb
	CmFGTDEO6sbRWuvSnBf5F6WQmrRBo1fb+9d+YP8HiclWAWhuHUErPt9yVqe+iuU8utpufU/oihlEi
	QZD76cXOR86TEZrXlDWCV1qtaGelZw0ALsslj+Ld6SDqVJN/iYNsWZXlpifLtrxs28R7j9SS/YFeb
	O22TGdA0P9sGRL/1SI4nbu9qZO/NZzAh38kzHCIyYo/2IhA1nQA73zY6+9ZfFO6LS3BpmY+qpw4ML
	74wwY3tgOvzmPdt9A3NipvpCPmWbQNzZscOQA8DC0J2ZA1Kg83SRZDPBhK3de8hC36hP3Z/UgBX6E
	wehC3Ia+/Wv579n3gOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqO7p-005cdU-EC; Mon, 07 Jun 2021 22:53:41 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqO7e-005caY-6b
 for linux-mediatek@lists.infradead.org; Mon, 07 Jun 2021 22:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623106397;
 bh=veiWrZ68/aRMVKyuCZcb9fLCipe0nVzpbd5nvowzwto=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=C8m9fYnmBSH03S6LaHiAzLyNGGINvPXifGITOE8o0iBq6XWKp88duOuqu4AxAzUOp
 gg9qojLlYVpvQwOC1E+Qn9OqTbfMgtBgGSjmE4jDTrmdMyeD+n8CrpluM0O3EyT6J1
 w5f2nvS8O/QDlleruP+Fl80Anm7GUQelfKN3T/Pw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.109] ([217.61.152.109]) by web-mail.gmx.net
 (3c-app-gmx-bs17.server.lan [172.19.170.69]) (via HTTP); Mon, 7 Jun 2021
 20:34:33 +0200
MIME-Version: 1.0
Message-ID: <trinity-663afc91-2433-4785-af9b-3ca5d4744037-1623090872989@3c-app-gmx-bs17>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: [PATCH v3] thermal: mediatek: add sensors-support
Date: Mon, 7 Jun 2021 20:34:33 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210420172308.134685-1-linux@fw-web.de>
References: <20210420172308.134685-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ip0nyvLzh2YX44Uhf9v4yvoEe2mw7J7QthU4ZFFsIRct1zSudRF6b8ECYw5mNaEH7okJ/
 z6Aw7K+oSZKQJ395RKhHpgLBd+9eGpE57z8+vzav1WvG0oLC1uIeFL9yXzoi3uKJOwhh08K5qdgg
 fv68On+lnP15Sg83+pVQW/B6V90n4c45x76Uj2s3JUpv8GUgv60GXEtWtW+vEtkfRWZwUpjfXKtR
 6X6jE7uIlR8vUUWuyFh28oitByaAHEwCbACBsWZnCrCz8a5bC8onxKMvejxpLPeLzaShU4k5TxX9
 sM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:y/rGaq02UMQ=:OhjC8OyJHp/s+qRkD3Wk/X
 mh7nGwOw/Fyom5TKTkosFTp6VjggmmQ5ZdnaYmPUPFjVy7Slb2G/w0JRigdPvNYKdHr8/fa+f
 6QklC3bcR3eh+19Smq/Jk3hd49+o/gUq/yXIogcDvItRG4spQNNDKWs7azvkOBIXUuRGHDr/5
 ISCzPB1a/tARpl9oZi6aXW0cnJwEz+L67M4bEISUyEr0yAr7CzG403oa25t2m7K47f9jpK/E4
 DxR08luHkBwvOXsEfyRyehiF3MU2f4Fudfpx/XpNzy4RqvopUnTlX3hWmdWYT1ANTRtBWclNj
 0GzGncQBrKDdMF/L8Xo5eEF0NObZMHaqKKlaFeso5ufAZOhAW5w34/V9jUqP4F7e+IiZzD8yq
 W0t2s1Xgoaf5dAw4xxLm3l/JjbtVTTgzX5I8j1iHJtqOtP4MORsFqp8CViiOaRisj289XavTd
 qmbLzwRJMOZdkzuyz5rxvFTHd9BezjfLLX5kLS4KbaDZBp7ploz3Kc3caNQapv7K5CMNz4Bvt
 tKFN71INNcRKJ2vCgk+a7c/tnj3CR8uKRau6xYLC5ZN9PmzSkuzUxoQXL9DMIwqG/ySTNiZIt
 r0BYNPWb0JFk+ryTpJVBFX6AxDzVm87ONK6BJEcthsM4DriSqvlgFdU5YcnYGSLdZkQBZm49U
 R9WgoIEaZP8nMeDVFiXp1Eu2FqUbnxMpoT+jvdm1XFgzaBbgQGLWGdPXXcDuXd8Rn/T4amRz/
 epj1Eb6p8ZBSjMNlyyj8f1xgAGVN8eUhfaq8683aeNrv+T1HUFyrsZmI9nHQgCso1iFs7wwiO
 +E2sk/a7SykcLhzQI47DY6211UrUj1G7J0s4yUnRET+OwdvSvk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_155330_549151_3C2C9F6F 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

just a gentle ping ;)

regards Frank


> Gesendet: Dienstag, 20. April 2021 um 19:23 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>
> An: linux-mediatek@lists.infradead.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Amit Kucheria" <amitk@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
> Betreff: [PATCH v3] thermal: mediatek: add sensors-support
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> add HWMON-support to mediateks thermal driver to allow lm-sensors
> userspace tools read soc temperature
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3: drop no_hwmon - now really, sorry
> v2: drop ifdef and used devm_thermal_add_hwmon_sysfs
> ---
>  drivers/thermal/mtk_thermal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 149c6d7fd5a0..85964988684b 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -23,6 +23,8 @@
>  #include <linux/reset.h>
>  #include <linux/types.h>
>
> +#include "thermal_hwmon.h"
> +
>  /* AUXADC Registers */
>  #define AUXADC_CON1_SET_V	0x008
>  #define AUXADC_CON1_CLR_V	0x00c
> @@ -1087,6 +1089,10 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  		goto err_disable_clk_peri_therm;
>  	}
>
> +	ret = devm_thermal_add_hwmon_sysfs(tzdev);
> +	if (ret)
> +		dev_err(&pdev->dev, "error in thermal_add_hwmon_sysfs");
> +
>  	return 0;
>
>  err_disable_clk_peri_therm:
> --
> 2.25.1
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
