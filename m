Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145ECC44514
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lxc4smYQ3yP6Fc8P815CCY/s/RuhTXwEKwVYPnAr0bc=; b=vSKwc0O0kEzK2GfMdjph76W7ms
	y7i/rsGa08jUJ6JhpE4r0w7T8Gd2DA9W6CRT5yajVk5ooB/cOaTtSoFTPNSmY3sM15QqTsLdIsYU9
	NmUviMMu4a8IEGa+kDKufjRQT3mgP4tZqVRiBEoCCu2eHBDBsvsTy+0t6f84DiYWNAHqtS6zXL53R
	6Eb55MM4ndPc7eoxQ8LgG2G6oCTf/qnaRMy0dAPiZhTA1PkGpbxigR2pCxJpC+PrwG+E+DUq+jVTr
	F+B7Fm2s1TSSIT/fqt39Fw4LYlIYk0EosxnH9ilJ3WsDBVjHLeIienVJo9JzVF0Kd62oGmTOtAp+v
	1q7ltthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegD-00000001o8u-3Z40;
	Fri, 17 Jul 2026 09:16:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegC-00000001o8A-23Yg;
	Fri, 17 Jul 2026 09:16:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB5E660204;
	Fri, 17 Jul 2026 09:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A4B1F00A3A;
	Fri, 17 Jul 2026 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279783;
	bh=Lxc4smYQ3yP6Fc8P815CCY/s/RuhTXwEKwVYPnAr0bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRtaN053SigZymTfwMifByaVtj/ZW7uOX6Gc6gCUBr/fqYWJ7yRSRkaAehOyyXkb3
	 HfN9l8brnTD5zzWL3VlG8Lr+wh/HZIsbk1qeTKKnLL5/ooCstop+shFyATnq/pks7G
	 Nd7wvnbMk0piXNXNFJWZfWi9snM9bYEJZ9AJ7UuimoHhEmV/z3RjNZ2xHJTe/wlqjN
	 AK01pApq28KBu+Cg81DF3MdlS/4C0DI63+X+BHAVkgmGIhiM16yB3qrsmOHUPSv8V8
	 hsADYDEkuiNWApmW4Td2Vbah3Bn2w0QBJhKYPeElbWa0UUaYFK0oiC8hLMnMxFl8I4
	 mFTOv+PBguikw==
Date: Fri, 17 Jul 2026 11:16:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: watchdog: mediatek,mtk-wdt: add
 compatibles for all SoCs
Message-ID: <20260717-miraculous-bull-of-prowess-be08b9@quoll>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
 <20260716161923.266315-3-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716161923.266315-3-akkun11.open@gmail.com>
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

On Fri, Jul 17, 2026 at 01:19:18AM +0900, Akari Tsuyukusa wrote:
> The driver recognizes each SoC-specific compatible, update the binding
> to list them in the top-level enum alongside the existing ones. Keep
> the fallback items definition so that old DTS continue to validate.
> 
> Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
> mt7629, mt8173, mt8189, mt8365, mt8516.

I do not understand what and why you are doing. Just because driver
recognizes some compatible is not a reason to move compatibles around.

This completely lacks explanation (in terms of DTS, see writing
bindings).

Best regards,
Krzysztof


