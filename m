Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AE1C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 10:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=299W2efm5XlUEJtXETdmkKyyL/oQvqxJQ8nDkxAo6JY=; b=gWn6ED7cIFk8hCT+zB2h/CYa4k
	RRd9LYpnjwh5T+sfEDSKgEOs48SOrKpZjpU3yoJPHj+Sij/RX2yrqbip/jMJIPDfbZySjP1KB3S/H
	tjiPhRs+eYStPZwSH7nOUO7mTkaS3E8L1DIFST9mvdP0T6XYz9bMzW+cxFQogpjioSYXC1Mzm2r8I
	GRtxp3v9f8vyn05edCH1u+2A3rsoMhv8koGMBe4VSKyvoWzdK1DIvxbvZCg0BXfDbu81uJW/gbiuD
	yk9vItiiTkfaGsGLzlmTXGvFkDYd7qa4TzGtzHk4BfxWC6kepMcrSeRWTyjoKBCcDN1RuSItMe5qn
	bnROT0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGrS-003F8B-QP; Tue, 24 Jan 2023 10:49:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGrE-003Ezk-GM; Tue, 24 Jan 2023 10:48:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D27D6602E2A;
	Tue, 24 Jan 2023 10:48:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674557326;
	bh=PWy/mEzY0rNRWO0R+jYtZffvemYuPS5FyuIJAM/aPmE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gBInqdT/EkDYIbquG+ZogkCItyYpL29Igf2pyntw/Nm9EUxi2vafnqP4x4eW0Mftg
	 5uOV4Didt65zhd5IVGhGIGSXGAHDd23uIn84Z3NYB+QOG09c3RdnR7dGrCnAKTkrGO
	 K65XlclnCWoxZnBLW+eHn7YMqbp4Tw03DYW4KKpCx4j1ZLAC4FBtS8q3RCjNGWS4Xb
	 wHrQ1tOgMADlaCVhIM6YD1Y9tkeikvhlL3SxK1CTUKJrK9JEOOiV3mvQT6SpOes7hJ
	 ybgR5a2TykPoTNhjkx3b3vT8VMNRp+dP9W7jDs/p9/ztJ/8PhxEuwwV9P2Rjf4uqaW
	 z3H9dnsDXqf1g==
Message-ID: <c0c8fdad-a576-7ac5-f6c3-465a1b9392e6@collabora.com>
Date: Tue, 24 Jan 2023 11:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 8/9] dt-bindings: serial: mediatek,uart: add MT8365 SoC
 bindings
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
 chunfeng.yun@mediatek.com, allen-kh.cheng@mediatek.com,
 nfraprado@collabora.com, andrew@lunn.ch, gtk3@inbox.ru,
 sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230123163833.1007181-1-bero@baylibre.com>
 <20230123163833.1007181-9-bero@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230123163833.1007181-9-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_024852_892614_69DA1F91 
X-CRM114-Status: UNSURE (   5.91  )
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

Il 23/01/23 17:38, Bernhard Rosenkränzer ha scritto:
> Add binding description for mediatek,mt8365-uart
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



