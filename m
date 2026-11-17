Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E3606A329
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MrBh/dfj;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EqHGWBNu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iU2cW2IePpuS+D0FuL9ISarYXE3VkyR/PI0yo1keQto=; b=MrBh/dfjh/WFNE
	ekSkivpAbSv0o7bZH6JqlbodQjpRTZRq3KEm5c08kIxloryufM0roIxipQfSX9zgrYDpjhLWSarxm
	1X+tCa3dRpFEgR11rb5McYI0997eZpelHRvdkjKaMhobqqfUl5a5E2FvaOlswaCGriaW84b3aLk+L
	mx02pXPSEbK3I+pQkEdHkB68xNQQSDB2eQAG3Ji6oK18hn7pAQAdeXLaaMJXsqJ+x2iJOlDxQtIqP
	x2woiDcWK2/ZDYq5G0lLrM9l4TV6alXQceyum5vx5yg2v0c6OyPkat99OIWOeq5G7bYqQ6qDc0muQ
	TUFxwXhsRymSoPm2dJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGrT-00000005MJB-231n;
	Tue, 17 Nov 2026 10:56:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGrM-00000005MEe-1srs;
	Tue, 17 Nov 2026 10:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794912978;
	bh=jGf66sH2K3XDwW9pv5TB6TILgUjOFvJHw8j34MMykL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqHGWBNuokUEOWYu0ZNDuzuegP+0HeZ4GihiuMEdGu6x72WSK5BTeDoK8xbr/8OQj
	 X8X17Ll2r+jt8vsQgbFekOZm1te9g+89jGiYq3NyB+Cd3Rr4OV8f21v2yBngTORn2K
	 C0RnK/F1sIm4TmzEsSG3vyrUvKsn6UzeBsPQWWcYOq6Un9naNpouJpaA9qVPOn2Bb3
	 e510m0aqQNZaZLstJkDTRy/OWptpD3TfenceB1b5fkJXYdF486iZwkBcCEjN96v/Ed
	 fKlD97Uq+63tveUNO536CWEud1xUBFGoOH09T9jIK+lh0Ev06IjieU29njTNO+gNRN
	 0jbHEsaAkd2rQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E66ED17E05D6;
	Tue, 17 Nov 2026 11:56:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: mediatek: Add the Amazon
 Fire HD 10 (2017)
Message-Id: <179491297788.155632.16976214618689978473.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:56:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_025620_767772_3FECF7EF 
X-CRM114-Status: GOOD (  10.82  )
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

On Fri, 13 Nov 2026 10:42:43 -0600, Ryan Brue wrote:
> This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
> with an MT6397 PMIC.
> 
> Patch 1 adds the board's compatible, patch 2 the SoC's keypad controller
> to mt8173.dtsi, and patch 3 the board, with:
> 
> - The eMMC and microSD slot
> - The micro-B port as a USB peripheral
> - The panel, the backlight, and the touchscreen
> - The accelerometer
> - The light sensor
> - The charger
> - The lid switch
> - The power and volume keys
> - CPU frequency scaling and the skin thermistors
> - The battery thermistor, on the PMIC AUXADC
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/3] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      commit: 321069a4642ff220f73556aa541d9537211e1c9c
[2/3] arm64: dts: mediatek: mt8173: Add the keypad controller
      commit: a09ffcb4fd6b0a417f36e1b819b329a0b489f7ce
[3/3] arm64: dts: mediatek: Add MT8173 Amazon suez
      commit: d43a2180abce1831b048cdaf36ab5dc0ff5e341e

Cheers,
Angelo



