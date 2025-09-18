Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D87CAC59A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 00:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnr0lphwAKPLW5ksQ22GegXVi8xqGEBkRU1P4uUo9J0=; b=1bFfDdLzb3C5UF3dbjmCcItZ/u
	sQIuVCQX4H3uXY9s0rtp8cUyxWrt08vGUaio9Xk8u4qFE4kEy0ZK4A542iBaDGyJhQVsJpEcARSGK
	spnJR6PBbQmx4t9J0ZUjkjmo2Oanl47ilABKw9S801wU+NjrMz6Y6BFJNl4ApqoPYj2d6hp7mYHEO
	aiT/zFWWozCBOsR66EzgCBNz31BWz1KSxhOViTGepUdz+kabx1X/5aVudYndzUdP4AymsRrYesknr
	moZ3Gumv8Zi+7w2F8n52maIJy3whhOiIeS9z6V8vP6uEBNs3US5L/8eCDvSoW+gcXN4AQUHcY1oXn
	RL74JfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2XO-0000000FoGR-14DK;
	Thu, 18 Sep 2025 00:30:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2XL-0000000FoFk-1cO3;
	Thu, 18 Sep 2025 00:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FD5740994;
	Thu, 18 Sep 2025 00:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83380C4CEE7;
	Thu, 18 Sep 2025 00:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758155410;
	bh=hqiBjDTMNtIZK2c3OUTgcHqbJVWmnljVpG2n/f/ZTiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCS0KNB3JWofqsgTN9Fg9b/3eTr0cJ7H3mJrjAJOl6uSnj4je1myzQ7Li018BoJEb
	 N4xB82npcp7YCNnumNB4vo0ENuelxgjruP6jwc7nGt5iSTrBfaK9DhodP1pt/LrM9P
	 6lBcn1GtEmqwQ6sHL4T0sRtoJg1pAhKNCY7JO8PcXT6CgOJmm2ZkISOTIwZDRKaRGS
	 5XmPm4HU7t/r/JWe8QlhypHdRNQsxmllbCFPIR2qOeG/big3wIyeyxCQEMT2Se9CZP
	 YQgNIGZQNLj665FfU3Xl6g8qGTYkqCyRIErGc7rjC+Xz1zEWyPERcXYnT5dhObBoTL
	 2sysuT046nHIg==
Date: Thu, 18 Sep 2025 09:30:09 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Message-ID: <20250918-festive-chowchow-of-joy-5a51de@kuoka>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-1-c4ede4b4399e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917-mt8196-gpufreq-v3-1-c4ede4b4399e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_173011_447160_FDAC820F 
X-CRM114-Status: GOOD (  20.41  )
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

On Wed, Sep 17, 2025 at 02:22:32PM +0200, Nicolas Frattaroli wrote:
> The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> control the power and frequency of the GPU.
> 
> It lets us omit the OPP tables from the device tree, as those can now be
> enumerated at runtime from the MCU. It also means the mali GPU node
> described in this binding does not have any clocks in this case, as all
> clock control is delegated to the MCU.
> 
> Add the mediatek,mt8196-mali compatible, and a performance-domains
> property which points to the MCU's device tree node in this case. It's
> required on mt8196 devices.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 7ad5a3ffc5f5c753322eda9e74cc65de89d11c73..ccab2dd0ea852187e3ab75923e19739622b2b3b8 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -38,7 +38,6 @@ properties:
>        - const: gpu
>  
>    clocks:
> -    minItems: 1

I don't understand why.

Best regards,
Krzysztof


