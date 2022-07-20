Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402BCC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcNBK7YfKlN5L7E979o1SuVA3j9sFZjXk0q59JTAE0Y=; b=X1H1Mo2T+gwxXjX7iTu4bKoxLv
	IORO+94XElHMGYuYIQLZXvJTkZ52cghEzqhkgAugVRsmnHmsdeqvXS/pVhLRCZ+PcBc8NeUbN6Sm+
	SwMTLcCDeCOxZPy4SwyjwyAn3/R3Xl44/Mj88i+QJsDk04cZ4B48Ge9nYhRODoynmFXiTqo5jIjk8
	u/O/cQrPq1vyLY98WuLXn2Zm1DAjtEJEPgmJVfIfA5tUCJ95iySeDptrq03gzFI0Q0QaJ2DkjSWo7
	Gt4HnwBsKxugHHb2dUlLhk5DK/SMAqpksSFhv8ITBYLFibDXbH97ukAhocl+kCLXwkzb/etz13cuG
	cK9+pGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDZT-008fBz-E2; Wed, 20 Jul 2022 17:33:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDZA-008ewr-SV
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:32:58 +0000
Received: by mail-lf1-x12d.google.com with SMTP id r9so31400197lfp.10
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GcNBK7YfKlN5L7E979o1SuVA3j9sFZjXk0q59JTAE0Y=;
        b=vTNsdywBo8SiezHq39d4MnSeL9RUzWS1d8tMBIYeJe001MMi+Pfnvmut9IFwSAtnN3
         fGyIN4s7PcC/f8EsnaeMS1xkZaz7UKZrqieviSAqqqh8sb1NOWx6I3+L0Hg7XRlBlVj0
         1EqUUBDqg1nn1lAH8A5uAqds6Xkz8s5NRfX/MiWSGoIJ46qXJNNoT4J1iD5w43lTie+5
         Efwe983Fi72oOGbMmZ7cpWuPBDt3gOR1v1OEz5y/0ccoLaKInzUF4DkPbDDP+UpPiSOF
         MeIEct+0P2goheEhfJJAJaH6CCnH86nKorzu/Phu0LDooAQXOFY3GXM8ZR88ss54PAKP
         c9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GcNBK7YfKlN5L7E979o1SuVA3j9sFZjXk0q59JTAE0Y=;
        b=fFH2VUu2UuPcNA66vAANqYeiEJylWZnE0XGq7zwu7TJ62B6WtymkIjKS2BphddttJf
         +kLyZr+o2QJSlyQIcHSH9i5ZNf60ueAM1f7TYFDCjWpQKhplzjLaWuce8/Mn8KsedycN
         iPEcX/9M2t9S1J10RmoIgzC30KR4w6nCjTHf6GiwS8AjHa4JUEeufCHtfjnb76lpR3Qw
         W9mALsPAd6yPbBDCqyzr+UKXidxrIa9ZWsr0gsvTnDooJvxdHIfCIIfXv6g57ZTq5Uid
         XyOz6BPjz02TA0S4DDv4UjAKiXEVev/5DvTNaapp4thYGVfR2ojP3eeUeUxfPJvMY/Jq
         66jw==
X-Gm-Message-State: AJIora/tkGfoy7l32NZTV6cgeCwS/aoZaPe58jOv3RhKIXDAeJV9YDAg
	/DEYW7MWHfCZibmL9R36hwvhWg==
X-Google-Smtp-Source: AGRyM1vjhyD+PuVuOucmn/VLbxuPWiERqLYolpXPQm2ecA3hiaYSGUjH7QjRWdaV7kAA5xwQD+EL7A==
X-Received: by 2002:a05:6512:1312:b0:47f:7bd3:1427 with SMTP id x18-20020a056512131200b0047f7bd31427mr19135756lfu.128.1658338371434;
        Wed, 20 Jul 2022 10:32:51 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id b12-20020a056512304c00b0047fac765f39sm3906980lfb.219.2022.07.20.10.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:32:50 -0700 (PDT)
Message-ID: <5daec4cf-172b-88cd-fbc5-586dceb93d4e@linaro.org>
Date: Wed, 20 Jul 2022 19:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/21] dt-bindings: power: mediatek: Support naming
 power controller node with unit address
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-5-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720123023.13500-5-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_103256_986033_18293E48 
X-CRM114-Status: UNSURE (   7.26  )
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

On 20/07/2022 14:30, Tinghan Shen wrote:
> Support naming power controller node with unit address, also compatible
> with node names without unit address.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

