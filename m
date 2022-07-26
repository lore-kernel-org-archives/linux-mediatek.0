Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2914DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jwdu98UYWOuEW6XBoV8gpkZA7B/v644NQpHcT4+eRDY=; b=ef7mB+Jk9Y48YkqgIen3nZSpUL
	pSeffL9IZkpLPL8u60vNstNK0lrcztQN2QPSf0jxJFcAtHErzD+l3Z5gKo8W4ZDM/O43nL9PjMaMG
	nn10c9GvMGUDtSZgfAv3OPCK+dxUt3j3aE2wLpsh/8DRxRNFHh9aoHuN8Q/xCU5wiT29RIPhx9LrF
	Dam8GSGzyLBjU3C2MTDeGLZnYs3nDt/u6ayPcAcq7/gks7w2Evc0UtTRSmmIXt+g77adLD5yVSZtf
	Z43l0PyiKdZVYOwjhSIS14kUFzt/JNUdq33AmtY736ILqg5wbO+aIETlN2mlyBTXpHltj7Ne4LV14
	RhQa/S+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFap-009t2m-Nm; Tue, 26 Jul 2022 08:07:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFaB-009sPM-EA; Tue, 26 Jul 2022 08:06:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F8EE6601B14;
	Tue, 26 Jul 2022 09:06:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658822782;
	bh=1gg6G/v1MUzA5d4puugVUB4z/jkdxRZujw4Nkfqzgb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=axAiqS9tj7R0mv6U2yrKGSBPgnVnsnCRqRetimX5co3/3cApvKHCBZ9CjXnL8/obZ
	 ktT7ZqmBp0lWX1utLWqjbzGPGMImhjbjrYynDa1OiGNV5M5QxLCH8nk+rLETiLBPBr
	 49gGZYuPUOlOeBwGgNMqNYr9eBxf3/ylUqtJ/bGKPQAvtKXpO3FeIkIZE+M/OqtSwF
	 OXcDH1KtlpySHDVLuibe94EunhVq8xPJNv3zOz7UI1Mmdmb3fGi99EV/Ph5DA1brvi
	 zAXcqQaQPtCs5kfTFV861l5hZMRSjTB8M7Worp3leDPW0RYWM7UzFk7TR26vQRZB+5
	 WA85niqsayLHw==
Message-ID: <3e63c06e-0f8c-c813-fc51-8be56e358d07@collabora.com>
Date: Tue, 26 Jul 2022 10:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: add decoder compatible to
 support mt8188
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220726040155.17206-1-yunfei.dong@mediatek.com>
 <20220726040155.17206-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726040155.17206-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_010623_644227_EF98D3C3 
X-CRM114-Status: UNSURE (   8.36  )
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

Il 26/07/22 06:01, Yunfei Dong ha scritto:
> 1: add mt8188's compatible name: mediatek,mt8188-vcodec-dec.
> 2: mt8188 is lat single core architecture, using mtk_lat_sig_core_pdata to
> initialize private data.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


