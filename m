Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57975C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 08:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3ElEs1gUlfr3J96mslGPr5ZZSV+6CIuZ+tfuu+KnHg=; b=bLlattlcvv19+IYHlM3v3eNIQN
	3Yru1dOmLpjkaBecjf7AgO92yo2CsXrsYMQlJ0Ws8k23j3vcj5o8HpwCLhSV6cQizu9ibK0xZEj6/
	5RtRzpJ3FODS7gi+s+jwYQeP5sQUges3SqEAVTDihJ/zr7y3S9+8e0W5xDCeWb9GNAKWiXHx6qe9f
	gJtzSypUqjRbxEbRzBE1AciyHhJxYRZVx+LolGEkC2Fgae4/G7kOCFSbDOZzzjQeKPUA3Q8zkM0uU
	QQ9xx2GU1O4m8C8o1TC4rRhc/hTJcvF3qIXnjqVGZfygl3qYgNh6DMY2/v9OnARMAt+6uRdaAol6w
	BIrMz92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxXe-00F9Li-09;
	Wed, 05 Jul 2023 08:07:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxXa-00F9Hp-1W;
	Wed, 05 Jul 2023 08:07:11 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D8066606FAA;
	Wed,  5 Jul 2023 09:07:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688544421;
	bh=wMIKtLWmpmEk0JFOIuuWIoQ/SSS33L2o6nCQXzsNE/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c6MQQP04ioq4F48xkOrOY+vudDg5jja/t8+Z5fiKf1Q/214F84m37Nd0PeKNSmeKD
	 YEa5J11zjHOrSep+OGX9yvgP3ZSje+9GpeYwqRtNFPG+rGQP4bicVV3m6VwLC0J/p6
	 iHm41/NLdq3jmQCA7RurRfypVbWRvH1r+Q5Hsk78iYfh2aiQbjeWkyNMD4L3SJEvDu
	 xMLhDyo0nDvBn54dmAuD+siAI0XJcQcysPcQ+hYDYu2IJmKnvD7JJG5AMPgpSTzMPI
	 goM8xhWJyrn6qVkr+DL7+F12e3eknEGduUmsRBz1+zE8KWCcqj9o8MKGDOsBvuW1YE
	 1Mmg7fRzbqyGg==
Message-ID: <7e4a3d1e-ae48-77b6-fe24-0a165c137fbb@collabora.com>
Date: Wed, 5 Jul 2023 10:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: Add mt8188 pericfg
 compatible
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230705065744.25848-1-jason-ch.chen@mediatek.com>
 <20230705065744.25848-3-jason-ch.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230705065744.25848-3-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_010710_639790_9CB8C23F 
X-CRM114-Status: GOOD (  12.43  )
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

Il 05/07/23 08:57, Jason-ch Chen ha scritto:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> Add mt8188 pericfg compatible to binding document.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> index 26158d0d72f3..33c94c491828 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - mediatek,mt8173-pericfg
>                 - mediatek,mt8183-pericfg
>                 - mediatek,mt8186-pericfg
> +              - mediatek,mt8188-pericfg
>                 - mediatek,mt8195-pericfg
>                 - mediatek,mt8516-pericfg
>             - const: syscon



