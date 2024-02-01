Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7997C4828C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwShds1DSOW99jywzyDnMv19QsZraNkfPoDRWVlBrdQ=; b=PzVuFh8POhWaomkJmKIv8aZLFj
	ttB8XCAG0xsm6+viFmPli1pMKrvLFuswgO6BBwSQcaxzQcAXMGKBigiH+hHGHyc3YRDOwoHaiv8jv
	jXIq0souajg7PcbVY93zbhVlFpNK6lnrlvrkLzWzZb8N+Tp2TIO6yS+fuRMdDyrW2TTxUaoMWV5hs
	XPVYCf9l6cKjEvNhq4kF1YC8pv0XOxOR0Pm7mRmn4+qHTTFIzFfocz+HHUMQnOU3+4B8Vfr9O/hCZ
	GPspsEdiyEMudsfnYTDI4p5UP3TEDFJZYiNGVv2FecUcMWkuUz/VVc8/JF9YY+OVI796Tfs3JQcua
	hw92yZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUan-00000007VYG-2pfc;
	Thu, 01 Feb 2024 10:46:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTcC-00000007K8W-3wJU;
	Thu, 01 Feb 2024 09:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706780651;
	bh=CQ+G0j9FxKWITjhQFY4SwZZur7CT0j14ogDVrgi21NA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s/tsIeBSYEvrkvPa88cGQTK3vogxX2XYOiVZ7T2WQ5TTGXK0MTMj7ojoG5gvtGqbq
	 ScJHUt3KfpVJvV6ulBryKd6p15MCT+DKAElOyaVqJ2Do7hv8cVSuTevLIKPmuJRsnn
	 DNThtdUYQWjgC6K6l5F4gzofQBDwIB8Nrp808kxdi0q9Q86qMvo/tCf1DHOh9MNQ2/
	 tdCP4O4FdNtIHPoBgzzUAgMrZT2k3QxtCxFcDABONArRHjCm/b8+PlZt3Uh+nBCC6l
	 oYnTOrBdZcUuv+gQ2AaGsSN+3F6cR6ansvsTsaIvRpIxyEIDdQEL5rDi7sXasvHuOI
	 VUWV53PLn2DWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 40B02378208E;
	Thu,  1 Feb 2024 09:44:10 +0000 (UTC)
Message-ID: <c027bf67-e9b2-4eb2-9dee-a47a9c3bdd8a@collabora.com>
Date: Thu, 1 Feb 2024 10:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/21] virt: geniezone: Add vm capability check
Content-Language: en-US
To: Yi-De Wu <yi-de.wu@mediatek.com>,
 Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
 Ze-Yu Wang <ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <peilun.suei@mediatek.com>,
 Liju Chen <liju-clr.chen@mediatek.com>,
 Willix Yeh <chi-shen.yeh@mediatek.com>,
 Kevenny Hsieh <kevenny.hsieh@mediatek.com>
References: <20240129083302.26044-1-yi-de.wu@mediatek.com>
 <20240129083302.26044-8-yi-de.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240129083302.26044-8-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014413_282959_FC01B134 
X-CRM114-Status: GOOD (  12.45  )
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

Il 29/01/24 09:32, Yi-De Wu ha scritto:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Inquire the `capability support` on GenieZone hypervisor.
> Example:
> `GZVM_CAP_PROTECTED_VM` or `GZVM_CAP_VM_GPA_SIZE`.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: kevenny hsieh <kevenny.hsieh@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>   arch/arm64/geniezone/gzvm_arch_common.h |   2 +
>   arch/arm64/geniezone/vm.c               | 122 ++++++++++++++++++++++++
>   drivers/virt/geniezone/gzvm_main.c      |  27 ++++++
>   drivers/virt/geniezone/gzvm_vm.c        |  21 ++++
>   include/linux/gzvm_drv.h                |   5 +
>   include/uapi/linux/gzvm.h               |  31 ++++++
>   6 files changed, 208 insertions(+)
> 
> diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
> index 2f66e496dfae..383af0829f11 100644
> --- a/arch/arm64/geniezone/gzvm_arch_common.h
> +++ b/arch/arm64/geniezone/gzvm_arch_common.h
> @@ -13,6 +13,7 @@ enum {
>   	GZVM_FUNC_DESTROY_VM = 1,
>   	GZVM_FUNC_SET_MEMREGION = 4,
>   	GZVM_FUNC_PROBE = 12,
> +	GZVM_FUNC_ENABLE_CAP = 13,

GZVM_FUNC_PROBE  = 12,
GZVM_FUNC_ENABLE_CAP,

>   	NR_GZVM_FUNC,
>   };
>   

Regards,
Angelo


