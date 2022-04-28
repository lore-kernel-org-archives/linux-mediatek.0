Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55855C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1R1hJ/TBFZL44MTtp2V1u4R9Z6LWgD/eD0iWQrEEHL4=; b=Sc2SI3aa4jizPY
	AzOsWhRGJ1e2Fkctw+cqiqe9aR3SX5vTrA3NplePDrU5MexPjLDbbzYJFeiVLgTFnaSTbRjR8uo9J
	W8zRVx9kFtpPblRfZ49YzaDOIr4pTOabB27irybZOd6cNkiJ3tFHdiIRYn+5NIv00nxA+KsbBG9zv
	/bPigRFkIYyNfPuZB4B+KYMPxX8LDclt1n9H3AAj7+5Vmsz7KvcDKdTcMMnepIY0+q0Cs7yFe6VH1
	lw4WIugBJWAAIyfqGdjf4FW0jsa7HcWhV888r4WvKQgM6s7LsIvwYE3fYSAyJaS8iDIae0mOSf672
	qdeY/FjJmzKl5scKc6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4El-00746x-1u; Thu, 28 Apr 2022 13:31:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk43h-006yiG-A4; Thu, 28 Apr 2022 13:19:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A8C9A1F4536D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651151987;
 bh=Y6r9EqSsbh3Dq7eavxiGIUP0pwnIFPvRrJcfm6QBnE8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HEe0sCPkAkBWKZhzzUzZdry5WIJSxY16gc5VTbcu1Iyil/jW5t1lblH6ZqHf2Lt8C
 tiuM8VRrJwFmYeZkQN2rfaI6SPqlYGF6+1F2S2pOkpVBM8ovivkkJNQco9jS8F3BM5
 3YxtmrigFaC8xRHW1vhw9UdHMzkzmj7oiUTSvUD5ov/B/RhGRkOnZRIN4qOogvE6S2
 Cxun4IVDrPxULNPup5cydHWqsrr61aCcOX208KEOdAfFsGonglKjlezDsgnTQpXH7i
 sdlrxLr7Lw8QEkT/MmxCyRu6PrYFUEYJY5ou/byucvEqeX5chpKT/5PtuQF+m5UJdj
 KTe6P5o2Fpz3Q==
Message-ID: <88ddf1ba-9395-cd40-53f5-25d1d2f9ef9e@collabora.com>
Date: Thu, 28 Apr 2022 15:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4, 1/1] drm/mediatek: add lut diff flag for new gamma
 hardware support
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jassi Brar <jassisinghbrar@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>
References: <20220428085829.15855-1-yongqiang.niu@mediatek.com>
 <20220428085829.15855-2-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428085829.15855-2-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_061949_545586_8FF3C21F 
X-CRM114-Status: GOOD (  10.26  )
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

Il 28/04/22 10:58, Yongqiang Niu ha scritto:
> From: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>
> 
> mt8183 gamma module usage is different with before soc,
> gamma odd(index start from 0) lut value set to hardware
> register should be
> the difference of current lut value with last lut value.
> 
> for example, chrome os user space set lut
> like this(only r chanel for example):
> 2 4 6 8 10 12.
> 1) mt8183 gamma driver should set the gamma lut to hardware
> register like this:
> 2 [2] 6 [2] 10 [2]
> the value with [] is the difference value
> 2)gamma hardware process display data with original lut
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
