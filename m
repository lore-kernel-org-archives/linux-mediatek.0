Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F143FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJiJcaNct+VPTu1XfLIM0qdNVn/+gXynyHI7jB0kHYM=; b=pGv7imGEvqntvDNt4ix6VfNWm3
	xSZhdurG7kXt0Ikb/HDj9STe+1yyqE64NMYIW4BvfXvZ6HID9oRX6Th+MIUb8BCFsDO++kC6TD7Yv
	E33TCvFMIp6vJpUc9V2bbSi646APp7FNmfxlZijZZbyOg3IlzhW5q1+IS4pA8QFIM+7zu+WIulzlb
	GoxCXLTSd9/wcAH7k9Zog163tQ6Dy2g+LMGfJfYNMfNlBgdCbsqER+1H60WPmHAQ7zt+UaCbhDvs5
	a/p3jn7GfEeRWGMS2a4f5aq1D2chwXh3wU1KXLuZQB9DNiR22+ZdOBg74CqJvwL9a5n/SeGeTXgM1
	FRM1+sHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlvG-00AnEz-1G;
	Mon, 10 Jul 2023 08:07:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlvC-00AnDV-2x;
	Mon, 10 Jul 2023 08:07:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0327A66057B8;
	Mon, 10 Jul 2023 09:07:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688976421;
	bh=4MaltMVO+iQy6EpByYoeAcXeuF+ABj89+MZxBYJFHKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=addcJBtOMke09j+T2MFJ5b5YVqiJA8dBuzMlpUWHxRWbF7exr5O9ywRw4xwFxyZdv
	 22k+KVecQZIG0Rmt9tBcCPHqUyxIZaPHySPgJC8fjqckey56wrJYQ+LIwBfFZWtwWI
	 Q3Ek46u64q8lnquI2kj8o0u1gcCMo394umGWpHrYKt0OU2lAk3PN3H5EHx/dKqYLIg
	 dH5Fu86DCBBs/qHx/iYA3x9Alj8/NubIPQPwBfaZcehKN/K95ffQwvEJWj9db7vD+W
	 Hx9brc0DBNm+uZLfWFKBdlIWb37uqpSZKYr3jaSWRAffcj7LnqL8daiyvDGQQ81lhb
	 M1txsLeyxlN1Q==
Message-ID: <44a4270b-72d5-10ca-c706-c3a1fc7bd4dc@collabora.com>
Date: Mon, 10 Jul 2023 10:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] drm/mediatek: Fix iommu fault by swapping FBs
 after updating plane state
Content-Language: en-US
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
References: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
 <20230709162641.6405-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230709162641.6405-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_010703_090933_08E948A2 
X-CRM114-Status: GOOD (  10.00  )
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

Il 09/07/23 18:26, Jason-JH.Lin ha scritto:
> According to the comment in drm_atomic_helper_async_commit(),
> we should make sure FBs have been swapped, so that cleanups in the
> new_state performs a cleanup in the old FB.
> 
> So we should move swapping FBs after calling mtk_plane_update_new_state(),
> to avoid using the old FB which could be freed.
> 
> Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



