Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D41C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 20:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDqLxSxQeh8b6S56qSaP+lxKwU7V25rhv7UQIH3z1Hw=; b=W6+9wjv28amFWliCnZWR5QCblH
	UBto8k3YjhxyLAtG88vQi3rEu8rUKSCCiLt3U5V2vHYCSTSf4NE80r79zBQFa6KGZQvv5JkYfVJb0
	zilPeWQGTSa5HkRoZBTo9cBmdVLu7ovLQ2n81h13p/rhtD5cSbxM1mKnKR3O1Ceqx9A5YV5pnNG0Y
	CMqi4SBetl5lUqo6ldlerRuWfnzJLibHphhJJR1vpSvfAZFgqA+3LoPoh4vFCQscii7fZdFUnZEPw
	i2Xcip/0QDp2/iyrhiafJXyDZZIgM6RYipz7eT3YKyf/nZD6EIXJkbj8UeyA9Vyhr4rlHrkhyS0vz
	bU2Fi+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgtY-001dj4-87; Thu, 03 Nov 2022 20:33:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgtM-001dhW-UT; Thu, 03 Nov 2022 20:32:50 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9F0FD660295F;
	Thu,  3 Nov 2022 20:32:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667507565;
	bh=s7VMS6sqPzrxI8wodWazep6RmdDGQpqaH/k/O9pHKSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyWTvoWWaPdngbDHe6Uw6YzacdFUVXdkGMEna87bwd7WXTwo7FBZlufZIkMHJJLEy
	 GHf4bVNU4VLMlQxhB+3hMwsKv/szkmIh8atjChM7QikeF3pQtpDvUT1TUh1ix3GyTA
	 Gt7Z0cqtZBPgBqcAf9onCOHOEoFlN6S4b/fC75qKhqu9oavCf0T3HMfqEkRisS1odX
	 WsAA1nTCMG5qF0aWuNAnC0fDyeCP9H0TaOEFwOJLFFqxyMdPg5pdbDPEeoavSrKRAQ
	 y1KhleAdaAeC1pxVT7LIbZ9gfHjNfp0eOXLf10t8XwpJhV6d28jeOFloLW1rRwnUKJ
	 RBu8+uxv8tkHA==
Date: Thu, 3 Nov 2022 16:32:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v27 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Message-ID: <20221103203238.fryjwpgjtwccnjwu@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-6-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-6-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_133249_270382_B548E71A 
X-CRM114-Status: UNSURE (   8.35  )
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

On Thu, Nov 03, 2022 at 11:25:06AM +0800, Nancy.Lin wrote:
[..]
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
[..]
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;

You should mask the value before writing to prevent bad values from overwriting
bits outside the mask.

	tmp = (tmp & ~mask) | (val & mask);

With that,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

