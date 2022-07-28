Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8B0C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dqf/NfFWC5lgZq2BrUGbZfBQ3MklHB8SSoa9o63N4lE=; b=IZDlHhTgnfd7lyFGkkZ+zPkPNU
	PfjVowDsnd1t85/EY017yUEbHK/wEoNHXqE3UcnuRMohvAAEf1xW5gofK1kYvALALvyPJIXf8DpGE
	5C0TMgMUUl59TGLmCpe91NgYJgNmw84PuORJ2+Nif2NT7cKohSdm9JeT14N1V3Ac41y1Y/23CAsx/
	RzaHCfwSpHERoL01wJ0mmHiVGlYHmOvvKv9loRDwqx8wIXVjo6GU65fdWBHmWqmjoSVX3mnRSnRqu
	38LvHMOavK7x5l5JZ1vohKhkdFr38t6QMz0sDnfi3S26wqHs8YGPlu+sjh6Y9mRT2cHOG5OcJnPSg
	LAb/tv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1H2-008Z7t-T3; Thu, 28 Jul 2022 11:01:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1Gr-008Z3S-Pn; Thu, 28 Jul 2022 11:01:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A32F66601B41;
	Thu, 28 Jul 2022 12:01:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659006096;
	bh=2Gf8nY7WN8C7IH2RQ1ZvuEwtQ2J2d47oOyVP2UjzX0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D0ve+y61ACPxexiD5k+nJUzMQxkgPGYCCiP3FRnIqqm0OEgYR6QVsTOLSSWVVgya7
	 2VQIRR7GSCMIfIjUGDf6Q3F8UY0Y28mIwpwO+eBgiHO/UmrMvU663MjrSI8DVQedRJ
	 sFblSS3X6ERr6lHz2XWrbyBssnQjFdLESVHTHB3dEGlF6Cj8fGFh1Fqo/9rquom8M4
	 Msj/HaqYXRKgdtlxNQQ0aiB4Go6lAq9/vMs4K7J0IlBLxYl3R1nYQomgfxZ09osUGH
	 HFNs4LzTczSDfMROi8bMDUiWZGVJ2bCRE9mYEDKzrQqz3jka6SpJJxIrh+h/B/wkzG
	 Cyzdi2hQFY9Jg==
Message-ID: <c6c649ab-d147-a5b0-f95f-71b0ab0e8344@collabora.com>
Date: Thu, 28 Jul 2022 13:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] dt-bindings: memory: mediatek: Add mt8188 smi
 binding
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220727104541.7309-1-chengci.xu@mediatek.com>
 <20220727104541.7309-2-chengci.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727104541.7309-2-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_040138_000612_CD887A51 
X-CRM114-Status: UNSURE (   9.96  )
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

Il 27/07/22 12:45, Chengci.Xu ha scritto:
> Add mt8188 smi supporting in the bindings.
> 
> In mt8188, there are two smi-common HW, one is for vdo(video output),
> the other is for vpp(video processing pipe). They connect with different
> smi-larbs, then some setting(bus_sel) is different. Differentiate them
> with the compatible string.
> 
> Something like this:
> 
>     IOMMU(VDO)          IOMMU(VPP)
>         |                   |
> SMI_COMMON_VDO       SMI_COMMON_VPP
> ----------------     ----------------
>     |     |   ...       |     |    ...
>   larb0 larb2 ...     larb1 larb3  ...
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


