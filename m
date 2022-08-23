Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A7C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCZVKueJFWTVqGgf5laKNPR1ALkCEtWWSEFFSVbljXw=; b=I1vctiWA6PwX/lgqophwb1OPDM
	zf7igW9R8AslID2OSKBxGQelmriAHwVxRfeyUVgSo7vKZ1QaPDAs2cCDOoZTAOqpO9/SUDAC8OjnV
	VOKcwiDL75OqyVwoirtLbEIrFW/HJh7zK4OiMWmnJth4wVwt3+8ngFftGAlVVMF+9T3JdWP90S/3e
	sqt0Y5VoM2GWK4Ho5hhO6iiOJDjkDb4sq2fvha2E2juRqv5BNXQf2DDHTrXtVpkBv5DfvvTj96bOz
	hjUGk/CQY0l/6P/WbJ+40v5KhCPA3rrrHvdmSP7cfQX/c/Vfnm/uSAaw7CZylv7b1ICQvDtalkdz3
	oOd+uAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQckM-0091cA-Of; Tue, 23 Aug 2022 22:51:46 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQckB-0091YW-Ol; Tue, 23 Aug 2022 22:51:37 +0000
Received: by mail-pj1-x1034.google.com with SMTP id r14-20020a17090a4dce00b001faa76931beso18648972pjl.1;
        Tue, 23 Aug 2022 15:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=TCZVKueJFWTVqGgf5laKNPR1ALkCEtWWSEFFSVbljXw=;
        b=hqwHSxYf03YiK+vuHypIwp4MFVfA5Q7jjW+erMpt8oLSYp1+TbPZsvf0j9h8qEy78Y
         KBIoQ1a0ZIW45BO40nV9MNeVEFDaGvlMU+wY5qVT3F6qNrdETTNnK1E9mr/fJZa6yMSK
         CLvf3qVpbFwvwQnmpzVf63Hb5yVDd6Y4Gf8aYlTULq4La9Xs/hon9QRZKuvMegxL2ckt
         rlCZ0o5Mm+J9/a/+MuS1QUCS2Okoahh/+vQvSdYm3UwYlh+JTTWR5tvirDRVy4ZiqOi/
         YM9M76/J5O/x03ufSGw1gyhc39HP75SaV2wDmbj599V19oWvpTULoPn3lDg08J1HLgAq
         WaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=TCZVKueJFWTVqGgf5laKNPR1ALkCEtWWSEFFSVbljXw=;
        b=KLTnBdWPiiSUzmbj0h+1iiIhJyytw+1IMQeVyij6IZVI70cEZJnjdDIKr9SkLaW7wP
         kqkdnywJHCVvHdX/CQn6qJgOg2BwQ7KzGmNtT/3UnTovxOdmhmcwzQG+QG7/hW43Z8cm
         Uf+YOMmaO7kYMOvGS3U1+qr0kkVLA6DiRWyFocdMgPOMnex/mHHQhdUo2wBLibyt+37+
         ZZZt54rDWiGdudnbCVqBWNZy8rzv+XjzfOiT8siSIg1wqp+dOADoVr1nw/9b6S1iYvY/
         N953rWd4brHdhcAqy886afJzuOy7p0AboVT3pg9HKFQQ0dFeEwYuGo3aHwDSyslHX1VB
         hT6Q==
X-Gm-Message-State: ACgBeo0Nc6iDFVpOR7LqVkUas8V26bhRgqhrNJuiVh+CBJ5nWiB3vExA
	U8jmVIP3+GdeV0Pd1cVgk50=
X-Google-Smtp-Source: AA6agR4KpCMf0gNEZx0UGgCHVfmv4BXGqJnuUkNBqC7ZkxD2h9RBqGGtSCMEUFdRphpvJWuq6BifDQ==
X-Received: by 2002:a17:902:a608:b0:172:ffa5:2ed8 with SMTP id u8-20020a170902a60800b00172ffa52ed8mr4889767plq.164.1661295092090;
        Tue, 23 Aug 2022 15:51:32 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id c8-20020a056a00008800b00536bbe91b83sm4349884pfj.157.2022.08.23.15.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 15:51:31 -0700 (PDT)
Message-ID: <df8f1406-e586-3e3c-987c-826b52702a3b@gmail.com>
Date: Wed, 24 Aug 2022 07:51:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] PM / devfreq: mtk-cci: Handle sram regulator probe
 deferral
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 myungjoo.ham@samsung.com
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, jia-wei.chang@mediatek.com,
 johnson.wang@mediatek.com, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220713111511.115007-1-angelogioacchino.delregno@collabora.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220713111511.115007-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_155135_850352_E8CA9B97 
X-CRM114-Status: GOOD (  19.03  )
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

On 22. 7. 13. 20:15, AngeloGioacchino Del Regno wrote:
> If the regulator_get_optional()	call for the SRAM regulator returns
> a probe deferral, we must bail out and retry probing later: failing
> to do this will	produce	unstabilities on platforms requiring the
> handling for this regulator.
> 
> Fixes: b615b00c42da ("PM / devfreq: mediatek: Introduce MediaTek CCI devfreq driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/devfreq/mtk-cci-devfreq.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
> index 71abb3fbd042..e5458ada5197 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -291,9 +291,13 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
>  	}
>  
>  	drv->sram_reg = devm_regulator_get_optional(dev, "sram");
> -	if (IS_ERR(drv->sram_reg))
> +	if (IS_ERR(drv->sram_reg)) {
> +		ret = PTR_ERR(drv->sram_reg);
> +		if (ret == -EPROBE_DEFER)
> +			goto out_free_resources;
> +
>  		drv->sram_reg = NULL;
> -	else {
> +	} else {
>  		ret = regulator_enable(drv->sram_reg);
>  		if (ret) {
>  			dev_err(dev, "failed to enable sram regulator\n");

Applied it. Thanks

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

