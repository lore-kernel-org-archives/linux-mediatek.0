Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6494AECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63vT8m8MylaPly4euPrd3RMV4XW9rM+F1IN3x8FpSV0=; b=bFEe5rLhinPlKPf/G4E5agdYDx
	AHclfPmUo1rVHd3HgNsrWeVKAQXCfawHsukd5xZunp1OvngCrpZbTzon0V0Tt53gRXZAT1H9Tlgbf
	ig1v0SZuyEyKGDAj/qO9F4URHo9ME4BSK4xM/Hfd9bqJXECP/DRlfnovp588vZxqmf73KMl23JznH
	giz0keuDLOBCzUF0b2Njvprfqt5k1NIcs9b7Sz8WNXnbAkgmfTiryIp6kxVd3e/25nXm+H+qScbSN
	r7SYv90Ji7wVy2vD7AQB5EBUK8IV6JDwfJhHuiUSeRSXvXLE3bqIqLEL3SOAvrWKsLT5I8ePFJOH4
	CRQNfWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrXK-00DG14-RS; Thu, 15 Sep 2022 16:16:22 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrX8-00DFdQ-VK; Thu, 15 Sep 2022 16:16:12 +0000
Received: by mail-ej1-x632.google.com with SMTP id go34so43309103ejc.2;
        Thu, 15 Sep 2022 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=63vT8m8MylaPly4euPrd3RMV4XW9rM+F1IN3x8FpSV0=;
        b=M0g5ls1WKDHcioqcss6bp/Y2EM9o688UgiKmwr2miwQidIKxfe8WsHaKBS0QnP19xj
         84b57V36j6Am47XtK0fTE9lCFQrdodANeaCY1bni5gEC/dfCJ80TiBl5e341v5NTrC0D
         650wtgc15NOFZrh8+dap7PRZsUWABj7Tx8uec+gUSCChXzFnBAz+G5wUQdtcfn3xBwee
         DxgKd50+fnKiuSJEIw9dIglUuWFo7G3S3McJAAZMRxOEpQN7gwHyE2qDJeYaycGoz8o1
         hf9SDsn/OaHyNo5ZyIc/Tfi99c9xyyymk+TwGm/k+2ol5tALgglTCwhOwnxQTc+6e34w
         jNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=63vT8m8MylaPly4euPrd3RMV4XW9rM+F1IN3x8FpSV0=;
        b=RBoWJXGAqU9zlgUb6qbYYlRS0xoA58H5qGU+YLz8vZeg0WxxdFIvpajFUlmz0hAlMl
         ZsmJOJFC80ng2nFfs+xmpVyjdN6YksYVicpH0PMumTQ5OLVIB/o7a2HjPwF73eJvF+sZ
         ttujsxQhLFm0G0lISdKMxBCP5Egu7bzXFeL5BeKdld94eqSOg/ZksOhlPpUC2SvBDASe
         NTh6elxLkfaCNJUeqmvXmiB36zVnBplZzDuU8fFY8x552eP2NdSe6RIm957WoCtVTP1e
         uPiJc1wjP9GKeCsst0Tb1Hq8urKb6V7tQR8LckrtD/Jj9EFfs2QMQ5NCG5Gjt3QhwkrQ
         YIAg==
X-Gm-Message-State: ACrzQf1Rh+DozJSBW6LAHHwGMiSFqOegBUNokIXWo8c7Tgi7fplMQMUA
	o2XcGzPLzZEjCRFNfsJR4jY=
X-Google-Smtp-Source: AMsMyM5zyVslz6eL5hQZ2vqtP2XxTO6A1/t93r3hM55bDcfdv6gf3smsa5UfAq06UyXLFCm1A9hnzQ==
X-Received: by 2002:a17:907:3f85:b0:733:3f0e:2f28 with SMTP id hr5-20020a1709073f8500b007333f0e2f28mr504311ejc.376.1663258567816;
        Thu, 15 Sep 2022 09:16:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y17-20020a50ce11000000b0044f2afbb1easm12258192edi.27.2022.09.15.09.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:16:06 -0700 (PDT)
Message-ID: <cf8ee34d-8be3-b82c-8e93-afbfa97048a0@gmail.com>
Date: Thu, 15 Sep 2022 18:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/2] MediaTek Helio X10 MT6795 - Display Mutex
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, moudy.ho@mediatek.com,
 allen-kh.cheng@mediatek.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_091611_080265_EC592A76 
X-CRM114-Status: GOOD (  10.37  )
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



On 13/09/2022 16:01, AngeloGioacchino Del Regno wrote:
> This series adds display mutex arrays and compatibles for the
> MediaTek Helio X10 (MT6795).
> 
> Tested on Sony Xperia M5 smartphone.
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: soc: mediatek: Add display mutex support for MT6795
>    soc: mediatek: mutex: Add support for MT6795 Helio X10 display mutex
> 
>   .../bindings/soc/mediatek/mediatek,mutex.yaml    |  1 +
>   drivers/soc/mediatek/mtk-mutex.c                 | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+)
> 

Whole series applied, thanks!

