Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677FBC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcBBbJ/UIJ1f5QSEKchBIEC8DJuliIcWsU4RV8tODXk=; b=hFL6ReECC17QbNn+4RmibF+Nk6
	pLs9zhxybH32dhES6pTxVrXGo1Q6bok4SFdRjKQz6n6MD0Ggv8/8SZHLyqkh88Pzd8q6DUWXz4pwB
	Mqpw4taxVbqhVhNfRLwd6SLyHeJ74xVBGDOCNnLQffCanyuRPq+w7qG03sYjtWJi5iMUPRQca8nNa
	ojvmQujxgtLnznDQI5EDQk6kABlPcw5NHE18p1SOD+62Ou7eXP6cWTbAYLSj3EYnwTAEopOMDfVi5
	ozdIBG3rVdqfOXjiB9hgCouq/s6Q6Ag9GQZ+yAZ2c8hrKrEW1SQutpRGOyqi88KzNEwC1xjdqxK1G
	JsyQyNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PMp-007H2z-TX; Fri, 01 Jul 2022 22:44:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PMd-007GxK-Dd; Fri, 01 Jul 2022 22:43:52 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A08E66017F5;
	Fri,  1 Jul 2022 23:43:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656715430;
	bh=enEhM+ScWkWY6bc7efSirQvyj6tgwMt92c5ptu/umHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMUmZjWB02mge2cX2TXCLuo2I8S+05Q2LIsD7iwF1zJ+fpVsRzNQe7SiLNx+72uSo
	 Z04c1xrsl0S0y/8FcQecaDnol/chS12TVc5BUlGu3rz+6JkHUWwQpnaEeP8wLNM9UR
	 So2pDhnxQKsZsGUfEqlROCul+O6SLbnc9+LcJx9NAj/QCGfNfw70/mutuULyo9X74F
	 +Nxs04BgtKwe2UlNwU6Z6HnY7Ke7cv7JLKzlEEAfdPYhwf42SmMuby3250NVp7OEPr
	 BcyJhSarbX4pQR1KKOSqetRY4FFRX8z5GSnabPz2f/Ptfo/tiglQcJikzX4sjU5H8q
	 tL7LbjOvP0n0A==
Date: Fri, 1 Jul 2022 18:43:42 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 08/11] arm64: dts: mediatek: cherry: Enable T-PHYs and
 USB XHCI controllers
Message-ID: <20220701224342.4rw6y6twgn2irssn@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-9-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_154351_635040_214423C8 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, Jun 30, 2022 at 05:33:13PM +0200, AngeloGioacchino Del Regno wrote:
> Add USB functionality by enabling the required PHYs and the XHCI
> controllers.
> This enables all of the supported USB ports on the Cherry boards.
> 
> Please note that u3phy1 also enables u3port1, which is configured
> to be a PCI-Express PHY for the second PCIe controller that is
> found on the MT8195 SoC, which will be enabled in a later commit.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

