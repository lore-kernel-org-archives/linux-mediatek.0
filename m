Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAE2C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 11:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s60pPB657jd4g2xRno7pYUahPQqIXcuQWW6ZiVo89Hs=; b=J6ZgHc75Ut2rC3+4zHCBo3FF2Y
	jtszmuHtNSO/2LrD679f6PGFzLMM0a7agVNFDjAJ8zocBudY+mH69wph6Sgzn3Q3TsbRuu24LY0h0
	MPAhikc9STRLMnwDa/dMzJXarSUZ6aVw0OpF/WWdc1n3x2ceqR37U6mQN9pwPe1q8+h5oVbSo0B4L
	U+0lcaAWKY+PVfJUFWIZItjQybEVPhc2I340iHms1zHtdyVV6NJ4mVGMrjQta9fpUXwW9LbRdaQA3
	0VQJJbdi998Pvx4cLT1pnMWdnxI9flL69vG6bB77UdovY8BTAFdIq9ECISMQ+uOsN3pagBIWwx00M
	zIEyf3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2A25-0024k8-68; Mon, 05 Dec 2022 11:53:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2A1u-0024PH-2U; Mon, 05 Dec 2022 11:53:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3DBF8660036C;
	Mon,  5 Dec 2022 11:52:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670241177;
	bh=S/XvQmPdf7xMwJPdBoXrFet0+92expZQ8DEbjSPs9BE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LQX47Qe0z7znEVhDoNSSdUh7pP3jMhJr8d35xJi2Xgs2Fabwnz5f9Z96mZxbEaM6T
	 hPxZ2gsDs2bFxn1rloMJ7hWJ8qwjBWHe6KPKXIaewVeLSZYBw+sPG1f8OY8joB5KcR
	 WKQQyA2K5Dn5Z+/H9SB9IGQjHRjDIvZYIkZyhgBZZeq5SKRfIoa8igNYvw/knHvpnr
	 rwN83h15Xh+tcMkIjfJ92lX2kFRpVBotJc5ngmVkBCeWGvqMyRB5oFRfJUeWoBrEfm
	 NPTE8LjIJW/fmtedA8lZce4N03YZgpcH2mzaAvPNegkM3HQu1NTkjyfjv+oab77wQJ
	 kB3cipqSoiB+A==
Message-ID: <378232f4-5c2e-ad56-c4ec-4d9f72f08755@collabora.com>
Date: Mon, 5 Dec 2022 12:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, seanpaul@chromium.org, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221205095115.2905090-1-ruanjinjie@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205095115.2905090-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_035302_366452_21393D46 
X-CRM114-Status: UNSURE (   6.76  )
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

Il 05/12/22 10:51, ruanjinjie ha scritto:
> As the devm_kcalloc may return NULL, the return value needs to be checked
> to avoid NULL poineter dereference.
> 
> Fixes: 31c5558dae05 ("drm/mediatek: Refactor plane init")
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


