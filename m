Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78948C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qFNdX24olJj5cv5MNZobuRcfOl3sk5CoOmO46JgaSQ=; b=d6xxGF4xL1RsSVnlyA4C7vS9PU
	G0fdkrNWPeH6DM6Q/EktLZJJixBqB1O+pzMlukevw0RdhEpzu5xgWjC9nQ9lMn8O3vS4+XNtGgc+Y
	iaLh3Mj/n3MgyPCip0sCFl6ePlE56QWL0IxBc0BgfvYGaEERV5Vq6Re7ZypJe4FauRDAULmnevlBC
	29fstHjymcPiVNkQ19y5iWqhySM8UM9XUmQ9+KzjNje2O1IEPGzDlwRUVKjIo7MWg90gXV8hPvftF
	Lyd0DR93QpYoRLc8UrqDytQxeQpPnIfoH62DppsUjLtK47yi9iFnvOsss22dTAzw4WMnpkCjbfoFq
	TTk7amTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f9I-002pel-0d;
	Thu, 01 Jun 2023 10:03:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f9F-002pdQ-0u;
	Thu, 01 Jun 2023 10:03:14 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1896A6602242;
	Thu,  1 Jun 2023 11:03:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685613792;
	bh=fBGL4bPqrWdlEx8OCDvLG0uYfi343SDPLIkWwU5ZiK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=POcatlQ+8JMl+loYBG85HYHQ9cQPvs/hL3XzH0Zdbb2NGX2H7TnZkWYxaP61MAykd
	 mI/bdIT+3WB+37YWTwrzPLYxg1mbUV+2AHZ+Y5gvvl6PZ+yJ0oulJ97HMcwPYZYGlr
	 V/GmGNPh70TffnKo7CNx0K+UdTlBY/lnPodb6ykFTC79druf4Bqn/FD+atu1GpE0m8
	 WQ87UbMG2dNpudyYJ1aQpPpoPw2LQA4Emk+5RRa44tzLZ/hocffZPJga5BV6x7MvmB
	 K6kM5FJzu0cxBhZrcvxbyYNPgoyo3DlZTbJa+IxddVMK2YPGWikx/IVqaF5D6XXpDV
	 KQjpImX8cbeFw==
Message-ID: <21719c2d-a465-35eb-8ce6-8ad3a376b883@collabora.com>
Date: Thu, 1 Jun 2023 12:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/1] ASoC: SOF: mediatek: add adsp debug dump
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, tinghan.shen@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601034939.15802-1-trevor.wu@mediatek.com>
 <20230601034939.15802-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601034939.15802-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_030313_452950_523A679F 
X-CRM114-Status: UNSURE (   6.86  )
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

Il 01/06/23 05:49, Trevor Wu ha scritto:
> Add mt8188 and mt8186 .dbg_dump callback to print some information when
> DSP panic occurs.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



