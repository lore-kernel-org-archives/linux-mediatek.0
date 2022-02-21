Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE48C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZGVghSpFEcQcc84aB2l7Lr8E+29RqLoy+TkhqsDfO4=; b=sfRyejsBDo2AOa
	CKyHpsHh8fmoVai8O67fDV+nwEVhmW+IJYTeBr7Pslmyt1RaSPGt8OY4FSY4LGJypF52WjrEtkcpe
	Iig7KCkgQP1kRopIszyHPla3xqo8AMQdYDHx3MRdlrcG1bAF3h3K8WP1fq68+Fm/O49drpuJQ1qqM
	YKI8Q6k/aRrZPwA8mE0Y69II2W/OkLcDysT6Lrtigi0VuQAyxtu+W3YEDRVxffMqyZ1Nao7Wn216j
	5kpiRUQpQJ7Fp7Z4PVxpKF95i4dqA5nZ+jlPjzJhKOHk/gDmf7tqFo7wHio2P6V/zIIBGlKRfUljU
	zFgPgb0WYiIrnfMNKXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9iW-006Cyw-E4; Mon, 21 Feb 2022 14:31:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM9ht-006CcD-7f; Mon, 21 Feb 2022 14:30:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 985891F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453827;
 bh=bh7tbbpZ/qSGx0sZNsm5LDl4POWeV5fbR3qYHHGrRGs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZJ07T/oMQpdlgSmxlBVQVZCd34UiNtr7HVS9KKakb3h7i8oIIt9M/ALGT3s6+Wy2L
 DZfOyg3juTvK3jRPq3sAcHtLdlB5ML/TyXlgYCJxWNIi56GtBiFCrD6WsDmfDbMFyd
 188gLCApPKl3LMAMV90yEyLM406p05HMCg7/+GqgxI53vBTXS5LR5GjPMehSHtQOsY
 /Kdeaq4ZgVIm6AXpDrzbIWcaFHuG1MNreemYIgOZ4TOjjWVKllgiv9nJrhfXCogh+z
 wDdOKn155H3jDX/I2aqQ/Yz4RqxKMwQB6eSf3bhMXSekN06eKE5A2MnoHu3qcciG4E
 +nLhYaYBoxoHQ==
Message-ID: <0ca2d740-38b6-0b75-daa7-86613082f0d7@collabora.com>
Date: Mon, 21 Feb 2022 15:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 06/19] drm/mediatek: dpi: implement a CK/DE pol toggle
 in board config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-7-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-7-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_063029_460184_17959650 
X-CRM114-Status: UNSURE (   5.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Adds a bit of flexibility to support boards without CK/DE pol support
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

s/board/SoC/g

After the change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
