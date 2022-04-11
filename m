Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D86C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNYFiqTctD9uQRHi4bsuaiiS1SgqSTX5jx48PSdXYs4=; b=wShnnakbN8ySZf
	wuLAwjCz+IXC4JeFW9JP0qFwwrKoKtl3MSt/VvDax+theHj49mT1f0RyHxpiPqe8JqEL6MxniG78L
	Oyup4Hl37JBbUUiqs4HuCniGPDXp8+yOR+ixhBXkvQXnq3KddeSCUSxVgMtwo4J71NzUyR0T4WEQ9
	UQuN1Jczcyt9xu07KMlOO/X2OVXiRjHsbfxva43ahTN7MQXR9xYlvYpiRX8lvZu6XiARK53XBctTx
	Niybhw5Ztr3k0MmpG79OG5ymXOB8Mp0v4YLLIzprpiyOXMTDkvNVTb47kFDkjomA9cLxmkvF3RllP
	OtrZfg3K9G+Z9tumuRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndq40-007mqU-FM; Mon, 11 Apr 2022 09:10:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq1J-007lUp-BT; Mon, 11 Apr 2022 09:07:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6AB831F43463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649668056;
 bh=ZiY1smplfC8Q/27VCH66ZDkjUfbqOxGVogTWZECGfIM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5pDyBHW7uzDcMd299MPjxd0ZepU4WVJX6o8/EW2tAPqu6wgHvf+Dr64HsObiTitt
 300hqHzv7AehGss5J8ERbQAQiTLw3Y786e97s2rswwr+foIEw1q0m0n87JQJMi9ANY
 vg1d4eLj3k3lRSy5R5CfwzuE6G2GlCab0dsmhLN6YTDtZEo6Khk9XA0bNoxtzqr6Pi
 W5O9j5rQG3rVqui1eGZhSQ08a1s5Z4fdr6t4Xctcy32hFoeCa7KhuMCJdwTeCPXtTY
 uzohXaYwjvke9VbwyftEkH0zO14Uu8DhMLgqs9Sa8tONHiUWbt1IMJ6kbSBLxnrnRd
 BxsDRcJow0B3g==
Message-ID: <914baf06-0fe9-0802-26a5-71e5a0715ce3@collabora.com>
Date: Mon, 11 Apr 2022 11:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020737_586087_CCC37B1E 
X-CRM114-Status: UNSURE (   6.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/04/22 04:31, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> In order to match the changes of "Use the drm_panel_bridge API",
> the poweron/poweroff of dsi is extracted from enable/disable and
> defined as new funcs (pre_enable/post_disable).
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
