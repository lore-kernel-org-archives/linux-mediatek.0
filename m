Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0F1CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB6IZQOydLCEs9yRgmtf/7tjPMcNnhYqayiIp6we2BI=; b=NTBCrTszepKYCWWf8T8hWpKaic
	7Gxw0+6ZeISb62ZQ/UeVmJfQtOuKtp/cfqXd29aZjib0DSiFcHz1hItWHYH49endvZW7DppSiITxz
	n2xdLz4bXloogiVJxkebOeuhz4betn0HhYLq3QdcBi7cHqFIVG8SbQHcvB5ow4lmB+moWWvJOgCbf
	PH9U2QLcW25A3fCTYabH22LScg0yYCO0niQS7XVrRllI3VorBt8n5KKbgk4SGbikamngLewa53cV4
	Rbd9sITkGMJo2XcKg93Qbay3vt1wmGvCtWWkac2MpJCDmEeTS+Cc2NDLOEA6kV8fTIUbiNk8iUbm0
	m1OqIbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkD5-00000001wOo-2q8A;
	Mon, 07 Oct 2024 09:39:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkBm-00000001wDT-1bo5;
	Mon, 07 Oct 2024 09:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728293880;
	bh=tBr82LXAC10QRWO1nQyfOJTIr5Jby9xgM3gFPqrBWGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cp3e9gJlsas+5EhyPBb2wlNAegDhPVzZKTsBY6mUFKLJuxyL47Fy8kUR0sdmEQGnl
	 B265NHP2FdfTzzjMfq8gFkCMf4nwgQi8/4Uxu55acLXsNSBMbM5DFx3gvugPoHNwwv
	 Az6fSWf0fc9KMKCy2XFidA/Y2gHe/9snPTL+3vqtz78wMyrm+D+TqYZ09QdKJ/HdXs
	 bhN3QN9M1IyO7/KGApIl8nlO8FY1Q8f3Mtlv8UIhMo6VVnhWvNcu9kiok3o25qw5ua
	 cDuuCuaB6PlScOo1ATIuYCoAnH9JweCcGnB2Y3dBzy7Ov7DVZcsyT8E1ydCUEBfXEX
	 KnUYKLc7DbVqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4230617E11F6;
	Mon,  7 Oct 2024 11:38:00 +0200 (CEST)
Message-ID: <80d1b219-5362-4ba8-9c06-f9b811ff0f83@collabora.com>
Date: Mon, 7 Oct 2024 11:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] drm/mediatek: ovl: Refine ignore_pixel_alpha
 comment and placement
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
 <20241007070101.23263-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241007070101.23263-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_023802_599689_D3724016 
X-CRM114-Status: UNSURE (   5.10  )
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

Il 07/10/24 09:00, Jason-JH.Lin ha scritto:
> Refine the comment for ignore_pixel_alpha flag and move it to
> if (state->fb) statement to make it less conditional.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>



