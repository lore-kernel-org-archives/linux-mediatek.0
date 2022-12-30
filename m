Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E5EC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 01:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0SAOOdPulApbGsb6HLxTrQaVjqc+oYc7ktI8GKIDc4=; b=O5edseA6X/mf3NZ7PHu3P/R41k
	vNspZSLrSwc/1z3tIEzpz8+vhpwi1Hljd92yrDCGJeHhVe5Eti6F8ta327ktcqRiOkQYuoDS8Ctu1
	JCsdcAzuO/6mWTc4DEIAEDnTQO0q8+SFf82iCpnyNmpdrBj148AaOJREAitDnKaNZZTBvO6FRnHGV
	avR3W9bitRxa2Il4fW3fKThqb77ppaviBRtx7W2Ifj8uXfQUT5MoViHVlggtQEi5OF9J+S3g/kNdV
	UoOO0oXsJDlPcRz7e8822hyODgsNWIyN4/BGSBgS+sjjPcCfjvxvarCk3kZNL1LDOe6kTHm/fIwQ+
	SA90GG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB409-003zJn-AP; Fri, 30 Dec 2022 01:16:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB3zi-003z91-VE; Fri, 30 Dec 2022 01:15:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56F3D61A0C;
	Fri, 30 Dec 2022 01:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5A1C433D2;
	Fri, 30 Dec 2022 01:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672362929;
	bh=McTqHvRN41xTwEv99dreqL22zrTU3o6TLQAedEBl+9Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JXIK0oV7z1wgRm9u7ktIkrBFaN6psz8iJqLOfPIofVJjOgtOeaxcZrmZsQWho4N7S
	 ZZhWlqzUXgKWpBeVoRGylUrqtnboVLd3TyEcF0MvsXio+te+GkbQ31X7/lxb4V3sTG
	 6UOkk/yrhXwNMAYBheVZyF2iTsYKMWhRqLqgKut+rM+yPaIrxOdmx1hxF6QvNT1JRn
	 2urMttcMWn11M/quHLlEIRCX0PJpwYc6zHdYRX6o2oW/jyiiOZYXAELi0VGUOIYZJ9
	 HwgCWYmA8kmXmRbOKKORl3OIpyQ5QMuD85+lC2S7hnTa88BV0N/yNJ1jDLMhLB13On
	 Xrav6WbVoW5qg==
Date: Thu, 29 Dec 2022 17:15:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v6 0/2] arm64: dts: mt8195: Add Ethernet controller
Message-ID: <20221229171528.510b7a37@kernel.org>
In-Reply-To: <20221228063331.10756-1-biao.huang@mediatek.com>
References: <20221228063331.10756-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_171535_110978_DAD3FBAF 
X-CRM114-Status: GOOD (  12.86  )
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

On Wed, 28 Dec 2022 14:33:28 +0800 Biao Huang wrote:
> Changes in v6:
> 1. add reviewed-by as Angelo's comments
> 2. remove fix_mac_speed in driver as Andrew's comments.
> 
> Changes in v5:
> 1. reorder the clocks as Angelo's comments
> 2. add a driver patch to fix rgmii-id issue, then we can
> use a ususal way rgmii/rgmii-id as Andrew's comments.
> 
> Changes in v4:
> 1. remove {address,size}-cells = <0> to avoid warning as Angelo's feedback.
> 2. Add reviewd-by as Angelo's comments.
> 
> Changes in v3:
> 1. move stmmac-axi-config, rx-queues-config, tx-queues-configs inside ethernet
> node as Angelo's comments.
> 2. add {address,size}-cells = <0> in ethernet node as Angelo's comments.
> 
> Changes in v2:
> 1. modify pinctrl node used by ethernet to match rules in pinctrl-mt8195.yaml,
> which is pointed by Krzysztof.
> 2. remove "mac-address" property in ethernet node as comments of Krzysztof.

Please make sure to CC netdev@ on the next version of the patches.

