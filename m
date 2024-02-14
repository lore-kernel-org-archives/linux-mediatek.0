Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E6EC48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 21:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDG27qbGXDXotWt4r5BxMuF8Z5aqGlNS7zowiQwidN4=; b=skHW2x3baNkNaHfv6RB2JZpVgk
	+JciXj75w8C1I3i5cVGBwrgCISZ5UBQcGbWI/021aE3k50SUyBZheK/HUFNFhiQqSl3UXJWU7z+jQ
	5xpZcUsYe6PAmrMFuPp/UFTYjkcBVOe3hJWm61dchhUTOfkeN4XumIC5jJYAPkrdjPISn3L2p0c3i
	f0+FF4wR9VjRif6NjuPwPtEE+xyVgtpWeWvKwm1t/ikHGJsGk5AgSNRkp1E6r5UX9FvK/K7ac3Nxj
	PyjK1ML9ngCjgbg2MSJRjCuGURdt7TOA7tPRHWDiszQNb1+xIjkwJTX9LRSq1s+7VJdyatU28XJO9
	FUoYSSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMct-0000000EHPE-0O2y;
	Wed, 14 Feb 2024 21:17:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMcp-0000000EHO6-3zIs
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 21:17:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a3d6ea28d46so89694866b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Feb 2024 13:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945422; x=1708550222; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vDG27qbGXDXotWt4r5BxMuF8Z5aqGlNS7zowiQwidN4=;
        b=tG4rHkVnnXNIkIzv8qTyXoHr8iKID79X+xsCCS2jIkV5561mjq1UEhhhkoZ4GAwhbg
         I8aGVqXXUQSkRUexQEEa/ms7ueC3SKc63B1M4G92LdALHzn5F97+Nv8H6m1731FItCJH
         2fuux3OAn6mKbsD9j0aopjFHauhlk+ghVip2PmPHQAUdVI9HkfQDiATGRKlxdEBkbsU9
         YUGakQ2Ct10UsXfV4JZINNZF+QcL1CT4J4ScSqsb32MWSNhmwh4SRHimhJR2ps6Epn+W
         s3Ch1MEHNxX3BEAdfh3zkHQnOg+hxWRBSeAk/RTypZbZ/6jNUuGGAtSaFkgLbf800Uff
         MA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945422; x=1708550222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDG27qbGXDXotWt4r5BxMuF8Z5aqGlNS7zowiQwidN4=;
        b=wVzNnQcPbTU9rfWLhA1/g3e+cSR6UV7H4coWbNECLW0eoM9LQwwqODwW32toFWczNd
         IAh/srmYlKrCFmIerWVz7DpMvd/CtVrTnqjE3SfKf35SWltrk2e9SZIZY3k6pWKfbx27
         lrpvtWD/K9Rrm7bXOZHzezdJAS3w99CKOnodRXZG5fc6EeQ7EYMvgRsuKdlBFfZPPKkL
         ce7r2taWoEFAiWXahMEe7DPFuWC474afFvQeVDuc/fdoW/+VWNzD2ahYAkDyDArK5nwp
         xtFK7OVd1WxtImjWrJ4K5hS13ZOW8K1UFphXfxw/PGq1rygofQR193JbjAY7MiMAYRmA
         D7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXjgSMBYUhaw8sy72ppEdN5JYKDZf8+UmeAplCltgfUdFON0hpLkglr1/pW4v7oEL/0wRothGDmljPR+ghwXn2Bq64HS2oB01/6K5vJddAiqhLU
X-Gm-Message-State: AOJu0Yym71XqGNL6MTZFmY0CC7wWFqRGsJ3IKR0al45Y1zfWyvRX4bbf
	BAFrVRDGfx7zfw/7LBcT7bnwTVeEIKn1Igg67UwZ8G8yssS6D5bR35EfnojQENY=
X-Google-Smtp-Source: AGHT+IHghIYGSVV5nYIaOLJXpc5/fTKV6YwQnTrz41TL27HdJSrtwGoV0czzrSjRCJfQ0TEdc1kgBw==
X-Received: by 2002:a17:906:1c59:b0:a37:30aa:3cf3 with SMTP id l25-20020a1709061c5900b00a3730aa3cf3mr2416808ejg.25.1707945420810;
        Wed, 14 Feb 2024 13:17:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9JojA/QSHANBTn9Irw1tl3eWBE5j4Be+VBQKri52r1b7vefT6kTjhNI5Wx/tUpYayJ6v7qI3PoYYqmIqnvsxcTOKnoHUtKQfw7L6OBwB5/zEbTaCODiOHB8Sia5rG0EQmnTeZfHWo7cpfGfZUs+vLQADkyICJTWIh1ui+4CqWFcr9bQFgLxm+byuu4KDLns8/27Qwzc/JsZyBypk6Rk6BKbfQwz3snnfBATgpkif4C39+shswPLz49Ek9nQid1u98L0b4Tmd73h978/KLg4nDIMAxnZrCIWu6mfO9RcHV9dVFGFN5qqUvtPDP6oFCgm4LhpFGK6t5mNGbciGNys0e+a5aMC8RZcEoqZZazZRaqS6nxb0zEN8NZSXWhm0I8yb7opJ6aR2PWoU/F4MYqKPvQYZ8jTFZ/T62LTDOH9Ra/gffLvaAI9OMon/GStMHSC/1f6TTJTFhZwJ4WuZVCDKL8f/Roew9Nn4=
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id mj18-20020a170906af9200b00a3d3fde216dsm1006846ejb.217.2024.02.14.13.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 13:17:00 -0800 (PST)
Message-ID: <d9f88786-abe3-4826-adbd-fee461a70c2c@linaro.org>
Date: Wed, 14 Feb 2024 22:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] spmi: pmic-arb: Make the APID init a version
 operation
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-2-0bae0ef04faf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240214-spmi-multi-master-support-v3-2-0bae0ef04faf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_131704_036101_821AC3AB 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On 14.02.2024 22:13, Abel Vesa wrote:
> Rather than using conditionals in probe function, add the APID init
> as a version specific operation. Due to v7, which supports multiple
> buses, pass on the bus index to be used for sorting out the apid base
> and count.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]


> +
>  /*
>   * v5 offset per ee and per apid for observer channels and per apid for
>   * read/write channels.
> @@ -1178,6 +1246,49 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
>  	return offset;
>  }
>  
> +/*
> + * Only v7 supports 2 bus buses. Each bus will get a different apid count,

"bus buses"?

Konrad

