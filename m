Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9393ACDB479
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 04:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKtWlzZGcSqpr4oYtvBHGz8mTHnWwBOUsRR1pMRsq7A=; b=aiuWxLsiR+6ByKJcoIlg7oiqlV
	9A+x2mtd6pUQTlxSAr+HddXviT6N6GKlHQUZErHMldmHCxqZO/AIDVMo4xrIGR8KtUxWjKjXRd6Xa
	Qn8kzoeFO+/hJE+D2xl62kvWkUuKXxIMQ0uv/8J/N06NQWqlklul0FyfRa7W15JEfGp1pyKpQsK0b
	eTZk3jSxvYsGzC4IFpZL+/KN0dYaqwqj/A05CCNpqk2Bxeoqs6SNNGFoqInsyRXOiUXrBFC8DpLOn
	sqSGnWOBgduUht7WcdbhFUa+DkeSZjOKPk1O5Lt4Eq86ILEB2vLCs2iaOqO/imrMdx3cNpb20d6dg
	zonv1iQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcF0a-000000077HU-0VjM;
	Wed, 24 Jun 2026 04:14:40 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcF0X-000000077Gj-0Wcy
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 04:14:38 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-139b914bab6so676034c88.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2026 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782274476; x=1782879276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vKtWlzZGcSqpr4oYtvBHGz8mTHnWwBOUsRR1pMRsq7A=;
        b=QD+wXeX2AQmbdjvDbU1MmIoH/1JVYUGzXK/h/nrzFi63kw5EIhgh2lq3HDBAogM5j8
         mBpTriNdPsWExfyn9NMa6rVAAlocVrjE91EYE/3EPi5jR0iIVatYSg7fke/AeSVdHd0m
         ZRlk1rU4U3iDGuaFWQ803/Jx/yd/gb7w6CPTqkv+uZS9DqgkZsy6H16GcEJFugukx0v4
         5GvcrhLlMu9wFyge+4/qtw6LEMN+r2JraxoVyAKRPVAQQ1i14ehMtpAVGC9OQiJ6NYzs
         psKy6MFzQaowWjFB2pSoLE8BzBEcziGQ1rcOSvOyPFZmL+5E3dmdt3qOwhoNtrDDo4UW
         L55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782274476; x=1782879276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKtWlzZGcSqpr4oYtvBHGz8mTHnWwBOUsRR1pMRsq7A=;
        b=XKMF9p2tLODT/npGlZsF8QFUq0mus5rME10NAa+zhTtqdkGBeEiyXtYKNcqIqY5LaY
         ChHZ9/xRuP+9WJNtCs9DBjFiL+SXQiv85FKESfExClIQ1ti/u1EDCbgi7+3Foe4U4gXs
         jlcX1iqwIlOjhGDsNtDFhiV5HkN6vqbgBH7xVR1qBDvLGomyN9FcewyY7HWX8uKmhX3U
         9E59UGZNNNXeITkM23x/nCLwwrrxbagJYXvCx805wKnOTiQ3Yta2Kvm4fk8MlQKjrqJP
         43Xy9KkE1g27H4v5VPTxEaHtu8SvI6vdZeVoiqhjl5Dsy/QLf02yn8TFuIvbRjOZ78w4
         Jq3w==
X-Forwarded-Encrypted: i=1; AFNElJ8IehQMJrXRS9/5g1dlo2Gx8Wvx3UqrrPR/112A5y59CxLKdMgMAIWs1ggReLIVTCS6xqbcUcdyHGlnMqpYjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWrsq15il5P8ogN43xsd1tVgb6tSkPyfG2XV8pUE5pMzRKiRfo
	RP0nYdnJRiIc9NkrASN+EmFRaQghSqe7lkVUXMXiwSsH9IgSbaVnue8I
X-Gm-Gg: AfdE7cnyS7f9CAdP7PZXlc4cN4NO08xkV0ITiIkpVN6VLjIaDOTxOnzLXB5xJQ4B5TI
	KBp0IvuYv6rnsnwnepL/kTnB4Q2RpGGL02huhi2wRZ5X6HlwM4cmFKPkzWpqmetmZPFiUkEDLvR
	q8Q4+7GShjmc7vWEVMiN9RGTmvAyeF7u0OrS8zKur0e6dOSxWtPmkbQ815eTktwKBmaXFggATWO
	Wqd1LARkfwsb3+z6r233HOQO0NbQSFbdmQrHi5WxBHibl+XaU2jsDnMsC45m+RhJWvCwt/+lmy3
	BDxd+pppmXHQbSBCR4McFtzd0SVzVvqfyS/bAq8TneJ8gRr4TZLt/P3LmGPNFbGJe4TOKi84wZs
	p1qP7Fdln9FlLehSpd0TE5M4Qw8xhOPz8gsgbLs6tR86mwVrwns76cNmGn2hTynWXfV7PzsEKNS
	DWOo5cAaMSQyEz+r5ExwIk6ApLdcTNzeE6gZyFu4Ks9+ofwxRSmRA56g==
X-Received: by 2002:a05:7022:128f:b0:138:5049:cb7c with SMTP id a92af1059eb24-139d0cd9467mr1322277c88.36.1782274475590;
        Tue, 23 Jun 2026 21:14:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:6026:1e6d:4a80:9bd0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d6edsm20547205eec.14.2026.06.23.21.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:14:34 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:14:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Count available keys during probe
 instead of pre-counting
Message-ID: <ajtX-cVWFmmkVO7M@google.com>
References: <20260528235600.312045-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528235600.312045-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_211437_201043_2660AD23 
X-CRM114-Status: GOOD (  26.18  )
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

Hi Rosen,

On Thu, May 28, 2026 at 04:56:00PM -0700, Rosen Penev wrote:
> Replace the separate of_get_available_child_count() pre-count and
> validation step with a single pass through for_each_child_of_node_scoped().
> Skip unavailable child nodes and bail out if more than
> MTK_PMIC_MAX_KEY_COUNT available keys are found. Set nkeys after the
> loop so suspend/resume iterate only over initialized entries.
> 
> Also use a key variable in the loop for clarity.
> 
> Use of_device_get_match_data() to fetch the PMIC key register data directly
> instead of open-coding an of_match_device() lookup.

Please split this out into a separate patch.

> 
> This also lets the driver drop the of_device.h include.
> 
> Assisted-by: OpenCode:BigPickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 53 ++++++++++++--------------
>  1 file changed, 24 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c78d9f6d97c4..e34856693ee2 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -16,7 +16,6 @@
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6397/registers.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -147,6 +146,7 @@ struct mtk_pmic_keys {
>  	struct input_dev *input_dev;
>  	struct device *dev;
>  	struct regmap *regmap;
> +	unsigned int nkeys;
>  	struct mtk_pmic_keys_info keys[MTK_PMIC_MAX_KEY_COUNT];
>  };
>  
> @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev)
>  	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
>  	int index;
>  
> -	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> +	for (index = 0; index < keys->nkeys; index++) {
>  		if (keys->keys[index].wakeup) {
>  			enable_irq_wake(keys->keys[index].irq);
>  			if (keys->keys[index].irq_r > 0)
> @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
>  	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
>  	int index;
>  
> -	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> +	for (index = 0; index < keys->nkeys; index++) {
>  		if (keys->keys[index].wakeup) {
>  			disable_irq_wake(keys->keys[index].irq);
>  			if (keys->keys[index].irq_r > 0)
> @@ -325,24 +325,23 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tbl);
>  static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  {
>  	int error, index = 0;
> -	unsigned int keycount;
>  	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
>  	struct device_node *node = pdev->dev.of_node;
>  	static const char *const irqnames[] = { "powerkey", "homekey" };
>  	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
>  	struct mtk_pmic_keys *keys;
>  	const struct mtk_pmic_regs *mtk_pmic_regs;
> +	struct mtk_pmic_keys_info *key;
>  	struct input_dev *input_dev;
> -	const struct of_device_id *of_id =
> -		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>  
>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>  	if (!keys)
>  		return -ENOMEM;
> -
>  	keys->dev = &pdev->dev;
>  	keys->regmap = pmic_chip->regmap;
> -	mtk_pmic_regs = of_id->data;
> +	mtk_pmic_regs = of_device_get_match_data(&pdev->dev);
> +	if (!mtk_pmic_regs)
> +		return -EINVAL;
>  
>  	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
>  	if (!input_dev) {
> @@ -356,31 +355,26 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	input_dev->id.product = 0x0001;
>  	input_dev->id.version = 0x0001;
>  
> -	keycount = of_get_available_child_count(node);
> -	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> -	    keycount > ARRAY_SIZE(irqnames)) {
> -		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
> -		return -EINVAL;
> -	}
> +	for_each_available_child_of_node_scoped(node, child) {

Let's keep using for_each_child_of_node_scoped() and check
of_device_is_available() inside the loop. This will allow marking a key
as disabled without shifting it's meaning (power key vs home key).

In the rest of the driver we should be able to determine if key is set
up checking for key->irq > 0.

Thanks.

-- 
Dmitry

