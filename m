Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA2AD13588
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JodzDkl4omwUoYGD9Glgt2sBUWZ35+s2CteaIYqLqcI=; b=WcEZ2jsDSS9XceFIHpIDI03ZDV
	EIOHn/dQN13GZGmvLvQatPCepw4ju27DT9b/3IFHsZ/eVQWC2kKuQk8J9GudwqUKgX3KGZ4htZRgi
	qoAmJ2N9koYdJNGjSnvuqpq1OrjDK0eO61/AxedkrzFrWEF1E0fOlzvu49RX02prVAEqDGzyNE7x3
	jxqmYAj3oXw/3cK5G7TxU0ikdPojaTyDa+lm80gBP7HASn9/GKYHwuzUi3oRNrv4oqR1JgqSCsXWB
	Jx6N0z9SwirS4tcZHGJQjM3G52usIQ52FGVLj6AqhuH3ZZqf9IU7iF0pAaqZoScOPbe8lJxm+faHf
	xiUzZa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LmZ-0000000ABjN-0ZgA;
	Mon, 28 Oct 2024 09:11:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lkw-0000000ABRU-3ACX;
	Mon, 28 Oct 2024 09:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730106583;
	bh=qbDABT2Z+Hm3SckfMFDCYI4eg+29z9RV470Z0JIO1Ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FZJFkmy/CZGDMoWGPLr/Imi9VzeOfV6jRL+DNCZklfPNZiSGYd7vmJqrQLGfak9vx
	 KywcSbX/zh6R4+mF4LJNWNuIFrRoa7tSSdtfEXioffKbYT65raQctoNBD50jrI6nBH
	 BA6Kx3oW5YPXbbgJTEO0nTv+i1AMJozDcQtcQSxzT2jlumQuO0ZI4TQHmLm4Su0Tu+
	 HziNnpKLd0OvenQqLTK3DLxyMUBBv07oDbQLsjN6a0ota0qufqzzubluruEPHWH7O2
	 1UtWwLBI9rzrLbj/80MdIkrmdi7gLvqFZf/PxNokDVBQ38hauTqxlvOIA6zoCRLi9m
	 BJMnYxeERYhzQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 476BC17E10FC;
	Mon, 28 Oct 2024 10:09:43 +0100 (CET)
Message-ID: <edafc004-999d-4ace-8f0e-1b8c711423eb@collabora.com>
Date: Mon, 28 Oct 2024 10:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek: Switch to
 for_each_child_of_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
 <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_020947_018459_48AC3AAF 
X-CRM114-Status: UNSURE (   6.97  )
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

Il 11/10/24 21:21, Javier Carrasco ha scritto:
> Introduce the scoped variant of the loop to automatically release the
> child node when it goes out of scope, which is more robust than the
> non-scoped variant, and accounts for new early exits that could be added
> in the future.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


