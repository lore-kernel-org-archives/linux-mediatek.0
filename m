Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28BDC27C75
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 08:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT3/lc2GngZz5E0TuG728E4qmHMo2b7YBCH4DcUIrB4=; b=pq33X1+xpLlIzBQPwTCBgM0ByO
	k7W6q+u2AWryYMBVucD6ZessCXBMN/178Xz/d3Ec/dYZLJDQVkMc3P/ShVH1vhfwJPhtguwisvK/T
	rBqymDeXlGLgnTundZ25ZQKk70M2icqWMmeuO543e8DtEXkIUso2qEG0x4iMU2DCwSnaPQKdxIrhg
	ctQfWyCVsLXcQYGnywieGa5F5rIa/y1PSfHx0pk3OXO10YI+/4bGhb8Xydw/40TOS//5QVMJDh8mQ
	c/BWIbvGyVDZB7shtaTLg8Ybdefge+l0Ussm0LArstG9C0P9MZkJ4rNP6nMbXP9MCD+XWpRaqETit
	MOY5G3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfOg-0000000FbQp-0cSd;
	Thu, 13 Jun 2024 08:01:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfOb-0000000FbOq-3ttF;
	Thu, 13 Jun 2024 08:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718265678;
	bh=wbyJLiiccUCYB2zQ+xDgPMn5sJZiH3NYN8ymff9xip0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=1gIWHpeX9ArQUPA+l2Bs5OXv0HqNko8JXsrMO8/bzJfar+d0DH5A7zwcVB3JokMqv
	 sdTkr7oll0IM3wf3ZIdP1ErQmSwO2ABvI7u/7APCj7lONW+Gz3H9HG/RKjoXAGTjxi
	 oFN0MELbxlKKDoJLrHdXl+eFJH3sz00dproVxAFswJLYEp/Vjsxp9O/9autAySlINV
	 AOn5m9jsrqN5udj3R1SVt80t/c5eRorxrKo8HdRWvk+aEa40/xIdzYnloBZazvAC+m
	 8+1CaBZd4cjFQ/MU6KEOrdKRTO1gXIak8LlqqU9uW1Lpu96jbGOGQ0iaweeAnaLQze
	 un+j2pWwFwAtg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 22ECA3782158;
	Thu, 13 Jun 2024 08:01:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240612092421.52917-1-krzysztof.kozlowski@linaro.org>
References: <20240612092421.52917-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: mediatek: mt8365: drop incorrect
 power-domain-cells
Message-Id: <171826567806.48354.15294674818509794534.b4-ty@collabora.com>
Date: Thu, 13 Jun 2024 10:01:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_010122_214141_AD2F52F1 
X-CRM114-Status: UNSURE (   5.60  )
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

On Wed, 12 Jun 2024 11:24:19 +0200, Krzysztof Kozlowski wrote:
> The top SCPSYS node is not a power domain provider.  It's child
> "power-controller" is instead.
> 
> 

Applied to v6.10-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8365: drop incorrect power-domain-cells
      commit: 24d29b58184973d328c3a17d007bb21e423ea414
[2/3] arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
      commit: 58adf8df342bbdd0e821750b103e7be6e5e2fd5f
[3/3] arm64: dts: mediatek: mt8173-elm: drop PMIC's syscon node
      commit: e7450bc4f8f187b87522d992c3e226dadeac3ba6

Cheers,
Angelo



