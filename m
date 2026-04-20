Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EAAF588DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8Wx/zazy2TuqrZqssF9+KIqUTsThKbaXcAXi0uwpGg=; b=IO4dfWttEdvdfdXcLPR2bkf+ab
	k0qEFcUgZZbr0kcCNAphdDm/4PgFK2JmeK4tBm/g8gxsE7YWQ1Oe1TCVEkoG3V9fgVEKNS1Ijy/pQ
	NN54egv/veQMpuX6TNnDY3B+SBZTPBwlesG8Dv4XnuflC4ilRJe4K00Lm9Zy6/8WPM9RplYwFXEyT
	o1GeVYIzMv8nXZQCD0SMHDIGyQ7lIgd8WK6IRaA2GiOWBz8Xti1XQLnATX0UDOHZ+rySQ+OVHz4FS
	zAJ+IsWV8ha7frO+5QzIyR4AkaHWf4DqJhzIFiaNj6eGr9qxehDJt2NzUtipu1FazIbg7656Ahpn3
	WoPfwccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpvf-00000007C5u-2s0z;
	Mon, 20 Apr 2026 14:48:51 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpvc-00000007C4z-3KK9;
	Mon, 20 Apr 2026 14:48:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEpvU-000000000GN-0rQq;
	Mon, 20 Apr 2026 14:48:40 +0000
Date: Mon, 20 Apr 2026 15:48:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <aeY8xF82FB7Plu7W@makrotopia.org>
References: <585fc832e4e5d3656bd25ecee6bafb636993104a.1776600269.git.daniel@makrotopia.org>
 <20260420-flat-rook-of-hail-bbede5@quoll>
 <aeY3HuP01VYl5x6X@makrotopia.org>
 <e747a3c5-1c43-412b-8ff6-f447ee33995c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e747a3c5-1c43-412b-8ff6-f447ee33995c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_074848_828537_1225F113 
X-CRM114-Status: GOOD (  17.69  )
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

On Mon, Apr 20, 2026 at 04:43:00PM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 16:24, Daniel Golle wrote:
> > On Mon, Apr 20, 2026 at 04:07:33PM +0200, Krzysztof Kozlowski wrote:
> >> On Sun, Apr 19, 2026 at 01:05:01PM +0100, Daniel Golle wrote:
> >>> +    rng {
> >>> +            compatible = "mediatek,mt7981-rng";
> >>
> >> I asked at v1. Reminded at v2. Nothing serious, but repeating myself is
> >> pointless and kind of waste of time.
> > 
> > Replying *once* telling what you would actually want, or replying to
> > me asking back would have helped enormously:
> > https://patchwork.kernel.org/comment/26880354/
> > 
> > All I can see is that you concluded "no improvements" without telling
> > *what it is you would like to see improved*.
> > 
> 
> Yes, and then you should go to v1 and read the review. There was only
> single comment in this spot, so trivial to find.
> 
> AGAIN:
> 
> Use four spaces for indentation.

Thank you, that IS helpful.

I've read the "no improvements" statement as an overall conclusion and
not even considered it to be specific to any *place* without further
context.

Is that the only remaining problem you see in the binding right now?

