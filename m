Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429ECC7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 07:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npOId2mZRfy97Yew6iDWD/qRDq3NzAPb60sowLxfQ6Q=; b=vRBdG85HZCNueIbD0/CjLm2A1Y
	kuihFv7mvlkbL07oIRbUGnR0H3NPIN8yBmPk/Dz6Btj2PnRyCwJtQy+/SII68PHsHRlFzDiF2aJs2
	cZI4sOTaxaEfXetuJCRC68/T8QlFyg0s4HHeK4v+Tu19INhXoApcUR5j6p2TUxbi1XWBz1NVHPwCk
	AoTgcY0Sc6DAq7zyY2HCqO1w1BXCoVFHHcabUcluCqRTnK7PuyrUJvMgq1QGpczwPRBzGy1Ae3LUq
	XwRPC0zHT8pDxtkarBPI+0IlJ2MKJX0rxYTF3gq18d8ET/211OJbEeFXcNseHeyOSkvvcdzF63JmE
	EbOxGs9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqF6-00FX56-2u;
	Mon, 24 Apr 2023 07:04:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqF3-00FX4C-1U;
	Mon, 24 Apr 2023 07:04:06 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D424660328C;
	Mon, 24 Apr 2023 08:04:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682319844;
	bh=mskX6naApSKUTuukB7KjqdlVaiylD+YEVsQ3J6mTGHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mv0Y1ohOHFIqZuph5cw9Feikq/MI/eSnnWOAY6ZUUrYQZQ6jLR4ZZGBAblYzg6yqt
	 xEV1s6vYNRvk0U+8U2Ec+afT/Es+Hu7yQpbEyKHQhXIUuyiFY2B4BOTvoV7XTqQK9x
	 H03mBjXpuDZuBm4QaeJfhIFps87KCEjNSVU3VXooVqpNh4gRseCAhjvl1bS//v+BuU
	 vx1CCnbUyMAcwOvnfB58nHSI8qETv7fI60lICk3aRTFTsN76qLUuJJW77txNupPSzq
	 MVXjvKOqTLZVqv39V6MGHg4QAfDz8KsD/7KKwkvoGdsLu2VgKguE6uNRR7suA0fkbX
	 OPeOXfwgMKZcg==
Message-ID: <9b26f3e4-fcef-0e51-3443-78624e96fe8c@collabora.com>
Date: Mon, 24 Apr 2023 09:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 clang-built-linux@googlegroups.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
References: <20230421021609.7730-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230421021609.7730-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_000405_627601_73EB3DDC 
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

Il 21/04/23 04:16, Nancy.Lin ha scritto:
> fix Smatch static checker warning
>    - uninitialized symbol comp_pdev in mtk_ddp_comp_init.
> 
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



