Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9C3C10F04
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 12:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMSMEfT3wdl2k8gY6UCvv9grPyDzh8kxzPgYBmL4a6w=; b=yPxssRLDoWbmZZ2hUUM4rHQj2L
	XkrjBtVDaCQDqOv8RMpTsdXciHsoeMpUSy6LblgMpMbMsIfyNYDtWVeGP6PCWaLjv2GtPeaDLti9s
	Cw0B5cfCXST1Hy8mZ7dGfZNnoLTB3E/J5uG4RukLOS/gzrKss1CbYIuCviQaR8XgolfepVFRJd7sO
	Hl4LcHOC6ZrMfNKrKFvuWGxhcqXiJjcYJn4rYPNIgScYiwK3rlJbOslnQVS8B12Mia2kUNSXV2MQ2
	XiRyRHQihnITgx6MW1TyfbbKJCk5Ya9Rsg0GxPYAVOWhDGIjPqV0DNPMOrefpDYZkB5Wuz408onXU
	tVrqed9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDdu-00CoRw-1B;
	Thu, 07 Dec 2023 12:38:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDdk-00CoKE-1q;
	Thu, 07 Dec 2023 12:38:09 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C5356607394;
	Thu,  7 Dec 2023 12:38:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701952682;
	bh=hb6z2Q9CYyAeDNhwbTzdfMk0lfdKi2GgZN0PWnVEr7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iOSzA8mj3cT7Vug+lBFst481/o3Jw4y8+7P/jZnj7NAenxNxL3BmwAdje2a+4uv9L
	 hWMUqjaOmgEKfErzODvCOQSHVcJCdVsLAUyN6S+fy/KZLmkbWCD2ekUiUkeXCfB3Ez
	 +KpuytKTWzXg7P8LRckyNFogNCt59M1D95ZPEk6ukh7qvcaohEyrHdZxFOMcSCWkFI
	 KLTUaUNtGSZUgk8vhuhcOna5SYNPgBcFe+QlQfcW5b6m1aRDhPw6jWcSyB2iskUrca
	 fM3PQe0iDG9Ci5uRrS9wTzQfvNS6mLF0N6+bIHJl9LUOgyM0oFmKBRS+mDSTvVXcxw
	 GRh7d5kf70SHA==
Message-ID: <8dbd5913-8448-468e-b99d-6e3820ff0c72@collabora.com>
Date: Thu, 7 Dec 2023 13:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: mtk-sd: add tuning steps related
 property
To: Axe Yang <axe.yang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231207063535.29546-1-axe.yang@mediatek.com>
 <20231207063535.29546-2-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231207063535.29546-2-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_043804_748827_E87E146B 
X-CRM114-Status: UNSURE (   6.07  )
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

Il 07/12/23 07:35, Axe Yang ha scritto:
> Add 'mediatek,tuning-steps' setting. This property will give MSDC
> a chance to extend tuning steps up to 64. With more tuning steps,
> MSDC may achieve a more optimal calibration result, thus avoiding
> potential CRC issues.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



