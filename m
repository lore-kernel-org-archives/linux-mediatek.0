Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BC1C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=; b=1ofVPfqRVDV/q7pk0xtVF9k6se
	+FfVIGVVYBil1JWiu+JV71ribEBZIGSx+LI9Arn2ditOzY75WBGA3vg5flTdCp2gf/j5+jWHMp59y
	mHMQ1otqg7vKwVAsxCKoVCvy1RfN8Q73DvYR4PPZxcx00QJWJTfvxCQsBmgeygsDSlr+8dVEUrqep
	dYX6vNidQ8bhtTTWdXw278xCRWALV1LC2mpGevRHGwqShm1diQPNDugtdR+C8R8YOou72b9vF8Uvp
	vqOBFr1YkBO/3xZJcagclHXfS8bc7Oc4EOJaivzylkEEMct6Y9sRLMUWcxS5KGbcupf0PZwRqvXwI
	/7fyyj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaq6-003OYW-2z;
	Wed, 12 Apr 2023 13:48:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaq2-003OV9-1U
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 13:48:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so4453088wmb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 06:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681307319; x=1683899319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
        b=X5GLXeJDIHOwYV33b0gurB0ztbWSgIyEeiSSG0/C6Vpi4vK1fhMxGZNWKHD8UQZzjk
         RuUJfvCOgJehPIKFMlGxnNZAvJI9GIH8z0noUWQLiVAewf3Ov7fFOfl/1Ho2YD7CuH1v
         Mm0T1u3w2UKESMcBO8HOKdgRlp73K2s5Zp4rc3jAxXmWyikjLX9YlrbmWLIfo2SaHcy0
         uSFCHjhPiRlfecUqaDRr/qTj86ljC3cS5s8uM7A+xA/Kda0UKaKzVyd95X5aCn4lmbSq
         7H3VZFmtr/dj0eo6tq9m9Gn+I5n2PI7CSAnwklU5ceCFwMDUpTortZkODsAaWO8gUi/E
         eEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681307319; x=1683899319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
        b=YVrNTtDuRCpSA1jN2CBrPaxb/lvjhGWppQ0ZfuaHa8fhQw9EigNPa70zel45N+rm5m
         O4tjvAIeO8B/+D5rUJU7B7fhFiiY0Vssn+OCtBMIW0x1Z2zHByHjziYXFebkRb94505I
         59oiVvf0MJztpI7oKRfnCHpIRLgbSdSpMBDowCqHxy2z5c9wbXdtfnI99RB++EYAyX8I
         KfV/eypiLOQtqbZvgTEMksKJBlc4sv349aktqwyOOb81DKNNUDDxJfEs0CNwPycItr3/
         235gCHpbWIahU7Gj/OZahbjOS0lDUI+rE2YpThSJwzN1HtGHNhxiYZZ+IocHBsxkHMvM
         yZ9Q==
X-Gm-Message-State: AAQBX9dM6u6fWNLWcQjwHlQBvKOwEDFPnjfH94rnMr6Gq87qOe1HE0mH
	run9A9mO+rZgaJm9V07HvlVIjQ==
X-Google-Smtp-Source: AKy350Z/ROia9nB7VNPQp9VQ8QMdkRRPlJGnrcpi8r3HW5TGeAv0xb6C9Cd+EosDMxX9OgVXXjaA1w==
X-Received: by 2002:a05:600c:230c:b0:3ea:f73e:9d8a with SMTP id 12-20020a05600c230c00b003eaf73e9d8amr12320568wmo.30.1681307318747;
        Wed, 12 Apr 2023 06:48:38 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c4f9400b003ed51cdb94csm2535939wmq.26.2023.04.12.06.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:48:38 -0700 (PDT)
Message-ID: <3dab974e-4244-feda-4b85-d48a18013219@baylibre.com>
Date: Wed, 12 Apr 2023 15:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next 1/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, matthias.bgg@gmail.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_064842_678179_EB328DB2 
X-CRM114-Status: UNSURE (   7.52  )
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

On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li<yang.lee@linux.alibaba.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


