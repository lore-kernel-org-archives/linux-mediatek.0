Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2EBCDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mEjCWQZTxRZbbNg6mdtO8Uj10XjAlWVbHMvsiIz1qc=; b=dX3xLHlvUebo13fVUkiqZ+18L3
	twMKAFrLOK2Tfb5KpkfYw5d7X96L3orx/cSh9D69IyDkv51AXaUTRTvU1RbXaFlISGlCmUhpStFJY
	H+hKE+B2KpAma/qSFM/NiDpkylu3uvgPXtdSFoZ9FQZitzGSyHnRAXyRIi0TJ2g9GQjUfJbjWKbwf
	vGWvqIZxcspOGtzFh/UClDr7clat1PSEkDKxQjydWAZ3hMmx6YpEaOTkHPIL8NHTKajNYqNpodNLU
	AcmDpJJNGM/qbD9H8DtR2FJSsvq3n5kSFdMo0Y38XNg9x0sz7yW+IIwrEaGpwErIVWDhnHOnMP7b3
	AAAT1GdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsXW-000VkG-2C;
	Thu, 12 Oct 2023 10:03:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsXS-000Vh5-1T;
	Thu, 12 Oct 2023 10:03:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 947A7660730F;
	Thu, 12 Oct 2023 11:03:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697105009;
	bh=vSR9Dv/F40nI015RR/8THaxAbwmFqoejsJwpTYtpx/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QBNYOs35EM11eNbq4zlUrZ7qdAJXpabM2HA//NhdL3bImajgCeWrHaU3P0EjuA1Tz
	 R6j8DYqo7wSNnyXsHsPzEj0G0gc3+PIDIpjcCM9oqr+npTeYcII/m9KJKgTyfrfN9k
	 Z5Nzzq+Xma2TSmMCOy+z3c08zm0E47lg+dqVMy/uMV/xvCPh4kPhjZJn6ezTDhH3EX
	 XvXy4wLgOuUGTy3bbYqW5QEO/njdJbOZumzYDoaB8eDv6VyzXUxn86ckfkQWIfRtxi
	 p6wRmjMkxMpMElFfpG5/ZGj0MDdML63z5ts5XOIprMDliB2UUTgc8JRkPlzmOeIl3w
	 B6rrrKGGpWkyQ==
Message-ID: <9c811fd0-9584-0df9-9639-00806f9c89a6@collabora.com>
Date: Thu, 12 Oct 2023 12:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1] media: platform: mtk-mdp3: fix uninitialized variable
 in mdp_path_config()
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231011030037.22337-1-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231011030037.22337-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_030330_623484_0694D736 
X-CRM114-Status: UNSURE (   9.43  )
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

Il 11/10/23 05:00, Moudy Ho ha scritto:
> Fix the build warnings that were detected by the linux-media
> build scripts tool:
> 
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:
> 	In function 'mdp_path_config.isra':
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:
> 	warning: 'ctx' may be used uninitialized [-Wmaybe-uninitialized]
>        |                    out = CFG_COMP(MT8195, ctx->param, outputs[0]);
>        |                                           ~~~^~~~~~~
> drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h: note:
> 	in definition of macro 'CFG_COMP'
>        |         (IS_ERR_OR_NULL(comp) ? 0 : _CFG_COMP(plat, comp, mem))
>        |                         ^~~~
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:
> 	note: 'ctx' was declared here
>        |         struct mdp_comp_ctx *ctx;
>        |
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



