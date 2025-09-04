Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E23CA1012
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 10:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuLfP+r54LURDa2LMo8LpqmiyCBnEVHwC9eXfZe3py4=; b=wkLBd/g4G/k3ASCkEtHOE0MuOe
	WZDx6oZs/7yv7LfeVZDCaRRCE16rfQSPQF2d6AO8OGW+aWNA+hxsNRZbAvDU9CthWwyds6jKTvWnH
	Tmm2fKiwIxbGXUA4MR90ylVWjIInR7b5XJKRI2x+XG1KRvhpgqBaphzoi42yLC7WWgvIWHPVU8KFf
	S2BIGTCIRFvt5S6i1/Bx74IDkjv5etqDDVEvzNnIerjhCmtMc8nbE3FMSP6tz0HDO6Lkztx2q0+qi
	frBJ/fgVu66ZjpMkZ9H6iUoqWZnyYUFOial70o2o3SNCrw3Vbaw3zd0Qcn/8Eqrq1RQZwmGQcY3oc
	dXVfPCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7Ks-0000000AwIy-3S8K;
	Thu, 04 Sep 2025 10:36:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6Ih-0000000AZjT-2ogm;
	Thu, 04 Sep 2025 09:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F7D143687;
	Thu,  4 Sep 2025 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58917C4CEF0;
	Thu,  4 Sep 2025 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756978238;
	bh=NuLfP+r54LURDa2LMo8LpqmiyCBnEVHwC9eXfZe3py4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIp5rGKSsb4OffYTPRkTkmC9E5V/Dz1pqOk7/EYbgLIWe3oY2+HwirS20q+oEPy7Y
	 JMxHmdnotOEJ8ULS1BDyK7jDnnJH74Kf9u3jTPldI2ZFawLqRARtARC8L0G/wqu+p0
	 kzUoCsSHywe6b6JIv+2jQ3aWL7u6dlQ9B7W402IpH19nRtWcuJAxd3dZbBZ/ptL9Kg
	 +bvoO7gBWo1QDg/Qwsx3T+tFveH8XnAxmfJRrAb6JFrjJLS2B1hUcdAEHYu+udoGUk
	 UM5tvz4E86r5BCr809NTNldr6BMX4bc2Qm8AYrLLMPjIimyfDxJVOxcvQPidbWSuvi
	 3Wu5OChGPV14w==
Date: Thu, 4 Sep 2025 11:30:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250904-practical-dazzling-quail-f1bebb@kuoka>
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-2-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903225504.542268-2-olvaffe@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_023039_731431_D54A3311 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, Sep 03, 2025 at 03:55:03PM -0700, Chia-I Wu wrote:
> MediaTek MT8196 has Mali-G925-Immortalis, which can be supported by
> panthor.

What is panthor? Please describe here hardware or provide some
explanations of not-that-known hardware names (if panthos is that).

Best regards,
Krzysztof


