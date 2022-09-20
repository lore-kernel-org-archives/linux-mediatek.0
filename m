Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D28C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEAzwLizI/ju3xZ0ZOntJ2K8j1yBtE8+DMBI20TAVaw=; b=RpO64Q84jdjwBqT5AhLDptJ50X
	BPBWjUITDHk3NCjZoxcAh/CEvwgQvzgaoJ/tWMdLxtnxcxBmfzZbG8RYQRRTAm6GZ9iuBHv/rT/TF
	VOvQ1Td8h/fQz0x7Vvd/ZGh0MfcnmDekf5g8v7Xl7iyzJ6f48a02DKtQ1BL8+PP5ZcxcIPsUg422O
	6Vv4AgosK09xRN81gu9gzFx4RYpkPog4+JkSUtZaveHtHSZXCTwB1O8+H6n82J2T4Kqjju3fvrBEg
	JhA/uiNo7BuL8W1rN2zF0pFGTul6eoIS9g9PX/Mm7MNGCNrJC+zQgnOuZtb9623UvQr+ZKU9GYU1K
	ak+NAt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZIM-002FIH-34; Tue, 20 Sep 2022 09:11:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZHV-002ElP-Iy; Tue, 20 Sep 2022 09:11:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E07AB82677;
	Tue, 20 Sep 2022 09:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93CBC43141;
	Tue, 20 Sep 2022 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663665062;
	bh=vgp1hqroueELOf0HkLsZXn6WvdIxgVzLklJz+ZBpoRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2vx/1BZEUEFyHcXFU0FOb4XiQwvOA9C3kxkqTvhol6D3Dj2WCFT2hRw3rxT9fj26
	 v4NgQJKpCYQZiGa3lbvChp+TgXs35AIHxGd6Cwzib/CpKzxNj0DKARW1/l49dfO1bT
	 M/iAUidqdDNkcFSUpsjKdQ/OiENvWCIHTHGt5sunwdzIm5cNJhx8iS74LOfDtP5pD0
	 3XpS3RLIgaS/fnNB9sZce+KOboB2MLHWA+dn7dms+6BtY/QG2YKEW4yt+X5om4dRkB
	 PyDFBrfeioCDPIFNaTDqdWk4qVAElgNc28I/g/+9vun4fbV31RYwQzXmopaPBpHDZm
	 At+3+uUzs5ZnQ==
Date: Tue, 20 Sep 2022 10:10:55 +0100
From: Lee Jones <lee@kernel.org>
To: Matthias Brugger <mbrugger@suse.com>
Cc: matthias.bgg@kernel.org, robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	mandyjh.liu@mediatek.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mfd: Rename mediatek,mt8195-scpsys.yaml
Message-ID: <YymDn+ZEIFUqpIEb@google.com>
References: <20220830091110.27857-1-matthias.bgg@kernel.org>
 <YxnGBN4QEb1yMrGw@google.com>
 <336cb80f-8f58-92ba-aa92-1bb57a75f0fb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <336cb80f-8f58-92ba-aa92-1bb57a75f0fb@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_021105_843653_3E0D46B0 
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

On Tue, 13 Sep 2022, Matthias Brugger wrote:
> On 08/09/2022 12:37, Lee Jones wrote:
> > On Tue, 30 Aug 2022, matthias.bgg@kernel.org wrote:
> > 
> > > From: Matthias Brugger <mbrugger@suse.com>
> > > 
> > > The file describes the scpsys node for all SoCs and not only the mt8195.
> > > Rename it to reflect this fact.
> > 
> > Actually, this is fairly typical.  Same with actual drivers.
> > 
> > Both tend to adopt the name of the module first supported.
> > 
> 
> Well I think that's unfortunate as it can create confusion for people
> searching for the binding as well as people adding a new compatible as they
> might think each SoC should have a independent yaml file. For that I reason
> I think it makes sense to fix the naming.

I'm not keen to open those flood-gates right now, sorry.

-- 
Lee Jones [李琼斯]

