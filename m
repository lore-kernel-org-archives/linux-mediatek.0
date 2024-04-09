Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B397CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/5D7uxDidmoI3NRj8KaHHD/7jfrbvFYnNMkF+NrNMc=; b=ykUGOyt4pryxPFcPTKiAYndbKR
	3pn9Fk1RUbUVYJPuKSOuF3tv1yfJAB/Hsq7DaXChw3S9ezZcPDq5uHtYZtyJWnz3GYWy3E35koTB6
	MBWQ7wwT+ApaKhZe4K7AIqbAwZFBYy/VAlPoJ8V7JDf8qA8wxAvnqzFbBRQ3iALpl5D2NntwZQNcb
	zm7lQE4yPFTvVNBNNeIkJ3VmGUlNtXL2tLxgAtHUX8gMeKrS/iic3ft53D/ntHzzqNcouDzjqPApN
	9EsTDOrMXGo74R/d4KijB3kbo2Scoi5ZD9ocUIOyG2vyl+mA1tXiJ3yEIoiu8ukvDyg+fOj/X/eJm
	1mSS8RJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAEz-00000001qot-3nxN;
	Tue, 09 Apr 2024 12:06:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAEv-00000001qml-2PsW;
	Tue, 09 Apr 2024 12:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712664372;
	bh=bxete63RC9eyY/F1YbE2OTVoJGEBETCNOX3GFBbDvK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5l1xQQJqk8igiSnjXLbP6ibC/X19GU65q233a+TeWdnpQ5GFllyjsm92UaHhclIg
	 oH9mEwGxGKMte7BHuSvUovqQa6MJ/86KOAopYgQZ9pqIVJPQQ412XTeNANheU5fht9
	 0FQxTkiAxIGI5ZSmLvAACVMugINnJLSUaG4DVYDEHJFyg8wopB2+rs4i55Ev7auu9o
	 zeFyaUqb8nWjh2R1g0xubWZFT5ujcDiDX6Rs+s4sO0UVtb425CdWuaQGhNFIqG8A+o
	 6I2FLmLTus1ttz/OjrXpV3T5NO2HZ8hskT0HuCPPgT1+ErUoc6GgadDTDe5X0OPcQ7
	 /AaTn5cUsusQQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8912E37820F5;
	Tue,  9 Apr 2024 12:06:11 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	William-tw Lin <william-tw.lin@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS
Date: Tue,  9 Apr 2024 14:06:06 +0200
Message-ID: <171266435367.323153.3142211141417575586.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
References: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_050613_832057_CD8A03A4 
X-CRM114-Status: UNSURE (   9.96  )
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

On Wed, 07 Feb 2024 17:42:41 +0000, Daniel Golle wrote:
> The mtk-socinfo driver uses symbols 'soc_device_register' and
> 'soc_device_unregister' which are part of the bus driver for
> System-on-Chip devices.
> 
> Select SOC_BUS to make sure that driver is built and the symbols are
> available.
> 
> [...]

Applied to v6.9-fixes/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS
      commit: 2217fb42a6d0e062b0a11f90fe775651f73ed05f

Cheers,
Angelo


