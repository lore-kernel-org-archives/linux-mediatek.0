Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F6CC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw6uAmpj8wInkF9Sg6x/VFanB67r6+WsxN/ttjh7LzU=; b=ek8hzrQlnda0HTdKUwcpUUHK8O
	zw2EF5uZi/4t1Pq3uxYSiH4RlIXvf0pNvlzN7V1iXbkWr6C+el13faq6vvXJgWbibnz1dumB9w9Y4
	JjMoGO1qCOV8Bn7BL2RZdrOdFWzpBBvVfb8kW8eU60Qw1wAKYXiIgbB0aHX73Ybgu0WLOIT4Pr8VK
	7PYH4lf/pLMZxRFL8wq33IjPbFRQjkj4Krfx8K6BXCljNcLaKFe6wUWQCb8A6sPAuu0nIlWuSwrff
	AD7YAXJJXmTjqx60pimOKD9ZmMLDSzFRRTOrzo3S66eoBmk6i2QCXym2cJ+y2RDhd9Nd+JhFZK7rW
	jIk/LGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU52p-0000000DxJ6-2X8M;
	Wed, 17 Jul 2024 13:50:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU52S-0000000DxCB-0Oh0;
	Wed, 17 Jul 2024 13:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721224186;
	bh=zQZmiTTzmzQdPa1yCebXS2nAhXU99NQMErzyQ+ATufo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WkWIqWsXqnZlftNqajdxtHkmhijX+MX+nw7jiazM6dfIThr3T7zjHvLQb+MKsuxJC
	 GFbEqrxnMIZOLi9F9WdMuT+hQtLiwJMdcr1fFTBuqA2udJh+3+f5xhlG5pgDzf5hCJ
	 4El7hidqOG0UyaBgR73qZY3HAIkQO1FcPhbH088v3UGUEBJWwDuiSu0kzXDwwLI8Oj
	 1I/tW5SFGsLCF08VqoT73zpYm8HsPuTaAugjUXt6Ec3P1ZD1wox5fivYMEzIpszbGu
	 w/pC9Fc9jqLD14NjFaXOpQG6OM2ObmNqwPe04PNeJ48m181+H0rIGMaslQC7+/i6PW
	 Tlt06TtS2ty2Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29F4937805D6;
	Wed, 17 Jul 2024 13:49:45 +0000 (UTC)
Message-ID: <7d942686-e6cd-43c5-8bd0-7dcb93d691e6@collabora.com>
Date: Wed, 17 Jul 2024 15:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] drm/mediatek: Support "Pre-multiplied" blending in
 OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 CK Hu <ck.hu@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <20240717-alpha-blending-v4-3-4b1c806c0749@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240717-alpha-blending-v4-3-4b1c806c0749@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_064948_349325_2B159FAD 
X-CRM114-Status: UNSURE (   7.47  )
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

Il 17/07/24 07:24, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "Pre-multiplied" alpha blending mode on in OVL.
> Before this patch, only the "coverage" mode is supported.
> 
> As whether OVL_CON_CLRFMT_MAN bit is enabled, (3 << 12)
> means different formats in the datasheet. To prevent
> misunderstandings going forward, instead of reusing
> OVL_CON_CLRFMT_RGBA8888, we intetionally defined
> OVL_CON_CLRFMT_PARGB8888 with bit operation again.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



