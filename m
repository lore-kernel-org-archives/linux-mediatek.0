Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7010AC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 14:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMd2E4XOQ3HT8S+BnC4Rjp+/JLgT7+Dv+1jq/1x2jhE=; b=omxWaxo1o+/lB396bkdxklqwjl
	ETlygYi2DR1VgSMFM+MhvP/MyDXZvy8DbmI7F0+oIITzQpcqWkLZkBDTVbt/6wyL2VGHgkpVLycJI
	geY3+tCw672Rfsw3g/WnEaN9gBIxWX4I2u1EuAJJGuvPMNzE4xEf76P2nQIgbHrD4nE4Bs5AGaNLe
	VwOhynDHgSdtu0CB9YvwSzCWDmSGR/gEzoOiao7rR0ywTcfXPdv0udokp+pWwtbV2HnPISHfgswXJ
	WFK+hNYRfsxBqWYAUqD78YtuKAHYh5WDJHj5DzvHoac0cdwmkr7qKDlLk44xrv2WzJt8qw70QpaHS
	YHur1Z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLTs-00BgxA-Pe; Mon, 02 Jan 2023 14:08:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLRL-00Bfa7-N3; Mon, 02 Jan 2023 14:05:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 72804660036F;
	Mon,  2 Jan 2023 14:05:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672668318;
	bh=X4yzkoY/J58wbsbcidQBQ/ToqZx7DQCXL6b+4gouwQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GdsB5uPwvhcqfqPEARN9lbwD/+nCbzVUAFNvezE5Tp3jXe0q3JF62m8Tohgq3M0Pj
	 27XU44FrUFrdSnb6/xawdFcwpzEDAFqTFTMv3vs6Tv173DiTwW5NwOWReXFWg1s4oQ
	 jMVDG+GUbCjj/f6JE3HxeGbMYZmyuXfAXSJZHyw/R1OZvVF+tZbI/fQhAzBSxoC1+7
	 FGwZChkjZmKtQ5GCpngZJMhi8JsmIHW7WzA8Wypjcqm+0rbu8P4Vn5akxPBeVdex5r
	 sduH3UDxD1/565L2zyLklxu7taoWdxUPQ11a4kAnw2vq+x2R5UpVKBGfOINIvcM6mD
	 pT+jKUE8xig1A==
Message-ID: <bb488cb9-d86e-e054-9129-986dac216b66@collabora.com>
Date: Mon, 2 Jan 2023 15:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 07/13] ASoC: mediatek: mt8188: support audio clock
 control
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
 <20221230055443.16024-8-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221230055443.16024-8-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_060523_981235_1A129284 
X-CRM114-Status: UNSURE (   6.78  )
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

Il 30/12/22 06:54, Trevor Wu ha scritto:
> Add audio clock wrapper and audio tuner control.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


