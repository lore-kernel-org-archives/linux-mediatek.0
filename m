Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYjyBSt5sXbp9pxocGVVn2gsA3la+OGti8BEmFxT9AQ=; b=PU8RwTEvvgYSuQdi5P1sQ9c8Nr
	0EHB/uIOt6ZZXgRBG+VxAN74WttcPDw8G0HCcNuNOQ8NcjfzuqZB3aTW1a9Ur+qaFri4GLNMUHPDQ
	zllh0lO2N+6BqfFzltRknRuQzvQWpCZ9b+DHJwqkPZ5BzvcP0rtnt2lEO9LtyJc7bmJNfgcepV+Om
	ShGcbUPcZ9IF/o4hCSgeDDfqMlgF6PlewF+pRtIMMkZ+8GvYIhaicEV0TBrJY8jr2sHNecQC7+6Ok
	dPFCfyDbiEJ07EnKC8TcWaEN4Qe+b5xf41FQPAh2qlTHNc3IGtsE4etZYGUTCD/XVR9i2E8YyQ/FG
	Eo/QwYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2uX-00FQcC-By; Thu, 27 Jan 2022 11:25:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2tn-00FQJL-HQ; Thu, 27 Jan 2022 11:25:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AEB611F450C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643282705;
 bh=tb/UqL1WfiQAsAVHo/IniIBGl5T6FOXpUra+9byZHPc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dft+9zu4GosFe6lxR39lR/MXp7jg3zPW2DtXn/dflw38u9vvZM78dQ5jY/0A017oD
 RFlQ6Z7xd/ozv/Z3skQN1bh2hlysrSmcb3/msYFmCeOEiCPHVxTB4zLUNx2QRzULhI
 AhMoRQg1muZEhghItNzPsFD/q6UnAiwLQbL+Fa/ldy5D+CukNzsMzJaFNIFkFiIGpA
 3ue0MYIHoRdRnvf8heLxYDBw3jTLQ2DwJUANSEe4ZJ3XCFcAq22UiA2/E8B04nKG+y
 0vQIWR9DZP+Sid58n5T4ROvgxpDuZS/oWmuRskX/YeIWPMZ+cDrODepj59j+Uz0A8y
 xg1rgB2f5TO+A==
Subject: Re: [PATCH v4 35/35] iommu/mediatek: mt8195: Enable multi banks for
 infra iommu
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-36-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <35ddad90-a13b-0370-a218-87887f47c0da@collabora.com>
Date: Thu, 27 Jan 2022 12:25:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-36-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_032507_809481_8DBE54B9 
X-CRM114-Status: UNSURE (   9.94  )
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

Il 25/01/22 09:56, Yong Wu ha scritto:
> Enable the multi-bank functions for infra-iommu. We put PCIE in bank0
> and USB in the last bank(bank4). and we don't use the other banks
> currently, disable them.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
