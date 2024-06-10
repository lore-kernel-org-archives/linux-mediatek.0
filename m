Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B1AC27C5F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RU6z/EPep6RsXc7dUQjlHJL6u32QelAQ8qjtrgn2Kw=; b=A9jeZDMXXZOak9
	NxZwhKH4z33L7hMQtroWLe+wDfkg6B4DD/NIeslnKiqEu82tkLjkKIi/3b5ieswflP454T67ZRDzf
	voCyhLWEiBE3jfv1cqwBzwoWmwLTvaIcDBoAVpJxjeR4H9rIq3+r8YEuQnoL2BZI7uvw2BJmJPTvw
	7utmuldftYKWlHn0vm8ykIwF23LmtV4AMyZQp8qF+SU4Uff4Wa3X5++kamrpf3u9mV6gj7br0VA78
	L8pYpSEArGr3MeKrgd7z/c5CYDYiVh/+CVFVz0cS6P1EDB7RGCLu2+TzFnLY8QpawFQHGe3AhXvI3
	0ZFaC/7LcueUG1zKGT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaAW-00000004CmZ-0f5r;
	Mon, 10 Jun 2024 08:14:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaAP-00000004CjT-3UHN;
	Mon, 10 Jun 2024 08:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718007252;
	bh=J1o7GUOJzCSDHzhvzvHGZsnc3g+z5nolKVnnUTDks00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lW0ACqbhxTzXDV5cwzEwamHYYJWcHpT2kKhiPxWvzG/+zG0WyPKrb81HgJ/xCJ9lc
	 ZWPVNv4ULxyTfRPlBlM2BsMMPRpo2wugYVb5KNJYrhoWaqwAtUWFfYke+KQCDBrmmc
	 NnflFzlyqkxw8EwQ2TF8QzoCwAbqRAM5dHXOL3+fRvHNEOTv+JLQe5y14zygZHRH7k
	 UrFs+TQnKcj2SjXtT7Sg42aM55bqI52qBs9BZoRPd+D+Ffjbfcvq0E1u50oG4TW/19
	 Vs3JgJluo+szSnOV4yCaYFICrJNn7IUo+4y93SoeMBuvXXCxnqZgo77pxgOr0dQdnM
	 mChRDO1UKVhTQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 49BC53780575;
	Mon, 10 Jun 2024 08:14:11 +0000 (UTC)
Message-ID: <07a45bb1-4444-4ea3-a650-b42392c6fea9@collabora.com>
Date: Mon, 10 Jun 2024 10:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/16] drm/mediatek: Support more 10bit formats in OVL
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-8-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606092635.27981-8-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_011415_141098_9515B9B5 
X-CRM114-Status: UNSURE (   4.73  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/06/24 11:26, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support more 10bit formats in OVL.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



