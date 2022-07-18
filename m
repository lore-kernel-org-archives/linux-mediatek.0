Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C28DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/DcKl1792dtFraiyvZ692Ib84+Yi+4Ulxn0Vh9//vc=; b=0cMSDfeg/a1Ky59rroMLji+gVd
	SX3TzRlX/MKffhMrm5CgEG/iZ/hHQOPWGSdYj450uv4cCY4U/3+iztMwfQn60qH1xj4VG9gZv1RCl
	hMkKM0651jMTb9Iu1AaMjEq9Tw66+rSreAHnEQ7JjWbUT1JXEzoHDtx6JN+u8rLXh6IieM7gQOFNS
	5qOhtsgBZg15HFRL9HG9SHITGN3wltSgAwMrVhKqbhqOu44DFUh/TBMDfd7Y9aLa7fPXJcOv/ypzq
	19L491o4p9FocpjG1yNLzdv35dONkxb2GPBrvm0hLBjxJ3KdeNoVRzLbIDkqHa7427V1xeiY4xIp+
	dMvzRApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRC9-00E13Y-Gw; Mon, 18 Jul 2022 13:53:57 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRBu-00E0Vf-GM
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 13:53:43 +0000
Received: by mail-lf1-x133.google.com with SMTP id u13so19456700lfn.5
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 06:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6/DcKl1792dtFraiyvZ692Ib84+Yi+4Ulxn0Vh9//vc=;
        b=adf7fKMxBuELaUr2WN93cCfzLwvAYLCSxArs7AO+ItT6SAVQJjfqXVZ6xkpW0xpkKo
         On5VqFStvsWGBQOGKJZQ7dLaBgOWAEZQ1ln9tRYix8ijrghu8R9X0wF26Iemn7lRv1UR
         JU4jQ6RpcMZ1YJ3iqD98dn0Gj9oL4LkJVchdcAXwLw3UmGrv38tllSQatCxZyLdY/TFG
         XlzM91z8J7cQNV1JdadJSE/R1I5akBQLQWQVvSCZ1N5YESUD32HcFx4TGEpLgefyGFoP
         dLOr+pELGuaDGzuiqcBfzujdTZh67+MpQOpx73gRJe4YjU9RNocEz/kTAhi9aEUaDcFw
         c45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6/DcKl1792dtFraiyvZ692Ib84+Yi+4Ulxn0Vh9//vc=;
        b=32a98UYG8CarQLv2TAqlBdH1LSlF0l463FYhhPHnj7V/LeTpLWQ4PfZTh14RVaniAh
         tI0YXT4TaY9o5jfWqeGh47heKuxEr2KD07wQLvQ3R9iYr5BAVGR1XnHQYk2/pThO4h6Z
         eIzIBMDpetclWrr2qC2freSmSU/rhts7NDGHAdcgkgJSAHN2xJW6taVGtPnGpI6ETYEx
         y2Fr1mckuF7rr2CrxPtll2ka5Zeb9ca+UrthV5oTdi97aVtk6Tpo4yKylslrhp6P2O1L
         mg4U+FYvb5AwJgC+0XdmJx8K3TrW8nNxt3sE82SLLtZLuh/iojSg0PDzmmQ0X8tkekPR
         ncUQ==
X-Gm-Message-State: AJIora8TmXFBJheWkgslnctU6B6dXh0BkuMDwahhxlBHsRC9jIAGxNI0
	i4zhRwnB6V3uQoDybgbM2To/ew==
X-Google-Smtp-Source: AGRyM1vlH8y6dxxb5A3iLBYGqYkrcDCTAdlap219dHfRtUb7BZ/CdexwgBbf1qAUdAng6pNUPijgsQ==
X-Received: by 2002:a05:6512:3d28:b0:489:fd63:f9c9 with SMTP id d40-20020a0565123d2800b00489fd63f9c9mr14550160lfv.96.1658152413217;
        Mon, 18 Jul 2022 06:53:33 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id c24-20020ac25f78000000b00477c164293csm2601359lfc.79.2022.07.18.06.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:53:32 -0700 (PDT)
Message-ID: <f3082ae0-4d1d-e5a0-909a-5daa798ab7fe@linaro.org>
Date: Mon, 18 Jul 2022 15:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] dt-bindings: iio: adc: add compatible for mt8188
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, jic23@kernel.org, lars@metafoo.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com,
 guodong.liu@mediatek.com, johnson.wang@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220718123930.24373-1-hui.liu@mediatek.com>
 <20220718123930.24373-2-hui.liu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718123930.24373-2-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_065342_567567_F56DAA8C 
X-CRM114-Status: UNSURE (   7.29  )
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

On 18/07/2022 14:39, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> This commit adds MediaTek mt8188 auxadc in dt-binding documentation.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


Best regards,
Krzysztof

