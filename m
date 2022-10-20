Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E88C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfoaDvIHm+IYqFg1zUd7jQMQTXkElPWTcNgvljK5gOA=; b=wRhDkDCg7JB9U9BrJDBNWMydNU
	Eesm8YI4JemfiR+iezm+Sl29h3iKscWe74ZwCY7zg5UoF0sE/r1qxbHO9VEcq1+TBVcnAaqZtT2BB
	Z4U8wrW6cFhEYezrsPvcjdYwxVbRQNBKd7TiHehnuhNrH8BJkODKZDY160z0KWVwDK1pcxz2aLj6u
	UzVWtCAL4PHEs4Hajx6j6IRAK3i2DYhe3ukHL/wj9sNAhexQKz7um1QQjzSK8CyCYCgCvn9WGkQD6
	92rwvj34FCAavS3ZPL8WN/psLwFj1C+f1yyta87ja8sPQAl2vbabWZd2wOvGcO2dohQ9ERZqguAhd
	7tspWVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWJ0-00Fx2k-3l; Thu, 20 Oct 2022 14:13:54 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVtc-00Fisi-S3
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 13:47:42 +0000
Received: by mail-qv1-xf35.google.com with SMTP id mg6so13514507qvb.10
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfoaDvIHm+IYqFg1zUd7jQMQTXkElPWTcNgvljK5gOA=;
        b=XZcIHHMg1dkhD0LgOjy1iBpji/JY8TckG64n7iRLwcdhSP6mWFjkTQpve5ROlxVx9R
         z3ZyWgENFeFwmcNNpiAZ1rDDt9xTH7+vV+O6iybz68MR5IU+kPJ431BoBfarnd5CmCIh
         m75Z0BY/2hll7ZDl3b3Bh4n4rSxv4lRaLGtPBpTKUb2qvOdPzfWtblSDpGZaD0W4Mw2M
         z9gRZjdMTSNCJwui0gk4X6RdyStQm2ePgb6Lcfcv6MYPB6W0n8bmVA/ntbrAweNTsex0
         cXFzrKKM9b/6jfDMmxw59mkngKBzHtv3T/Z3jv2aNVReNceJF2AAp2FYF6w8Xx0cCk/X
         1YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfoaDvIHm+IYqFg1zUd7jQMQTXkElPWTcNgvljK5gOA=;
        b=pH6WlS69GyDduoH9zc9YyfkvdHzU2mdAdTZF5HgBxtoi3/CU5P8wl/wrrM4eTpduG8
         XT2OmQ7ZkxktQGNM4mYDHB3peTvvUpWraKRS49dAr4O57P+m4Z9OSlR6o+mILo6CU22h
         Y+Dt53CUrU1iaVnAUpPfe6MMwmf5PERlddlxfZNMP8YkODtSzIUHhWAG9eOPWu6fxAeo
         YXUpYtqyVNdFKDqhHh4Tms79vL6171/bDnxj5Y3sGVb384OIvIuR/khqNC5zwQMVtW4X
         N1D4WkiGUAn6c08z3hE/MaV9y8OH+m1XkRDnkcbhaVR1p1I2RgH8SOWWZ7QoGaO3VhET
         iHFA==
X-Gm-Message-State: ACrzQf2gpZtc9QixWzpK37hhpPLgwGJs4mChl14Ymjy0FFKOZma5GxTL
	bBKrwUwKo+hT+B/Ftc54HSfrWw==
X-Google-Smtp-Source: AMsMyM5sOIvVtFC130aKpuulDJA8HBv+YuVvL3HoTNZOe6dhDsx7M2SccxP4xCX5/6e1vhY5fApY1w==
X-Received: by 2002:a05:6214:c68:b0:4b2:31c5:78bc with SMTP id t8-20020a0562140c6800b004b231c578bcmr11137347qvj.45.1666273656040;
        Thu, 20 Oct 2022 06:47:36 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id gb11-20020a05622a598b00b00398d83256ddsm6107388qtb.31.2022.10.20.06.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 06:47:35 -0700 (PDT)
Message-ID: <883c9095-f304-1b8c-2f4f-a2151d8e1d1b@linaro.org>
Date: Thu, 20 Oct 2022 09:47:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1666266353-16670-1-git-send-email-xinlei.lee@mediatek.com>
 <1666266353-16670-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666266353-16670-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_064740_939139_018677D0 
X-CRM114-Status: UNSURE (   8.00  )
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

On 20/10/2022 07:45, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> For MT8188, the vdosys0 only supports 1T1P mode while the vdosys0 supports 2T1P mode in MT8195.
> 
> So we need to add dt-binding documentation of dpi for MediaTek MT8188 SoC.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


