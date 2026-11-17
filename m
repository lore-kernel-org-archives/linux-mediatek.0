Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53E606A323
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ctIaJnyI;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oEa1fA6G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=slUfvfIqFIUcI6mKtrZs1QJBfv+t10WcDiqUfYRfSVw=; b=ctIaJnyIgCAMA3
	hBr1wWg+/3GfWTEw113qNwP6hwrc1niDiCXGBOv9FVzZcDajajJmDn0J2wx9To5kuSx3c7+qVNJ9M
	jYmEtuMTjlbJKHoTsE06AGubIXKv/D5EcdR3xTmAaLiWAZdBa80/yRENt2o8Cq2QsKfWV20J7kU+r
	61JUDTXqrtCtABqpIYRtipZl9+fOwUOkHaCBHbejO0axpVydWK2R7S8rB/NOMIu8gDeOCgla2NybP
	35Yy1fBaAIfw7BHI7pquVzBv2zkKIPtLL06cFTHInegnwa7G4NKB9qWMm2Epp2oX6JAZfJuU6QkHZ
	+yswZJ2i45iNksspQ35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJOF-00000005ysv-2Sqa;
	Tue, 17 Nov 2026 13:38:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNq-00000005yVw-1xWA;
	Tue, 17 Nov 2026 13:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794922680;
	bh=i5GOUYtipkjBwuOdde9Bcs37tKsx9Bj95ZOzvKeJVlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oEa1fA6GsRULsaAerhm02910MylbInm6oIqOsjXDllcPW7KHcYW/oAhyIAkYqj6A1
	 9VPnK1o0KsvV36cz0tyL6NCGFGK/wsieVwkpAOHu38/gZLiXJymSZMO/njueeLYCTT
	 w5m6Z4VomWqWh94c3PRBkGgrw/NLI+/YhhEHGxFy/t+0dY/xcCJ8NOG5wk48JkeOsQ
	 Fz8rR4AEC/J/Yj0r0PKlfrQxVyLhji+LykuiJ/MZhcF2NOW6JXId+9EQpSAK8dYBFj
	 AsGeDGy8hGd19ibc+CW0E+4rnVflPX1hUFbFuhXLg9Zg/Dprtde1HtRSKSLqiIoLhd
	 Y+r6olq4z6DSg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C607317E00E8;
	Tue, 17 Nov 2026 14:37:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261117-mt8370-fix-cpu-map-core-order-v1-1-00c6c74c7629@collabora.com>
References: <20261117-mt8370-fix-cpu-map-core-order-v1-1-00c6c74c7629@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8370: fix CPU map core
 ordering
Message-Id: <179492267974.193585.7125119331951320635.b4-ty@b4>
Date: Tue, 17 Nov 2026 14:37:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053803_748181_0E12C39E 
X-CRM114-Status: GOOD (  11.20  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 13:22:07 +0100, Louis-Alexis Eyraud wrote:
> In mt8370.dtsi, the child list for the cluster0 node of cpu-map is
> overridden, to reflect that the MT8370 SoC, as being less powerful
> variant of MT8188 and MT8390 SoCs, has less ARM Cortex-A55 cores
> number than MT8188 and MT8390 (4 vs 6) but the same Cortex-A78 cores
> number.
> 
> How the cluster0 node override is done makes the core child nodes to be
> named in a non sequential way (core0 to core3, then core6 to core7).
> First, it breaks the cpu-map child nodes naming convention in the
> cpu-topology bindings. It also causes the arch_topology driver to skip
> the A78 core nodes during its devicetree parsing, leading to at least
> incorrect CPU capacity computation for them.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8370: fix CPU map core ordering
      commit: 14cdd904db60288b782ffeac59f4c626ef11e9f5

Cheers,
Angelo



