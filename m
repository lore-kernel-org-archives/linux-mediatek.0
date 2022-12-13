Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A0C04FDE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj0TWM/DzTC3r18hrwyOZsaSP3P0finYVLAajqJl1/E=; b=3mgNBc1VSjRLqazyKI64UR7bpq
	CwIphJSzDSVCfnD9HsNFhl362dgy17wvrjswjsqAX7HxprL4WTuMAIOOAoXBo8UBBXISnQm7jIIwL
	tKCbzjbnIxTSWpLM2QckI8HFI6npf8WS824UIhxbyesd2Y1g4Rwm3z1C4QxDP2HB60qWcGBJenz+q
	9W/ZZNsUif7BH1ZzpWPbZ8CB74783t/oxBguCYwOd7JskBDdWX6s/FZe9WxosV/EZNqiC8pSzPoJK
	dYGSyIXQukuJ1KMkriLEuNdG/y8FCpNTooenK3BEFecW12+j45eQS9WREJRlVhHlRpuXySoInT0XL
	RC2o8pIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52o2-00Fpj8-VE; Tue, 13 Dec 2022 10:46:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52mx-00FoFT-FN; Tue, 13 Dec 2022 10:45:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E84A6602C35;
	Tue, 13 Dec 2022 10:45:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670928330;
	bh=iuqT409IUBvhSQ/CRdv9Kn5GVcraHKp1jmtmN2tp524=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ea4lsPxpbWawWIqUaYWw5p7QgK5IEfdYdsbMEf82jS245uskBMFY+MXtV0iZlZ+1N
	 IBMMZs0gszA3HOAc2otnf79agBCip7Cs95PyQzNloFQjuvTBWtGnc0Efo1LH+nzl4W
	 UZWOtDqSUQGurbhV4aKM1+DdygpDrQjo9xf3jQzMMfB92dQA38GksVZkpGINGcpG8g
	 6hjDdODAstyb5MQMA/eirBVCg0E7V+M7rDnIvzr+OVnzydz2x8cxnOMl4bDvveHhpo
	 9ukwBaZexB4DYHnrp/NADKmSrX3BzyUUGeRhjB/c9hbGkAflaj50N7+F9TpIUzpMlH
	 5RjKcmnMw3QSA==
Message-ID: <476ac247-011a-caab-a7c2-b167ebb57916@collabora.com>
Date: Tue, 13 Dec 2022 11:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 02/12] ASoC: mediatek: mt8188: add common header
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_024531_704997_0371F741 
X-CRM114-Status: UNSURE (   6.20  )
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

Il 08/12/22 04:31, Trevor Wu ha scritto:
> Add header files for register definition and structure.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



