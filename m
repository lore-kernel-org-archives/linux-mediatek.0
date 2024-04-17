Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC71CC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cy+aLOQBEMjVG/9jY6YpbDq0/VFwsk91NU4FfipASw=; b=JhFBasNC8n0n+fZJtZQUEctphW
	UkPHSOYk466TlFF7+naDO/mDA++vscbnVzSblOuBedeN+H8Qp9zfcD7qC133M5cpmM+I7OyWV1PEd
	zXJA1f0BcncopaaGOK+UOwzUsQsbiZxrmDk/uFlv+ru6Mfw6LWslFEXACQHc28IMjQdbtRnbJ61UB
	4Uf6ihSsEd+8Myp9utx4tYCY35zRLW85EtVjQjZkXaRfU8LFI+NVLHnk5tuBLhPmizv3rCKKJwo5g
	w+tAEZ6s47f7X71g1UpRioYqOLsNhBWfdgQDXVU/KcEebGgUJJJGrjW9RhdRqvDB4YkmbobO5JPwF
	MbxfDMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5i8-0000000GEwX-1imj;
	Wed, 17 Apr 2024 13:52:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5i4-0000000GEvW-3Jbv;
	Wed, 17 Apr 2024 13:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713361942;
	bh=VxunfktQMOjppOCQpES9K8zlG6woQD+gav0HVLUYdWw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Mykj5nAq4uZmDGUy8aeGxuqe1I9F/q86kU0nNQ1xVNXcg8XVae31Bm2y0lTzMLRxz
	 sCbBts3Q1SnTtyf+WFufvN7v6WNYpJwBUoN1k7kZTBFXzQr3V5p5NWX3Od/aVo/z13
	 dcyJZqtU2prWJkdPjLYZkRNp7EoJzGjc7SHTX5MKlH0rQh2+K9hh1JGB/+PJkfi8iK
	 58QYY/y1ZXU2KXl29NUD5sHJrhTDD3on7edMTS7rVk+37dU6erHEzcqvjviarUFc6h
	 M0BkSzY5TVdDI0g1canrfGMTmTSWsLkVVnnRDYmVwIiYpaCBC2x2gaSqy9+8cL/6e8
	 jsIu2PVVQMrHQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7EB49378001E;
	Wed, 17 Apr 2024 13:52:21 +0000 (UTC)
Message-ID: <275e760d-e4e2-4a6b-88f7-9a8590b0773b@collabora.com>
Date: Wed, 17 Apr 2024 15:52:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
To: Wojciech Macek <wmacek@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
References: <20240417103819.990512-1-wmacek@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240417103819.990512-1-wmacek@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_065225_051153_F9F44D73 
X-CRM114-Status: UNSURE (   6.98  )
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

Il 17/04/24 12:38, Wojciech Macek ha scritto:
> In case there is no DP device attached to the port the
> transfer function should return IO error, similar to what
> other drivers do.
> In case EAGAIN is returned then any read from /dev/drm_dp_aux
> device ends up in an infinite loop as the upper layers
> constantly repeats the transfer request.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



