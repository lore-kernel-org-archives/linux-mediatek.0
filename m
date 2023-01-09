Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD66C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJaNDBmXWNIX/5WxDjJt8tvXBJXPLtMyz7fSw+ERNXo=; b=ciaNmeLcNG5o47gwuuNGBBG1bA
	3KLKVoMWw0ievTgYJAESpudQ2Mtstio3iggSIaagtXkQWvQF5D6go/hKFDFHz6xXIH9zVNPcGD7wa
	HfpN1LkZZxg5UZ0ujxkJV8uksoBh2cOfbQyH6fvw509hdl+Qofhk40seOMkrRQu7VsrmaLvML9wfN
	O8UpzN4qffYv2iLd10ZNbdwX47+C3d95/zVEiGarKs2YYidVhMVX8LuJmVHJ8JsHVMJ///Z7RZ5dJ
	jXrMoqeOIqQPR0InPY3dzMrp7jLLs9xllZoamCDF4OqkDaryuyDfIDugpfNvw/uUkAqRz0NGMjHt2
	1i0w80KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqMN-0012xk-Gr; Mon, 09 Jan 2023 11:30:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqIQ-0012Yz-GY; Mon, 09 Jan 2023 11:26:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B08936602D06;
	Mon,  9 Jan 2023 11:26:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673263588;
	bh=eKJGPDGPsYgrZbdxBcghst0mxz5CKz2aEmqkcsFMp14=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4DJgybrdIjRLeS4QFB7meP/vAkmLJN70/VBJI1/OhW5BJTVhmCyMP3VL4GF7Moj8
	 a9XUTsyt2ElGO8U6/lQDZ4R/ccAvcryCWG4rYQgsRuFSEWVX6X/bf5nDu+gKArEj1G
	 jkylAl/Fy4EnC6e5Mh50HvrYlzJEBfN5QB5Y3IoYWcVO5YDfFbtL4cp/J+iq9ysU4b
	 mXGEsh97WiYCwqrPVZHgVa3ekJyAmz0dclzk+GipxatfRm6AaVxBXsb/YFUnniEvIb
	 NQ/8nHRXRZLMmfAa++YM+NBs0ikvpBphHVvFz2GXCRkxsepS51H7ov8B9KebeP+fSS
	 LIc6YNjFG8J4w==
Message-ID: <f9a88b58-35e4-1234-f368-d2fd6160ba3e@collabora.com>
Date: Mon, 9 Jan 2023 12:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] drm/mediatek: dsi: Reduce the time of dsi from LP11
 to sending cmd
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_032630_705336_3B323BD3 
X-CRM114-Status: GOOD (  12.62  )
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

Il 06/01/23 04:05, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> According to Figure 16 Turnaround Procedure on page 36 in [1], you
> can see the status of LP-00 -> LP10 -> LP11. This state can correspond
> to the state of DSI from LP00 -> LP11 in mtk_dsi_lane_ready function
> in mtk_dsi.c.
> 
> LP-00 -> LP10 -> LP11 takes about 2*TLPX time (refer to [1] page 51
> to see that TLPX is 50ns).
> 
> The delay at the end of the mtk_dsi_lane_ready function should be
> greater than the 2*TLPX specified by the DSI spec, and less than
> the time specified by the DSI_RX (generally 6ms to 40ms), to avoid
> problems caused by the RX specification.
> 
> [1]:mipi_D-PHY_specification_v1-1
> 
> Fixes: 39e8d062b03c ("drm/mediatek: Keep dsi as LP00 before dcs cmds transfer")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



