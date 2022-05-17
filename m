Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DABC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zs88YLS2NNXbBZn22DQTJUEgMfO5Cuah7PXtSos/hzs=; b=JggRnXB865gvTe
	+dy2NRafzQ/MAL4dceSjso9ZwXlq+qPUnQha89bkLM9oZnKuZWH5Ov1ArHkubvVfMTWeuinn/9QBL
	U/VBepKPDu3p/MzWBRcGJYRcPcshDmOMYk1JCber6QFKM456o8XBnWeB9++4Wmp8F/uce2o/X069T
	HVThMcbFw4zTkVsLIktnNaCBpRcLGcpcNd6ED8y/NdEQEsqPjR5m8fEkdiSsIWdyBdv2OqKpp0Lxy
	ckZDX+k46ipQecmSPC32Tzk+05nB/u8JJ2NHKTwt/6LHglBDxikTZwf4u7NqMaihU5T82xuaa0jWx
	/ZK1rMWoT+ewnZSo1c2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyIq-00ETw1-Ku; Tue, 17 May 2022 14:36:00 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyHm-00ET7Q-O9
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:34:56 +0000
Received: by mail-lj1-x22b.google.com with SMTP id h8so1311228ljb.6
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nqGuv+VUb8uKfnQR9C3qSWq5fRItPmp+77gvagzw4wI=;
 b=kyo7QoQoMUtzWNOVpW0Ia4CKz4RSfXzMntgLH1djSaq+zLvp4P6wPXDrXTBP5maBNX
 r6bNM6i8C9gnL76fU7FTEQhB2GHZCSePAFRtfUMoqFbzi61URwoquAZOTneh39yUB+Yr
 sHqHwYKaIdZHDOkzZLb+qV0c8qp+xo9F4bT09CX4EaWiehDvNXJClNADBzf4hRVc2V0n
 F8gJQbO1DvnExulv6SaX2PWyOU2d8syVJboiiJWO0nAJGJc+XqJFatOn4V4kMUh+32XD
 l5AAZO4G7UlzG97FK2f3G/k5fRLqvJfqXclqSym7CTkZINGtJAZInazr9IgoCyPAvngL
 8VZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nqGuv+VUb8uKfnQR9C3qSWq5fRItPmp+77gvagzw4wI=;
 b=fVRtk4aHnvTZxlSIvbN0WZSYHuWBoqT+J6XgeE8z6GdGWhGpitGYMcF+Yhtf6iMjU8
 AKe6Q+7s0oQBw41jOCia67mt1sMn3aZuYJcxJbrh9TxtYlPSmGcmgnUuTyHG6N7ZjYfc
 c9O2rOt8B62V6DLdOtiiEHXlXUIEUofefjtKZuDdaUKgxXITw2DFH7bDM2ESmytRmJ7e
 dO9wlb16qTugYhNp53o26WHDupdia4uzCL0+JS06OfmCS4pcwkpRIvpVpNjANPcltZEm
 /SKxhUqryV4cJxnKWsZ/tQZW0AmEkuFT07EFSPDoHooxh8hCOnsUkYG/Yd/5S03Bic0V
 w7Pw==
X-Gm-Message-State: AOAM533/8C5mT8o4trMmXVkiO1NM37yHijv9xkJuvK9TR8y5Cb5gXhFo
 j46sfrOouW9W0//c9DlOAGo+QA==
X-Google-Smtp-Source: ABdhPJz8PXD56VDKdbGPVTFttJCfqQT/JMx12YjpiFErqxGbrAK9xl+4pls9Kdg41RW8bRLDSENgig==
X-Received: by 2002:a2e:9917:0:b0:250:808a:f7c0 with SMTP id
 v23-20020a2e9917000000b00250808af7c0mr14326311lji.136.1652798092874; 
 Tue, 17 May 2022 07:34:52 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m11-20020a2e710b000000b0024f3d1daec3sm1890587ljc.75.2022.05.17.07.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:34:52 -0700 (PDT)
Message-ID: <6ffa2847-cc25-d1ee-71c4-0534f0ba9b86@linaro.org>
Date: Tue, 17 May 2022 16:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 6/6] dt-bindings: arm: mt8192: Set #clock-cells as
 required property
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-7-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517101514.21639-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_073454_901586_A331AE38 
X-CRM114-Status: UNSURE (   8.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
> This is a clock-controller binding, so it needs #clock-cells, or
> it would be of no use: add that to the list of required properties.
> 
> Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
