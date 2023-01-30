Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3347CC54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4k/Nc+vbxM1mE6/adaioEXR7QTUOYEWnVbj4IhswtU=; b=b8KK1l7RCqkT8I/vFebXUQ0hb3
	Skq0wqOMpjdVfgSGGyjGvxJxDebzgB6gupvq2GH4hd6ZsCDv2xsPd6Xv3EjUcxz8NM52upyeOwV8R
	0lA3VNSEd3Q23CryuJSzxTa6QnoBvOtlFsWAibn/XFa6IDmsJsN7jj2XTEW7gOJlrEu8Euc7QTbGg
	M8kWJJeNWW9YdJN47NuuCaQkdKEyIXYdgkHQqadBc+P80ko1tDIEmFajsqnqNV+ATphHb6CnWTzLD
	E6he5fAQ/Lqx3OWT2K0gg+RtjmparV/cWS61HYaOpQEANo3q6Ms5+9d+BnjkRRwM0Ie0CnRBtC/ma
	sSHxAUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSuZ-003QWN-NO; Mon, 30 Jan 2023 12:05:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMStG-003QDn-Rk
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 12:04:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso7971143wms.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 04:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4k/Nc+vbxM1mE6/adaioEXR7QTUOYEWnVbj4IhswtU=;
        b=kUVVk0Qo3KVIzL0lbkWQGeoXMGZLnOmnIBkOywzB3qf6dCsF7RxVxMu4san75cEg/W
         tUoXfvlDKLrDvVxvZDaXy7j+ZQXKjujcuBzMBbNnWILBMgjaQ2ZHvr1FJLCogUMo3MTQ
         9/JqstAUzQzcK98MeszrwfL6oJDjtjC83cp8QTUqkWlbtJ8v5ufBAWafuTvO6azfZYVC
         s58Rtf0pb4KbnPxnaKab5Vs3B5TjnCy4k8LwKEj/zysJaiLxSVdKJlsCCrxoiVjuRCil
         V6L7TH50uTrB9qyN0y1dSHGxTW0dkMHyEgfvH5jcFRCq2sMTmWmHJazuUk4oUSUrpJY2
         n6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4k/Nc+vbxM1mE6/adaioEXR7QTUOYEWnVbj4IhswtU=;
        b=reWT08buZaNmqChYNYnIcNxZ84e8S1Ih7fngmSZdI7B/o4aWnU94NaM9mHU5D1gU3F
         L8HL/3TEUlW4GpvSoicNb6A42m4EmhnAhIpUrAXIQFoHZyINLE3EL+mtPUqNxh7REbZ5
         mQKz5iZ138JgtAadZgYDtOmcy4C3uqKOkBfmsCcSDgPNOqUI33W5Afm/etuEfrLS+dEQ
         rt541rSnaiKUxRIKJFSfh8KcMOqkgnPpu5x6HgrY4BX4n4q9kaflEUl3w6aidDN3JKwm
         LpkqvS3MWwPOS+93vI4nPwPxbyKOhbRi/RaXJ5PQd5IzR1xhfBSx1f3FlG+AJMdAqOiF
         eu7w==
X-Gm-Message-State: AFqh2krqYRri9fXZBWhEs1Kb0z01jTUrwWC7Lopt7Wl8UsqLHLuY02wb
	fJjAZgj1daFS14nfmLLWdcrNQg==
X-Google-Smtp-Source: AMrXdXszvEIL/pKpL72DqLBqbSkAybsWNTlkDzADohEONJssb8T5yk+kO3rPc5tPFLreuiK5WEAq2A==
X-Received: by 2002:a05:600c:5390:b0:3d9:a145:4d1a with SMTP id hg16-20020a05600c539000b003d9a1454d1amr46068952wmb.34.1675080241399;
        Mon, 30 Jan 2023 04:04:01 -0800 (PST)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c180a00b003daf672a616sm12320077wmp.22.2023.01.30.04.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 04:04:00 -0800 (PST)
Message-ID: <30201eff-0339-da85-cf01-d0001af0d03f@baylibre.com>
Date: Mon, 30 Jan 2023 13:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] iommu: mediatek: Add support of unmanaged iommu
 domain
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, yong.wu@mediatek.com,
 joro@8bytes.org, will@kernel.org
Cc: robin.murphy@arm.com, matthias.bgg@gmail.com,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230130102722.133271-1-abailon@baylibre.com>
 <20230130102722.133271-3-abailon@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230130102722.133271-3-abailon@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040402_945112_C3300206 
X-CRM114-Status: UNSURE (   8.23  )
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

On 30/01/2023 11:27, Alexandre Bailon wrote:
> Currently, the driver can allocate an unmanaged iommu domain.
> But, this only works for SoC having multiple bank or multiple iova region.
> This updates the driver to also support unmanaged iommu domain if
> MTK_UNMANAGED_DEVICE is set in the iommu id.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

