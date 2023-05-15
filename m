Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D25C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+XyNMlAETg+dR3Oy03ffSYzFpJWsWFCxJlmwho5nuY=; b=J4Hz/aiTdL7YsEdup0hM6qOX3Z
	QfqNMOZkPCmW2j6sIkGNnPPx68wEdaPWeVB6pOVL7UHEQFzSHCQ3iuMSN7zc1ZAmHpG3NGNl2bB1Q
	iae3a1xkL6K8e8I/NS/SDI/+g9MkmX7vdtdBCsG7+ynGM6WwcbSa+oPNBQMLoHDmQdoyXgrCsizou
	oBz6JcGofGLiq0YSb9G4HtJDsLEE9FOcgGC3rpd8YbD1jnwvxohICMuQKXInguCL4NbVt3PJVMHwU
	cGv/XQ2YmK7POq/FwTxEfzYlhEiEbAENdu2zztbKrfkljS8O3F8w3wtnX4JJD857VxQ79/v64ZcDp
	/3igURcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyeJ6-003LUC-2z;
	Mon, 15 May 2023 19:56:32 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyeIz-003LOl-2e;
	Mon, 15 May 2023 19:56:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-965ac4dd11bso2642356366b.2;
        Mon, 15 May 2023 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684180580; x=1686772580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C+XyNMlAETg+dR3Oy03ffSYzFpJWsWFCxJlmwho5nuY=;
        b=CYZSny1QI7fCwdUCHviYVtHoqUKOzpK+e2NFy1X/SbXEWI75v7qaSOzixaKdj2wkIT
         DpwtHIkI1ILrC56vo/+shvobpuXyPiVMDR8K9CagTBIUftXKl9Wube1A1KUWW5ZtdO7f
         fl4e3xiRh/2fAiKFCM/XX5WDPJuI2xcWcj7njNLLtvagqTVEAkrKQHI9MJ+3980b5nnL
         XQNtZ+kMnAo7/nlLLVaZ6uxoeyY+MgpR0qYdbbqGTHccFNUen3Ovlw9iNDrmgqfy5Q9u
         kG3SlfBcDodIvlOE1AykUooxhqDFoTkUxi5z6JgQqID3ttOY8LUZgoaxMx8WXrN3B6pQ
         DgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684180580; x=1686772580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+XyNMlAETg+dR3Oy03ffSYzFpJWsWFCxJlmwho5nuY=;
        b=Lm83BdscEArxB6InO0Sx9+D99GAbpkiy3Pzle0vnJd89cFG9htGPWkb+ZIk9OqizYI
         8LwRQ78VGzG6PPctgLd85v7D+MmQdGXWW94q2eMfk6jAN4lNHqfMKJ4BfAY8Whp2H8On
         gFYGe0lEFswdAoqzGJJjtkPd6g4FB+TI4WSnBdGoGgXBTR5dJ8k21Orot6IFtCPtUgdj
         4051U6JnMlcA6Cy8ktEA3pPfvob+JM52Wh2nlCxjc0GaOPqxRQxUnIS5ntDblCGxxq9+
         qn4EQB7SFVnJXGE6GfqoCwlWzmv4vhah244i3o4SgOsY4vBkyyk57KiA12tfFc+Z3Faq
         FGAg==
X-Gm-Message-State: AC+VfDxs/qwOD2SVzDF5l2Z1JdvrmjxstrOxeVFQetklHgz1ja3xsQS0
	epMzAsGvC37h6nGsSe8UK2M=
X-Google-Smtp-Source: ACHHUZ5Kze+PqMpF282DHjtxjRicRfGuHPl9XdDUyiPnJ8JCMhXoquCk8nP+oGKjyTsyVtdTzZG57Q==
X-Received: by 2002:a17:907:2da9:b0:94f:247d:44d2 with SMTP id gt41-20020a1709072da900b0094f247d44d2mr32695380ejc.5.1684180579593;
        Mon, 15 May 2023 12:56:19 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id s1-20020a1709070b2100b0096a16761ab4sm8570364ejl.144.2023.05.15.12.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 12:56:19 -0700 (PDT)
Date: Mon, 15 May 2023 22:56:16 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Marcin Wojtas <mw@semihalf.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC] Providing a helper for PCS inband negotiation
Message-ID: <20230515195616.uwg62f7hw47mktfu@skbuf>
References: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_125625_857162_3957C285 
X-CRM114-Status: GOOD (  11.76  )
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

Hello,

On Mon, May 15, 2023 at 01:22:50PM +0100, Russell King (Oracle) wrote:
> 1. Should 10GBASE-KR be included in the SGMII et.al. case in the code?
>    Any other interface modes that should be there? Obviously,
>    PHYLINK_PCS_NEG_NONE is not correct for 10GBASE-KR since it does use
>    inband AN. Does it make sense for the user to disable inband AN for
>    10GBASE-KR? If so, maybe it should be under the 1000base-X case.

What physical process (reference to IEEE 802.3 clause is fine) would be
controlled by the phylink_pcs_neg_mode() function for the so-called
10GBASE-KR phy-mode?

