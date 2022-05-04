Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9tITbDfDczceNDrSP6Xy/urZHYsKt/KVizFVcdT7hs=; b=xSCQ5OCWI+5HT7
	7//Am2oJ1YyaYdzhCpJEiARmBU2tXJxy2U1tv3UlQRByDVIKSfBKW59pGAXcfTWtM8Qn17LHCFBse
	wHYaBGsxNSRHLh7ZxlR2VJSwbb70UdPcsDDfFwIdMSLZNTau96V8rnv6FXu6oMizuocxjixB5CFgE
	1sWJ/HNXEQsff9rvK9GyYCfLdMB8QUZe7OOcJ4Sno5MxQrlEkL4Yb5v+WNGtVd1KQCtXqFFf5mtDa
	IjQPhcooe08rW/v1mcGpjURbZ/p5awwkeVWuRWbAZtkEfLUpuU4PrqTq0P+z5oUItzVeR6n+dXd+k
	Uv/Hqj4vraTI7DbA5Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmA2F-009PqH-MF; Wed, 04 May 2022 08:06:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmA24-009Pmm-I3; Wed, 04 May 2022 08:06:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2BA181F43E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651651606;
 bh=g4o2JNm4Ctpm5k1rvLgGc8KPep2McYePUQzlec3QBWk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b/wlNUz6s3DO+++GsE2ms8gl75kjfDcHwqg0VE1PAi8+0eGfY9Hgd+U3h0xCQexaw
 onor0VkEbaFunBBtN0TyEFGreN1HUquBgcnuphdhihUaG2/gFDLi+ygm/T+Hdm7qsF
 Q8L0HyrMwPuC6TtwBQgOd8Yf/yESF3rkq+9+w4mebNjM9RHr2DTlT3pHLCrE8mJsTV
 E5aP3PfpTUcIRjN5mET63+Lb44KYzvrSkizpzqPphT13AWjMJjGm8q/psEcy5P25G1
 QDvWmIrpGxqdYpADcFcwY5F8oDdedjsnxnNOGL4l+qPaD3bMNF9qjK1egW74egsodG
 kTQkLFtbDO3TQ==
Message-ID: <a387728e-94f0-ccd0-3936-977db545efb7@collabora.com>
Date: Wed, 4 May 2022 10:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/4] drm/mediatek: Add MT8186 DSI compatible for
 mtk_drm_drv.c
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
Cc: airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428133753.8348-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_010648_850340_BD88CFB2 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/04/22 15:37, Rex-BC Chen ha scritto:
> The compatible "mediatek,mt8186-dsi" is used by MT8186 DSI, so
> add it to mtk_ddp_comp_dt_ids in mtk_drm_drv.c.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
