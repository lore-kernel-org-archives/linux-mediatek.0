Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF57EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 15:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/8lfaKnBDNBDBKXeY9rLNuvC6DNY9/QlCjC1FEAbSA=; b=AF0pt1nowYOoZbZbyweu0MQT64
	n9LrTCokLXoTdz0tS3m+qwxo4gCntUJbGG0KjAJ1rOMeGyaKXSBPP5FMeW6UX9hN0FF9x9NGhUcCX
	E6jLcAZkHxx4G74+Y92VX59a/Wb6Q4dAFn3ez3bgHBQh66E1bA3nqCu/2UVc6pOEKGop2cV2qz2++
	dk9KLT1sGlILZ194ra9qmHBBqK1VC+nZu6NNG+GlEBFOEaC0HgtwhNH27CPgoN3GOEze9RRttvvjw
	CS5mSAN/Y3pDiKsUCUuC/5LK8maCMoCY0eU/BUO5xG8bFKo5rX58YHJcgikcX2W6WPh0j5TOR5+NP
	kstYZPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsSe-00EUD7-3C;
	Fri, 21 Jul 2023 15:54:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsSb-00EU9v-1d;
	Fri, 21 Jul 2023 15:54:31 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 23C5C66070EA;
	Fri, 21 Jul 2023 16:54:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689954854;
	bh=aGb2zEtDX/ptoxn3icdi3HfOY+CTAIz5o9rwC4aMEwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQVlKjMn/v74MN9GY2ZGkCPUJVr98bbdcMoovGg7r/WpsKlBLzBpzFb00V4REfFfE
	 wTODDLD9Y6p5TzatkqI8A0RKvkrV3lA5lialHLY3khrD3M6G5/9N8TrCHEu49EBAgW
	 dZg45kBHTb13hZ51frSTBJ7zPhMEix3n8Ft+WJ+ky6CcWCIwbKBVsydTJhANLZUlq0
	 Kg04ZoB8xMWTBbAjTQxG2uOhnLfs35JWiKjB2GoscmgcbVK+ZfrlTKYjPDdiEP/w4E
	 WRg7FnRFCPn/D5g8wGCi3VW+JBUXV/xk/YsJrennqFF1uMOEfrutW1BQy9C6D2SLMx
	 vOmQVbXzdB+VA==
Date: Fri, 21 Jul 2023 11:54:08 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
Message-ID: <ce77d904-78a7-476c-9571-b1728016046f@notapiano>
References: <20230720200753.322133-1-nfraprado@collabora.com>
 <8bb1a42d-2809-04a9-dcdd-45fc91ea1bde@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bb1a42d-2809-04a9-dcdd-45fc91ea1bde@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_085429_737698_6FC1D70D 
X-CRM114-Status: GOOD (  16.64  )
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

On Fri, Jul 21, 2023 at 10:16:44AM +0200, AngeloGioacchino Del Regno wrote:
> Il 20/07/23 22:07, Nícolas F. R. A. Prado ha scritto:
> > The DSU PMU allows monitoring performance events in the DSU cluster,
> > which is done by configuring and reading back values from the DSU PMU
> > system registers. However, for write-access to be allowed by ELs lower
> > than EL3, the EL3 firmware needs to update the setting on the ACTLR3_EL3
> > register, as it is disallowed by default.
> 
> Typo: ACTLR_EL2, ACTLR_EL3 bit 12 must be set if SCR.NS is 1;
> ACTLR_EL3 bit 12 must be set if SCR.NS is 0.
> 
> On MT8195 Chromebooks, SCR.NS is 1 - hence ACTLR_EL2/EL3 must have BIT(12) set,
> but at least ACTLR_EL2 doesn't have it set.
> 
> I haven't verified EL3, but that doesn't matter, since both need to be set.

The kernel is running at EL2 (as I verified from CurrentEL), so only ACTLR_EL3
needs to be set. ACTLR_EL2 controls whether EL1 can write to the register (in
non-secure mode) [1], which doesn't matter in this case.

[1] https://developer.arm.com/documentation/101430/r1p2/Register-descriptions/AArch64-system-registers/ACTLR-EL2--Auxiliary-Control-Register--EL2

Thanks,
Nícolas

