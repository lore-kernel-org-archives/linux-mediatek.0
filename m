Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0606FECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaI/YReTC3BIlYtZ07v8cDaN5K+sY2T+W0qJCfRxBJg=; b=wkkRMzP3YXteZ6cbzPdh+SLLmX
	zRxf8dgCyi7/x4m3hOuyTpJbXz9iFEwqb+nl0shA56Nub0+XniXxR47Th2uwIp4k8Nwt3jC3138/2
	UAfIvQGXgvKXyB5lrUdmSx72VIckZMaaEtfP9sMlnGscsclqufN23mOMeNARmPnT7zzjJCES3P9LX
	OnUFKWmUqIWvKRXa/KtxbOWSR8b91HtfCzlXPkrhVP6jej/NuW8xs4kX+KieiTfR7K20ai4Ssqmk6
	tIVjbjrZ9uf8GGJxSI45IoW+lad4IR6pGmb9U7okMW4DTIeNPKrO/EACkOK6VP/k5y1D76cdNLJeE
	oYFkRHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZW8-00Egpw-JA; Fri, 09 Sep 2022 08:37:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZVn-00Egct-DX; Fri, 09 Sep 2022 08:37:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D006C6601FB8;
	Fri,  9 Sep 2022 09:37:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662712635;
	bh=J4wxsmKEaXLH0SwiwOsaRMS9ekCs5JD8wxfbrPlVQq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D5w/1RjmCkMnT6fAF9pmmHWIQ/LjgYU4uzrh3L2zQrZSNM1RVaCGdGdVHLBtD02AL
	 UD5cU5CMtDLqGM3za3Q+0kOxB/yamTlTVeM6GsHLUccIoazLGV415h8ECGb4LddNfa
	 grQA81TfQubySLuhVbu0vyuzckPXadi13RUHdtbpe4paqeph4Q+V6vrKrazf2w0sO3
	 sxfVcg5y/KTa0JAal10cCgFXoF1jWE5WzmXNiwTZzmNSC+2BpgIGvwtk6mtLxCbqy2
	 zdntr6bHlb5xUenu8HHGETGGgjQRWRPQauePJmCndggkYoOUtDBM9YAy4CZwxOKpBz
	 VAwzH8f8XTb2g==
Message-ID: <76d76339-a67d-2004-7c84-62203a11cb11@collabora.com>
Date: Fri, 9 Sep 2022 10:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 3/4] thermal: mediatek: add support for MT8365 SoC
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, matthias.bgg@gmail.com
Cc: Fabien Parent <fparent@baylibre.com>, rafael@kernel.org,
 amitk@kernel.org, daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
References: <20220909073609.32337-1-aouledameur@baylibre.com>
 <20220909073609.32337-4-aouledameur@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220909073609.32337-4-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_013719_627294_468450BF 
X-CRM114-Status: UNSURE (   9.27  )
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

Il 09/09/22 09:36, Amjad Ouled-Ameur ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MT8365 is similar to the other SoCs supported by the driver. It has only
> one bank and 3 actual sensors that can be multiplexed. There is another
> one sensor that does not have usable data.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



