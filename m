Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFD3C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoKI1oN7NuMqVexF+ImYK1Yr93HuS7hH703NEwUH7G0=; b=pSQASU3HeJKopNuNj21+fE69fX
	CC0rmXvNBV54WT21NF8Jlb3T0677XFkFd9gNfL33+vCO+IKhYxn4qEZLRGyQ5X3dY/YBy+Uqnyuxx
	ENB0K3Do/AMwfBqt3EajfFhN+d9guliWUZBoo1nkW8R3SaJMDkwOrwCqCVuQUyq5EDaUN76BGd6H5
	XYlYhb3guzXSD2KtuE9n4GuJxnOmR0P03iXKIQacED6g5gEp53wpmt46ycv5M0ylrm93ZF+XbkKt9
	xDcKG1VuW1LoCUGH0XN+9SdLEeqbyimaWvWH6XeHOVqbIMH4s4IFMOxzaC4UPvkcbpdsb/EUkTRjD
	xGQS5LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKb2-00000003bGW-2LoR;
	Thu, 21 Mar 2024 15:44:48 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKaz-00000003bCK-0Rsa;
	Thu, 21 Mar 2024 15:44:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rnKai-0007eQ-2t;
	Thu, 21 Mar 2024 15:44:29 +0000
Date: Thu, 21 Mar 2024 15:44:25 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: add driver for MediaTek XFI T-PHY
Message-ID: <ZfxV2c-JBCFrpSRV@makrotopia.org>
References: <745f8b46f676e94c1a396df8c46aefe0e8b4771c.1707530671.git.daniel@makrotopia.org>
 <3bb95f1d795eede63284dbcb224e06ea6886b421.1707530671.git.daniel@makrotopia.org>
 <ZevJwSq-A43vqO6k@makrotopia.org>
 <20240308193632.158b3c42@kernel.org>
 <Ze3j-7WzbTM52kAs@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ze3j-7WzbTM52kAs@matsya>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_084445_172635_E0E06F31 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Vinod,

On Sun, Mar 10, 2024 at 10:16:51PM +0530, Vinod Koul wrote:
> On 08-03-24, 19:36, Jakub Kicinski wrote:
> > On Sat, 9 Mar 2024 02:30:25 +0000 Daniel Golle wrote:
> > > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>  
> > > 
> > > It's been a month since this patch was posted. Maybe it has somehow
> > > slipped under the table (or even under the carpet)?
> 
> Nope, somehow I dont have this in inbox, i think i have some issues with
> gmail and list server,

The series can be found here, just in case:

https://patchwork.kernel.org/project/linux-phy/list/?series=824861

> 
> > Lots of people in To:, lets direct the question to Vinod? 
> > Most active generic PHY maintainer according to git, Vinod?
> 
> thanks for letting me know...
> I will review it in next few days (pulled it from lore using b4)

It'd be great if you can take a look and maybe merge this so
we can proceed adding support for MT7988.

Thank you!

