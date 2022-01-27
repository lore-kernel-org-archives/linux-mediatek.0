Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A404C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/RD/m2SACIP5Df4jd/ItXEw4aAzdqE3dxmd/+n5xuo=; b=oJdw40ucVW5lLka55KuwXK4zoz
	KiqgLEtdTBV1iZusqZtzYCY14wAZpk1Bx7snqRIcQWcmubmrTQMSr6BN0EYm9a/P+RD9XrqfMzzmd
	shoF0/XK3/r43YH7zGL+6cvo5tG84B/LOusEU4rMhT/zfBzlY1nvldbWLhPDlobnEmxKCh9L/bp6b
	8DC0KgAVZG+5pKps++k8wtAhTq3+jNX353m/WoBoDd29y/RCBZqTp+u+dLn2b1xw2U/9rQz4OK5Kk
	1og7ykJ8+9OeISfqvnkUrCGrV19Y2i8GfPhp8SrVd/lnizqcVA9PtZBAAt/q4konGkn2/ZFgUiVNc
	uqGpWLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD20E-00F9PI-R6; Thu, 27 Jan 2022 10:27:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD1zz-00F9MO-Jb; Thu, 27 Jan 2022 10:27:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AB1741F44FF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643279245;
 bh=1pHBK+qOfKgSkn2nYNSNhU9hK3UyhbI/pSuMBl+2Jgc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GXCEFQEttXLRZlKiLfPCGvgiQJeFii+EA73219Rq3p71mQ6V/BRSl+97zM/J4i/QI
 XkcJHZjt8qS7+lqQqXW9J5RBzeC+WMNY3VhMnw8fMaR9P0oLW1g465nC/Q+VdoRzz3
 EZzhACVcHHFhjM0k9f6PoGuVwL6PCPN28zVr2YIP+honKpGkiChr/MniAb5UdInETg
 WUBdk0riz991ynPs8vqX8PH3sxHWP6S2D8IQh6UfWJFdlheGHJFzeFYTiu+t5boE60
 JhJSJxyB0AcKBOwCiJMKnKjBf9CW3VvGHis36oAXWD//RYWTXHIG+VsW4bVfbW3NlM
 /a5awB9ZcNv0A==
Subject: Re: [PATCH v15 10/12] drm/mediatek: add DSC support for mediatek-drm
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b5e3d5a9-9997-fce5-9201-bccba1af6c7a@collabora.com>
Date: Thu, 27 Jan 2022 11:27:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220126071932.32615-11-jason-jh.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_022727_814559_65C9D7DF 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/01/22 08:19, jason-jh.lin ha scritto:
> DSC is designed for real-time systems with real-time compression,
> transmission, decompression and display.
> The DSC standard is a specification of the algorithms used for
> compressing and decompressing image display streams, including
> the specification of the syntax and semantics of the compressed
> video bit stream.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
