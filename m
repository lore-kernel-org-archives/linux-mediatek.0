Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B151C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QDS1Ky4fnmVy6UZnsFY1HSdFBNZDHduAwMbW/J/1Pc=; b=a9lw+qWmMaIPq8
	tMqDaUv8n5DNgdGhDWXv/cqw8S5BzQhBlQytlf11eai1KAfaBVDC9H98oNP8Zj6PlcD1SVvhLprcE
	DPmMK0QHU+7EZ7gUXlT43f+Y4vRUOn6QioeIoH9C8O5Qm+qqBU0Fh/kQShQ/qfzWIVQRHSPV/9tZq
	XuY07PUtc1qdNugcX2e+d/PvOfdAIJjxj4KlL8MD+7c+TKbr9cKef4/s/lKVlZmXTVdaqDkd7/vrp
	mnd+MarOiJ9RiIlE6aeCX9ImbKq7uwHitQxVRhliBcCiR/pAOHDND47THBwb3RZu7kYHyTtx/s+gG
	G+aSfCYbAxOOr3DCviIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGT8-00CWJq-GY; Thu, 10 Mar 2022 10:56:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPo-00CUKc-Ic; Thu, 10 Mar 2022 10:53:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 632831F454C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909583;
 bh=b5fO4fdPwqMD/A4ZKgLYPaoafwQC/kfyVNYY7yRZujc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QSZ+LicgTc1UcXGgL1fUBKGpz0s0bYSJBAD+q3prTF1q3EWfSR74S/MNIWtF19g7m
 bxZFdEwCn5nMbvc9Ib1UFxuQ9VvWc00O4JBIsfGqtc7Zo/mOFw1D2paRguGyn2fE/L
 FBkh+aAJq74R+zhA0ZD/wP+2GXFfz6m77mHLZLHgiBATvIbIL4TI2r8rxOUoTxP4xs
 cvsglk2t9e3dcpiIpSWjYV0aPfye0X7yMq1dTbPcV86+gFml3IjQN0S9qCUTU7bAr/
 CKGEdXftMgrpCz+STXAWEuMEveoxuJC6zKjcbZScNRwOy5vXmhAiaKlD6PnAocuoTD
 Im1XaYFKb4AHA==
Message-ID: <8fb8fd0d-3ead-e918-bcbb-9b1dd45df22e@collabora.com>
Date: Thu, 10 Mar 2022 11:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 17/22] drm/mediatek: add ovl_adaptor support for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-18-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-18-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025304_807881_A9E24440 
X-CRM114-Status: GOOD (  10.89  )
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

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add ovl_adaptor driver for MT8195.
> Ovl_adaptor is an encapsulated module and designed for simplified
> DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
> an ETHDR. Two RDMAs merge into one layer, so this module support 4
> layers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/Makefile             |   1 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  17 +
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 443 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
>   4 files changed, 462 insertions(+)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
