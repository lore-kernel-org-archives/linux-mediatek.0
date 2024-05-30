Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24345C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zczsW4dpoxWj3SrlUu1zfKSBf6kHrGDOsm5nh8xb+o=; b=fkKBzh8U4ia40xYSK+qvWjQfLc
	ylIGl70ezJfAQeGE9KjAIohqy/BCOzsByxFyKlN1C0lcZf7exPD8B96CCL3FPx+SSUneqKfZZK+8F
	CLY6sxQX1Bwk4rlm1p39QWNppQVsJ/NQVOLNfszl1kckxRWNnRhXJM/27KylnRxdT2JNtUIH5QuVw
	OqM1XmGbTobUHdxD2m4wQg3JRn2V9bHtRtx3qUloeJiX8iQs5p4ulBqfNhsTL0XdBSVs1jm6Ge5A1
	VwqHeiyBbrKEe2tuOeKr1TiI7/LfbaNr3invdervpNTqLECVb0h4TP9PbtxtcKDwCXwnsAbhAJabi
	4kwPoL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcdM-00000006vHy-39jB;
	Thu, 30 May 2024 10:03:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcdI-00000006vG5-3PrF;
	Thu, 30 May 2024 10:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717063419;
	bh=bwJjFeyzBTMV6+dpXNKXktvgWL+phVmXZH4aj9xRd3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=en3bq4pTZ9qiSymwfShbESCLgG/446i3zs7x8XSG7XPwH0YJAVT/b+AQbZ/VdJBb4
	 NVT08gO+VHH6JCHBHnCMYwtoct5QLYmDw7/1iO4mABP8OE6q62m4G7moA2TOKy33CL
	 49Nphd7a6pGYyPLdIKfqWMd0NLLZ49l8hb6mRFqETEUK+Jq3yPtl0uG0Go8p1k4Ztm
	 rL57F6x/IzOLXxZsDqbYKz0ZBHnSFW0/m33GQa5Fmu90d92FwjKff1n2rAbOacDqPe
	 i2CM3BkqxM1+87oLnaQ0+shS1UG2ifg3YWBwX6zPTIWNGYKXa9xBRxuqFoYx4VfX5u
	 vYA9p/iuwZRsg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF91137821A7;
	Thu, 30 May 2024 10:03:37 +0000 (UTC)
Message-ID: <f833747f-71de-4537-861a-8758fa350846@collabora.com>
Date: Thu, 30 May 2024 12:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
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
 <20240530083513.4135052-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240530083513.4135052-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_030341_132047_4971EF36 
X-CRM114-Status: GOOD (  10.09  )
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
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> of the Series6XT GPUs, another sub-family of the Rogue family.
> 
> This was part of the very first few versions of the PowerVR submission,
> but was later dropped. The compatible string has been updated to follow
> the new naming scheme adopted for the AXE series.
> 
> In a previous iteration of the PowerVR binding submission [1], the
> number of clocks required for the 6XT family was mentioned to be
> always 3. This is also reflected here.
> 
> [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



