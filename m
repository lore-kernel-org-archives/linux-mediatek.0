Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846AFC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfCQxeXH44txeLYfAR63mxbUPTOmZEEOWcD5Gxh9IXU=; b=WHiJTSWPbDIPKaZ8yYfXNaM+3x
	qYZ0Gl6gKZAi5Enh8T7sRmm7KFWDzpo6UXp4mT0aenVVXJo6LMwKBzpJzlf0YS2ksy/bhQZc6ZT6G
	K8WqScKyYjPYdAc+G7x2iRMQ9Fl/UghHmQ5oyw078Ww8FOdKNhYSrMGXqqe4vKwv9kj1+EyRkCyVg
	U6zoB5YO7paLaqWAL3dXHPXCw5B9JiDRfW0cuOZHSWUxkrcBW9lGYMUD9H0lqVsvDIoY1Nr912aak
	79t8KVLm8agV8SN5GGLnx1UCk5R5qpWhgpFHZd6o6g/oUO6h4kt2i/WxhI/SYGMl3jhsTJrcYrbEt
	eR6S9C0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Ja-004QIS-15;
	Wed, 19 Apr 2023 07:33:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2JX-004QH5-10
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 07:33:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-2f3fe12de15so1903320f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681889592; x=1684481592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MfCQxeXH44txeLYfAR63mxbUPTOmZEEOWcD5Gxh9IXU=;
        b=smdxdk7t2jmP9sljnoleeuMnuYo7h8ompBMv1/GpjvOul4Sym81MnGLrcOTm8a6LTj
         yLTn6aMCSlQUdEYsVs9413kORKxK/sKQK5LaG8NNjTbCD8YMDBXj6vFFZVAaRIeoJYoY
         N/o7kgFPeLvQVWGWJqGSckItHwmN1kjkMM6ffIl2O6/w4i9NDXh0jCN0e+x3SysYrTsP
         mKe9gwNaGeEuvqhquVsiqAQgwzoaZMB7vqaVeg055tD1gTa7MouVPKgtblKcSYj/APwp
         ptNTIyG6XvcH0Kz3e5dlhfNOq0OHo0YCDOGEaNhIHzRfFyqlXgTvsZQDaS1qQXqNqFhe
         r7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681889592; x=1684481592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfCQxeXH44txeLYfAR63mxbUPTOmZEEOWcD5Gxh9IXU=;
        b=lJQNXpw0fkNuC4561Wki89kGSxzKafKs9Oeqb/zQNAI5jJ+jq/fgaWHvaf5+IWDP1f
         9wk8v/XWvlIcUEipq2+TeiEPRZ1AiMnHGX5eLCy6my00C0T6vNz+QXw2lsias6Rata23
         IhPDIN+GdYss84o56BQfUfSpNLBTKxw7a7pTZPHhqtWwsjsOO4OjQ4ExwTc0Im9+WeBp
         ButO45FFSH4Dw/V4tzCCFOzfHlj2jqbHnRDD7DBOTp7KC91pYe65IF+0Dsx2WoA+pIzL
         G1a7t2t4yDLF40nof0vexXGaUZcdks6DW/Z4sd7uD+EOKKXxTpMI1t6Fc/d826i9aj0V
         8W/A==
X-Gm-Message-State: AAQBX9dF/X2CnGzesWqLiRYiZaT4XPe9aEz/EKzMfRnQXN9tIF6ke6Pj
	wM4cuyiwUJj3ICoSFLoomM/mqQ==
X-Google-Smtp-Source: AKy350Y6fkmsUz9/iCx6NSfuOLJOUsVGfZcsVc4Ij7DNyNaugEStDn+dBRhpqmOMD1+pyvi5+vn8hA==
X-Received: by 2002:a5d:4011:0:b0:2f4:f727:14b9 with SMTP id n17-20020a5d4011000000b002f4f72714b9mr3358907wrp.43.1681889592227;
        Wed, 19 Apr 2023 00:33:12 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m25-20020a056000181900b002f90a75b843sm9684787wrh.117.2023.04.19.00.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 00:33:11 -0700 (PDT)
Message-ID: <125cfb20-271f-9746-9bd3-eb3637a6648d@linaro.org>
Date: Wed, 19 Apr 2023 09:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] MediaTek AUXADC thermal: urgent fixes
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 rafael@kernel.org
Cc: amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 aouledameur@baylibre.com, bchihi@baylibre.com, daniel@makrotopia.org,
 ye.xingchen@zte.com.cn, hsinyi@chromium.org, michael.kao@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230419061146.22246-1-angelogioacchino.delregno@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230419061146.22246-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_003315_392571_DBB64E81 
X-CRM114-Status: GOOD (  15.23  )
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

On 19/04/2023 08:11, AngeloGioacchino Del Regno wrote:
> The AUXADC thermal driver unfortunately has issues with a fixed wait
> at probe, as this is not only SoC dependent, but actually depends on
> the board (and even aging...): for example, that works fine on the
> Chromebook that I have here in my hands but not for the ones in our lab.
> 
> Some machines are working fine with that 30ms delay at probe, but some
> others are not, hence I started digging in downstream sources here and
> there, and found that there actually is a valid temperature range for
> at least auxadc-thermal *v1* and can be actually found in multiple
> downstream kernels for MT8173 and MT6795.
> 
> As for v2 and v3 thermal IP, I'm sure that the v1 range works fine but
> I've "left room" for adding specific ranges for them later: this fix
> is urgent, as many MT8173 and MT8183 Chromebooks are failing tests in
> KernelCI due to thermal shutdown during boot.
> 
> For the KernelCI logs, you can look at [1] for 8173, [2] for 8183.
> 
> [1]: https://storage.kernelci.org/next/master/next-20230405/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-kms-mediatek-mt8173-elm-hana.html
> [2]: https://storage.kernelci.org/next/master/next-20230405/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
> 

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


