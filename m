Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B31C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 01:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8S+2+1FZWy59YIIbl64G7IjD9qpeWhTPs6TR1Ry090=; b=IaUxHmvvs/JuI3LH9rcxqI0iwO
	Z34O7snjXiS5j5EyO2xhlnTZQ4i42FwEXvnBKN2bth3SqfFNqt1ijyQxtERb7eVT0XxBt1j7TOabW
	JgmY7GtZNGLYySJitU2NF1Me9OMTp/a5nz4M7eJxTujTfsV1on6jyQlS7TwOU8j3EhGPUTnltYFhF
	lCBiqh5RXOQh1GUo/HptmnInaPYL0ctVEIr+Vtl5dGWL4mWpwwIS0KHN2RrbsJBTabcYvzZND9/nG
	NmnE3QfTv9l1mEuZOo7cRHdT7DH+j2Kwk3XYOHM/U/wKpqG2OKlDDKRmbXEvd0ucqe6xWfYAtnIO1
	1qhnTUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAhOI-00A9cG-4t; Thu, 29 Dec 2022 01:07:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAhOB-00A9XE-Jt; Thu, 29 Dec 2022 01:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=r8S+2+1FZWy59YIIbl64G7IjD9qpeWhTPs6TR1Ry090=; b=PrYXOeC2KTiyVJl1ncrgb5e2n9
	aX7JdiJWT9iNn94I2vPz0MbPgd+ig0r5W2+4YEHFKJMcVc9lre2J54J3zVARIbGZTpyOXif5uI4Fl
	+NsW9hFZ5j7BJ7xNL8zimTGiUlPv2C/t7e1f68d23HcRLKxHYI+H06LgHRIECZcByhAg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pAhNb-000g1W-1R; Thu, 29 Dec 2022 02:06:43 +0100
Date: Thu, 29 Dec 2022 02:06:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang =?utf-8?B?KOm7hOW9qik=?= <Biao.Huang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
	"joabreu@synopsys.com" <joabreu@synopsys.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mt8195: Add Ethernet controller
Message-ID: <Y6zoI3XYnFFbN/Z5@lunn.ch>
References: <20221228063331.10756-1-biao.huang@mediatek.com>
 <20221228063331.10756-3-biao.huang@mediatek.com>
 <Y6xrNAyvJhP22RdF@lunn.ch>
 <a3959ffb49cd8ab2f3b0fad5149c222b08fc2032.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3959ffb49cd8ab2f3b0fad5149c222b08fc2032.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_170720_995686_BAB7D74A 
X-CRM114-Status: GOOD (  10.60  )
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

> > Is the PHY integrated into the SoC, or on the board?
> The PHY is on the board, an external device as to SoC.
> >
> > You also don't need the compatible, if the PHY correctly implements
> > the ID registers.
> But without the compatible, it seems PHY driver will not be attached.
> How should I do? Thanks in advance.

Check what happens in mdiobus_scan() and get_phy_device(). When it
reads registers 2 and 3, does it get valid ID register contents?

      Andrew

