Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F2AC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fpWJyh6d73SY7L5CvgXsZhXEOeP3iCkwduSv7x9h+8=; b=Po/noVpv73k4QhpZWTzW8zsSqL
	d04q41Y8dkEFALpV++XKY6ZZq5JZFDFCsDF6IvCDqp9GpoJwcb8f3cvj44/X06Nu0SEysSNSKer2c
	sMCH0KbNRtEtkZtUNPfYEiRfUsic2OoH6GP1LkjNjSaZgUjfXZPUAcxkaGHHxVqTw0zbX0uLop8Ub
	e46GhIiSS5L4WcMG+QPmL7SatoUryu/NtLTyg2LEeV9mVMrdIvTCqOtRbb2YKgPuBsetlnNN85TUG
	rY9Thdcu4yJkgql6uORedX2n2leol7RUN3WGE3nPxIZEWe++gN5wgNuEY39ckcawhDrPZOw/O1X+8
	hDnH+G2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82yP-00000008nKJ-2RIF;
	Fri, 17 May 2024 19:10:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82yL-00000008nIV-3KEs;
	Fri, 17 May 2024 19:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7263FCE1B8C;
	Fri, 17 May 2024 19:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28112C2BD10;
	Fri, 17 May 2024 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715973026;
	bh=wOOGkoKGvagnGIuFGWUQi+/XM0qoo+nYaSgD8aHlsL0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gYHVe5SCP6vA21VjqimT/TCTDdevm3GBnC0jNIcGMi4NC0y534bpkezsXTWFHIQ3x
	 tHdW1E6UrATEXk2Sv699qrRPCF4xTRlt5Msr8tlu2hE7CeL3FejaF5YEgs7hF1Siat
	 /RiHSin+ADfp0NALuswp/5/Fq58sS7X8dL7vmCkdtJUq/3Ce4suEhjozC3GaXWE/wH
	 kyjdYfHG55mCJZI89RTY9YW8iWjv2vPsGvYRpHd3NTf9mXtgmUa7kJdzyvO18rfp7V
	 v7GUKyzk55Ah2Ef8TfaC4hT/xtxyA6MPvykOEVQjsrupvIytHl+zSNbgmK9Re2SmUS
	 HnZDnpUFtHbnA==
Date: Fri, 17 May 2024 12:10:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng
 <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 0/5] net: phy: mediatek: Introduce
 mtk-phy-lib and add 2.5Gphy support
Message-ID: <20240517121025.42b76cb4@kernel.org>
In-Reply-To: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
References: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_121030_094881_354A7318 
X-CRM114-Status: UNSURE (   7.92  )
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

On Fri, 17 May 2024 18:29:03 +0800 Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Re-organize MTK ethernet phy drivers and integrate common manipulations
> into mtk-phy-lib. Also, add support for build-in 2.5Gphy on MT7988.

## Form letter - net-next-closed

The merge window for v6.10 has begun and we have already posted our pull
request. Therefore net-next is closed for new drivers, features, code
refactoring and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after May 26th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer


