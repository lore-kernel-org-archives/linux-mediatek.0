Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93BFC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ky7BpRUFNSyLFVzPEKglKW+EkrtEr1rmDDAjwiIX2s=; b=HAEZTnAuojzjD6skM1HEdo7QSg
	+2zq95bTic6j49Ng9jCWGbsKy41Ihvv4GFF3qdh9hyatraHPH0d+zrUoV613Sd8yXpqSftqRl6HzG
	0WfYQEV7N7ihXMWjLeiHybP5Neo3BfWFad7rrtoqM1Bfy2DkHp3xySX+DTk9dz6cvlZXBoDgMaj6A
	gJPzLm2z9rZ2Cy3A9JUAUSteMyDJjsavWeMMsrwSPPgjm2SwSR9eJx8QbcdbbHwIPTWWowU6OQ7L9
	SpoiAZVO9czxDrsWoQPcmCZ0WLCTYYvfl1vCh2e9iJQZnS47M7oK/LF3oWRF+KWCm4D/4ZaYdAscR
	qF44lBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYq3Z-0000000FvaU-1cmD;
	Tue, 30 Jul 2024 16:50:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYq36-0000000FvUx-1kl2;
	Tue, 30 Jul 2024 16:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 54A7FCE1141;
	Tue, 30 Jul 2024 16:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6B2C4AF0F;
	Tue, 30 Jul 2024 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722358204;
	bh=r3X8C/3sWlCsyEECb963nRYST3e36OQCZGpGejhXErU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ko3XZPEdtdl2sPr6s46xPFbd66QXg+miej6Cbb1GsG7uIIPEsup07vHsotmwHVoOB
	 essYkhUabKD4F8O7z3jtNn/S0QHbBE4PPv5/AzRZjgjJC5O1U3Ppa56X4N+Butlnkt
	 0K1Zws/MmxgMirLHC6tUgdXbniQGKXvNGZcZ7dcBsBBJ1RD/0aaE8VdfgjkMaGqNAL
	 DQMtIXgDQZk+uc2klppC42Uup+oafEGnEfIK0UyATrQVagWUjbMn7BV1HjBwj8Zh3y
	 SBTAHM7c74Cij2tOr/CemKxTtcm9dy274vhurvWGkgVqy7J9z/0ievfXL3qZ4JqTNn
	 RGx1+0o3z71vA==
Date: Tue, 30 Jul 2024 10:50:02 -0600
From: Rob Herring <robh@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ychuang3@nuvoton.com, schung@nuvoton.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 02/27] dt-bindings: mfd: syscon: add microchip's
 sam9x7 sfr
Message-ID: <20240730165002.GA1508552-robh@kernel.org>
References: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
 <20240729070603.1990265-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729070603.1990265-1-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_095008_667739_13B7194C 
X-CRM114-Status: GOOD (  12.43  )
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

On Mon, Jul 29, 2024 at 12:36:03PM +0530, Varshini Rajendran wrote:
> Add compatible for sam9x7 SoC's SFR.

That's (kind of) obvious from the diff. How is the block on the new SoC 
the same or different from the prior chip? It's kind of strange that one 
of these blocks which tend to be register bit soup of left over controls 
would be the same or a superset of another SoC.

> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
> Changes in v6:
> 
>  - New patch in v6 as the syscon devices are moved to a new file
>    upstream.
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       | 188 +++++++++---------
>  1 file changed, 97 insertions(+), 91 deletions(-)

Put this in your own schema file. I don't think we want get into more 
complicated cases here.

Rob

