Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0650D37495
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 13:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyzkCg4h1ISFWLCV403kqEnrPeNAh3+cbobaWmWl54A=; b=f5KBT+e0/uSHYA80fCNRmDhowU
	55JzyYszah/gcJIl3ioN+jXE2VUoqdwxkAECAXQQLeevseEvsE3GfrmkjpDgB17s8V5Dpd9MBixAk
	4tiauhT/va+14BFwZOOF2Z2l9Qy1qh0k674sWy4qqhCoTsBUabgrXgBSYHO3tNeN01VLmf7fpvt6w
	s6mmI4NDV5mFy+OPFc8Yuinetz55edbQVkLaLc2NESsGbpXa7d3rUYYgMD/h1qXxOhqdYrfzvpJ9i
	c+nSfuzbRPsEwWmiqMbL5rpzQDBQ47OG3GtWHBnIi3FrW1nGgnOu9R90Nm562Zu+E+VeAxh15Khlv
	l8v2OdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Qin-0000000Exyt-3azd;
	Thu, 17 Oct 2024 13:39:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Qct-0000000EwnI-1SZf;
	Thu, 17 Oct 2024 13:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729171992;
	bh=gL7HIZDcngcg38f0O2Ne7G95R5rU2tPl/BIuc0Pcbdg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HIVYA2H+2rTlNkI3CBNX0Oz6XKMOTMy4YUDdvMANFeuRAuTlgX2JEH+DYXrgR+O58
	 +3qXEhNm6SX0//tfm1UygavvpxQ8uPmGjHeqzdmrlBttaXEKygadIbg4mufbfDHIrO
	 Bhg/WYSGh8TCrIMIWPF5ya6iHiKLTh8vkD7w4QQNNUuStKZ8NL0mlXk04DRkO2i3d5
	 VJJsHj+NC1IgmWjNe2URawoY2jCy+MzpGejDlFWJjhyshU9It0Z4O+BAv04cU1dmfD
	 bDQuCR+SrcXtrHSfHyz8X/ANEQZpyB6LvRXcCEupWFD4syPZhAAdOz+eFueT0LlWrl
	 xjFHeBsL1vQIg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35DB317E3609;
	Thu, 17 Oct 2024 15:33:12 +0200 (CEST)
Message-ID: <ab80d339-8b7e-4cfa-a3fc-b9f1d295a79c@collabora.com>
Date: Thu, 17 Oct 2024 15:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org
References: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_063315_724486_400CBC01 
X-CRM114-Status: UNSURE (   7.88  )
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

Il 16/10/24 16:17, Hsin-Te Yuan ha scritto:
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.
> 
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


