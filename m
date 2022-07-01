Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC432C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfzuEXXFR7LVibdMprAepE91Gsjb5dhtF6ttcTaq5fU=; b=nJnRYpsH3Zj9G5AoLQFFK8cFKv
	AeSrKTU62sMrYaKF3iKWePqjfxW9vhWuJF9LYGO2Kgn24VSZFE71OKzAoVSjp/U7m0mplH6ZUImWv
	X96FO7nBEU0UjAq0PJe+62OR9tNAcymdarobC0ZQN8g38mDtYhIPAhCcWuVXRgf6NAqoX4wb9q2in
	tmzdQxxJFVK+I5tRdFMLUcUPPQNh2OCIcld1avNbX6o7m9kdjN4l1CHP7XYou2madhHItULJyIFUn
	+3b9hJx9U2At4VdlOJneIQLerNqzFGVMdY3iHCP8BYUzXXgcTz8j58MQmbKni7Y5iLReACDWp45Il
	jmhKqb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BiZ-003XFD-7a; Fri, 01 Jul 2022 08:09:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BiN-003XBE-77; Fri, 01 Jul 2022 08:09:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 771496601974;
	Fri,  1 Jul 2022 09:09:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656662960;
	bh=OnFylUH2bK/KrG2ZmFByKOKEh30FKZwSBlJiuozSLKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n1By2XTMBpyLE712pO39G21v6KPnYPSxK8Ci78ltdQBTlMSGIB8++E15d6TIyv7La
	 L+5Wb90IqNQkZc2Vw1U5DnqpRkAuT6j7Y9kqE+iK5z13Jw3bcR4w3sAPOUCJcqu/o7
	 MbwJUaUuI2P7eU/cvIR69YAJ7nG8ONHu56NrjOn1YTZZz4GjINxeUOB2bUYHx8VvEo
	 dsGNmC+phe7Z+muDvuwcUD9ISfg6Uuvgv0bjSfnAM3ICZfdqZIYymEae/b7Yychlta
	 6MCPz7DB0XfSwzGAUj7YTFRBHpGRmOO7c1fUTpZzOv8M19USxn3YJnbwUUIRIoet2h
	 +xv1bry65eB/A==
Message-ID: <145d79cf-5328-7c99-3d49-d5e9eab3891c@collabora.com>
Date: Fri, 1 Jul 2022 10:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-6-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701062808.18596-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_010923_702229_0576BAE3 
X-CRM114-Status: GOOD (  14.46  )
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

Il 01/07/22 08:28, Bo-Chen Chen ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195 SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


