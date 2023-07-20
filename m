Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C3DEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrDk48CdzF5fcwIQkXd0KUrQJWPxWuX+JVBHtPRcDzA=; b=Rvzu8FYkA53jaLFZU/FCiM43av
	cQ85UHeAa29S5xDEGWmj8/2jL5ju8IFq83UWYxthuGzsMSGkABCqB1objDB1p3ausGD5MOUMM6Ucn
	PAyVGlg2ActQFfvbr/l2p4FARR1zSr9A1O9wiqmGy4lAiwMk3DbEwABWlhzXvpmTxNvbVWu8XsKqK
	+Yam1ZSdFDWy3ok/uxVAZw6DSGA5h2Pat5erYqVznRTxPO3GXLQnbg91HWFYppUvT21ulaxpE8KRw
	u6I0SdbTUdVs3GkCBagNyO8BwoTdYWQE1Jvj+QoJWgrOurmdhQS4ER8YdPTlZnkoAh7IxSuEGtBxa
	dVSiejNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPxo-00AWmM-1D;
	Thu, 20 Jul 2023 09:28:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPxf-00AWjU-00;
	Thu, 20 Jul 2023 09:28:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC8B66606F59;
	Thu, 20 Jul 2023 10:28:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689845316;
	bh=ywsg8mrGt5vzRhTvN5yTIHTNMJFTTFdl86eljvEVajU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YW1LezwA0F9SSjfm43jsppvXMLPUsKwCGRFL5gwTu17A2teRS71cYvaETDvcGBgzJ
	 EpDy4vBoeHxAKGuUC+OX5qsJxm04WxqSKbfq0fxjuCgtnfLvqBS8eCMMfb0cvkLFxA
	 ARkpIjhb+IVlH2RpA9hw+tJiEUxKo0nq7fKtST4SywJrWvoxHs49b21dsFQbuayhmc
	 19KVdDVE8R9+yIyopLf0x2gjG6CGo6KiGXMfbHFVjU4zqmx7qZ3quXK0okfnJ8JAQY
	 4DdyXReetozLkRSH8BDrtwucnAOywRzUB64qAODKb4v33FlcnFxTSmknklgnuLx2iy
	 30xrHWAngX7ZQ==
Message-ID: <f34c542f-e9ad-17ae-f3c8-9495fb534587@collabora.com>
Date: Thu, 20 Jul 2023 11:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-4-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230720082604.18618-4-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_022839_170015_3853B83B 
X-CRM114-Status: UNSURE (   7.04  )
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

Il 20/07/23 10:26, Shuijing Li ha scritto:
> Due to the difference of HW, different dividers need to be set.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



