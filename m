Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF94C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLJxBM71n9KZyCkMuIUcJKUFoz4fHHssR8ohha+PSM0=; b=XonEUqWFxVxPtM7dWvw1a/Nv66
	mkJhrqLoiC+1/hPx8aImzDBbMKUTU0ZlNR0w+a2iRtPXengcVMmfpaBSL4GKPfJ7tXOGSfz+526ro
	uuI69OiF9yZwC4uEJ0lV2YEPcdrAI6RVoVWRT7Mrhej2OzJ1cpuCgQJ0UyRIqGiF45aqtLmIgU8oG
	KX/NmsWjUZLGI2GKHxRH9y4gcgljs4ceAHt5LqsYrc6zVINh8XDfKhnZnVVqBcNjXjZWt3mvC6oSt
	D1wmjs67yLTY8zm4ka7/rgKHbOli7ExF8tdX5chpZRKZqvQ3fcTXyHEin8M5gr30IPWcM1uxal2oD
	7wSpZaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIE7-001a7B-38;
	Thu, 23 Mar 2023 10:31:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIE4-001a4Q-0t;
	Thu, 23 Mar 2023 10:31:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F315B6600880;
	Thu, 23 Mar 2023 10:31:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679567473;
	bh=+nm2bNNzHBVf9VlMG8H7LfVJnc2HYpp4Jv5fZk9O/P0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DmcXxUHsBgzcjkPlqCyk9JvYYX0h/4JWd1Yv3VEttg902d9MkJzptLUJji4fhsKOK
	 GncwT/heO9DpacKfQEdTh+6I8oRR17JiT9tIxPRO6fLHBYy+fUHzbnpbJq0XfU98Eb
	 laKTbSQhEboyfk3tJz8OC3Va5Pinz9gKnlXrGKWhHz9CFB9Kb5hiDK9KbY1plYATfg
	 i+ZasWGE7SUHph8GGuNbXY+2Psi9TNtsD2NEbe/4mw3MS9ZgDxDulvNupUDqPrxtbo
	 oEzpqLwF3n/2bqtJCo90JAWVMtqVlVa9Xmea6c5ER62ow71xaFs3DSglMmCViTPr29
	 Feulyon4prtOQ==
Date: Thu, 23 Mar 2023 11:31:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 00/12] Panfrost: Improve and add MediaTek SoCs
 support
Message-ID: <20230323113109.0a611095@collabora.com>
In-Reply-To: <0800ffeb-c7c4-1671-173e-1529b8eeb12c@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
	<0800ffeb-c7c4-1671-173e-1529b8eeb12c@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_033120_459618_E3E27751 
X-CRM114-Status: GOOD (  24.61  )
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

On Thu, 23 Mar 2023 09:24:06 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 16/03/23 11:20, AngeloGioacchino Del Regno ha scritto:
> > Changes in v5:
> >   - Changed minItems for power-domain-names in base schema as
> >     suggested by Rob
> > 
> > Changes in v4:
> >   - Refactored power-domains and power-domain-names exclusions as
> >     suggested by Krzysztof
> >   - Small changes in MT8192 bindings addition
> > 
> > Changes in v3:
> >   - Changed MT8186 bindings to declare only two power domains
> >   - Added a commit introducing MT8186 specific platform data to
> >     panfrost_drv
> > 
> > Changes in v2:
> >   - Add power-domain-names commit from Chen-Yu to the series
> >   - Kept sram-supply in base schema, overridden for non-MediaTek
> >   - Added Reviewed-by tags from Steven Price to the driver commits
> >     (as released in reply to v1's cover letter - thanks!)
> > 
> > This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> > and improves MT8183 support: since the mtk-regulator-coupler driver
> > was picked, it is now useless for Panfrost to look for, and manage,
> > two regulators (GPU Vcore and GPU SRAM) on MediaTek;
> > 
> > The aforementioned driver will take care of keeping the voltage
> > relation (/constraints) of the two regulators on its own when a
> > voltage change request is sent to the Vcore, solving the old time
> > issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> > supporting only single regulator).
> > 
> > In the specific case of MT8183, in order to not break the ABI, it
> > was necessary to add a new compatible for enabling DVFS.
> > 
> > Alyssa Rosenzweig (3):
> >    drm/panfrost: Increase MAX_PM_DOMAINS to 5
> >    drm/panfrost: Add the MT8192 GPU ID
> >    drm/panfrost: Add mediatek,mt8192-mali compatible
> > 
> > AngeloGioacchino Del Regno (9):
> >    dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
> >      variation
> >    dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
> >    dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
> >    dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power
> >      domains
> >    dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
> >    dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
> >    dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
> >    drm/panfrost: Add new compatible for Mali on the MT8183 SoC
> >    drm/panfrost: Add support for Mali on the MT8186 SoC
> > 
> >   .../bindings/gpu/arm,mali-bifrost.yaml        | 80 ++++++++++++++++++-
> >   drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
> >   drivers/gpu/drm/panfrost/panfrost_drv.c       | 37 +++++++++
> >   drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 ++
> >   4 files changed, 123 insertions(+), 4 deletions(-)
> >   
> 
> Hello maintainers,
> 
> this series is fully tested, fully reviewed and fully ready.
> 
> Can anyone please pick it ASAP, so that we can finally get GPU support
> on MediaTek SoCs (including lots of Chromebooks)?

Queued to drm-misc-next.

Thanks,

Boris

