Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A8C41535
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3+ycALoZ2BMAkx/lyzbn6fEx0Nc3B4VwBxnsjkG45s=; b=2YjbYp3Si2bzXCtdK6OXUCB9Q7
	7vxnVnmswF6GwAA0Btl04FsFtKCBYg7eqZoGzjtPWPS4aBE0OxvSYZ8kfRqgyjVD7HGODs7XHleL5
	wLzj5eCkm9712tV3WarAQQBusrtacsZlso+QC05KVGhoSwN0roHFFm6vOoH3gqccCg6XIj/vUQsTD
	oIcQHXARyVyqw97Up43YChB70/nVwFha94b8aTmyNgMOW73XwuTe9dmaQsEK+ENKNg8zCXaOzchSg
	QxSro+PD+M2/E3ZxDd3UVN4MttnvbR3MLWFBlZB0t07REKbXVexnIj+m3WVuI7SPgo7kawYhvXMbl
	vgK2iVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0MY3-001g1b-1W;
	Tue, 07 Nov 2023 13:55:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0MXv-001fyu-2s;
	Tue, 07 Nov 2023 13:55:16 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D88066074CE;
	Tue,  7 Nov 2023 13:55:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699365307;
	bh=lEovXn58/a4qnfn12fKn636CmpY/k7Bme8lkfOulb/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b3cY5YwBIxpK4sAvXA6iiM2EDfd+5tG/YQQgKjaRzy6Q2pPcZo+fL2kgLsimWGfzh
	 ChwLHWADVMWoPM9DBcoGGkynvuiJt+qmzXGUwPA74HFfctyEtdH5ZcZfKEDne/hv/5
	 oTSZJ9ogffTuXH9OkMCvrjlGyjCYUn/DIEEYvdkONqf0+idjbq32qrPF66yqGMciBE
	 3eaJ/gZFZbXfY80AAXV7/Md2iyD+CR7zBA9eXnFsxi+BzA7NOwgArqE5vlrq9T/y+8
	 fPR3wxQ9OC04v/+792yj0/jjK9r8Ne5WRduqQJHOYjDKkOHFW7uCNRTxjpiQt2z37/
	 bhojXkVF5oMQA==
Message-ID: <534c55c3-d045-4c0b-a374-431ac0fe4751@collabora.com>
Date: Tue, 7 Nov 2023 14:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: SOF: mediatek: remove unused variables
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
 <20231103095433.10475-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103095433.10475-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_055512_105379_29AD82A4 
X-CRM114-Status: UNSURE (   5.69  )
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

Il 03/11/23 10:54, Trevor Wu ha scritto:
> To prevent confusion on the follow-up platform, it is necessary to
> remove any unused variables within the struct mtk_adsp_chip_info.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



