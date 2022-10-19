Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75B4C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 07:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GUKTxadoDWP2KU6mxW/gNikeYk8pUd22CuXVCBT/U8=; b=iz8WPGQt+euvb66AoQlcRdhZSN
	ys9ee8cIfKlfvZoT26HVS2d0xdvPK9SO6ZIqodiFQhDig0vbHtMej5N1Dmj3AOaIaWTHn58Ag2a0V
	i4PDYCAQRYITfzCdk6zqL6WwjddngaUqwX28C1M9v2OTjRav6SJiIixtZQtz926SkZhceQzk5wwx/
	ldzvvPnifwFDcPcjr4q+KHAiaAOQ0mPMF14o7zpmOSm8LSAHOWhX38Tq2dihbyElFq95duAdsJHsJ
	Dp8ye1GLKXS6lJqR0fR9DIbTBhI7DpSx/Jr48q3O7tFzgKP297X3yljkYQPwWgQbcRpal3ylcOsAs
	OeVvbC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol3aa-00GCce-Lq; Wed, 19 Oct 2022 07:34:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol3aO-00GCYR-LB; Wed, 19 Oct 2022 07:33:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8ED4B660226D;
	Wed, 19 Oct 2022 08:33:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666164833;
	bh=agU8AIJzL3KVTa3O2BDqTFMaHpfGu0dLSgxRTteE4pA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HTzK+QcKYQvhNCdVyOTrUdalgUdfYq/wBID/tc/XACAUL+0t6cxYjAatgRis2WQFI
	 Q4h1mRZgx8xKg2GLc2pd8cA31YAjxaWyVGK6aiEpMoLV0GliSi4eWXjv8lH3vu/T57
	 L/qoxnAoXWp5MPXtQPIgStGdW3TJDtEvxW+Z9rx8SbvK90LtUH1y6cVLVl/HLLwC22
	 R3UtpoatosxDDukOZrD8DbeLvepbJPdIfLeNWzUZHaBSlrSe+CZD4lrWzj4ylkIeQk
	 v1ylqzNVQjxQ7M0W5hUKDPnkZNlx9/lzPTXk/9G3wBoi58fd2kYq96L0ONCDoLyU/U
	 wK8P/F35/JYMA==
Message-ID: <6110f23e-d7e1-fea4-c497-84ec1478eda0@collabora.com>
Date: Wed, 19 Oct 2022 09:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v12,2/3] drm: mediatek: Set dpi format in mmsys
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com, jason-jh.lin@mediatek.com,
 nfraprado@collabora.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_003356_873029_A575C19D 
X-CRM114-Status: UNSURE (   7.07  )
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

Il 19/10/22 04:52, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



