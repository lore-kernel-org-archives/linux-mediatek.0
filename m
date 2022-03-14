Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C8DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9Xp7oOD4Ii+VRcyMD8lKWobBchXCFn5tGNmixlwwhE=; b=t0YN9q+zPq0HT1
	Fl8UYg3yIlQ+K7lur4Qc/G2YWEI1/h579xVfYYrp6jr6IvOBdKC3bzd4c9VzdmbxP4sQi2O6K1YKV
	08Z3O+x2EURR2YoYHVUmb5qEtm92bK/b1HKZM0F9QIbuA41+blcSE5vHrSLMdv0LcO3xP2Ol5vgAY
	4wXjbl364cBqYOM2d9PUUXUTry555jEMyCrmhd7IrpXjP7LcOWVQkaAiNdQc/6Vd5lxiB02ngYA/h
	xm54A6jZX97gEtQx+Jl6CGpQbpcz8YzXasWTXPpeT0dwdxOSKUkDpfQJdLItndmPGd85THqIqcqt0
	xqfNzbq8jGNVIh4uPppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTivb-0059kb-PV; Mon, 14 Mar 2022 11:31:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTivO-0059g2-JJ; Mon, 14 Mar 2022 11:31:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4BBDF1F433F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647257500;
 bh=xtxrT2bamlWz6iXZa45LA5QO3D2qQ09Z7rxdq4K7m4I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bkBm6JJXlTt7MmmN71Nlm9cMk1/zHBg9MkbwKg8XzoEbuWmK26zYeYrFews0nI0Jc
 ZapKj23jnPtVXFcL9OvYTNKp1EGu/NJcb6d71cjcer+T9Mx3rvu9UFCzc+ld1qQeBA
 9uEnDlUOwDWdL4Zx6tGjWL1aeflzZy3egX8igARPlUQljEFqe1da/qMhVUIgpUBZnA
 5dSnKmYi4jY1aPW2PEJd7M9hZ1fZfsR7UHosTf8KR3PhyoofUvZfHCq/u2Z/YTetVY
 MNOcG4qj1X/k5yVwDuaza7hnsT61Ti/gReMcOUdMai3hKLRBU9FQXkwj73AzwcWRHU
 KasflN6tsJ26w==
Message-ID: <36e7847e-56ed-8768-388e-c6a00a2cb0ec@collabora.com>
Date: Mon, 14 Mar 2022 12:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3] remoteproc: mediatek: fix side effect of mt8195 sram
 power on
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220314111806.28168-1-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314111806.28168-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_043142_845784_A637712F 
X-CRM114-Status: GOOD (  19.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/03/22 12:18, Tinghan Shen ha scritto:
> The definition of L1TCM_SRAM_PDN bits on mt8195 is different to mt8192.
> 
> L1TCM_SRAM_PDN bits[3:0] control the power of mt8195 L1TCM SRAM.
> 
> L1TCM_SRAM_PDN bits[7:4] control the access path to EMI for SCP.
> These bits have to be powered on to allow EMI access for SCP.
> 
> Bits[7:4] also affect audio DSP because audio DSP and SCP are
> placed on the same hardware bus. If SCP cannot access EMI, audio DSP is
> blocked too.
> 
> L1TCM_SRAM_PDN bits[31:8] are not used.
> 
> This fix removes modification of bits[7:4] when power on/off mt8195 SCP
> L1TCM. It's because the modification introduces a short period of time
> blocking audio DSP to access EMI. This was not a problem until we have
> to load both SCP module and audio DSP module. audio DSP needs to access
> EMI because it has source/data on DRAM. Audio DSP will have unexpected
> behavior when it accesses EMI and the SCP driver blocks the EMI path at
> the same time.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Hello Tinghan,

I'm sorry, but in the last review I forgot to mention that you should
really add a Fixes tag to this commit, since this is.. a fix.

This is the tag that you should use:

Fixes: 79111df414fc ("remoteproc: mediatek: Support mt8195 scp")

After adding that,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v3: fix build error
> v2: apply comments about macro definition and function calls
> ---
>   drivers/remoteproc/mtk_common.h |  2 +
>   drivers/remoteproc/mtk_scp.c    | 67 +++++++++++++++++++++++++--------
>   2 files changed, 53 insertions(+), 16 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
