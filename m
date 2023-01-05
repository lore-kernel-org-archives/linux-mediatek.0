Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC57BC4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9LJDQA1vjixOM0uxyUx98zcCHLA3TkyFk4APImW0Qw=; b=vV2MAaXxZ8+72mbCweD9SE5CQr
	UZS3m7vr1+R7q2yMYU3E1gMHqdJ7HC0yU5KXFXyKgYerUhZGNHVVvRgr2St227hVT6gEI2KUxjHuW
	8NjjFulX4JZ8aP0hY3YeEYlCwdsyLmQfLRI1+iOv/Lp40XeXJLG5LM8hYgMOtCCRCYa20kn5beWdT
	qpKmd4BwJXtZhJ9qF8EMPxO67dDVJkOpg+RFvheVz5yDgBz6nBjjjdKbgs9pQhIPON3Y0/3c00zCU
	fkegKZm7KnlSrHHr5cepODQkoiOGqfNa12u94rKOzO3IkpOR7k0IYyMH7ko9JUpfrjWkOSeQWKlyk
	Hctmh9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWro-00EYnZ-OR; Thu, 05 Jan 2023 20:29:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDO7k-00BSw1-9C; Thu, 05 Jan 2023 11:09:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A6786602D2B;
	Thu,  5 Jan 2023 11:09:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672916965;
	bh=LAsrZfSnQres51ppPQcdXpGQ3gS3K+MVgY/44ivN1Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iAV0ZfBHi/SK8ThsE63VKckB2W2TMiARXN3hqNYC9GBS8vXSmHwFk8BwBeesxguF6
	 zP/Ks+vamEcKO+tHiXLJVubRerU8+1LbLcnfN/HqDygHAouz4KePH66XvtHGBuyf6i
	 IY/3y8k+ju4FBAU8qnWsg3RVY6QzQxVhI7tGbpJbP7yu92Ww2H5MudA8QLjk2C4weG
	 nGYh12cV+HI9m/5+NtKCiXqU4RuHEqf5JqaxDOQT44PWAVz67QPpd2y+LZkWEAAqbv
	 +9vsS2c8QEHPto8fJzPBjfbA+GxTSq6iRRxO4VnzBYp3Yy4GuFiDRv7k238VBSpJi2
	 j5IjErh5uIDkQ==
Message-ID: <77e958fd-5ced-bd5a-70cb-af4fe94717d5@collabora.com>
Date: Thu, 5 Jan 2023 12:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 09/13] ASoC: mediatek: mt8188: add control for timing
 select
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
 <20230105081606.6582-10-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230105081606.6582-10-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_030928_664851_06DB22DE 
X-CRM114-Status: UNSURE (   6.37  )
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

Il 05/01/23 09:16, Trevor Wu ha scritto:
> Add mixer control for irq and memif timing selection.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



