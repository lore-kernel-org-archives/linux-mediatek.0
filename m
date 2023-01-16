Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2187CC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9JPOCLbPSYdlBQh8f4nW/+w7XlzZIDopk5i3Ysv/I4=; b=Yov7RJNugJw0Ec+oFU5L7NLLKj
	slKpphCx6L4ay8s3YesAYU2Ry+iCjYAjnv3pGu2fpO2QXH5X0ncTpfivZrXnvk0+NYNxLUc77oqLi
	fXPWL1RTW/e4vMfN1jJUTUklDK62l+GHnz3awNbV2pM3F0+573PWBCunGwkZhK6bf5pEobLGbG1c2
	zRcuQTe5zGRVPz1CDk1fpqiaf1qagP+RxxzDb2UJomZIv2mneOokdPDzYMfkCULAk1+cCIjktxB6Q
	tjLwBI5Px2//sR/4O2xLnJ8GfcIjacJ3hMOlXJu4wBKBi0AlYwg76G0uvBm62wd44Z2Wjcxww0BF8
	kB6Z5dyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHOGA-00A2Am-1Z; Mon, 16 Jan 2023 12:06:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHOFz-00A27L-6x; Mon, 16 Jan 2023 12:06:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AC37660035A;
	Mon, 16 Jan 2023 12:06:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673870787;
	bh=yHR1rnQBHPsnUcjrAlXmmewlqZnVelc/M9hoJD2YZ7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mP+c1p5kIStdMYgRCtoDoTqhh7t3qaDfuXmAWSjwVkevbm0kOJ4SGtk2BcD26TBvg
	 /woqsIieFDLYga48oaOaxH8BuWL5ptuDlmnPB9HMZKwqTnj33TNSRCHuKS/oF5xw5K
	 BG1ymj4QP65EyQK2lgoTtjxyAHRpTnUEFg4lb+5pBgekeIFUhEOR9KwkszHzwPenT6
	 vpdr/HkXleBJe7eO8feCeV+hWxa/FRTfk/HKiNHGp8XsaEbNLs+fTWi/mIE96ql9Rk
	 WzKdiZ5wZzEgpAMIei4y+qwjfEW8Uzb/U3D/FsltkICj2O8YVf93rrMcxHkz3WRjD3
	 K24BND5awdkTg==
Message-ID: <366d06e5-11d7-7e1f-0ed6-4f370496d338@collabora.com>
Date: Mon, 16 Jan 2023 13:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: mtk-wdt: Add
 reset-by-toprgu support
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-watchdog@vger.kernel.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
 <20230116105305.31818-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230116105305.31818-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_040631_414833_6A89EC3D 
X-CRM114-Status: GOOD (  14.04  )
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

Il 16/01/23 11:53, Allen-KH Cheng ha scritto:
> In some applications, the mtk-wdt requires the toprgu (TOP Reset
> Generation Unit) to reset timer after system resets. Add optional
> mediatek,reset-by-toprgu property to enable it.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml      | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index b3605608410c..b4de6b134ce1 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -52,6 +52,12 @@ properties:
>       description: Disable sending output reset signal
>       type: boolean
>   
> +  mediatek,reset-by-toprgu:
> +    description: The top reset generate unit (toprgu) generates reset signals

TOPRGU = Top Reset Generation Unit

Please fix the description...

The Top Reset Generation Unit (TOPRGU) generate reset signals
and distributes them to each IP. If present, the watchdog timer
will be reset by TOPRGU once system resets.

Apart from that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


