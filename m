Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36350C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJu39uKQb5FUWStjjO5RSJfgZUiVaMUMW+vetWTKfvI=; b=ZhgHF4iC36gnzid2MndKUPXR/D
	ggWR3w+YLQmbZ1vY11DiYkaT+yvN3DtOqRPiuV6tq6UuvEBq5PcFnZM9GYYG0B3cqLfuMRgDBdLg9
	QoKLzHgGzlDphkZ0lXMTpEpFWBdX4gVZQoxgzuzM4wB+EBUIJguojb3sx94r43cHPI9DQkSnJ/9td
	SfM7EOipd6ibN8WIPron5E7qES1/mrdv+9clsM+5JbPA74fdFy/sa92NHvYKFOPiNAUqYw0ohT2Hr
	N4G2Hr0y0QU63OX94cP8k59LE9iPHDWBsSr9NIXKxoyJbyf24sJ/dDNuCBha2F969iI5DBsnqhvIT
	zPOmYS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4j3-009gxK-JP; Tue, 13 Sep 2022 12:09:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4ir-009gKS-Rs; Tue, 13 Sep 2022 12:09:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4649A6602002;
	Tue, 13 Sep 2022 13:08:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663070937;
	bh=ytNEmiOcTsgWo0PMOFDU/i6E5lJKDu8uqwY6x00ydfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFHlB0J2yobOwBvsWUUS07kgVmtwvhQ8i0BmdU0Mc14MRQ8k2mS60QKiOyPOT4BIm
	 aZrp8CbbkzYxHPK2wQopWJ68KZ0ISvf8ddrLGwPNK4t7Ts336PtSjjQBmSDyZONOF8
	 Wc+MYU+dWW0Wct9deGcnCiuAa1O3kXKQsBY4fh38B2f88+8SoVJHlQmI3Z1VmN0kYq
	 9xSorSGxfXLbz3SXAjKJiZ55Hc6yT/JhjPAYyWLK+9LlwHhEmOssamkXBlXswm07dg
	 PRNhCH/5FHNEIb3pY7pY5YNx7zwndByB4z+BDES0tryYxvo7WERu5BVyJY0+1C+WDX
	 ydQ55sH6DQwdA==
Message-ID: <ca89b96f-cb17-e6b0-5dcd-fede79737770@collabora.com>
Date: Tue, 13 Sep 2022 14:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] soc: mediatek: Introduce mediatek-regulator-coupler
 driver
Content-Language: en-US
To: matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 alyssa.rosenzweig@collabora.com, nfraprado@collabora.com,
 dmitry.osipenko@collabora.com
References: <20220628120224.81180-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220628120224.81180-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_050902_161459_8DE5531B 
X-CRM114-Status: GOOD (  18.50  )
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

Il 28/06/22 14:02, AngeloGioacchino Del Regno ha scritto:
> This driver currently deals with GPU-SRAM regulator coupling, ensuring
> that the SRAM voltage is always between a specific range of distance to
> the GPU voltage, depending on the SoC, necessary in order to achieve
> system stability across the full range of supported GPU frequencies.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Hello Matthias,

gentle ping for this one, as it has been tested for quite a while here,
on multiple MediaTek SoCs, and it's working as expected.

Can we get it upstream? Is there any blocker?

Cheers,
Angelo

> ---
> 
> Changes in v3:
>   - Added braces to else-if branch
> 
> Changes in v2:
>   - Added check for n_coupled
>   - Added check for vgpu to enforce attaching to vgpu<->sram coupling only
> 
> Context:
> This driver is one of the pieces of a bigger puzzle, aiming to finally
> enable Dynamic Voltage/Frequency Scaling for Mali GPUs found on MediaTek
> SoCs on the fully open source graphics stack (Panfrost driver).
> 
> No devicetree bindings are provided because this does not require any
> driver-specific binding at all.
> 
> Last but not least: it was chosen to have this driver enabled for
> ( ARCH_MEDIATEK && REGULATOR ) without really giving a free configuration
> choice because, once the DVFS mechanism will be fully working, using one
> of the listed MediaTek SoCs *without* this coupling mechanism *will* lead
> to unstabilities and system crashes.
> For COMPILE_TEST, choice is given for obvious reasons.
> 


