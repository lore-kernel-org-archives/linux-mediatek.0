Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A95C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qfNUhMcJlVHTX5ugL614Z3rtxdFD686ztYoNw3q9y0=; b=hf2LBLKBPNHlHogfDjiQ10ReGV
	mWyouo+lrRBYOo/Mfh1zQuhe8aeOD3BhVy801+Qj4dgytl3XLKZO6+xQ7JbCsdGGvAh3Su+4OwwNJ
	ixH/nzn5xvytF3mAn4W2PNn9AAe1cpMq9gD1DmvoJ2vVrR095Mygyikjal1bcAyG58hgSNeoDRokE
	f+q0S0TVSCxhBBvhfZHta6OcJ1qX6zhVHobM4B7Owf6Ebqbvmz+Vi4xtT6+X2ew3xdkSXrfDFu+ar
	QctHhCqtpTnAEFVjFl2mI7RaZaPLHSpOe1keVS1UbpJlq4gbjhkAnvBW6YN8IKrQfcDxpb3FLARbA
	RbQ3SDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFS6-00479F-1D;
	Wed, 16 Aug 2023 12:16:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFS1-00477v-2w
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 12:16:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c0cb7285fso800951366b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692188192; x=1692792992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qfNUhMcJlVHTX5ugL614Z3rtxdFD686ztYoNw3q9y0=;
        b=H/mJ78nNtCoBbXVd1duxJf4+gPfM/iAJ2ovVQOTaNuEHibJJ0xCPAsD+UwT58Txvew
         mZTl64AXOEbMKm1wpNSzXPR9c95y+Bo1aEclJmNykBPSL3PznqC4mdCOuGQ0WLqqiks9
         OpJO0LXuPmjoEZXiHBM8mOdJaJ6osZp9Mvw38j4xtaKRO8Dz3sVXr7ZzMc/prB5lxFii
         OnBLkh+O+A5yMoahjDthsJ2sRvR7D4LGtj07ibRjO4yK5USOH+N/UALLo2SCAhpNMovg
         7cjq2Fnt1873ZEPdyk2lvjJABIEbMy4HWlFjRGUS/QsMeEYt8+h6ypqlIgrlCXAxc6r2
         48cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188192; x=1692792992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qfNUhMcJlVHTX5ugL614Z3rtxdFD686ztYoNw3q9y0=;
        b=gfRXM8HRmNSBOaHnX45Rx/jyzQS8nbM6BcKkdiJ/KFE5oLDrVC4+mIz1P7m+X+25ty
         GjppEXwLHjjm0hKglf0GMfd25POf8mWHy8wZ5nNfHyRuVrUIBc0abbx3gW6jRGKlx6sI
         hh5TQsNVUoOflyJHCHU1lt9UDMaIedKdpyV5xHo3GRgGfQvTQbUcTqlWcSFsja9Hod6b
         ZRX4Ke4GO0Vswi7V7ipvTlPnJ1S6GXPOvxTRoQdwHUrbqqGinaHsdTy4hNs5wRn+VUYo
         q3aQzr8LpAMWr8L6WbchVh3O4ipM7t//hMU3D3RtBofO3+rC3MMiQIXMq8JwNx9QHLx6
         goxQ==
X-Gm-Message-State: AOJu0YxntdCfnQQkCRSBaKueSoc1sVGE5eSHiEApj58bmp4hQ3+iouUW
	e+f39oCsIDWqKaEukcmAKlXWSg==
X-Google-Smtp-Source: AGHT+IH2npSDQNyY7+hshJrvpkJswRw8jux0gNkJJiFZHSRMt71tiA/2TE9iIxDK3yb7mgMZsTxffA==
X-Received: by 2002:a17:906:704c:b0:994:2fa9:7446 with SMTP id r12-20020a170906704c00b009942fa97446mr1221712ejj.46.1692188192549;
        Wed, 16 Aug 2023 05:16:32 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.44])
        by smtp.gmail.com with ESMTPSA id rl24-20020a170907217800b0099bd1ce18fesm8538796ejb.10.2023.08.16.05.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 05:16:32 -0700 (PDT)
Message-ID: <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
Date: Wed, 16 Aug 2023 13:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
To: Michael Walle <michael@walle.cc>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 "Miquel Raynal )" <miquel.raynal@bootlin.com>,
 "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
 <6702bac712daab13698b9bb9ad81d49e@walle.cc>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6702bac712daab13698b9bb9ad81d49e@walle.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_051638_008167_F193CF9E 
X-CRM114-Status: GOOD (  25.23  )
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



On 8/16/23 12:51, Michael Walle wrote:
> Am 2023-08-16 12:38, schrieb Hsin-Yi Wang:
>> gd25lq64c has Quad Enable Requirement flag parsed as
>> BFPT_DWORD15_QER_SR2_BIT1_BUGGY in BFPT, even if spi-{rx/tx}-bus-width
>> set as non QUAD, eg. 0, 1, 2... Thus quad_enable will not be NULL and
>> quad enable (QE) bit will be set to 1 by default. According to
>> datasheet[1], if QE bit is enabled, WP pin will become IO pin and the
>> system can't use write protection feature, and it's also not recommended
>> to set QE bit to 1[1].
>>
>> Add a post_bfpt fixup that reads spi-rx-bus-width to remove quad_enable
>> if the width is set to below QUAD mode.
>>
>> [1]
>> https://www.gigadevice.com.cn/Public/Uploads/uploadfile/files/20220714/DS-00012-GD25LQ64C-Rev3.4.pdf
>> page 13
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
>>  drivers/mtd/spi-nor/gigadevice.c | 28 +++++++++++++++++++++++++++-
>>  1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
>> index d57ddaf1525b3..8ea89e1858f9b 100644
>> --- a/drivers/mtd/spi-nor/gigadevice.c
>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>> @@ -33,6 +33,31 @@ static const struct spi_nor_fixups gd25q256_fixups = {
>>      .post_bfpt = gd25q256_post_bfpt,
>>  };
>>
>> +static int
>> +gd25lq64c_post_bfpt(struct spi_nor *nor,
>> +            const struct sfdp_parameter_header *bfpt_header,
>> +            const struct sfdp_bfpt *bfpt)
>> +{
>> +    struct device_node *np = spi_nor_get_flash_node(nor);
>> +    u32 value;
>> +
>> +    /*
>> +     * Even if spi-{tx,rx}-bus-width is set to DUAL mode, due to the QER
>> +     * flag parsed from BFPT is BFPT_DWORD15_QER_SR2_BIT1_BUGGY, so the
>> +     * quad_enable will be set and QE bit set to 1.
>> +     */
>> +    if (!of_property_read_u32(np, "spi-rx-bus-width", &value)) {
>> +        if (value <= 2)
>> +            nor->params->quad_enable = NULL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static struct spi_nor_fixups gd25lq64c_fixups = {
>> +    .post_bfpt = gd25lq64c_post_bfpt,
> 
> No. Please fix it in the core and not just for this part. To me it seems

The core seems fine to me. We already adjust the hw caps by keeping just the
hardware capabilities supported by both the SPI controller and the flash,
see spi_nor_spimem_adjust_hwcaps(). If you set spi-rx-bus-width = <2>; 
(spi_nor_get_protocol_width(nor->read_proto) will be 2, thus the quad enable
method will not be called. Are you sure you don't have the quad enable bit
set by the bootloaders? Please add some prints and check whether the
quad_enable method is called or not.

> like a fundamental problem and that commit 39d1e3340c73 ("mtd: spi-nor:
> Fix clearing of QE bit on lock()/unlock()") is broken in that regard.

what's wrong with the mentioned commit?

Cheers,
ta
> Tudor?
> 
> -michael

