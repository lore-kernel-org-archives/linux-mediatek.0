Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E69CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gf1l06JiE0MoxiUUIr3v/UKInudemj1MYMNIMDEiq/w=; b=pDCMf80AooVMyV
	cd2nuSyjXH26fI5l/NEisxLkMIfex7Jmtfs6xkgUNO4hrFW1MZbnx37SFuBXBtBm/CuwsaZGEMngJ
	xWZALe2bKaNqYAvr/pRYyjBJpVwg+RALbwynTtUz2k1kYA+3ljNFTXR7KfJ4B9gRDJ8c7/kc4q8kx
	FSzJeG/3+XrcG3ch4VJ4FH20S/2DoOGjjJhs2tqlwQ4dV0W3jzKGvTSWS5iooE1TC210EjZrc1vX3
	uJE1dEev4hytXI5UOlV0N7z55+V5y71/o8dbeoGbUb0aaDqX97FsRGRtE/DMZM3SH5rn0KgjbpUHx
	LKxxPL0d76Y66kDy6vtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLrf-002DfJ-F4; Wed, 02 Mar 2022 10:05:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLrS-002DZi-A2; Wed, 02 Mar 2022 10:05:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B87CD1F44C4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646215532;
 bh=Px5GBQ7EElBGp4NHQzwbv9Xg/hWCIXOMw+5mUBSPG2w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KgVMT15N2sjROZubbpp8d8WeavE8c+WnOJo8lSV3mcp4FWNTN5a0E1n5mF7b8L2r/
 WBE0z93+LCWoewqdEpB12TDge0xCWcKwvbZtpFAOTSSain4IsLWu1S6eiEObc7X7LC
 D8ds76/q5vrK87/dBQI5610sq0VcTAjTsTh+v30++rpJfKJjklLZaI+T22koGpxcZU
 mJER3zD0mRXJJK/xQPzmpCkCBhdwUmcvaHBAbp+J4Q8ddQiT9GltvlfDJQPUiZMB9k
 JyEax3kaPE2xHPgwtsAwj6mS1Im+5HB+hlOopN2wSE0dfgxBb2uTrffMiycESfJaD4
 oIaoCuVA9OlHQ==
Message-ID: <0b7ec857-2dd7-1037-2896-07103506ce17@collabora.com>
Date: Wed, 2 Mar 2022 11:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 19/23] drm/mediatek: add dma dev get function
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-20-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220222100741.30138-20-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_020534_512516_8FF63DA4 
X-CRM114-Status: UNSURE (   9.14  )
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

Il 22/02/22 11:07, Nancy.Lin ha scritto:
> This is a preparation for adding support for the ovl_adaptor sub driver
> Ovl_adaptor is a DRM sub driver, which doesn't have dma dev. Add
> dma_dev_get function for getting representative dma dev in ovl_adaptor.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioachino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
