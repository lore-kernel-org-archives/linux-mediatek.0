Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EA9CF8852
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BMXT1qySlfBTwPHzxMkCNg922NPoFe+hq4k1IIpchM=; b=wQEn+MKTPwguvU1GsLnGGLs4fL
	o/uHHXPe8W07bEYCUNQsvXWefWEEiRELArUlTK3Qm+ZPZs2ZSSDWZYb5yTKohBKHgFB2AdEJOVTsv
	ORyh5fn6ptWZdx9D32GWDhhN4C2YU0SuTOaglMjd4RWeN3Vc4voXxWjHxkDqiUdxGmlw8DJotMdtK
	7wbt2fE4sUF1S7hg7rSYtPNd2ntYtxZS86XWqIHCDA604WDo8MLudRWEUSrTsjcUoN0eiFP256l4Q
	D/3ghajKIJA1aV0qLc02Fo849MteuMjaayiGMcxWZ9ewOGpdca/lSnR6Mm+gESIEUC9CxQgxSQ6/5
	TFNTW0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swr25-0000000ENrs-1TKr;
	Fri, 04 Oct 2024 22:44:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swr0o-0000000ENhL-1GxS;
	Fri, 04 Oct 2024 22:43:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89CF85C5B73;
	Fri,  4 Oct 2024 22:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC26BC4CEC6;
	Fri,  4 Oct 2024 22:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728081781;
	bh=1BMXT1qySlfBTwPHzxMkCNg922NPoFe+hq4k1IIpchM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pKEDZyof2XabtSvvh3focWQGj9C4vtDTvEYtE2/yYpYzb9Z9e4w/57gUHjhleEFLd
	 +S5g/F6fvX04+Dw/0JIRdtaJvlTY9/vmrh2KwlYQXD2nPN7HtDwSfmfeiCkONsuEXJ
	 orF8LJ4FMzDFKF+fE7jvh0Fn1TWiVI0EtNvJ4Yr7LNturnD3RXrkoyeBN4zbQIV88r
	 X5/7JblEWjYgxKSVKxZAjxKG2Xi/ij0YNR+5BXauWNJCzfen3WedkunLsG3CiMUMk4
	 lDlIZTQYoxYO6fr/nEtH9x6tEkVFkunFje7oJRarsRpyecQ3zM2vwNul3lxqT/I8zh
	 D8kQDeHk7x/+Q==
Date: Fri, 4 Oct 2024 15:43:00 -0700
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
Subject: Re: [PATCH net-next 0/9] net: phy: mediatek: Introduce mtk-phy-lib
 which integrates common part of MediaTek's internal ethernet PHYs
Message-ID: <20241004154300.69b30a98@kernel.org>
In-Reply-To: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_154302_419338_B29B6246 
X-CRM114-Status: UNSURE (   6.11  )
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

On Fri, 4 Oct 2024 18:24:04 +0800 Sky Huang wrote:
> Subject: [PATCH net-next 0/9] net: phy: mediatek: Introduce mtk-phy-lib which integrates common part of MediaTek's internal ethernet PHYs

When you repost please shorten this subject.

