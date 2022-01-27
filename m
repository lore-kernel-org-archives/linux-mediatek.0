Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C86DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODzV0gKmGE3zSTs4hBfLkjcZu8E7CplA4etcYfeUuEc=; b=UX44qXorCivY7T2i7B7U6uPlY3
	YDUPkpTXajBS48X+aesLYRfNNu0QXVeovLwArgZHXX6S3Qdkzx5ZVaZ01UPN8t8FlS535q8FSnf1r
	LfdQTC15SfZu0XzU8yuIZWrW2GDROWXbbBOHMlNujXES5PZbftzVtR2N2/qXY1WzQAoWsMuJq1AuK
	FAmRbGGmS2T2PTazQI6wB58LbAHZkxRmyPjsOSuoE5gBZskIQc36RDSbTLL0moz0r+0gaCUI7Xw+R
	/OnKmwfnK46SXLbQDGcvdgIkwbvWMSu+yeA35hWjQdUk/uUgD1CNIGVNmVuPH5VWHGuEq1vJU/Vum
	IsiRHfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Ie-00GALt-JU; Thu, 27 Jan 2022 15:03:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6IT-00GAKC-7e; Thu, 27 Jan 2022 15:02:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 21B551F403B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643295768;
 bh=di0QlooY9Xo01DVMWIhw7aG/KryjQggrU+H4kEUJCBs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aGTgsniM1VQF3R1ga0HwRknNztMGKeXKiZ1fuXUfZIxEzqSbVbHW6EmIUbz+3bX5E
 rAOC8sqSNdnChw1Y+L0XhoiLpv0yYFj+XEuWELPt/day6gpS9SvG7StaTcetw33syR
 BJfmf5Q9VcLes8Z/xNaUfWt7FwVRZluWopfwuotYZlLvdnlrpC2lu3jkXSig3banzg
 hKQ+cDD1XeEX9V9yrYiQ0TVpIX5XI27FukUzwcr63FHc0T64zWufYtIMJWdUBQDoEt
 fs+/mT1Rkf7B1D0iB1EIOrsYHOSmEFTBmcNH3YvcxphMJL6Arp+9c2uGCUcUDmeadR
 DJOSTr2ufubKQ==
Subject: Re: [PATCH v1 06/14] media: platform: mtk-mdp3: Modify mtk-img-ipi.h
 for MT8195 SCP
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
 <20220117055254.9777-7-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f6bbe7ff-1487-0ed1-595d-2449d57098ca@collabora.com>
Date: Thu, 27 Jan 2022 16:02:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220117055254.9777-7-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_070249_446948_D3F27924 
X-CRM114-Status: GOOD (  11.95  )
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

Il 17/01/22 06:52, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> 1. Modify struct member to 4 byte-alignment for MT8195 SCP limitation
> 2. Add new struct for hw engine adding in MT8195
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>

This will break MT8183; is there any new firmware for that SoC that will
synchronize these structures?

Alternatively, you should add a new version of these structures and select
them with a wrapper function on a per-SoC basis, or per firmware version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
