Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515E9D374A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8M8MUwyTxN+J+oz/kf34J9IaAKfFHxAPp2e1o9+Qmzw=; b=0ILYxbkX6sfe5KEu2RwWnfUzG/
	P0+pingsKq81W6z9ioH1q7fHxiBOFnTtO7lz/RYTYmATZbEK+xryQ4Mra93p9Oau2OTDeDzuKRx5P
	EkF3dHf6f1N5OKq6IJsJ9TNoIwSyF5GWlAO4VMAEM17t5OqW/nN2xwsgJTEon2Qhe8kZ5KqB6CCmU
	uYA0fNzOk5PTP6PSqNx4rT70+sHi2pWYK0aP/2ByznE90YhXzb+1d27uHZg3H6Xqm3Km9Tii4ANYv
	3M3oRaZLc2vfC6EP1aIi5ILYVQSojcxfy0xJtfkBWfT4V5UR67noFtbGcR5feEJqKTGmypobzp7wi
	YDuJa9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RQ4-0000000F6NA-1GxE;
	Thu, 17 Oct 2024 14:24:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RM8-0000000F5dp-0xb8;
	Thu, 17 Oct 2024 14:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 464215C5A4C;
	Thu, 17 Oct 2024 14:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42969C4CEC3;
	Thu, 17 Oct 2024 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729174799;
	bh=dgAWsGv9y58h9ooyR9zbl/FfGLR8dAyl+LlCxHpse6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsRsfTdQZzaXZxB/Xc9T4upHZgJ0ERByj7F60SeY8LkmC1BGL+WvhOGgkl1EUcIfs
	 8t/ALceDwrMsyz3j7TFn42QWH9wd4EzeWydEHVSgos7agEMZyL6M/Ybynjylw/vh9v
	 ZOFCnkV3a5gh7VtZoABm424C1QI58Zpab8cjpXVCLmnqf429PvHgJRPGJ/i0UdU76i
	 xDPy0ZPDZir/BsJZ5TlrMOd7oTZctb6KriTjKY89Pw4XX//HnEYiCUJ/+nd9ZFnHHx
	 di6WxoxnCWiZi73sj687qZypmFVCy7xJOu+pjV0rB7hBzOKsRrqoBwPGLr8cyIe6Sv
	 ebOAwZtmcoOQA==
Date: Thu, 17 Oct 2024 15:19:54 +0100
From: Simon Horman <horms@kernel.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek-ge-soc: Propagate
 error code correctly in cal_cycle()
Message-ID: <20241017141954.GR1697@kernel.org>
References: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
 <20241017032213.22256-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017032213.22256-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_072000_346441_81ADBEE6 
X-CRM114-Status: UNSURE (   8.57  )
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

On Thu, Oct 17, 2024 at 11:22:13AM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch propagates error code correctly in cal_cycle()
> and improve with FIELD_GET().
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Simon Horman <horms@kernel.org>


