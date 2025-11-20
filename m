Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081E0CF649C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyoCT3QgLbaLHLquOAoMXmdRN8izIUYlclunjFiDvLk=; b=t4lL+C5ss1EOI+lgNpr0RL4yJw
	YE11DrekRkXp35jSBHJ0EcjAjIQZ65ATsKSjAYyrh2uIUrKfUsknGi552z7hxemW+qDyvVYAJLBie
	KEFTdpqS6pV+5DD+uqPxP266cQd3QEjhuUyAU4NoCt/CCzlhHZz9z2u1cMCAti/qIegPs/DAr97Zp
	14YT+8gjir01vddGGucoAfonHw+/Q3R8jttm6psOANYLpC/UufWKZcb6Ct76m7C7h3KFq5CzPF4cD
	rKqbFjzhO397KQ0jfYsnX8jyyqV6jhZOnwZJPl41ohlKkNXVqUCCl46yH5NPO1WWk1SuLiXrRqFga
	n1XprYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsGh-00000005rzy-33EV;
	Thu, 20 Nov 2025 00:11:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsGe-00000005ryq-2pWr;
	Thu, 20 Nov 2025 00:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B09640AA4;
	Thu, 20 Nov 2025 00:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F24C4CEF5;
	Thu, 20 Nov 2025 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597480;
	bh=sv1fkok2N+aLyYVgNquI/uq2Ye6mJG47tXK86nl4Hpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrQNDIf5h8U04GRpL+stTSw+b/uLkBEXTXEHautRVHiMoUgIN/s+foGGDLuIUU20g
	 bMNOTF1EwFFMn5UH5ZPzwBInEsqFDm4wGhIe3RpRPmUiURV+8jfXoZ9iazunNzl/0T
	 MOkYsh/030fUc0wiwWgjowPxeo/ajev+7ufyvLo5hjd0b1lm9RylQJRcezyP8Iknj6
	 FTah9Tx5jHHLytaCFIxZ8GaiNBTkdNkLGofFpxmqlDZJ/KMXONevNoPbvohfmv4zVn
	 KZTsabtvucGqHdPaW2zMDcO86ragISyB+tD+vgoXR71RISNZc1DJApGkY5VEsOuebe
	 N1PQsv55MUkpw==
Date: Wed, 19 Nov 2025 18:11:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Georgi Djakov <djakov@kernel.org>,
	Henry Chen <henryc.chen@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 02/13] dt-bindings: soc: mediatek: dvfsrc: Document clock
Message-ID: <176359747794.3605292.8742901410982819930.robh@kernel.org>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-2-b956d4631468@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-mt8196-dvfsrc-v1-2-b956d4631468@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_161120_774620_93E6F644 
X-CRM114-Status: GOOD (  12.37  )
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


On Fri, 14 Nov 2025 17:53:56 +0100, Nicolas Frattaroli wrote:
> The DVFSRC hardware has a clock on all platforms.
> 
> Instead or proliferating the culture of omitting clock descriptions in
> the clock controller drivers or marking them critical instead of
> declaring these types of relationships, add this one to the binding.
> 
> Any device that wishes to use this binding should figure out their
> incomplete or incorrect clock situation first before piling more
> features on top.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


