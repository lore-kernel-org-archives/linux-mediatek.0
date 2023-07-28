Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB2CC001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l68HT7O6Xx8AWB37bZWB1pnAxXebHSVNVuTpzywGEt4=; b=JoveNAnwBv2r0LEo3Qbhhy3er0
	k8flryG4jnVYvr60WoPnRsU5ETmPsAM/4FRGTKEiakXTCuRgB2r0wdnrKCheeGJnFIJx72FKW3TOu
	+0cD02Zl1WV8yd4QnngMWY0hdp29lJVFYA2lyr+pjNjRUMetITvDUyDOd8f8G4VWTEOjaZjCVwh2Z
	s8QG8DzivtP2qH3nioAvWm3v55ZeEqyO3X0AWGUi9zycVE1x//fTwQ6LvLshVozLVekzvX74/+mhN
	Hn3X5Dbi3Ile/8NpZeCPpk2njh+Y4cgKEmW3mvfwbSjPtL8x4RVahJNQKoTCr6IdTrpN3Se3drths
	+Y4czxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIZJ-002L7y-0A;
	Fri, 28 Jul 2023 08:11:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIZ5-002L2O-1D;
	Fri, 28 Jul 2023 08:11:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF5C3660704F;
	Fri, 28 Jul 2023 09:11:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690531867;
	bh=vCwUzlqOQGnNY9fGXomLGaxMGGyn0nTi6KpRvQZbsfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K7hVcO8Oeapz0cviNUSNSl24JJFW3497w7NWQsDmgOOWg+mfCSAeRiao3ndHFmNLB
	 uF0MzRhYqtapZnPT5MQDaMOg89Ul/j1VfCA4ABKVpSfJtTnmbn8s9UCjb9qVPUjPsP
	 rZ1GYkthazIVXwZkicAzMeR2YlC3IfKrKO+de4igI6/bt3K+1FwBLyhSGxOYXwpWX9
	 z4arbaKCBqHrhsnqRGiwcTFzmUMYaX/YO1uU6LhQ0zQ7LLSdWWo+gB+FnvYrvMbE8H
	 TuOgLdfPhTzE4sBViPG1nos5UM1suh1PAhaFse0zNLM1DpRmBQzkG02DK0Puv/Ujr6
	 GbXM3zzwC/DZA==
Message-ID: <fd1cb69e-f942-581a-48e8-4fd160ab1b64@collabora.com>
Date: Fri, 28 Jul 2023 10:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 1/4] drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0
 driver data
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-2-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230727164114.20638-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_011111_567089_F3736D54 
X-CRM114-Status: UNSURE (   6.76  )
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

Il 27/07/23 18:41, Jason-JH.Lin ha scritto:
> Add missing mmsys_dev_num to mt8188 vdosys0 driver data.
> 
> Fixes: 54b48080278a ("drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



