Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEF2C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww9xFVaCwk2ETibLJimsG9GOIHZa0L+ycBwxPDoLq/I=; b=NmwqbebMiBj6xlmdKEL2MUYzk8
	SowOCQ/lm+5nteL2A3XbKmYpG9vTkmVkmUBx88QUF6VkdtfMiZv22q5hd2mAE5S+VAfmkRycrndS1
	/Be0vZsxnq+oaHJDyIfLIvxFeJgEeq5U9SG+o1xo7wx139wZMgS3OhpiUYE2Ray/XVinZDxkt0Zgh
	FuMmVOhorvpCYK3Ca9ICDDKhBuELx/+smK8bBkjCYMPEMzUFttedz3SGNHJ7fEMktDD0WoyJOkFXZ
	zkIOoAzkMWuu9I2JjXFJ8WEdv4FLJjzhuGZW9mDYojIMxHHubEaOrld+UpECJt4IM6WndUO4JMA7t
	tRTXaHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrwg-0000000GP86-3N1j;
	Wed, 20 Mar 2024 09:09:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrwd-0000000GP3u-1QAi;
	Wed, 20 Mar 2024 09:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710925748;
	bh=WL++lSiQWnN695SrxzJhseXDuycH02PQhHRdBX9Zm3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1cicMcx3GHSFdlgc4r0/Nix5DLRLaFVACMk05mRRdZKAbxS5nSRXiKiGA4MG7Lp4b
	 Er4sL+Jpu1KpJtf0c3OHDrZdiVuUuK/I0sADlM1/2KSvy9g1HQq53bTpEoxmUaxcF4
	 qDTT9gfNWqpFLlX4fwyKOJW9dgP5VsvMhEAmcvgpt8UvOeNDxKWiOSbMTGLzgzu7N3
	 az+QNeyMsn2HJbWgA9TS/skPXJhDSJ/V6qtL8WTipHpawktrmzwtgVH8TdgeUp3qpq
	 iDfihMUMIIMJk4LqJ8KB1pwH4sUO9X0fhyPCxTuFCc0DPzrHKjXKNzsmMf1BIdbSB0
	 aiRpukMe0KDzQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A713D37813C4;
	Wed, 20 Mar 2024 09:09:07 +0000 (UTC)
Message-ID: <1bc3e804-50c4-45b4-b227-1099e50f4fc6@collabora.com>
Date: Wed, 20 Mar 2024 10:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.c"
 to "mtk_ddp_comp.c"
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240320024222.14234-1-shawn.sung@mediatek.com>
 <20240320024222.14234-10-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240320024222.14234-10-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_020911_550502_43974056 
X-CRM114-Status: UNSURE (   6.25  )
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

Il 20/03/24 03:42, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename files mtk_drm_ddp_comp.c to mtk_ddp_comp.c and
> modify the Makefile accordingly.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


