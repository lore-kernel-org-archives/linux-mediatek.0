Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7FEC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke7aSOxPlThSZP0F9EclcE6GE8Cn5xIaDIS93/r6w3Y=; b=S2gKS1NB6tER9fxOCJb9fk0HRT
	nt9Yy3maenOtsRAWR6qQqxTa+uyWnf16zZUWsUTLmwZ+eIzjsmWtstPZkfX7e4cW05TvaZX9JW1Gn
	6YNOqSvWcFr7yI2kr1njZ0MXNK/JwecVoTfKpmi+uGKACIkGkkqTqmtBoGw/bIr2xVXY2zSu+F/4N
	k3nt8i02N76U4oaYm8ROR2uRHFfNDg97JUvbhqkvHoeTDus3W9x5Y9iaqHFmjNdnPMx2VjTT3P20O
	fiWBnceGUaX9ekYQOzwufsGnE4iY9tfSn3+6E4zmULD1Pn0AvfYh/QK4VNajudkr/3F9e83QVbsde
	Xemo8dSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS6A-005bA5-Gz; Fri, 10 Feb 2023 12:01:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS5m-005axx-H1; Fri, 10 Feb 2023 12:01:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DB29166020D7;
	Fri, 10 Feb 2023 12:01:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676030485;
	bh=pZ9qevw7fCReyRLFCyksKqNzLLJU+iQDcQl8RJbAtYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IhcKxm3xRqksDbWYIraRfKY7UuJ6eeQ8a7ayIZqbiTGlEo/d2TpZeljFwOmGMasE3
	 1lhEZo++OrjdEMcLcPxZL3rLCTwhJKoonmP+yLhRKaMe9go7+RRZw0lKOmq/IJ2CSV
	 hOGsBsktArV6O80GQmmtqQnrjA6qAApJfnooYh/5jgWweKwI06u/e3pwgx7pxZwZNf
	 H8kONoNgyjm9oRiueSGwPrkew8dgI4jUcKsr+O4IO/SjgaQglyF3yorrmoUHOoRB1f
	 WtTdJVMKylfHK8QLn9b0kBVJ6bV0NwFGEEGFOHR9ANyxdsssy1AvrqMvtX0pHda5N3
	 berTf+B7Bik3g==
Message-ID: <12ff7576-76d3-8cb6-4c8f-6c9417ac28c2@collabora.com>
Date: Fri, 10 Feb 2023 13:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] soc: mediatek: mtk-svs: delete node name check
Content-Language: en-US
To: matthias.bgg@kernel.org, matthias.bgg@gmail.com, roger.lu@mediatek.com
Cc: nfraprado@collabora.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230209162403.21113-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209162403.21113-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_040126_725641_A1D26BF0 
X-CRM114-Status: UNSURE (   9.28  )
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

Il 09/02/23 17:24, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The function  svs_add_device_link is called only internally from the SoC
> specific probe functions. We don't need to check if the node_name is
> null because that would mean that we have a buggy SoC probe function in
> the first place.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



