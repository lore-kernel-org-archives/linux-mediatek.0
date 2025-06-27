Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE225C77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 20:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjqI/TL1jjUy9OEupRkPIs2W1FI7rT/bc36wQWBg5Jw=; b=hF1nrMx3oHNVclSw61HYxQaYpD
	2mc/sdPHP+zS4gUKKFKzuzPMKQ4fjOd+OfKfQNTsZf1Rz0R6h7hxTiL2T/IP8giPmFCuyZehRNB6J
	l0f1/5i91bg0WfrrIRTDQ5821j4+3TuaZwmIQ0yGUptFd2zhQ2mWuhXwf/vpS4UP3uvvYogoBqjXz
	b8iuzCkyYy6/JgNV4GkfWE1NCIK3LKleWHXgnlZ3ekhFrP9Jk9A8ZMQiEsKqgdA/0vmwPRRciZ8+u
	zxPBCTSTUj0xHbr5wu44AQI9B2uxl7O2LGAII/zBNhQhDDs0aG2la481wUbBiB0qGI+F2Lkp7cNar
	oAbW8BcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFa9-0000000Fk4Q-3DUb;
	Fri, 27 Jun 2025 20:21:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFQr-0000000Fj9J-21fl;
	Fri, 27 Jun 2025 20:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC89361435;
	Fri, 27 Jun 2025 20:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C113C4CEE3;
	Fri, 27 Jun 2025 20:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055140;
	bh=s0Xged9J2HnvN6x2GXvoVG4DhENWGLcw1Wvk3UDfhk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbvaIv84Q8/hxga+QPQuAVOJo1iAVrT3k3tciBHSB01FYbsIbgXMqUtXbZrrFDe7X
	 OnKj4xc8bpec1TE1VMfxS3vlCZrcGxvj7bc4r/NIR12UEp/SiKK/CgY2CumCXTuN7V
	 8ojRypb9bxPPbTwJJTbX8Y0o79DHcv9DNRt7NoAumwz+/uSm65r2kqL93yx6KZuk2k
	 vsuNKV59kFj7IlI25mMmAv0GEed5gou1mK4SZao+NxLP+Ze3pG4lvXbCZD8EujeMN7
	 G7xBF+ar5OYrvQi6rlNIqhmgeLhNuhYmpf3qvkYTWYnf7f0L7XCyGqDRTGHUWiQKp9
	 LaEvc20NP2RCg==
Date: Fri, 27 Jun 2025 15:12:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, kernel@collabora.com, krzk+dt@kernel.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com
Subject: Re: [PATCH v1 1/2] dt-bindings: mailbox: Add MediaTek TinySYS MHU
 mailbox
Message-ID: <175105513896.4155718.5094277254740319329.robh@kernel.org>
References: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
 <20250623120127.109237-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120127.109237-2-angelogioacchino.delregno@collabora.com>
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


On Mon, 23 Jun 2025 14:01:26 +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek TinySYS MHU mailbox, used for IPC
> with the TinySYS hardware integrated in various MediaTek SoCs.
> 
> This mailbox handles a custom MHU enabling communication through
> the TinySYS SCMI protocol.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6985-tinysys-mhu-mbox.yaml     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


