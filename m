Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yVbztr+R2BDV5275bnNlIuRCQzqGkaahfI0oDfY38o=; b=2Bg1qr17balkLC17LAgJfLTVUd
	pv6JwfPDZAJDvIH9a52VgFpt8aaQyuU9mvruRWP8ooqf5uzLscL2cLKYBiHY0o/Q3I9plIvIUfGLQ
	VLMz3TNFVaDSf0FEU8QKA2q6xHlgZu7ZDYci9o8hjCrSRjqUVqmT4D+vKtElYsBPk7Es+bHG7ex7f
	o15/SSFgLxluymzO04oh7eiUsDtKpOt23VvpzykThbuLHkEWFdJUrfdK6S8fR74OnThV+bQnzAFz9
	Rg1QS0OopgWMVmtR71AGTh3MgaoqRS7g48FcXfolRNn+KozOXZtBpVE9Idd5DQ/gu2y2OYjOREsZr
	DxMmUSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjmp-007XpN-H3; Tue, 19 Jul 2022 09:45:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjme-007XgJ-GM; Tue, 19 Jul 2022 09:44:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2E0B6601A84;
	Tue, 19 Jul 2022 10:44:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658223887;
	bh=iPLT7orT6p2DHBeQ2X3yYwTk7rc/ErbEjE1ySXD1v3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fzvMLRp7lJ2PLEUHXHUHztyjmDw33j1uwd1Du70q+jT1wHneym8PzxMAowsLKg0JP
	 FXJxUo86sm4sz6lD/9QvRuTUwwY8T6EOVTG7zdKz4XGuwGI2WlNBRUPbi/1AUoOvO+
	 W/8C3V4icsAdswCTfzA2vQruq0pqfoLyai/fLzPKkXg+Pf62cvWNbPO8/dco7su4/9
	 aWypzqT5k6tLE1ph9gG1HuEKIzELNDmArEdR7dghn0qqCFeT0seOT1sLOe14Omn9lp
	 dD4xo8tc/khJCz0Lx27RwFwU7F2hMNED8EOh1CUWv6j2RnvtscbSxsdP/B6UQsqGbn
	 BE+hWOO6uvwFQ==
Message-ID: <c764d5c1-2d4d-e829-a728-eed253a66701@collabora.com>
Date: Tue, 19 Jul 2022 11:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: adc: Add compatible for MT8188
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, jic23@kernel.org, lars@metafoo.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com,
 guodong.liu@mediatek.com, johnson.wang@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220719014657.28714-1-hui.liu@mediatek.com>
 <20220719014657.28714-2-hui.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220719014657.28714-2-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_024452_703894_82E7F08A 
X-CRM114-Status: UNSURE (   6.92  )
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

Il 19/07/22 03:46, Hui Liu ha scritto:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add dt-binding documentation of auxadc for MediaTek MT8188 SoC platform.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


