Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FEDC2BB85
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 21:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxKqRh4GT2FHMzCqU2YzlI48rPuABD88DD99K0EHv6g=; b=hV8D4en/pBOTOMFA+HpLbv6kxD
	puBshnm4BA9Vu8aVeXFL3uyYtb3hV7NvSvWCo/uB79sbv0cO5r1J3obYfwUclZEF58u7GYqrbAXzd
	mxkrztRV3jMtVhtWeYHlPTH33WVoInmEjmNcJXIXnTr7sLL7B1nBkSEhrctEiRWNw9/XRfcfC2F32
	k5NKmBDpPWmIwgcguBmzypkmCzU2b3gnB6MsZOQTaumeKq7RE2eU7D9ypOVPcaJTRbyfu2+Rfnmdr
	O0JpvQECoQvLfsZf10/C5rkGBzZwVW3K6iQo26WzwzAI4rXyTlTw6ciJLT5Z/twmckzG+KOmWkI46
	8PuyZJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJJgx-0000000CeUh-2bGj;
	Mon, 17 Jun 2024 21:15:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJJgr-0000000CeRm-2O5e;
	Mon, 17 Jun 2024 21:15:02 +0000
Received: from i5e8616c2.versanet.de ([94.134.22.194] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sJJgj-0004LG-FU; Mon, 17 Jun 2024 23:14:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: Fix the value of `dlg,jack-det-rate` mismatch
Date: Mon, 17 Jun 2024 23:14:51 +0200
Message-Id: <171865888527.3904644.1008571862368310887.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
References: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_141501_655674_347F4118 
X-CRM114-Status: UNSURE (   9.17  )
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

On Thu, 13 Jun 2024 11:58:53 +0000, Hsin-Te Yuan wrote:
> According to Documentation/devicetree/bindings/sound/dialog,da7219.yaml,
> the value of `dlg,jack-det-rate` property should be like "32_64" instead
> of "32ms_64ms".
> 
> 

Applied, thanks!

[2/2] arm64: dts: rockchip: rk3399-gru: Fix the value of `dlg,jack-det-rate` mismatch
      commit: a500c0b4b589ae6fb79140c9d96bd5cd31393d41

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

