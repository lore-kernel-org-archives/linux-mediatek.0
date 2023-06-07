Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B80FC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLEh8B6UomkdYUGDamGJdoonEu246aSTHyQY/cWON5k=; b=QhXGKAgxImUe6UqIwoPg6/jYfH
	2EqoH88vO4mXEBNzoBsd2dVOIpDy/6GrPD9qGwupXnj1eRldBSMKflH+naAutIgJx10Tb0f+bvLIH
	brnz1iRCAVB3MeCOy6D7GTY79LHSoB40X9yWECeKDfuTUaTYw+BRL1NLIKuHP4ZOMQ9mMxnYNgCXM
	WsasRn9Bu5tHzD4/3hsMyM8Nwt6RLSiYarSbafoPwNaV2myXcza/pQF8/iVtEYm4Ir7xc/jMN2l5S
	YOmNA852Pypp3Ki5Jw3eezhAN5N+RrDDaHc1+OUIzLnC6lKIuE+kOx1AEhlfttWnHMUKTm29yogXa
	M3oD3ocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nxX-004obS-1f;
	Wed, 07 Jun 2023 07:51:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nxU-004oZj-0o;
	Wed, 07 Jun 2023 07:51:57 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E0B816606EE3;
	Wed,  7 Jun 2023 08:51:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686124314;
	bh=OL6a+74rgSLOjh1XTzq5rghrVaLQdAGMurMRtvvZFIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X4Qhgr4m+UfwkPMV3xKQu/gKzqxUfdzwBkmsISXJgmv6w3xKsErUXNmRmZwxX4Pre
	 gv83wNM6Uve+omoUtSSSuoMI6YrxF2wjrM85x5QbW77NAEkFePNaMnMnNwc0Pq9BJD
	 QFYFd+xFLDH7yo0VVMF7lHhVpQujBEsD3LHe3wL248Lpd8KT68Th2hvGgDeu3hzn6i
	 mRECp3ztJt2yC+RvC6lMawGKiSG1Ot2X2BrR8FwICZLd9++jmkLsKNdW6vhhM37U89
	 cvyRr5iYMcOQZidNbq6AXLBKysaQPIxpF0R0HdBwze9goSCMqAOkZ5pJDNRYpJcSKc
	 kAMTr0gFlNSyA==
Message-ID: <72b71e37-f9e7-b182-824c-163d920723b8@collabora.com>
Date: Wed, 7 Jun 2023 09:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 2/6] dt-bindings: reset: mt8188: Add reset control bits
 for VDOSYS1
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Fei Shao <fshao@google.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
 <20230607061121.6732-3-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607061121.6732-3-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_005156_421060_504ECB6A 
X-CRM114-Status: GOOD (  13.56  )
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

Il 07/06/23 08:11, Hsiao Chien Sung ha scritto:
> Add reset control bits for  MT8188 VDOSYS1.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   include/dt-bindings/reset/mt8188-resets.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
> index 377cdfda82a9..439a9a25ca19 100644
> --- a/include/dt-bindings/reset/mt8188-resets.h
> +++ b/include/dt-bindings/reset/mt8188-resets.h
> @@ -33,4 +33,16 @@
> 
>   #define MT8188_TOPRGU_SW_RST_NUM               24
> 
> +/* VDOSYS1 */
> +#define MT8188_VDO1_RST_MERGE0_DL_ASYNC         9

Sorry, I've just noticed that there's no index 0 in previous definitions: this
is wrong, it must start from 0 and must be sequential.



