Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E046FC0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVoMY99RmC9i5k+o7HzUtRa5EUohfOvn94fp6L8HZ5g=; b=ES7umytZ97YWOkvhAlKyjjaRb8
	f+RM+PMdbksHvnKX7A+mn6NAuy2spIs6/aJiNXRT6RyJmTZl37L3dp9Ixe6jPOB+k6AyF75wn+6da
	oab8W74q8aCFCEyzbnMUjUwmuMrGmdxFHH63kkOdoW+3YwPb/FQUn9X578jaV2MZ9ZgB0Lnphg/rj
	3FWaTa6l9B/d+7h8Gpp6LXM/3d/qUmsod3ZbzPqLBpcNSb2fJNFFiALgNzt7Y3nRlPEYLEnYDQrvL
	kU3ZRrOgk5Zx7lL6Fj8FD2VwRr64kYLZaS8IF5crVKVtiXSFi2P4BDVQRI0uDI5JwYkQlvYFC5lsQ
	OPof0U0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIx0-003Ltf-0p;
	Mon, 17 Jul 2023 07:47:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIwt-003LqN-0Y;
	Mon, 17 Jul 2023 07:47:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24DFC6603203;
	Mon, 17 Jul 2023 08:47:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689580029;
	bh=26aPzlNp986WPqG7Lr26YQExo7j+A8YekqKqBBz+4rU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eT/cA7mzOMzprdYTN7JPBq6J8JkCnQ3Md41jwehyo3Wox495OAwDew95SwshJvlqX
	 p9vq+ZN62VFp0DzvvFkNZKf1NI/HXI9/fS3GLfygbbYvBL6w3WCcughXfuQEE7NRB9
	 dHMmYOEbYUteeZiGKnbDxWsLU3OrF8obZcsRQkTpvwstAwu2DUjSAjq5Z8GSGBjIHJ
	 tRWbyg3itBTj9UZzWWx6aMnDPVeIT4T9kBh/1ebUhV8w3z1duWjfrtRLKqF4NQ9VYN
	 J1JWBzA7n5g5nBHDAm/srxjFLMnB+PyWk3hnKiVk+8hoA1UQgKafeoTzBzH9pdjpJt
	 BySmsC1pm0C8g==
Message-ID: <1e84f0e3-8902-d55e-ed15-5c6476944656@collabora.com>
Date: Mon, 17 Jul 2023 09:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/4] drm/mediatek: Fix unintentional integer overflow
 in multiplying different types
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
 <20230714094908.13087-4-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230714094908.13087-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004715_741272_70818CDF 
X-CRM114-Status: UNSURE (   8.95  )
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

Il 14/07/23 11:49, Jason-JH.Lin ha scritto:
> 1. Instead of multiplying 2 variable of different types. Change to
> assign a value of one variable and then multiply the other variable.
> 
> 2. Add a int variable for multiplier calculation instead of calculating
> different types multiplier with dma_addr_t variable directly.
> 
> Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


