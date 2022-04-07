Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C22DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmlHVe/e0pKEbysemYmBBSLwixrSX2DxbyOtqVD3g6A=; b=CxIxb7YvLwfONJt2J5rjREPCVl
	nmBkphwzpJe2r+r0W7+3jrI+Cu5HRb8HgFwwyymm5orVEyWPx75KVd5c6trByQ/gNqI/IhI4Jwupj
	xr1+qb//LPCOsugWieJJNIrLmwiBOwTRofpY5aMOR0wlp504z9e+Pn7MF1qqDsvT7a/qceGxgkbfW
	n2QlKCl2nZjIYFGFukE0iyOY06jr2o/3vRK05dpcZIBK0+X6/wGjg8rTWMDsCZNkogFGkBIGuIsJv
	p4YdajMHKoxpVLiQPleIXlpwCozXoJkKD0cOyvSUg0ZtMaJ7K2mDrYf+s0w0tf4T2m1IW7Eo/kOa9
	Y2LmeFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncNxn-00AdHM-Ha; Thu, 07 Apr 2022 08:57:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNXk-00AQSz-FD; Thu, 07 Apr 2022 08:31:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 033AA1F4557A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649320257;
 bh=6e8HenrGm7ueDzpKsobNNpLOHDIySrUgYBvMNTWkXV8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ai2pKUULO/Q4bNNaYxGOfgX9yE0r4mBHrfh9sOznK3UT3kXoxwYq35TL5YUwWUqZg
 qzLiEAbruH8URXZvTvEK1Mt3fdMt9+BFQ2klTx0/MMe2S6avCtRMUHsVRVmi8EFzVj
 sV0extkjPfZNaCOGIoHF3wrqr4qQVIDy1GkE8X2pcD3yO4w7QIDp5ndi6SGPjio/uT
 jVCUwMCWj+bwOVMXdTXasjgyrsOxlftY41FLngMAvVZ96tXJOpYji8ugZ/5k8MF3Cs
 8uCdIGjgKhuqaB4+TDb5c5d0nzFTgixeCibhSSwQIkUr/WJKyKkdUBLqa0wQqjgc4G
 ixlLMGjssk+Fw==
Message-ID: <5337d925-b904-6f05-8fc9-2ff5f429c447@collabora.com>
Date: Thu, 7 Apr 2022 10:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND v17 2/7] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220407030409.9664-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_013104_765397_090C14A1 
X-CRM114-Status: UNSURE (   8.48  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, hsinyi@chromium.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, postmaster@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, roy-cw.yeh@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>,
 John 'Warthog9' Hawley <warthog9@eaglescrag.net>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/04/22 05:04, jason-jh.lin ha scritto:
> In the SoC before, such as mt8173, it has 2 pipelines binding to one
> mmsys with the same clock driver and the same power domain.
> 
> In mt8195, there are 4 pipelines binding to 4 different mmsys, such as
> vdosys0, vdosys1, vppsys0 and vppsys1.
> Each mmsys uses different clock drivers and different power domain.
> 
> Since each mmsys has its own clock, they could be identified
> by the different name of their clock.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
