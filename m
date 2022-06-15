Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8F2C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ty1RxSdadl9+9NVwFX4A9nsRzhPnvvUrH+LaNBwqcY=; b=gzUZh5KpfQK6QZoNxayJJBK1Gf
	9RsuFaPa3RLDrxxPBrjW2xxTj1kawNXAO28XIpv1izfFcboqSiUeKu8Pc7LtO1DV8v8eYwsQfIuVb
	/OafbzoWpymRFOM+9SlCkKw9YLkcfBXqtd6h9aAsURAfeSynuaHvzJ9WtGHRcX7Lq9O6qGLo4O3Gy
	PwW2l6je3sk6XvjS6/xmT4+SYeIKGABy2C1AOy7WAwkkWG844ip2/VDT8+fUQsjf3RSiIiKaUYplG
	3lkFIowwGqyKIfQGmNgHm9oK4bq+nD5IN/tGK2NNKsefABMbMrUTGKDUsuFuVB/fG/wmTd5DP2G/d
	rrrR/+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1awJ-00GXRP-Bz; Wed, 15 Jun 2022 21:52:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1aw8-00GXO2-QA
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 21:52:30 +0000
Received: by mail-pf1-x42c.google.com with SMTP id s37so9926515pfg.11
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0ty1RxSdadl9+9NVwFX4A9nsRzhPnvvUrH+LaNBwqcY=;
        b=mOTOZ38DU8s4FzE5wLrQa/baN9X5EK/Chdacc1xywG2axFJn81QfX1V4bPIuELWZ54
         7ly9GjZPTmsy8LCK2YJVT9ahruaGGsA2w3Zvbyr6hDXHlKeWsVdpye1RcJcaaV7/gYy4
         zYRhDLUPdYD6j6CXrK8RPHMOD27iyCam7fboYjf4YCDK2c0LCwQiuu3Xf79EyySoH67N
         k9fVd2obk+DQ0Y9R6YIQ4/0NwDe6+48zjG7vN29CnhD91xx7oCaGTDWIhl3U8HpsAeFQ
         QN0b8/UEA0VimsxVYO49LMh1ahxH7QpdwwzX4e2i/0Oq0Sr9XqixhVARtkXJMWmw25ps
         TsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0ty1RxSdadl9+9NVwFX4A9nsRzhPnvvUrH+LaNBwqcY=;
        b=ovTmHHh5SiwBUETsOM0e2ywF1QhoRVOPD1//hKYH+xpoX+EcmHyObDhVtlqOYAP0J3
         jCAW3cpSKOXV5tVx3TfgyMOuV5iVD7InuqfwXhkMyyYPcSLN66z/056+vH6eJ5BcAIfD
         kIvA0XgZHKaxa2+S1jqdgkkvw7P+od2B9bgBXplGZsAkQVc5feMC/6GWoTtrA/NF1xfl
         qTfKXiWEzXPp762nl7NJydld5rDkLLfEwqSTK+pXQJ1uod/L0HNPXTrZLf0i5NiJS+um
         +bQ0v5YRcCBa6pXGbTqpqxHcOIjY8GbbRMd7GBUxv+j2NgKgkVuFCNKSvZq4KgyRv7OZ
         aqBw==
X-Gm-Message-State: AJIora/6cHxGJG6NaVZ8lK/xsutMCtT9NLRrEUqBXyKgipYqqISbY3o2
	0pk+mYs170+LrPyGK5fJSim8fA==
X-Google-Smtp-Source: AGRyM1uI1Sje76zEXKJGG1p78/HpCUSQaVRb3IjIorpckoBM3clSfQzXUTyCe6Ie40563QpO7eiN+g==
X-Received: by 2002:a63:8941:0:b0:3fc:7efa:119d with SMTP id v62-20020a638941000000b003fc7efa119dmr1644975pgd.340.1655329947256;
        Wed, 15 Jun 2022 14:52:27 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id f10-20020aa782ca000000b0051bd9981cacsm110643pfn.123.2022.06.15.14.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:52:26 -0700 (PDT)
Date: Wed, 15 Jun 2022 22:52:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: mt6397: Add basic support for MT6331+MT6332 PMIC
Message-ID: <YqpUmE5+Kmq9rxwB@google.com>
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <20220520124617.228808-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520124617.228808-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_145228_874502_11574AB7 
X-CRM114-Status: GOOD (  17.16  )
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

On Fri, 20 May 2022, AngeloGioacchino Del Regno wrote:

> Add support for the MT6331 PMIC with MT6332 Companion PMIC, found
> in MT6795 Helio X10 smartphone platforms.
> 
> This combo has support for multiple devices but, for a start,
> only the following have been implemented:
> - Regulators (two instances, one in MT6331, one in MT6332)
> - RTC (MT6331)
> - Keys (MT6331)
> - Interrupts (MT6331 also dispatches MT6332's interrupts)
> 
> There's more to be implemented, especially for MT6332, which
> will come at a later stage.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/mfd/mt6397-core.c            |  47 ++
>  drivers/mfd/mt6397-irq.c             |   9 +-
>  include/linux/mfd/mt6331/core.h      |  53 +++
>  include/linux/mfd/mt6331/registers.h | 584 ++++++++++++++++++++++++
>  include/linux/mfd/mt6332/core.h      |  53 +++
>  include/linux/mfd/mt6332/registers.h | 642 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   2 +
>  7 files changed, 1389 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/mfd/mt6331/core.h
>  create mode 100644 include/linux/mfd/mt6331/registers.h
>  create mode 100644 include/linux/mfd/mt6332/core.h
>  create mode 100644 include/linux/mfd/mt6332/registers.h

[...]

> +#endif /* __MFD_MT6332_REGISTERS_H__ */
> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
> index 1cf78726503b..4d2b80319db3 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -12,6 +12,8 @@
>  
>  enum chip_id {
>  	MT6323_CHIP_ID = 0x23,

> +	MT6331_CHIP_ID = 0x20,
> +	MT6332_CHIP_ID = 0x20,

Are these meant to be the same?

>  	MT6358_CHIP_ID = 0x58,
>  	MT6359_CHIP_ID = 0x59,
>  	MT6366_CHIP_ID = 0x66,

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

