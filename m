Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CE4C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++jzD+Bp136TlYbQKiFuC3WA/fT1sOZA5mRF1yfM5wU=; b=KiasmXi6SrNiWHp4vxgh7k2o/z
	0rid6Y63nM2jW8Hm7mh2/+zIeXDZeQUWgngH4CZAVkHxrb9DYzPzqr/YbEYb9y9WFmZ5bN7gdRhIG
	POfiKLLURqjvP4Oyl/x75fsTeBxeUmpLR2QmpxolFGsfnrv8e0C5Vb4cQYkiNldV3XXFZmJop7P8D
	M5iVPzgbEGs6KW+trgMrjR3yQjmXb6nSrC4WBNBNwB9CVkg6ygRiTJef1JdMwpv5HC7bbDM71iHHP
	KNDUq7dyDod4gSYWkECXsCTm/vwfMglFRviERsKTcySBCdE972OI12rHPfjORZ2qF2WjqL+//xz8b
	b0Ics6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVWx-000Hsq-0B;
	Wed, 29 Mar 2023 13:07:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVWq-000Hqs-1D;
	Wed, 29 Mar 2023 13:07:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D05BD660316A;
	Wed, 29 Mar 2023 14:07:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680095268;
	bh=yGfVILKe7laFu/2YHoRttqj8pGUwtwyR33Lg1kmR68E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WVKmbqI9f/tOjmJbTXVwE2UHiYR7vuFTBriH3zaFHfmMCj3jcP46Df1s8kR8nW078
	 iVCesM5eN2gRh0baQ3glN8f3NMriMe7wuKiMbBeguEfnOkrI6mBOxOFfqI0xnUSvQ/
	 r6KYUg3SfGZ6+U3BZnycavTk5iaG/tGltcf7Ef9XVRo64FLmDQDnD7ZWifnHhiKqnj
	 Cs2TgTkRdk8qO3FZ7j/wbxp18FQRHxqaRm5TYhuBi64n5T2xRM1W7ofAOqxwcl7qFt
	 dAkfaikA9m5N94lSkhsUvL0wi40cwAEgK6QZZmxB9f1sQSoexW+ccU+MkAKnz3Kfog
	 AmoGp5x4E7BiQ==
Message-ID: <84dff623-c5e7-7f9f-19e1-54fb8c20d110@collabora.com>
Date: Wed, 29 Mar 2023 15:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/mediatek: Add ovl_adaptor get format function
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com,
 shawn.sung@mediatek.com
References: <20230329015916.21684-1-nancy.lin@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230329015916.21684-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_060752_643111_D96BD355 
X-CRM114-Status: UNSURE (   8.22  )
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

Il 29/03/23 03:59, Nancy.Lin ha scritto:
> Add ovl_adaptor get_format and get_num_formats component function.
> The two functions are need for getting the supported format in
> mtk_plane_init().
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Small note:

This commit depends on
f287c66a6064 ("drm/mediatek: Refactor pixel format logic")

...that was already applied in the maintainer's tree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[On MT8195 Cherry Tomato]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

