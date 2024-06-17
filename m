Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE3CC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/DERmto+fcPFGNXFc1rrjBtuUOhS0O8qorlL9Ztj+8=; b=Gk/ymvL03t+naT7QAUgamvxH6o
	Yj/Dd/OIY66wosUFG2pnBXWRvHnyRneFqoePrzO4gnALqWXFQ8VcsG/Xu5+5d5Tn7I7OzJWFsBtlP
	nrD5GPc0zHUxN4raTTcNeL2MBHRS9DU+oUtu+XhIXR27RNbP/aQUU4k5LiwPvYyjMjZnoPYpkJ62c
	TriSNlyEDDLgeqVj/yqT4v0PyFS8B1YrkU1D/x1g7EaqBW531D61rw9GbP84p4u5YqyiS8UqDxxFp
	7YJv86ZckB8e7CLF92LpXzfBc+ED/G5C0K226vZOCbAJvpOVS3uTIbbYYiR3kV55WBOWByjR1T8nD
	fYdczmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAPc-0000000AS88-34NA;
	Mon, 17 Jun 2024 11:20:36 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAPZ-0000000AS71-1Net;
	Mon, 17 Jun 2024 11:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718623231;
	bh=7M44fCklyjADUfmcSUg+yVO0wqaTtVBvCoujFgimqAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4lO0CG6Se4dkykAfArUXVGlNnDV/A7e4FAzDN6L25u12j45kB8xyqSWOaZAToMAqR
	 jwz0+ZHyFK/H5e/MVdIe+3usnQYO9eg3NMbrOwGonhn2fg8WF3MbflBBKHHscFv0Xe
	 aRuQyP4qoosQZZc828QXK8vC38vccFWFTKlrjxzS0AKuZQhJHH/jLuLU5hMuZkFz0r
	 j20oR/5MtYOyPXxTf3/yiXs3Tnk0AMpgXgrexwtLp6nmvj3L8heEYjVbTSWaldQYEp
	 YChbMhPo4/BiyIPNglAJRwP+5ykSDNyd/B2T/S3rsu6WT/CmENHJYHGxGmYX6GO0/5
	 2+xK/eOFIwA9w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21A6537804C8;
	Mon, 17 Jun 2024 11:20:30 +0000 (UTC)
Message-ID: <670f3b3d-10ad-4ed4-bc36-317900bb5bb0@collabora.com>
Date: Mon, 17 Jun 2024 13:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm/mediatek: Fix XRGB setting error in Mixer
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>,
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
 <20240616-mediatek-drm-next-v1-10-7e8f9cf785d8@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240616-mediatek-drm-next-v1-10-7e8f9cf785d8@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_042033_657968_136E8524 
X-CRM114-Status: UNSURE (   6.18  )
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

Il 16/06/24 10:29, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Although the alpha channel in XRGB formats can be ignored, ALPHA_CON
> must be configured accordingly when using XRGB formats or it will still
> affects CRC generation.
> 
> Fixes: d886c0009bd0 ("drm/mediatek: Add ETHDR support for MT8195")
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



