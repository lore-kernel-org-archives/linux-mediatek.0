Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CDBC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wf7lTE++gpWnTJsacyHAqpSfQbbuHn/VEFcMb6c/obA=; b=0yI34abg4Ddhwq9BmRUHFqBmWR
	XLaQXpwbYxzcQ4yMh9pkKQeFWNzLDjJTHxW5xuH1EgNBzQAPf2ws+ILJRMqsIMoBWVFzqPZw5pJ/Z
	ZKTc3HVsFa173XP/I2XkZVISjgutLYl7h9kNOEH5REP87p4LlnYpIzpk6JfynAmEbNYIrdaq1D9YZ
	hMYL7gTPpVvTwXV+Q3l+vS9AeWc1XpvCcsdUdlWlESg4cL+B5I/A0a7OUmDCmLr51Lif7PpU5JyzS
	/qREywnwa3Xxb8bFSNjld/2DAVnNKURq+Y3WxTCImxhYWWFtmLEBEcuNZ3ssuHXMzwrWsY+UWjGD2
	BPCcJZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFK2-0000000FiJ5-1Ha4;
	Fri, 27 Jun 2025 20:05:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFHi-0000000FiA6-2Dox;
	Fri, 27 Jun 2025 20:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 378D2A514F7;
	Fri, 27 Jun 2025 20:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE363C4CEE3;
	Fri, 27 Jun 2025 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751054572;
	bh=Kn4BCp5llI7tE01yR+uf2dvC6F/CoYnl1ShENveaHkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6YNk4Toj6vFLfrkCoBKx0pN8kG0bH0UB8Tm8QdeRMVACHCkx4+ZHR5qy9TeCg0yy
	 zhTe6rodmwoMHhYsQwjQQckfyPl/0cR3tbgFBrtjeuKjdgumMCInH7IJIu0qb5ykwi
	 RF2Lw0/zCqATfV/5oH0/w207nE0kOl97tUkqot5fBXuJmv2eonFC2nE+wskhNggqu9
	 200mkh2mT4R5P5ciwzYGitRZvI3zKgAqZgXMl+gKIjese/TX609bqMbpmKi9ZbN47p
	 NJn/JNlxsRzGUD8+jNhtoInRFqloUwfQP/6R3Wc5YTYSsdO1R7opzeTlOb1IWbvC1p
	 uSiUnsDiooL6Q==
Date: Fri, 27 Jun 2025 15:02:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	dlechner@baylibre.com, kernel@collabora.com, krzk+dt@kernel.org,
	jic23@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, conor+dt@kernel.org,
	andy@kernel.org, nuno.sa@analog.com
Subject: Re: [PATCH v1 1/5] dt-bindings: iio: adc: mt6359: Add bindings for
 MT6363 PMIC AuxADC
Message-ID: <175105457149.4089682.1894322678019051751.robh@kernel.org>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
 <20250623120028.108809-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120028.108809-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_130254_636241_DD589A02 
X-CRM114-Status: UNSURE (   9.03  )
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


On Mon, 23 Jun 2025 14:00:24 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible and channel bindings for MediaTek's MT6363 PMIC,
> featuring an Auxiliary ADC IP with 15 ADC channels used for both
> internal temperatures and voltages and for external voltage inputs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../iio/adc/mediatek,mt6359-auxadc.yaml       |  1 +
>  .../iio/adc/mediatek,mt6363-auxadc.h          | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


