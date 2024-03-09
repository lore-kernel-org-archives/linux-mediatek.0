Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E967C54798
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Mar 2024 03:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmpoLHITiSMqkgsAsbwGG71zLH6X55Qvd5xRl4vJsKw=; b=aJiiJZTgJGcUpDmdFIYb0Qy+cF
	U8UdmcQGvSzRt4o5uPpwlQ7B9tk7++cb2HDkq0muVuXJhtGoj3dda8gwdoLj1zw8j9ecZFPXHCXk0
	KksWUyyvc9RuwYVqTKI+vH+QT+7uXa+TcelGl8q+Xpk+bn6Pgui8b2et0MbYZAFlkN4KzMfNM6dcZ
	Lx/8AU4e/WMU+H4Y524g5rGamxbVg3mk3OA3XxJjuem5b9lFET5k5JGZZxZlks0G6OtFu7oboVE13
	i9/rUdwh90xXqsnoAZLBNpdUUH9XwYqvZ1tTnPK/hdH2wBRr7VPyN0SzKbyrh90D7+z5JqbjCbWHm
	5dV9CpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rinVo-0000000CIdE-44o0;
	Sat, 09 Mar 2024 03:36:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rinVl-0000000CIc0-3cJF;
	Sat, 09 Mar 2024 03:36:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EF2D6111A;
	Sat,  9 Mar 2024 03:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EE0C433F1;
	Sat,  9 Mar 2024 03:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709955394;
	bh=lLn6OOrz7gmP48Oh35CDpxbACMTCrCw+ctxvAb98+Uk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mqaANVVlKWfUxM9PlxRgsdjRkOrg3Jkc7oPqzWTUbZvx04x/1cYRNF3P+VXIKijag
	 E4NUmiz3bBjfL9lAizdsXBZSmscGMeEp9h/p/sqyzDUFO9oMI9IlBsgjjTwW8cxUfW
	 Kw5IEh9OHXAG47izsjv00pXaK1HY6sgvmsqtujqG1soURdCHj/haDoOXMyCoLSl9Cw
	 VuhPjnL8tjLyINJekqUutnANno5gWdwbSlAnGm/bw5j9PFoctYsCh/24OOL6UTxDxQ
	 rK88cfYz00RLkCkrLWGLDzl8vk0yvOmSnasKC03uvIkTy7lt6avJ5J+mw00rjFtcAn
	 y+NveqC5bUT7g==
Date: Fri, 8 Mar 2024 19:36:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Bc-bocun Chen
 <bc-bocun.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, John
 Crispin <john@phrozen.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Qingfang Deng
 <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: add driver for MediaTek XFI T-PHY
Message-ID: <20240308193632.158b3c42@kernel.org>
In-Reply-To: <ZevJwSq-A43vqO6k@makrotopia.org>
References: <745f8b46f676e94c1a396df8c46aefe0e8b4771c.1707530671.git.daniel@makrotopia.org>
	<3bb95f1d795eede63284dbcb224e06ea6886b421.1707530671.git.daniel@makrotopia.org>
	<ZevJwSq-A43vqO6k@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_193638_300967_49930EBD 
X-CRM114-Status: UNSURE (   8.00  )
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

On Sat, 9 Mar 2024 02:30:25 +0000 Daniel Golle wrote:
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>  
> 
> It's been a month since this patch was posted. Maybe it has somehow
> slipped under the table (or even under the carpet)?

Lots of people in To:, lets direct the question to Vinod? 
Most active generic PHY maintainer according to git, Vinod?

