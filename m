Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11E9C47088
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 12:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qaQnzUFR6jEc6/BTtzhr5L0OwEmeK71QdZTFbxUz8E=; b=a65siQjUv4iEM9uBAk92rEngap
	1X+ju4NPLHcmwD39QdFipeTY2NbWrMJB555iIPUEMhWlqNjQeapYCyrcnzUqI/1QGrFhW+pHtshem
	F/E12H++Ok21tooUO196Y3rv9xyW02TEdP2NMWA53SDNLRiTzBISZ9Y5cNvUzs7mQnyy7UkISWpeq
	CEp7Nn0Td+6TfKL97lToCbl3HluQVWt9TnRIYanABy6OAf6eiQO5kYq0iwJWQO917VxvJOeo6BCPf
	BpSC6AvQrZU1MziiDUDcIPMDHJCN3N6SG5hwkKFzuCOs6Xr+GCo1HpGwCksTYKaoWk1DSchgb9Vm6
	RrX553qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0iUT-007GmX-5e; Thu, 01 Dec 2022 12:16:33 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0iUD-007Gfa-Mn
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 12:16:19 +0000
Received: by mail-lj1-x231.google.com with SMTP id z4so1665849ljq.6
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 04:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qaQnzUFR6jEc6/BTtzhr5L0OwEmeK71QdZTFbxUz8E=;
        b=sOWXzQoCSZLsJZmc13U6bfD5H/L6IPlnYQdftDEmYjI50/EIuxERFnlkJufQUJdi60
         v87bCX3G11oWdxLgVfQZyl20NwbaRIQ+S1h47FECuTvi1pK0BjjfyPE52HH5KDQqjGv7
         riknohuZ4jnAI065GNANBYIWSJ6lXEOKfomopCrUKnJBekNmMmhtfnVx4dRJiQUaqO/C
         6Sg7zMO38p8ZiUXgXd3QGk/e8dqdKaT7Q6Hn6XwhYngqN2M9SzprkeWR/MtV22iPz5lu
         iCRUL36LM964arkGNYIPFeYnuJUsc4bNLxZNrX6wimvEwe/VlEndjgYcy4py2KNabAim
         AzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qaQnzUFR6jEc6/BTtzhr5L0OwEmeK71QdZTFbxUz8E=;
        b=WaYPKOCdAsvYpyxK651kTVusv9nKui+IoTzAPCMBIdKhmhCn+dGGh2V3sawcsNOt8I
         PyoVDOOZC9qwL/Tgq4tHHDssXQpLoj6v5/angB+g35Xm9/zsDKxfFJ6M6uPnnqJ1tFCU
         VvDrvnVVvWTc99Mujkao6tJzpsrPJejoaB6DCVBXgADC+vY/3gNzGYb/8JXJeENnDSqY
         VDn4uegpKxSSULjvsZeBmLjyeCYRdjtyIyqeLfAsQmyroxV63gtNCeVuZMTLXDGHGfnz
         eSjh3BTcCF1IIH5J+IOfl6w/4LNAzOvZggMGKSuGwQo5O6CWodtn4IVTqXPwH5LAq8TQ
         xCvw==
X-Gm-Message-State: ANoB5pk24CgzHpxyWUsAyQRPOASh9t8ShACs2/aMIs1Y6aBMxOTf99tZ
	n/mffe5jkjOWe3qdeFIAqAr3oA==
X-Google-Smtp-Source: AA0mqf7+IQJ/XtOhZfRpM+10zUvVxsU5YE5EoyCx5d1tIv03ZdI2hGAYOBCVQTJ9Bqkgw5n/0a36mA==
X-Received: by 2002:a05:651c:82:b0:277:2f15:4179 with SMTP id 2-20020a05651c008200b002772f154179mr15340293ljq.408.1669896973304;
        Thu, 01 Dec 2022 04:16:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s3-20020a05651c200300b0026df5232c7fsm363309ljo.42.2022.12.01.04.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 04:16:11 -0800 (PST)
Message-ID: <2cac7d40-1807-63b2-9be7-9e88e721b68c@linaro.org>
Date: Thu, 1 Dec 2022 13:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add GCE header file for
 mt8188
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20221201071316.24583-1-Elvis.Wang@mediatek.com>
 <20221201071316.24583-2-Elvis.Wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201071316.24583-2-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_041617_748831_307A4520 
X-CRM114-Status: UNSURE (   8.08  )
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

On 01/12/2022 08:13, Elvis.Wang wrote:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> Add Global Command Engine(GCE) header file to define the GCE thread priority,
> GCE subsys id, event and constant for mt8188.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> ---

You got my ack here already.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


