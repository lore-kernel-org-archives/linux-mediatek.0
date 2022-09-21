Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360FDECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 12:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCNKWg9mIirpAsq6CDL/S4tRTfz/p4E1Te7CB+xS8RU=; b=V5uU0aoG/oRu+cbX6XEap+Wpks
	uBR9UFdtcs/SPo15UUV7rH5TLKPdH4x8r9C1Se/uD6pD8WwzZjXCg7A/N94cy8XiK9uKrfLH9Pxfb
	Z/vcQudMUy4nOEWz6PHaXh5ISHLl50QXz4a56e0CjYYwZ0zAtUWGXM2ARP8qVm32SyG/MaRpneH+H
	vm96puOR2/fUGrel9jz1vHeWz6eGMKNl4AGjBZri06/1oxLJuz0Y7cxs3FDxcvEevyzsvE2UB8Q21
	DAUBB2cCsQ37Q8B7kAA/iQPHg8rbgw19V33sWJN/xOI3kBEU7hCHWXzu1uUtqubDDP0Q+N85hLnID
	7YuQDQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaygB-00BFyj-Da; Wed, 21 Sep 2022 12:18:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayfz-00BFw6-Vz; Wed, 21 Sep 2022 12:18:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9416C6600010;
	Wed, 21 Sep 2022 13:18:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663762681;
	bh=ZqLHdcmZ3jM1WLgRQfy/dghDg8AblsWqEL1j75mDDJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgLMbHtr14YD0NJw96u62HHbnIPkNyWHmQTWLMe2lDPiHzjbMPk6ds5swVfk8S1Q8
	 SLXGwlaKhEetj1yy7nMHlZe95lbBiRNGeIoCnK3BSdL4PvcRy7F2YhtaAkmbMRHlFh
	 QaHw5soZow7GVt9GZ4gL0acRAJSS5KmANMqZOa/wr2cRnFOghlk5J5LXClcV5pPKTB
	 ic5alO6vUbtxg/hfHepE9R4foLLaZFl+AhRBovlvi6BDBBGFa7HUpxkd/u2Xrn4xL9
	 CRrB5jRuHS0RqsHv7EG9A9QbKW3mKukzdLgGT8sj3G2qMyYJI8lG4n13Ox5kgsI6RN
	 IiCOX4Z9m3Kog==
Message-ID: <dbe3f7fb-5fae-b147-f824-cd39ba3900ca@collabora.com>
Date: Wed, 21 Sep 2022 14:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
Cc: matthias.bgg@gmail.com, yc.hung@mediatek.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 project_global_chrome_upstream_group@mediatek.com
References: <20220921120239.31934-1-chunxu.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921120239.31934-1-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_051804_266586_28984577 
X-CRM114-Status: UNSURE (   7.30  )
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

Il 21/09/22 14:02, Chunxu Li ha scritto:
> add pcm_pointer callback for mt8186 to support read
> host position from DSP
> 
> Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>

Hello Chunxu,
Can you please also add this, along with the .pcm_hw_params callback to mt8195.c?

Anyway, for this one:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



