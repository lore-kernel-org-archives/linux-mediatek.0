Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5692AC48BED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zE+lQyIu/EZBhvXDgTeZv070/UicEfhkJ5LC9W6liSs=; b=ieJWslUz2458pM4tbWut/MWWPs
	a3CbEaJQIyCcXAw8v/hU1s4qtTdRIzXZLdnG1AdppAMP9q71ruuezGTB9tcu3CVH34hnujH3X7sbP
	t8X4hV3E4AoJpxoGbaAgJQRMu8sxWNx/n/c138DTWTqQPblS+NGLq/2ArDlesnyZT2L+6v/vCjoO4
	XXsgvSI48/BalFJXveJarOEUVKgdWXUfQioTAyoXATVcfGMrCeJqFdFwSD+E4kXrHzaZighEQzD3r
	EUsJ3sR6EdTkZwFQ1D7zUNBldF/0wqwjj1v20Ac9kU8zFdCf0ZX0WAaod0DCidBfmCY37ZNBzO7da
	VD8kSoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBQI-0000000CFyC-3WEI;
	Wed, 14 Feb 2024 09:19:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBQE-0000000CFwr-3sIb;
	Wed, 14 Feb 2024 09:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707902357;
	bh=eopsYwS3LqpqJFXQ6Zuagfea0xeoUuIZuhfwfg1L0A0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bsPs3WFbo+AGEVfYLhDzM4a+lV/fZYEyUxr5cFSD07EM0L6ljKbgKTKKScSo8R870
	 dI8iri9GayobJEa2LMELQzotfdkSy9k8r0/eSKQTVKwG1ygwMuL9G0+7cfORryI2mN
	 ukVrJJ83+KnV/Y+ptTtAZFYBDTPsSSi4RstfCnjDiFhgdLItMirFyQozVriRq5Yw4z
	 HRZub6h+Jge5dYlU6S2Vva5Y92KR9QZGsKkDT/ZTO2BwofIhTIGGyW6rIr/nJwDI/v
	 jziw246t2InYjfXQ5vLJX6ODBgP4Fp1ARPfowjklkKczp07lmgiSOu+kCVAmtNI3TX
	 voWsOgXWMyxzA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C04B33781FEF;
	Wed, 14 Feb 2024 09:19:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: replace underscores in node names
Date: Wed, 14 Feb 2024 10:19:12 +0100
Message-ID: <170790234013.477427.13548425234687450683.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213144626.341463-1-krzysztof.kozlowski@linaro.org>
References: <20240213144626.341463-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_011919_114437_C1D0413E 
X-CRM114-Status: UNSURE (   7.48  )
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

On Tue, 13 Feb 2024 15:46:26 +0100, Krzysztof Kozlowski wrote:
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.
> 
> 

Applied to v6.8-next/dts64, thanks!

[1/1] arm64: dts: mediatek: replace underscores in node names
      https://git.kernel.org/mediatek/c/e630c7b0

Cheers,
Angelo


