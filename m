Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4778C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH+bTkp2aL+SY5EhCxQfh4frvR6/VZZy+GFWIBF/DLU=; b=QfD0TDR7hbIfjtrtF5z2KWwUJy
	DkLLi+F2GwwCNuyf+yhVXAeG/+0CIDDyzXVvkEJm5znIkLpAbgWXRYb5nyuREP3pYrVOWPnIe1ZmQ
	2Q8Kz832TA5JEBA11KabZM0Hy9E1ZD6UZi9OMT72qN3OPcAK/FzXpgxON1QYDNHf9MX+jG5/Lrn7U
	A1g8UytSx7GJ8IYXHWBcDVem4CFIKKszvOMIBo4MLkkhBwOIsIM6iF0XmPmKO6MC3o52ovqtpGGGr
	5kzWkPNHM/1Z+l5Pm+OYPIn458ZlNDLjzxaVUSd96uI9e45wwzFyP4Y/9dPb1gVa3R2eAon/wUrUj
	M7m4Sqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9OE-007cA8-Bh; Thu, 24 Nov 2022 10:23:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9Nx-007c0z-3m; Thu, 24 Nov 2022 10:23:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 18D596602B19;
	Thu, 24 Nov 2022 10:23:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669285391;
	bh=ep0/8WFmmF1DLAjStgRC+286Uemc17K0xldJybIShBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=awkyrvSeqIxToj4LbnERqzihnB06rBYL1VQ8mappgQrBM8rxkeA7GHzEVFAoTZ44g
	 YaYyRFSzIJ1E6UsjmG5dKkPujzeDcPfNqMcU/gsIlCReMvv9nsANFPvM4+MiwnkY3H
	 nX8PUc55Kmw2f+BdY78sCZag5dQPJWLOOY0Xu3ZTtUK+nnjnHmOl2uVre+ek9sBBIF
	 9o3/SgLy5Qk9mUrg5Uv8RDfclM7ABCfpAxFWRY3MbRUANNVYsXm5/4F6/6v0erU23D
	 I3Er7mbzYdneoDgn12Rp1whvWCCG86C3pjqi9XhlaUcGeXAwPktI6txYKno1sQzb+M
	 SAAMrTM8s07Hg==
Message-ID: <38ac71ce-b38a-4fb1-ba21-aa5c91283bd9@collabora.com>
Date: Thu, 24 Nov 2022 11:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] ASoC: mediatek: mt8186: Correct I2S shared clocks
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 nfraprado@collabora.com
Cc: chunxu.li@mediatek.com, ajye_huang@compal.corp-partner.google.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_022313_315811_B1A2BBC3 
X-CRM114-Status: UNSURE (   8.66  )
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

Il 24/11/22 03:30, Jiaxin Yu ha scritto:
> In mt8186 platform, I2S2 should be the main I2S port that provide
> the clock, on the contrary I2S3 should be the second I2S port that
> use this clock.
> 
> Fixes: 9986bdaee477 ("ASoC: mediatek: mt8186: Configure shared clocks")
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Sorry, had both versions open and I've sent the R-b tag to the wrong one.
I meant to send that only to v2.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


