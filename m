Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B305CDD578
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOwF8ltACD0eMc8JWUcGFcXuRptmCsExZblDNBugkUU=; b=38obvZE8+8K8vhNZonNh8qXM/2
	7c6DSj1Vk4czfdYOd4GMhUM5Wx/HDbINqDkhttOPTBl/Qw28UOErxZiS5DEHL2M9iZcHxMKrzSSzW
	hUZ3SqLzMIZsBGW46Og1E0onCY5+IKLnJhiK3YvVR1jwBLODaNebcXpaKt9hnhp8+5x/jXF43megI
	TxRWAqPqrio1yt9Zx78eAJRtSgde2ZmuxCf0W6tc4edg15Gv9mILKrqM7oYjmZpNsRSKfTc6uTzj2
	uRn+GFUeVPXUVjx/gPmPE6nB928Qxu5R9EOvZGh4gtwAkKqlEz0AV78gHxWdBnjI7fqrrgM2sOlgn
	QmEKa60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srH0A-0000000AK4K-2v8t;
	Thu, 19 Sep 2024 13:15:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srGz1-0000000AJn4-14Ul;
	Thu, 19 Sep 2024 13:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726751645;
	bh=lVpBhjn/lwbFw1fgMeadNurIObhRHR8S3Xp7BExSnJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BMfBjYxSZUtylya1Dy1KCbuAOar8fp3lQNYaP5lzmtN4ADZ5OFMoSwyvV66BvUwUJ
	 FO0F0Lc/2v3lnr7zQYj0a1L7+kTvgKNcWWhejqNlFPQUU6QvdWuSVnZBR6zz51USIw
	 YkFQkysbTl/ZYYKPea7zEPvtp6yJqY3zQfOyUXGVzE+Yul9rXGk9YYauef8bXfrz9N
	 qnu5u1pqUYGMyVGRPcB4wMpd28Ncd/f75prTefG5Ktxd8O42LnunbWmwt6B6DvI4j9
	 T2ynEQIIJaS8O6f4kxFjiEiuN84HhwFB4f48vBMOiCEkRJmWBPO+5A0CTHzgSqltwy
	 LpVqf06RQ8vRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1D8D17E1516;
	Thu, 19 Sep 2024 15:14:04 +0200 (CEST)
Message-ID: <0a78959a-2d72-47a0-83f1-89065ff48d0a@collabora.com>
Date: Thu, 19 Sep 2024 15:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: Disable DPI display
 interface
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Pi-Hsun Shih <pihsun@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jitao Shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240916162956.267340-1-alpernebiyasak@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240916162956.267340-1-alpernebiyasak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_061407_480554_313867B0 
X-CRM114-Status: GOOD (  11.75  )
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

Il 16/09/24 18:29, Alper Nebi Yasak ha scritto:
> Commit 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183") adds
> a device-tree node for the DPI display interface that feeds the external
> display pipeline, to enable HDMI support on the Pumpkin board.
> 
> However, the external display is not fully described on Chrome devices,
> blocked by further work on DP / USB-C muxing graph bindings. This
> incomplete description currently breaks internal display at least on the
> Cozmo board. The same issue was found and fixed on MT8186 devices with
> commit 3079fb09ddac ("arm64: dts: mediatek: mt8186-corsola: Disable DPI
> display interface"), but the MT8183 change wasn't merged until then.
> 
> Disable the external display interface for the Kukui device family until
> the necessary work is done, like in the MT8186 Corsola case.
> 
> Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> Link: https://lore.kernel.org/linux-mediatek/20240821042836.2631815-1-wenst@chromium.org/
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



