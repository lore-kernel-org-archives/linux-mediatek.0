Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D768C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LdeuY+e/T9WOXCdLkw4buWi1oj7w18iD+IE+GeLMYY=; b=sOCF2rT73yNDPW
	hwCzuPvDnaNDOImNNxKrff303hCSGlDQoOU8thtrUkKo6B29MiShKYUkTD0YucQMPcgk8CvuiZGFM
	Y0asdVdYZWzYgOY/tYHxtrSxgTBROLo/F2G3Pg791jZLX26Pdr2FpctHE+3xb418I40/zFliG4skL
	83XPouvclwekHoDQQ0UodyoW+1Nm3GhB/BuRHIiK+kjj10IzLdgQycfRHkDX7V4EhQTNtg6GwR0nY
	eoeYqtJekPEcupYW46l/AzY4AbcBz8xNv6wQ1Icv/eqEAqXRpFf5S+IPUx7vI9bHWyTOFZgzC6G+n
	LlVmFt/g6tM/42mavSHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn1x5-004YYr-Nj; Fri, 06 May 2022 17:41:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn1x3-004YY5-Pl
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 17:41:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84240B83882;
 Fri,  6 May 2022 17:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB73DC385A8;
 Fri,  6 May 2022 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651858871;
 bh=jUYORx95YRDHeeeY52LGlWTfTnt6ibLZ3gg1qG+EM6Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nkgizYeSWtOn1Z5SUsUMNTGLs/CEpROMfjVLnZQgz3A5UUaTbbRDtmCvbcM84K5AG
 +qgS9SuMNK3F7zi/Bb/Hdy5Eg1oV/7XWmCvzy0mDyrxweaR/Uw1e38byTQj63/tdSM
 copVMXd1Zrm5Uq+g9tR0CxhB8ya47FWgEiIQ/ONT50PEWMJDGuvi6tguIXSsyajpvo
 8lzQp0t68xkzVp3KD46OH0QmaEPbcwIqhz/rSjSBKUSlnH922vhnOCf6i7GcxqUpRa
 gm19BJ45d/KvfTKIUr5PZq9MbFiFQMJPFdBxY3bKYqhSG2yHLYlfSPAxwDetJJoXY6
 y+fRck3Xynmtg==
Date: Fri, 6 May 2022 10:41:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: Re: [PATCH net-next 11/14] net: ethernet: mtk_eth_soc: add SRAM soc
 capability
Message-ID: <20220506104109.63388e33@kernel.org>
In-Reply-To: <97298a5aeaa7498893a46103de929d0a7df26e8a.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
 <97298a5aeaa7498893a46103de929d0a7df26e8a.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_104114_023858_1359C00F 
X-CRM114-Status: UNSURE (   7.22  )
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

On Fri,  6 May 2022 14:30:28 +0200 Lorenzo Bianconi wrote:
> Introduce SRAM capability for devices that relies on SRAM memory
> for DMA descriptors.
> This is a preliminary patch to add mt7986 ethernet support.

sparse says boo. I think you dropped an __iomem somewhere.

Please heed the 24h rule.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
