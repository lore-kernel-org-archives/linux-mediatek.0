Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A315EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 01:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KASIAk7lweb31z7JMcQMtrMqziJu11LwdBMNbKMfGC4=; b=2ELCkIzb0uC9Ew
	yl0ywI+agJfx2pAwTpgYVWnw863jPxNeqFx1muKrQqy6C6bBYMUa+Y0QtzcMMk6sapHnNZLQ5MGY/
	+S2nnbHWxNKcz8b9aRKjF1ShkKQ5PHRQoa0K82Jo1qUKlBDtGn2Szzi8ReMss2drMNjc/7jXmrNUF
	6ZIlHINL2UrRKtANwAeVP17qWc7HMdmqse9dx+P1TpTejJlZQbkjnluhx0dWgPfRfSZC+3lvk4OaB
	t6STYKm3vj0YTlhkX7obJYXFGxlBh6QDNk5CojqCy0Z5/n5zbToPMNH1UVlq/eD0nHOez3S1EnnfH
	fNN3sK9VVNwcF9XCmDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCAMG-005wpH-DF; Tue, 25 Jan 2022 01:10:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCAM2-005wn2-Ol; Tue, 25 Jan 2022 01:10:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73D92B810A8;
 Tue, 25 Jan 2022 01:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F27BC340E4;
 Tue, 25 Jan 2022 01:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643073036;
 bh=w0sNNSOpkifO6hGy+QE+n1Pgw1k19GJC6mxvBdgAXY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MzJYxMuT78+EAeSOgcV1O9EAYeDkr2NnhL6hJ3Dt3qYeAyx+7N10KxGPbAsRYBs76
 Z+aL1rSCS/I9q/LixyDPSehwZiUcljKxYBngiExdaDvAVholx6ylfZVbdUNbH5MQL0
 DEkiehIwrKUneytLd0SlMBcjyyjnuxBHSG8tmtW9Yw2Whbr5fP+OY9vDKgCpxr4USX
 SMTrNXEEFI0a7wj65nJNEy3hkp6DPHNAvG1jxNGxyVV+v/SaPmr8RBTKfgrdurIDT8
 b1vmE+WUXBrLrm+5JC7k2HJMZQEd8VLM/mJqw5uN3dFkkogM00ewjSVdAypDbtLzFk
 TUl3W2rtfAg5A==
Date: Mon, 24 Jan 2022 17:10:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Doug Berger <opendmb@gmail.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bryan Whitehead
 <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, Byungho An
 <bh74.an@samsung.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] net: dsa|ethernet: use bool values to pass bool param
 of phy_init_eee
Message-ID: <20220124171034.764bbf5e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220123152241.1480-1-jszhang@kernel.org>
References: <20220123152241.1480-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_171038_979201_61460E48 
X-CRM114-Status: UNSURE (   8.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 23 Jan 2022 23:22:41 +0800 Jisheng Zhang wrote:
> The 2nd param of phy_init_eee(): clk_stop_enable is a bool param, use
> true or false instead of 1/0.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
