Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714C2C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:58:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BCE613F0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BCE613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zW6YNJqvOd9hV8IfJLy8rFUgXfBYo1KVI5sKmvb1BEg=; b=1LreL34ccX4M5AmlXf5oocy3QT
	6+eijyv61eNrDoi8M2qzI0X6M+RxHCcoSp+Xk4Q+Bsq33efJegOwu1uvZfqP1vvKTx6r0r2E8fYLt
	BN6ey/16FS4A2n8TT2ycIVvqhSUR0RjOcW0CI6ysco05rTsyAOjgxhfuoJ1Ri9+OgvSRSjnWNrpgW
	iOZpu9sd9WtXFpm2MSYZ30uYq377p6Qj73Z/7H7TS9+123V/IULnvuWos5MJbsAboSTy9kO+wH9zn
	+Xz014PyQae6srBqv1MT1Dn0xXqwI1hzhnz33X2gUj25SsheQ3usRP6HP/grZMEwTlrICDn8/Ytrm
	9i0rRT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loQSB-004CrS-1G; Wed, 02 Jun 2021 12:58:35 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loQ5q-0046ed-PV
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 12:35:32 +0000
Received: by mail-wr1-f44.google.com with SMTP id q5so2142866wrs.4
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Nhkur6Md4F0lV5cADokhI9e1ZbvHW/X/CRyud57vlc=;
 b=mjITBjbjMNgFAedpoaAjzKs6GG7aw2Irys+uxuasdvv+6kOw6nIT0PTcb4SUwWGSpS
 ++cCdocjqVC1DbO1CxGdHNaABJXcI8jts1CWpY4pX0tXEzuk+bhelHIuXzk2NsGJ131j
 d1GhUbXF1HBOiWb8mLhKNiEdIoCp8YQB5rY5XF38Y/hJscxVazCerAAxE6rNQ0cP5VG9
 gh1iZiNNk+kfsW0cuXvXwxu7iXFqXr4YX1LrZo/sTHBEvdNz6jFXOYVYdUjAKqBvtH4c
 HsFS9fiBzQAWLsUPS9wkqOc41FBxf9keEaBlQM7okKF3i9Dm3GzH3g7OjkxTek+cLnF2
 DeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Nhkur6Md4F0lV5cADokhI9e1ZbvHW/X/CRyud57vlc=;
 b=hYGVzzN+2OPbSftfZjgi9tprY6DSjwCBB/dvshzfG3G11PyAXpXBMP/bcBtrGa5MMR
 kg3sNDhdu+DIgtWu/9DmHJcmkHdpkL1+Nl3XHJLIMXxztiGMrYnRsCdC2WLtylw9crwr
 /SBo5+P+QMV1WRaqXQ9KIMKi4zkJYj3fUrhmulUnCuQexIItBnORQfjHRZja5QYIRD0B
 CsAHT5sashbrYRmVPCggMQyf9GasFq5sIVME3kPGWxReVQ9NRfdOLgwvpRnCSUQgclz5
 ys8t+TxznC+9hhHip7YOZNI8m/3OUwkBAcqvKlrkh/5DJTLOlY50lMKSLGBqwxSQZAR4
 FgQQ==
X-Gm-Message-State: AOAM53063XyrBQp/zD9F6O8a1LmnDLtQoOBshcXwV3cWLlokfrtslekr
 OwGQWHifK7VvTl4eBxTSi0M=
X-Google-Smtp-Source: ABdhPJySDC47e40En/SdS8eSyMtPUoz4xjHmatsVacgtshZ8EQ5TLQymqeonDr1136tfqGOhH3/LBg==
X-Received: by 2002:adf:f708:: with SMTP id r8mr6328716wrp.159.1622637268881; 
 Wed, 02 Jun 2021 05:34:28 -0700 (PDT)
Received: from ziggy.stardust ([37.223.145.68])
 by smtp.gmail.com with ESMTPSA id a11sm6498658wrr.48.2021.06.02.05.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:34:28 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: mediatek: move bit assignment
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <20210528091945.411471-1-linus.walleij@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b3d9f92d-a311-0093-4243-b21f2646997f@gmail.com>
Date: Wed, 2 Jun 2021 14:34:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528091945.411471-1-linus.walleij@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_053530_886319_25F6EE36 
X-CRM114-Status: GOOD (  22.43  )
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

Hi Linus,

On 28/05/2021 11:19, Linus Walleij wrote:
> The bit needs offset to be defined which happens some lines
> below. Looks like a bug. The kernel test robot complains:
> 
> drivers/pinctrl/mediatek/pinctrl-mtk-common.c:137:12:
> warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
>            bit = BIT(offset & pctl->devdata->mode_mask);
>                      ^~~~~~
> 
> Fix it up by reverting to what was done before.
> 
> Cc: Fabien Parent <fparent@baylibre.com>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Cc: linux-mediatek@lists.infradead.org
> Fixes: 9f940d8ecf92 ("pinctrl: mediatek: don't hardcode mode encoding in common code")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 9fe91e11a877..525b1aa7f7a6 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -134,7 +134,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
>  			pin, pctl->devdata->port_align, value, arg);
>  	}
>  
> -	
> +	bit = BIT(pin & 0xf);

I see this is already applied to linux-next, but I think the correct fix is to move
bit = BIT(offset & pctl->devdata->mode_mask);
just before calling regmap_write(...)

I can provide a patch for that, if you want. Just let me know if I should base
it against linux-next or if you will drop the fix proposed by you?

Regards,
Matthias

>  
>  	if (arg == PIN_CONFIG_INPUT_ENABLE)
>  		offset = pctl->devdata->ies_offset;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
