Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923C6CF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4t205hYnVTVq+sOwTPy+FUsFAaH3wh5RMknY7nzvIs=; b=boZTnj73UhBGXPo0Jf8+4jBr5L
	vnzEc/3WeeQenjmfYmoQuOg2XvU9reHG28ypxMsr2TvXO4b2dew5u/gb0t1TPQzRz35M+1fdw3u7Z
	K3eaKOTJDf3dl+2zWiNxM2fMky4WUnz6dyQ6P0ZiUCcF5X7TB/NwNX6b1Lw+kV6EeyGrJLCkO8VNF
	LvZnrHmWoM32WZDqhA6Ea9itQpd6AhJvA/lE6lB53i3ZgZrpJDhO1mNl5jiCBphjQotBUvLUY0RCE
	6PKjXG10bNwJqcvROY6zsUB+e66Jpc5wrZEp71vmiyGPf5mv/HSItgdviHIFBdRq4AwDONqlKpgLC
	h3L7Jrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvsp-00000005NN3-1ioE;
	Wed, 02 Oct 2024 09:42:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjg-00000005LfY-3XRe;
	Wed, 02 Oct 2024 09:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861611;
	bh=0S93rWEfjMVEo/fyh9wrlblnAUV4pqcHsyVbNmBMAyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HTH+6koBsK75t6aQ+zf5bJI5k/OlOXavLmRDyCUrfApe+3TH1vWwKeaH0WX0OP5ug
	 37h46lyOOw02nlbnC9gsu7gSLwrZMDWk9ujGi6OAzNl/bZCLcxajsRugQn0foMu4nq
	 fyMYngtlVsOMNgUVPeEBw6d3ylI7CMBQZJclmUvczUU+tP7nbOIAbXdXgrOJ6N/j+s
	 V49naHc2KjJ7GKErNBuMpfY1FYLOnZWTyzHbrkrgsqTSP2V45enx3PmdAe7p5Ndhnx
	 sw9uSfdqp947ZWbD/QXcLXcuCJFey7hwaHSqCV4LJnOgWS0BhDdV2oxZE3Eq5dMqgL
	 VNjj6bkC35nMA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 247DB17E1245;
	Wed,  2 Oct 2024 11:33:31 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20240912154451.3447081-1-treapking@chromium.org>
References: <20240912154451.3447081-1-treapking@chromium.org>
Subject: Re: [PATCH] arm64: dts: mt8192-asurada-spherion: Add Synaptics
 trackpad support
Message-Id: <172786161109.39477.14598458914282754770.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023333_107789_B99533F8 
X-CRM114-Status: UNSURE (   8.58  )
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

On Thu, 12 Sep 2024 23:44:29 +0800, Pin-yen Lin wrote:
> Some spherion variants use Synaptics trackpad at address 0x2c in the
> I2C2 bus with the generic HID-over-i2c driver, and this cannot be
> distinguished from the firmware compatible string.
> 
> Support both trackpads in the same devicetree by moving the trackpad
> pinctrl property to i2c2 and adding the node for Synaptics trackpad.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support
      https://git.kernel.org/mediatek/c/925ebc0c

Cheers,
Angelo



