Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5520C27C43
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wgCXu/07gqtrfHC/lKjrpKwTEPryRym0cm6OzfK7bc=; b=08zn51FvDfeVNyYRzMJwyHyNb6
	dTYyB7/TUiTw8y8JEUDcZfBMzhfSp3qEsfkgAIohYCj1NdVKvB5aHKhmIRvJecUiyN3gtZLv1hBrL
	cijRO2+Q/GVJEfQD5RbowIrz7S+5Gdyp8TI3X2hCDR75f3rMwEZJ41u5pV/QkrN16AkETBQla5wD5
	W2kJBgmiXj34vEEFGqHYMWRqQghgtxUw66StxZW/agVlGFxMfRPwaHsElryUtbbFjSlTAaKOxj3BB
	uswPE/4rtT9G6CBmIVpT9DmhhHoA4h1WOTdio/akj37a146FiCb82ncWMnpETQN+J6hfiXTlOHsdF
	EZRnNfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCce2-00000006vdv-2H1t;
	Thu, 30 May 2024 10:04:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcdy-00000006vbf-1NLx;
	Thu, 30 May 2024 10:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717063461;
	bh=/tsUCKxTdfstpXjOdGHJENI0qzz+YcLQaxG2NsiaXOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xO5LMmFgF4W18QQQZHzUxxPAzx9Le5WHUXf7uOQRNY1FWycw3CCK5gVI2AbLwjtwZ
	 fK9KdoCjMzoMuFB1ehhcq9yUTuGjfZ36ipsSgopspSaES+XeAjOCiihKX6bN5gK2t9
	 keJs0y5z7NEopGeVfq3ezVU0CkLJd4n8zVxmslkZFrKxDb3XAWk0wRZ7tL+tRTlay9
	 lUHp2WRGeKdoL9+q8obBZtpSek/dxpA9u4UdGIO06q4qbKT9WGbBJ3v/TNDWrP0tO9
	 SKpy0L14pqmmKjUT77B4Hc60RAPxKNqpCSurxJhvyCVlXlIRxV69zxr7DCz/gFSjQC
	 veyO4ORGp0+vg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0021237821A7;
	Thu, 30 May 2024 10:04:19 +0000 (UTC)
Message-ID: <c79ddaae-ce56-418c-ab89-3b137286c518@collabora.com>
Date: Thu, 30 May 2024 12:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8173: Add GPU device nodes
To: Chen-Yu Tsai <wenst@chromium.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240530083513.4135052-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_030422_645955_EAD91D54 
X-CRM114-Status: UNSURE (   8.28  )
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

Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
> of the Series6XT, another variation of the Rogue family of GPUs.
> 
> On top of the GPU is a glue layer that handles some clock and power
> signals.
> 
> Add device nodes for both.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



