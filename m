Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83055C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0A8CYYFJEki/nAeA7v7f19bEeGW+RLIIRh4La/MjB7U=; b=Z+etuEa+ltRKEMniSdtmR+5SeI
	ft3KdmrTeYSz59H5OBoBc6osM5We/qrsS/Y8pX+I/S3atqfCGudbzkfMmE57jp2yUokpwrWJ59Rty
	asnXaE5kpQWddQ3DnXD958QKsFsWLgfm9xbZ1w9RgZDAzuavdmK6CGR6DR1RILcSmb1uOFGd70j6x
	f6ifbyeGPAuMEjQ+pGKRYiz1TuV1ivRiWmIoqGIGJP/mGrExJMP6aywvgVrxvF546kqnqX4cJQTYY
	ONii6uXBLCGtpCbmU4DoT7WLnCjKnWOXxpPM9hRRXUkzoUBkVLm/iJ/O346zWqfDZ8sr+Syf37Tg5
	Yr5fP3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMro-0086NL-Ar; Wed, 01 Dec 2021 10:29:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMrb-0086K7-88; Wed, 01 Dec 2021 10:29:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B78CB1F454F0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638354561; bh=WV0G9yZFIKe2fqvqgmNdk7lxP5b9KSdc9XCdw4wHdIc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VMZewMlXa2qjyTF8y1kRqn8Vc2mMM0PF/uFVPSUzQOGCcuRs0AJLn4jpJenBr+2Zw
 wOho7QGFLAe5GZt72/QiONfPlo4sXV3wHl1FIEVwtpQr4soS2cjW3kvYwNdVPnu/8s
 0JqnvqSoz6JYGKTYIxjUTDiVayte14sXC8RKkaC7qLL1hNLouBTmeNt440GxS5xXku
 ON22jWW3t/eg28700/8L/gWQoQPaQYUi1heIRX4W2Zdbz9jLLXsbWxS2tETsRR4alh
 jdhaMpZsuRNL5saLvWY78dXVkGVs622/hdPwpi5fZj/xYzmTOBFVA70CyViIAlh/+Z
 HP16yHwBuhvAg==
Subject: Re: [PATCH v9 2/7] soc: mediatek: mmsys: add support for ISP control
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com
References: <20211201095031.31606-1-moudy.ho@mediatek.com>
 <20211201095031.31606-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8aab6aec-054d-a0fc-dc26-b272ef8472bc@collabora.com>
Date: Wed, 1 Dec 2021 11:29:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211201095031.31606-3-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_022923_456246_CA54EFDF 
X-CRM114-Status: GOOD (  11.37  )
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

Il 01/12/21 10:50, Moudy Ho ha scritto:
> This patch adds 8183 ISP settings in MMSYS domain and interface.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8183-mmsys.h    |  26 ++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 117 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.h       |   1 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  30 +++++++
>   4 files changed, 174 insertions(+)
> 

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
