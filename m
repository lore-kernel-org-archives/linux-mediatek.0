Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCA2C47DD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 17:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWnT5S4Q6XzDJBRpEknqgOW0ZyLDPeI6kyNoprab2vM=; b=SbOzsEAggvXBgoaBNDHgzAIJgs
	9Dd16B4HJhXCNozKq8TrChBacFdtWzcG6z7R2vtPhAzpprhT/E4xGJHKeSiHjX4GdCDUdc0DKoia3
	PSEBMNb1NN1tZY+chCXTi0QrD5Y2i6ulXl4lVVnrzqRU5DwnGsCNtAvdBMBLHvovjwpzTBS8ZYjG8
	UJUYrltwKHPspXqJoQWzEcL4iFmzXSAhNu9x+I+fLEnk3+uo48Rw5zQPNnvPr7izmTVRgcTStxkp1
	16ADOm+/tvRCLSYpXvz9M4tIv1qeW3GGCh53ew6KiOOxzgL1o12YxwsiFevHNEbEIgRqbqSnDkUoK
	hMIsawZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyBp-00DFqL-0V;
	Mon, 22 Jan 2024 17:34:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyBl-00DFnb-1O;
	Mon, 22 Jan 2024 17:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GWnT5S4Q6XzDJBRpEknqgOW0ZyLDPeI6kyNoprab2vM=; b=eWTa4QXyrVBO656lSz5cMMLRyy
	R6pDqNNQj8yI9pfktmlDM2dJvaXnLVSst2pNMmm5eqxhxxmJB6x0wkoNQ+gbkAv7EUL0MdozU8Qee
	H1SFbw/Y7JnA/iHu0f0//49u9J+NQqQBDQ1snFjFX75fyr78iZfOqRF5I7QNEGvK19So=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRyBY-005kSZ-AZ; Mon, 22 Jan 2024 18:34:12 +0100
Date: Mon, 22 Jan 2024 18:34:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Praveenkumar I <ipkumar@codeaurora.org>,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH 5/8] clk: qcom: support for duplicate freq in RCG2 freq
 table
Message-ID: <b84df52a-f144-4ec3-b81b-20d1a0176aff@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <28cca132-d5bb-4cff-ba2f-9be241a5ce83@lunn.ch>
 <TYZPR01MB55565998F43009AD351AC07EC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55565998F43009AD351AC07EC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_093426_020187_E7A74C74 
X-CRM114-Status: GOOD (  18.86  )
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

> > > Change-Id: I97d9e1b55d8f3ee095f6f01729af527ba90e50e5
> > > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> > > (cherry picked from commit 775e7d3b69ffc97afb5bd5a6c9c423f2f4d8a0b2)
> > > Signed-off-by: Praveenkumar I <ipkumar@codeaurora.org>
> > > 
> > > Change-Id: If10193fc79a3c1375ab73597813745ff1f4df0ad
> > > 
> > > Pick from https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/6dfb368bae130bee58e00ddf8330b55066e1c8c5
> > > 
> > > Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> > 
> > Please clean up these tags. These Change-ID tags are meaningless in
> > mainline. 775e7d3b69ffc97afb5bd5a6c9c423f2f4d8a0b2 is not in mainline
> > either. The picked from might be interesting, but please put it into
> > the body of the commit message, not mixed in with the tags.
> > 
> > Who actually wrote this patch? The first Signed-off-by: is from
> > Abhishek Sahu. But you have a From of Praveenkumar I ?
> 
> I have no idea about this. This patch is from Qualcomm vendor linux code.

O.K. Since this is direct from the vendor, who probably does not track
code authorship correctly, i would say the author in git is probably
wrong. I would set the author: to Abhishek Sahu <absahu@codeaurora.org>.

> What's more, I don't known how to deal with these commit message since I'm
> not the author and I'm not sure do I have right to edit them even though
> this is GPL code.

You should keep all the Signed-off-by, in the order they are. But the
Change-Id is meaningless, so there is no problem removing them.

	  Andrew

