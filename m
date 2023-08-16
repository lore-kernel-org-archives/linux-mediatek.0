Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BE4C04A6A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yruZKqzLaC+4643Ot4X60prS0Wm0q5EyxySlt1tCThc=; b=zCc77aosy0DMhnRJ80fJlUvDwn
	BR28Mnp/Z3F7LWW9cv0kPzJgFMAVCWv2aINIb0Pkwj/KtO2ug6yDl+pjHxAHyxbQeyi3gEfHrLN5v
	MW25ZnL+Uqayx8dHEzyX5h56KYXIneqLIcmGNYoaXq/fOr47DPCQYEEb257MoR2buGJm453ug00Xw
	v/b1PxqB8hH3WJcIW5oUWbFT2oDbHnwNkAKvujb5Muz5VfO1n5myS04SEVunrZepnV8GiGoNWjgQP
	o5s3ltM9E2bOZaXLmzRAcXNTlCheYWXf0X/Ij0BVpN7R5Nqmn9KnUo1G3fCYpKSZ9vbQhb3lMnAPQ
	9TTXUDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFji-0049Z5-1Z;
	Wed, 16 Aug 2023 12:34:54 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFjg-0049YF-0y
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 12:34:53 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so1229742e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692189290; x=1692794090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yruZKqzLaC+4643Ot4X60prS0Wm0q5EyxySlt1tCThc=;
        b=EY6fQH/mKR7ECTcxYzttcyuzzjs50D7QSork2aIfeBdRu6iYloEudaLTEOl1HxTbbk
         Ht+CJtxx61RMaEakWl0vWkXOg6VcpCgQ16N2oi+WYGcs8RzUqx1xAuVV3QP2jcfs7c5o
         cLOVgpKIh8Lz1iPhQ9hA7pXIcFnCeFjS4xR46NEMMpu3/PYnKAj5/0j/hSOBCZKglrZE
         csUOEkq8P9Yc2GGk2RnGZKuoNGiX8gxYVQmUuJ6JxfcoNeQyIyEdeJ7ShPMU7OdUG+bC
         AcnsUaRVOD/Tw3/e+hc8RJbJqHFLwrULWXWlRIQb072hpFhOTxmnGhNoZiVsdE18wM0E
         dtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692189290; x=1692794090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yruZKqzLaC+4643Ot4X60prS0Wm0q5EyxySlt1tCThc=;
        b=i6B1V7b4x4+ClZaOXQK0ZSfxLUESrQPt1O1uEbIhA/0pdETrMx/7Ep+NRtHnZ6V7l3
         5J0zDfqP4TB5rqnCEDifpK3xiqDzFRwuWFXSSew+ZcrXPZ9Sp8YHeC/D0i16NhNFDgAw
         qquvzfgqn2KwetxaE9bJ7EdDejyrgSsuso+m3uXVzRNHMBOkjFkwRqYEvadjoyyVZDF7
         AWBz2gf4D+Pdx5HsuM+uSKrmhkuEFGX/+swkF/jbKJHI8XygqHHdZcmC7yH1vaELHr4b
         U+J8QS3pIGCUCMsY2VcTDNKkrSB0lFq/Hd8GnEzmHEY4tmqRaueGXNIbdjNrOWUuv9y2
         2beg==
X-Gm-Message-State: AOJu0Yyt8Ufwk1UFssmScUx1LrQJCYX/rd596AwegjoPqJPDHqmFftRR
	Leb4DiPcu00KiY/LHxk96pofSQ==
X-Google-Smtp-Source: AGHT+IGM+5Kgz2X4N//QD5CWhAuTE4i7Xl3eqvW0P418kkgaL1X4lO0nnZhIcEgVQ6CPLn/Wvn2sLA==
X-Received: by 2002:a19:384a:0:b0:4fb:911b:4e19 with SMTP id d10-20020a19384a000000b004fb911b4e19mr1154375lfj.35.1692189290401;
        Wed, 16 Aug 2023 05:34:50 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.44])
        by smtp.gmail.com with ESMTPSA id y18-20020aa7ccd2000000b005227e53cec2sm8278663edt.50.2023.08.16.05.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 05:34:49 -0700 (PDT)
Message-ID: <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
Date: Wed, 16 Aug 2023 13:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
 <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_053452_340885_46C3E262 
X-CRM114-Status: GOOD (  23.11  )
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



On 8/16/23 13:22, Michael Walle wrote:
> Hi,
> 
>>> like a fundamental problem and that commit 39d1e3340c73 ("mtd: spi-nor:
>>> Fix clearing of QE bit on lock()/unlock()") is broken in that regard.
>>
>> what's wrong with the mentioned commit?
> 
>         } else if (nor->params->quad_enable) {
>                 /*
>                  * If the Status Register 2 Read command (35h) is not
>                  * supported, we should at least be sure we don't
>                  * change the value of the SR2 Quad Enable bit.
>                  *
>                  * We can safely assume that when the Quad Enable method is
>                  * set, the value of the QE bit is one, as a consequence of the
>                  * nor->params->quad_enable() call.
>                  *
>                  * We can safely assume that the Quad Enable bit is present in
>                  * the Status Register 2 at BIT(1). According to the JESD216
>                  * revB standard, BFPT DWORDS[15], bits 22:20, the 16-bit
>                  * Write Status (01h) command is available just for the cases
>                  * in which the QE bit is described in SR2 at BIT(1).
>                  */
>                 sr_cr[1] = SR2_QUAD_EN_BIT1;
>         } else {
>                 sr_cr[1] = 0;
>         }
> 
> "We can safely assume that when the Quad Enable method..". We cannot, if we
> don't have 4 I/O lines. The quad_enable is just the op how to do it, but not
> *if* can do it. It seems to be missing the same check as the
> spi_nor_quad_enable(). But I'm not sure if it's that simple.
> 

I see. Then extending the if condition should do the trick, as
spi_nor_write_16bit_sr_and_check() is called after setup. Something
like:

if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
    spi_nor_get_protocol_width(nor->write_proto) == 4 &&
    nor->params->quad_enable)

Is this what Hsin-Yi is hitting?

