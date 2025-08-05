Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F9AC87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 17:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq8h+xLnHGJ8XkiMmmmLGvvQ4fgZKKt5kaoyZwJW8GY=; b=X6yjyGOSNfB+WMv2iP8uSl+QbN
	8pt38RVKyY9yMSP8uAjXwGvvm5t2V211iwpDAwRIAGz5p1kd9SxEDC3hqtmZV8LJFQ/tLQAZMvuSm
	PcHPH+EQdtmA5IyS+et5koVmeJ9VNytimNFf2s9YkJh1rFa08QlYlNQGJ9sunHIBIW2HRUWftce8s
	AWwo/RRCLMZmxDlyZRG5oTRVKNoMpah1klb9LJI/0286N28pLw0Unm6Vc4hu3L3GZm6aMXaeMQBOG
	z8FPMz+cZRYbo8OJMBrn4hlbot8J9grIqdfDowA75PlKGx3KwSKcII/SwXCp50PVmYN0XZV/j6R2z
	er6V7OTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLli-0000000DT0U-3ZlO;
	Tue, 05 Aug 2025 17:48:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLI8-0000000DPGu-23P4;
	Tue, 05 Aug 2025 17:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C7A5A566BA;
	Tue,  5 Aug 2025 17:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14502C4CEF0;
	Tue,  5 Aug 2025 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414255;
	bh=zPti4vHQ72c0KUJK1MFtmTjRrvlP5Fdb3fbdUSg7DhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTk+blBXu+Mhx+4uUQU5Gv/TlCK62jDarbWpdTCEI11qqCUJ0shwy5gSGTG0ZkRGM
	 GVn/0CuULcFpf+yUCB3kJo4vTZX5Mq5mzPySaZX1y3kJ/gqaeK5dShUe8qNguzewsL
	 1DfEpC87mz1fV0lSkKZ2OqSsW9wlhz4XLX5VEFtFAM4yhXvc1106qV2F8X6dx2LeMt
	 yJLMMvuFSzcREDDcFjmTNdvUUtxzawpdlR1d1Pd0rrKKQIBZhoPyKOQDuO2KLbB4NN
	 owm5jYt31sZvANBU8Rz0aqtrZSM2NzBPGjgl/2SrcvnSn1Uuhk7mElcoDCyA8ajAZB
	 Qg8SgcertQPxQ==
Date: Tue, 5 Aug 2025 12:17:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH v3 9/9] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8196
Message-ID: <175441425377.1957748.9727174250578457285.robh@kernel.org>
References: <20250804133035.309990-1-laura.nao@collabora.com>
 <20250804133035.309990-10-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804133035.309990-10-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_101736_593104_D01BBF1D 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, rafael@kernel.org, kernel@collabora.com, bchihi@baylibre.com, arnd@arndb.de, daniel.lezcano@linaro.org, rui.zhang@intel.com, colin.i.king@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, nfraprado@collabora.com, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, srini@kernel.org, u.kleine-koenig@baylibre.com, krzk+dt@kernel.org, lukasz.luba@arm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 04 Aug 2025 15:30:35 +0200, Laura Nao wrote:
> The MT8196 eFuse layout is compatible with MT8186 and shares the same
> decoding scheme for the gpu-speedbin cell.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


