Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E707E95A8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFecjiWd/7N0MqFNd3sPN2Kr1oXKSr0zUIMV1TNe0VA=; b=ZgToAfdmTfZtptK9SVBTfLZgcf
	jRE7bZ7lUue7C/2Mk2RJZKJk0P3IrA1/637sxCWfwer/Iz5DC84ZkFGr4B9i9gwnrt2bPfJT+iU58
	Pu+S4ASz2n/b74bQ4ga93DjNTcaCt2kyuChQVfaOqKLVq717rvaFPFlWjcdH6Bd/lnhBCslo8oRMI
	LIXe1MylsDSAVIXr8RryJerdtYgfx6zHBLzjwgjqtut+fh2BTMzaZUkgCgbjhNk/JKG6y506hnpFO
	hS8705Uyh+zed2OxAPCm4bFC7/rTdteoWbw+kpVn27S9LC5MqJljMbNEke7sdTtluJH/ygU/boUWz
	PWSERiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppFm-00AffI-1E;
	Mon, 09 Oct 2023 12:20:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppFi-00Afdo-0Z;
	Mon, 09 Oct 2023 12:20:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F2D0660708F;
	Mon,  9 Oct 2023 13:20:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696854048;
	bh=ipB1t0cSQBymxpdIikiz/0GTXsJ8nWOTmw69GaAQ2UQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jr18bvPegygn6tygNt5zBGY+jZ5jyWS7TnxSWSDFQsK53uootGZUv6iArYChIfpvb
	 LsUHOvT8lMcXXTnztBSWd22Xt0QABmwW50y0q9uiipRjqkIy+AwgDC3vShB9Mw3ooz
	 3+9HAfDGNYVOdCxao8Do2Ye+re+VDFgVgUgRw7gkmBHkCxyaAd1OLli1R2TShQU403
	 Y/ZrCoge1oU/c0d/aNDiR4dHaosENj1Z9+dBUrfhDbTpgilEHk9lCg11ho3flFjrD4
	 F98R5O1/W4y0J5z6fi0MEqgZ0Vt/gm9Js7bTvH2AVRoX6UGfX3gre4FB6rFdfzd50D
	 bTzA8bI32aQ7g==
Message-ID: <cae3a6c2-d6be-0795-f242-100019f1a070@collabora.com>
Date: Mon, 9 Oct 2023 14:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [v4 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231008014629.4971-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231008014629.4971-2-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_052050_343487_B33D251C 
X-CRM114-Status: UNSURE (   7.61  )
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

Il 08/10/23 03:46, xiazhengqiao ha scritto:
> Add compatible string "mediatek,mt8188-rt5682s" to support new board
> with rt5682s codec.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


