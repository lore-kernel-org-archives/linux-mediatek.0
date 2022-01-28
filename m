Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E846C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYJMuofxRzNUwnDxZXcqafTpjhFa0nZd2lkPQ3ashGo=; b=qPOT79WWe2vh+q
	iKuFxE62Z5houGklIP6DU6Dbpipr1Tjq2VIWmy9fDhq6Nf+1UJY9oDLLEut+PJBt36Dq568xSCwye
	bxq8jcgrm6zm2y1MWzGezjtuPGe86Rb1oBvIHtaDSSn4ROZFMNTmPofDyYAMnzTGRpG99rdGgKq8b
	i4D16IMTTD13Aivyn/LB6DjzpEr7tB1vSjXfR/opxdRiyRWYDlILOUbIO8T0rxcrfE54SbgPmnqjF
	gv4CxBxqxxjgLi1f5G9pE01QOkpoO22lUCE0m65HtW/9sSTx3fUlrnjOlPxo0LAGnYhBlGNiJqYSN
	itRMvPZ7K9jt6tFdCM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNx1-001KSh-7a; Fri, 28 Jan 2022 09:53:51 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNv5-001K80-AE; Fri, 28 Jan 2022 09:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643363480;
 bh=TPm0es0o9GmkaIbJI5sgB+eRvpsormzXxZrC4jIKTwY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lw8G5GaLn6m2QNtkRoIScx2SKGN30S81ZWJDBEAvqHol7wLMADSPTCNaKiwLHHa4O
 yEHHjbHckvABmviqXTIoMeIX6G/PervaFjP1DgIG3ujfPYfpQ7Fjo3PVdko1lyiOT6
 uw8zSDqPIWYsPfpsP9/U7Pb0KYU9ZqQIYNtN9mkU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.74.59] ([80.245.74.59]) by web-mail.gmx.net
 (3c-app-gmx-bap33.server.lan [172.19.172.103]) (via HTTP); Fri, 28 Jan 2022
 10:51:20 +0100
MIME-Version: 1.0
Message-ID: <trinity-2a727d96-0335-4d03-8f30-e22a0e10112d-1643363480085@3c-app-gmx-bap33>
From: Frank Wunderlich <frank-w@public-files.de>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: BUG: [PATCH v2] isoc: mediatek: Check for error clk pointer
Date: Fri, 28 Jan 2022 10:51:20 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211222015157.1025853-1-jiasheng@iscas.ac.cn>
References: <20211222015157.1025853-1-jiasheng@iscas.ac.cn>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:5h7BNj62fEnFWuBGgJlWmE9InsvDnOykP7ue9uqjDMLptSe0QHnMcounJfEE9MJdF6lie
 GfPFaYaaeP5J5pb7cQdcPiOHcNwWRc1vIIIQjBJUgdM0uQJBZZawPLwLZNxpvFdU6GudHFPEIGTa
 qu9BibcQzpim3q3qHX2iftPI4Q1C8sfknaU1RKD52ooqIhzkfTyiEU4NFH0DezSxuTsK72Fp673E
 b1A3n8acWPEowD9CCvasp/UeEmFiD+0on/twbGABspQGLZ/z4vSbV1z4GcIIi2Z1eP8QbhlOHJpV
 x8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:laLppHjiiv0=:1YylzN7l3dOnakxZjTaemI
 dkC4SoeTguf1/WgtEqSllmCf3LKOE/kvv8fsBW8/coIlSp6Yei0JrLdlTI0+8nelFNOI3I9bu
 ePa38/iwhGxicL0XexExeFVJUh/3w7yjWAImSROqQABc03+ZfxWbPvQ9yWpOYpKRH+O7fxA3k
 n6UhHsok+Q2PoJu+a5fTHspML6XKP9La8izbWwngNU/H2oEL2QktmGSFOpQDZNtASA2LajeHi
 TPkuN2Zd+hhWrbohdcqaOVCFmRPds2I6wVZaNQ1eZY+KkAOZpDpsYWL6mgqUpsUiAV57LDGof
 OcddGd1K/r7Pe7rT3QGlj5iPquXYqmOJcU1TFr1q72SzkkPQH9oNT4o8J75b6AAeMMSRg3lii
 wwNHk6oHTskcfNhzye5bEOtbE9n3rYvkMhPvbU2ZIw4DZszAfZodKiFoIaGGtalzDsHaD6zK2
 DI4Z2ymML4zjrMv1HJt+hl7K+6KSA8PttWdBA1WTAoVJZJKNdUcuiuZ46Qy6QaVA0FOO10yTP
 PsGGpCPfhurgEyvKGR0OkCvUNwTokBRhlCE26OVsPo5b7F+Us73j+atqplsVIdLn0a+KRn1cw
 b6ZQqQaMEsvCR0zHhY5/TVY9KSmgbg8WiK3JVe6GtWyoDPfb+7CDoC22zdUufAIWXPGyygGRT
 bkHLTCPglixIe5KGGznCcj6FChS1J4lU9P1FiltSqAzvOCf7dAAroP6jrgKFqIs4xKFvb0mAz
 HYP5tI/jQfYIjjwgUNbNGcQCeJfE/Daag/GcvcOqM6xW+J6wQjKNVJGI4dtEbx780LYblAjr7
 Vxcfzl/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_015151_765202_ADF56A0E 
X-CRM114-Status: GOOD (  27.61  )
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

this commit is merged in 5.17-rc1 and breaks scpsys on mt7622/bananapi R64

mtk-scpsys: probe of 10006000.power-controller failed with error -2

at least ethernet is affected (i guess usb,sata,btif,... too, but not checked), as gmacs do not get probed as depency of it

after reverting this commit it is working again.

have not yet digged deeper into it why it is failing, but maybe author has an idea

regards Frank

> Gesendet: Mittwoch, 22. Dezember 2021 um 02:51 Uhr
> Von: "Jiasheng Jiang" <jiasheng@iscas.ac.cn>
> An: matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, "Jiasheng Jiang" <jiasheng@iscas.ac.cn>
> Betreff: [PATCH v2] isoc: mediatek: Check for error clk pointer
>
> On Wed, Dec 22, 2021 at 01:57:15AM +0800, Mark Brown wrote:
> >> +	for (i = CLK_NONE + 1; i < CLK_MAX; i++) {
> >>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> >> +		if (IS_ERR(clk[i]))
> >> +			return PTR_ERR(clk[i]);
> >
> > This now pays attention to the error code here which is good but...
> >
> >> -	init_clks(pdev, clk);
> >> +	ret = init_clks(pdev, clk);
> >> +	if (ret)
> >> +		return ERR_PTR(-ENOMEM);
> >
> > ...then discards it here with a random most likely inappropriate error
> > code.
>
> Yes, you are right and now the return code depending on the
> init_clks().
>
> Fixes: 6078c651947a ("soc: mediatek: Refine scpsys to support multiple platform")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
>
> v1 -> v2
>
> *Change 1. Change the return code.
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index ca75b14931ec..670cc82d17dc 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -411,12 +411,17 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  	return ret;
>  }
>
> -static void init_clks(struct platform_device *pdev, struct clk **clk)
> +static int init_clks(struct platform_device *pdev, struct clk **clk)
>  {
>  	int i;
>
> -	for (i = CLK_NONE + 1; i < CLK_MAX; i++)
> +	for (i = CLK_NONE + 1; i < CLK_MAX; i++) {
>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> +		if (IS_ERR(clk[i]))
> +			return PTR_ERR(clk[i]);
> +	}
> +
> +	return 0;
>  }
>
>  static struct scp *init_scp(struct platform_device *pdev,
> @@ -426,7 +431,7 @@ static struct scp *init_scp(struct platform_device *pdev,
>  {
>  	struct genpd_onecell_data *pd_data;
>  	struct resource *res;
> -	int i, j;
> +	int i, j, ret;
>  	struct scp *scp;
>  	struct clk *clk[CLK_MAX];
>
> @@ -481,7 +486,9 @@ static struct scp *init_scp(struct platform_device *pdev,
>
>  	pd_data->num_domains = num;
>
> -	init_clks(pdev, clk);
> +	ret = init_clks(pdev, clk);
> +	if (ret)
> +		return ERR_PTR(ret);
>
>  	for (i = 0; i < num; i++) {
>  		struct scp_domain *scpd = &scp->domains[i];
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
