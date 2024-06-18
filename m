Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFC5C27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwuekO+qO5Vgnrxo0AKsy/m4L+9J3Sf0K7ye3YV/Wt4=; b=As8wbLgDimwor372WCzhT9wYGO
	FXy/ZMxHhqYzcGQ9kl/LQAMSmV32oCrksFeoXe2eWgXpI9vh+RGlZBb34syeK/bCpZH8c+pR+HR1/
	olPSM12a1ngvmrZDTfA3c/rWuuLK07LIimImXjV+v8fERmJeOSsvKHuLM2/s/NigAw8AKYjtlFPrN
	vsL8aeqVlnDXoCx9zLoHCFAlHBhlxP5taS43XymPnup91/6P3WYdH2PH03NDmJYasz6LRe/0mJNyq
	+y8PPSS/AhC5q3/SEMJIj7GsZ4MMusjtU8G9Sdc/CYi8Jx3XYWemaoxnG66RaeFbje94rkKTLnOKo
	Xp0vudkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJaeR-0000000FawF-3ria;
	Tue, 18 Jun 2024 15:21:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJae6-0000000Fapl-1oge;
	Tue, 18 Jun 2024 15:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 507CBCE1B53;
	Tue, 18 Jun 2024 15:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C07C3277B;
	Tue, 18 Jun 2024 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718724072;
	bh=pftZobImKhsOZDGQpcO6l7rtiCtIORxyQekHLEb4TL4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dcJWtPJf3vEj86v2xNuwAcgNgX+rYIaB4a7zu8zFgUJwtPpYlgkTf+mv2C7xQTTuU
	 lqvIzkBWi10sytsNherZxhuDxCp5t2IUftghf/la/fsOvUdEI3g2v4A8CL5Ml+Jd0l
	 Nxp5hWsfHb/v/8/ma6QtA/W0SMraGM2TclONNXOXRfdbqUlqLoIWde+uvzJBdcbb2a
	 Edsb272wNYVU9x6cnnlJhsjZDVOQ6QnfYjRnkU0Q/+ZQLqdK6ckKo9gH1IyqtDuyYA
	 mmDBMU/rCkCokdRrTlZPU7OEQIPkdkuuwnk5U7MrxAvDjeuvZhNu0rdL4rlVfwqCnM
	 2x8/M5bFsgRVw==
Date: Tue, 18 Jun 2024 08:21:11 -0700
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
Subject: Re: [PATCH net-next v7 2/5] net: phy: mediatek: Move LED and
 read/write page helper functions into mtk phy lib
Message-ID: <20240618082111.27d386b6@kernel.org>
In-Reply-To: <20240613104023.13044-3-SkyLake.Huang@mediatek.com>
References: <20240613104023.13044-1-SkyLake.Huang@mediatek.com>
	<20240613104023.13044-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_082134_808741_8F5ADE8E 
X-CRM114-Status: GOOD (  10.27  )
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

On Thu, 13 Jun 2024 18:40:20 +0800 Sky Huang wrote:
> This patch moves mtk-ge-soc.c's LED code into mtk phy lib. We
> can use those helper functions in mtk-ge.c as well. That is to
> say, we have almost the same HW LED controller design in
> mt7530/mt7531/mt7981/mt7988's Giga ethernet phy.
> 
> Also integrate read/write pages into one helper function. They
> are basically the same.

Could you please split this into multiple patches? maybe:
 - change the line wrapping
 - integrate read/write pages into one helper 
 - create mtk-phy-lib.c and mtk.h (pure code move)
 - add support for LEDs to the other SoC

