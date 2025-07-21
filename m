Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E929C83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 19:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vryXsZRTWCX46b0o3/MR/vjYS8BqW+i+Jur9E8lXans=; b=tk+UqOS3seUtu6m+JZAXA76c4u
	WYue5D+QOI3umvd04vbJgCqBKDKu8lXKRuzzrOQTYsPa9lZyVoCrRxgrQ0JM20o0NHZtlcyHsTj8f
	m+XhYXc2DLQR5aPhbZXA6wANbJXA0CMGa+BrkmkZac5GJ+CEqwf7ZzinwLGFtrYvNz5eoQ2tb4AKS
	RiSP4pJmBbRiypxUW7QBNheJPT8rr0wVs8TwskkrshfdHMtcxzqCcnLn56t79DEdLHWxTaTHqEue1
	VSN6q001X3g0D377a/laqywXjEMuPZMhbhwD1dU06skXCxnCAT1vnNxFwlnJUOh2uxvCIr+qi15Cw
	KXEfN3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwQF-00000000XtV-1p5j;
	Mon, 21 Jul 2025 19:43:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwLk-00000000XS2-3Uft;
	Mon, 21 Jul 2025 19:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 396695C62E9;
	Mon, 21 Jul 2025 19:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C6FC4CEED;
	Mon, 21 Jul 2025 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753126739;
	bh=SGFyd6hkJVVeWAZqZbFqfwOminQzrq2zer8F2GULDmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KY2wVsAkRTi0EX17ch8MEhAuFHc/o5USV46MmwuHYkGm/Bshjyj6fTQXwCULhQBOu
	 KJcPU/36aTPllGhmI5M5fK5yH0SlyeZy0uImuqfcwSdcxpzQCOt5qWcN4k7zb6C4Eh
	 fxBvn8v+Ot9aKcR9oIC0NShorhxK/UTkEoiDCJgKhB+Y57+s5qg1lWK7x+aWSX2a/y
	 ATQ37uSnOghkUjakX1vhK5oQb2I3QL76fAtYOV4To0GZKH3OEHLt0gD95jio6FwkY3
	 5PHu1oOs8x1lCqIVGu89oCCDMFWXQcC3H9VrjIxuoj+lww5xFCgWSqI3jncKlQ/m2F
	 NYkjFLwx4yHpQ==
Date: Mon, 21 Jul 2025 14:38:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: cpufreq: Add
 mediatek,mt8196-cpufreq-hw binding
Message-ID: <175312673842.1140849.10630028189155435330.robh@kernel.org>
References: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
 <20250716-mt8196-cpufreq-v3-1-d440fb810d7e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-mt8196-cpufreq-v3-1-d440fb810d7e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_123900_913985_BB983164 
X-CRM114-Status: GOOD (  12.70  )
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


On Wed, 16 Jul 2025 19:51:22 +0200, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC has new cpufreq hardware, with added memory
> register ranges to control Dynamic-Voltage-Frequency-Scaling.
> 
> The DVFS hardware is controlled through a set of registers referred to
> as "FDVFS". They set the target frequency the DVFS hardware should aim
> for for each performance domain.
> 
> Instead of working around the old binding and its already established
> meanings for the reg items, add a new binding. The FDVFS register memory
> region is at the beginning, which allows us to easily expand this
> binding for future SoCs which may have more than 3 performance domains.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../cpufreq/mediatek,mt8196-cpufreq-hw.yaml        | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


