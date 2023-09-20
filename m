Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE720CE79AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 09:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTEx++kGyZaKiOB08CkB9EhYFDE++xcedkF+6mmAZEE=; b=I9WnvF0cohekEc
	V5CAQutAQqJmM7u2S20wWd+i8OJDIRy0YqhOox2G4Z1xiqD6RxioTpgaY82OupFL4TSdmfYv2Q/72
	9ZZaBeAMGqFeBJhhWW0yuT++8V6NDUDOW3pwZGuBJAH6riwK+os11QBf7gA2Yn7qeyZJ6NLNagbgl
	BxlEZane0bG1s7uADnnhJJYKu2iy28nINaoh0GCp5xKKcqbxWaaLpGsMrdpaEZWWo+ZO66vwMhZ4u
	tvjOSzPLP4G9qRbPM+sM+wuwqBo3ThvQv4nm3p4dYNFp+FPrB9zonHtaNd1E6eHJU6KjxZN7Ekdnz
	YeB5RXyErYC79Z6u5Eyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitIm-002R4f-1z;
	Wed, 20 Sep 2023 09:15:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitIk-002R31-03;
	Wed, 20 Sep 2023 09:15:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA0C36602173;
	Wed, 20 Sep 2023 10:15:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695201314;
	bh=x0Esi80mdMUdifaJpkmgw+xW2uN1cQWlFCth15rOVuc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZTwubqliiJ3jXqLEsaInqpxrA0CUnmRDEjlMtg0RFeqiSje2g0FgsSFNWUMiMtAo
	 Ms795fFYax4zXrTLTBBaj6uOUgfv+HrT0XsTPEdlOzyx2s00uiXNPJQ7QK+1J7rVd0
	 ZCvcxNqUXCD7cYUpjne2jnJYKwcownWEkjmF1HzkqKt+HZH0EGVxab7I6QUdEs9Umf
	 pQOobuL93DQhNxBxO1guq9lAucI1JlxUgV9plEY2vIF1vERSDXOIBPKcztg7r7zuKh
	 PpHNVxdbHf2zTmrClVrpGnYtsGLao60ZKhviGXNoUzeGRKood3u9kAdJYUo1sR93WJ
	 3NdK0GPZHWcCw==
Message-ID: <eba543f6-444c-3e7f-4f33-4c7114be16c0@collabora.com>
Date: Wed, 20 Sep 2023 11:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230920090658.31181-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230920090658.31181-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_021518_234851_D1E5A3D8 
X-CRM114-Status: UNSURE (   7.68  )
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/09/23 11:06, Jason-JH.Lin ha scritto:
> Add spinlock protection to avoid race condition on vblank event
> between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

