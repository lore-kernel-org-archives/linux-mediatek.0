Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91CBC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdmSJUH1kLCn9bp9fIU11Gr/lXzprodPOvIElkvc9ys=; b=oug7GTga1tNHvwljaaoQ33Ucsx
	w9UdrbuN7sX1tRudSidMaziDtt4YYT4CYgqwEI50BYGj6Pob9hkUMQVjr2eluMh4RAFKFMW/hIool
	nkrhSKoRCOAntplu0OM79iwyYnKbh98BqPKSlFwmDCRWhslhCvlVF/T6F98kC7DdYwPn8M8l61NHs
	ulQEgx/bX0QG+v5JVYhERVXxbTLS4KALWDbxNPIa26uxiZSYbeCpEOQMUHMuUkaqU2MkCvTmUvYdy
	esHTB2SdrRvnoH5p1qHKsSKq9R+NomhptIy6i9EpV37elJYLd07sgl43tFM4ADkCeVdzH8/34i3za
	GxR9fc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNl3-00000001Y5Y-3Lrs;
	Thu, 18 Apr 2024 09:08:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNky-00000001Y44-1leb;
	Thu, 18 Apr 2024 09:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713431314;
	bh=LsD7yUmtMCTzO1crQtPBvcjHCAiLcbN7MpNEaC3Gpgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZSM+iswSiJQUhdHGJZ5VxHCJyxeJgeADTcN/qrYIiaa/asAzkICNqsr4/5U9k44rs
	 QPZfkY59B8IMG7vKo49CkAUiJM///EsWvguueXGdNQpjZMq2xQx3GlPXqOx+xlHMib
	 jc2aPNAVdUuKtcXum8MMmkIMtLFaGrrYdYZwwgraNT2OzJ4mP0LeHGIiJt2Cjj2ux6
	 ToRFZXHBrIj+MAIFxWQy1f+5bbtRwaDvjRfoVjtqh6PeetCgOTg8sylHq9oI1QXaXo
	 OiSYk4PwgCyeZ4LrwCxqSBgmLt/jom8s4i9w52Ymtj22OhN1zVYROjj0z9puzHYh5X
	 nOGMCfUIeaXlQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BB7E6378203F;
	Thu, 18 Apr 2024 09:08:33 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: add u3port1 for xhci1
Date: Thu, 18 Apr 2024 11:08:26 +0200
Message-ID: <171343130258.187209.10545268279574102752.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240216095751.4937-1-macpaul.lin@mediatek.com>
References: <20240216095751.4937-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_020836_782641_53C34401 
X-CRM114-Status: GOOD (  10.15  )
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

On Fri, 16 Feb 2024 17:57:51 +0800, Macpaul Lin wrote:
> This patch fixes an issue where xhci1 was not functioning properly because
> the state and PHY settings were incorrect.
> 
> The introduction of the 'force-mode' property in the phy-mtk-tphy driver
> allows for the correct initialization of xhci1 by updating the Device Tree
> settings accordingly.
> 
> [...]

Applied to v6.9-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: add u3port1 for xhci1
      commit: 2cf936800fc1eb22465e43d9d908336630255c3d

Cheers,
Angelo


