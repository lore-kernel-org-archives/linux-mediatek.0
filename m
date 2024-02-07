Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC3C4829B
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtEUvONWM++73ohDLBVcrhK1dI5+gJNwDx7rFh/0y3E=; b=TWigA//JG9HRPJKIlh/T5zYvEg
	Mtb0yRJ6I8VRZuc4hGMDs/uNk+V9fjCe1pEFtp0ckghGgbGGRB038yjFz1PBpp7caeBIlKVbHsnNa
	8wRfoZhJPgZfaJ/RS9btSNULo1TYY4Fp/CplC8HbKx/H+JcrSL1AdpXm+BFJ9/2sgjj5OCOZVxK1U
	E/hLzskP2CD5bcOnwpARBwpZYTYcbrQ/JT86vYDJVmFm/MAksGjhsOodx7SxMaNOR/X1iYVGoIMxZ
	E9+HmeS271KZ1wll39sZozk2I7WH9I6nL+1D15MaJixIW+smkb8LGx9UriI9J0I4hphS2qVGJU3wk
	LolVd3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXiUd-0000000Aqsk-2dkl;
	Wed, 07 Feb 2024 14:01:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXiUZ-0000000Aqq8-1yPF;
	Wed, 07 Feb 2024 14:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D5445CE1903;
	Wed,  7 Feb 2024 14:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7FAC43399;
	Wed,  7 Feb 2024 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707314493;
	bh=g3Z88DUNdFcDu+TkPwpM/lXAN8LWu5w+gBGr1EpmKz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JRulxDwtEBTvF/i1yphRDtxYZsJHZ3RoXyDmR0n20YayYd3ONvQFTdgJXhRAxzmGZ
	 gy7IYcUWCGcjxAT9YcYGMYu3IT0be4Xt0Ye8/E/6JxJ7t40YjKGCSgwmQsLaMlHQLs
	 UPWeFhafDy9VRlvQBtYE3hBGYj1aqYQqh+O1WERtnIG+TprXL/ih29DUpbrroPOb6k
	 hJ0KVsG0fgj0CYAQrhScp5mdH3ZpXQTQrWaRIP6osmTy3FZ+VArt5vsPnNB8C2U0Rp
	 YLnhKpBJClH5KwYXXFi52cG1cOhAKb+Lxj9+bfwUGtraZPN26DgOMngx/knYXongCD
	 D8EvOFZVgV+xQ==
From: Vinod Koul <vkoul@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20240111101738.468916-1-jstephan@baylibre.com>
References: <20240111101738.468916-1-jstephan@baylibre.com>
Subject: Re: [PATCH v5 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-Id: <170731448892.147119.12389092200889790020.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 15:01:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_060135_723927_1EBFCC0B 
X-CRM114-Status: UNSURE (   8.46  )
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


On Thu, 11 Jan 2024 11:17:30 +0100, Julien Stephan wrote:
> This is a new driver that supports the MIPI CSI CD-PHY version 0.5
> 
> The number of PHYs depend on the SoC.
> Each PHY can support D-PHY only or CD-PHY configuration.
> The driver supports only D-PHY mode, so CD-PHY
> compatible PHY are configured in D-PHY mode.
> 
> [...]

Applied, thanks!

[2/2] phy: mtk-mipi-csi: add driver for CSI phy
      commit: 673d70cb3c652ad6d97594e03225bbdf20226216

Best regards,
-- 
~Vinod



