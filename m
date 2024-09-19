Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82467CF3963
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiEhcJCuChupAE1OcY7zKzyGNvHHSRSNmI/O+BPOSl0=; b=T6COUkOQc/mu7BCj0JgAeYxSng
	0947g5RaJJNeIyxM6FfZyF4NtD85HpLK7N4BHrODLgUJuUQ1QS2moZl90OJl6FzdbaJ/x1j68F98v
	fYtqvBC4EKvQBZF5uiwSmDFd9SdHRqytk2VBk4bDGVLm0N9dwgEkG5gjP98TNvGbLaOld9JiSz/zu
	aln1y8zv3LO3wCkRny+zjAiwy0sDydrAwDcHsEjEoA5Y9S9T3LFivV4/hzDnh/sLSdaBCK/vGrt2D
	RMwxDBA08Bjw4UJDTf2F/IBK2wUdPfkTTWKOYLxkM8pPe4qPqU7fcOPGRmrNqP7ARjksCKxX0Foyh
	qxkZ55kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srLkq-0000000ApB8-0pWB;
	Thu, 19 Sep 2024 18:19:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srLjh-0000000Ap2m-2k0i;
	Thu, 19 Sep 2024 18:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09820A43FB0;
	Thu, 19 Sep 2024 18:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C5BC4CEC4;
	Thu, 19 Sep 2024 18:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726769915;
	bh=v3rpimedUNi4pi47RIlHL/6lU7cCNgoVze+n/fIKNLQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NTRxMoUHtPCO8/v2+r07fYTT4+EW9CFPoskxQbJ0v6xLonlt8dfFbZrsP8t0r2wbt
	 ckofs47WbK3KlTOWXBznMbpkfAH8UPjrQ/8ciDLG10ZRFUed2IHdXf2KElnKkAL0Ej
	 2Q7p0O7J1MaDW9GPJGK2tNWi03Za2H8M2PBeT5rmGbeUN14U8hEFpjAO4wZ9AYrj9E
	 UWuXjxXEV71mCaF6bTyK53hs7hGCv5CqUeUrdoKFP2iLzH0Pluv2wMF/9HK6fgRyXG
	 HULlj2/GtnQmKZRmx4tVhUsMVvqcyN2rY8hyVk1RzJfW/HwBzrTPFb0iP5WLIk/aKt
	 QIwAslHOib2tg==
Date: Thu, 19 Sep 2024 13:18:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240919094212.1902073-1-treapking@chromium.org>
References: <20240919094212.1902073-1-treapking@chromium.org>
Message-Id: <172676985046.765320.3471835988677145017.robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8183-pumpkin: add HDMI
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_111837_781710_F647F945 
X-CRM114-Status: GOOD (  14.67  )
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


On Thu, 19 Sep 2024 17:41:49 +0800, Pin-yen Lin wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> The MT8183 Pumpkin board has a micro-HDMI connector. HDMI support is
> provided by an IT66121 DPI <-> HDMI bridge.
> 
> Enable the DPI and add the node for the IT66121 bridge.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Co-developed-by: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v3:
> - Update commit message and fix formatting issues
> - Fix the label name of vcn33 regulator
> 
>  .../boot/dts/mediatek/mt8183-pumpkin.dts      | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt8183-pumpkin.dtb' for 20240919094212.1902073-1-treapking@chromium.org:

arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dpi@14015000: power-domains: False schema does not allow [[76, 7]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#






