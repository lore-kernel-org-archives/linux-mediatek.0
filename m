Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B71C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCTpfeRTlYaxFhkgl5eHAYBuuDQ1gSPByN6dQ/Bs680=; b=acA++UtOx2c7+eTExEGuouAVBa
	fVW6nqIjbphKFALp7xRwDkYkmRyPP7HnZNDbea6vO3QpAQ3jUBic6mJH/CrV0qlhTmGPIXOzlDMet
	OJPwAiAWpMMaH7B6XHnWWieGOq7XnTTMOS5VcVwTtcQkhK2xetDMNaZPLikCc6wUXxTt+LeNBE3lU
	vv7Hb+ypAcBbYzrW+uOcJ4NusX3/qWIyBZauXUvNdkZjoUk72qtV0q0GHGb54ibm80qJcp/3wPalQ
	jBVUfcY1gK1/9Pmkh0CAuc946YkGalHxBw1RubxCENcgEkVvp6rM9+UdEj6CbqkuMAD/A+8IVXyrA
	3wyGmGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmt0K-0000000GgtH-3FC5;
	Wed, 20 Mar 2024 10:17:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrw7-0000000GOcd-1sbt;
	Wed, 20 Mar 2024 09:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710925716;
	bh=0pLI0L5jQtxzcpdywVIifeQcG2pw2/Wr4GhCFKwu9uQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uiCYaqVUV8qdI13Y/tOKLHPQhu5i6nOwDEC321w6keVmWgCjyw0VmAjj5GRSxwjz0
	 yvMEuRJKxXITdz19QVhKXxTaFb9rRm9Ha0wcbiXvAS/nOUAf0YsInuuLxlnyeDnCpK
	 KXaIaqQkj9wkBlz/oNJ9Cp8NIeU6Q0AUVqOHrAmc5GGUOS4o/lQh1uuWx8RYUaGUHl
	 70oCjHV8h6zrIYNN3ZUHkMSZhZjLGSS2HiVySP2drmm3AYSQeIZ7cVybNL4gxT8VLS
	 qY5ZeH96WEONwZ/qm5TGHQSoOsi66GcCqfBdaW6Od9LeMo/5qj1sqiUaQAbrnrkW7D
	 QmIS3L+BVuU4g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9AE8F37813C4;
	Wed, 20 Mar 2024 09:08:35 +0000 (UTC)
Message-ID: <2812525d-9c17-4758-bc4f-e3093cc26ef7@collabora.com>
Date: Wed, 20 Mar 2024 10:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] drm/mediatek: Rename files "mtk_drm_crtc.c" to
 "mtk_crtc.c"
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
 <20240320024222.14234-8-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240320024222.14234-8-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_020839_945874_546A52E5 
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
> Rename files mtk_drm_crtc.c to mtk_crtc.c and
> modify the Makefile accordingly.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



