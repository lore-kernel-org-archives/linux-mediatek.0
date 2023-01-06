Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE5FC54E76
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 04:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sHGkyA2scdB7whz74zay7o5uIH26hS4CiJFHb+a7xI=; b=XKUj+2IJ/mkz35IT9eo2MdLjIZ
	PCrSyaOQGozdBCK+n2re8+7gnBmP2Ag5hh2pewEikys0WYE0qhNeCYLzPeQZMr+lOx6j7eNvGfONe
	yU83PkLvhGUF2QHlQ5LoJ0ubWLOK37Oy1Sd2cptYwaiQqvBnhiucD/QHti8USxziEYPTNglRsbKlC
	t4d0uq1ofh+/Bmt7RAZNQ4jC0ZE3lIDCPZTa4wyrw1L5i/HsgowSyObVt1dMngRaAktZZYz18/mss
	sSUDOIuudwClCHoSMTuHfs225htlnIK+jm/IKYhtK3s28LU2oFiKb0t4coUsQVupMu507E/ZQgiey
	h2/wgYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDeou-000nbp-AK; Fri, 06 Jan 2023 04:59:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDeoj-000nRw-9P; Fri, 06 Jan 2023 04:58:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6B6261C41;
	Fri,  6 Jan 2023 04:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEDDC433EF;
	Fri,  6 Jan 2023 04:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672981135;
	bh=8sHGkyA2scdB7whz74zay7o5uIH26hS4CiJFHb+a7xI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KyM3m+bYUNtm7WWoBfNdLUfR0iAxcGTNmly5MtGLfIEXH6tHS0RcDyUPzgloFhHS4
	 I5Bobtqnb7DDikiNcMpFK4wTSdKjRYPc5V/pQS7BMm6X+Ksx/onhoTnYmXR0wcdqNg
	 ravEfFPKvazQhXA4E0xht8eu0X7aW4COSklR+nSGP4WPW8ep1RzGxhacw+cx+EqA5p
	 x2m4dVYT0Hclx0Cy5z5QfI/rDntZhuW1oSzdiYDIxSWpryOjCcRYESlpRXM06Off0K
	 vpYS1H8foMGrmxTd+kEnKugBezD0DYt1BTe+DZ4yJ0hzsUMBisKgMKfTTRmFIdStM0
	 n4aD0tk5BFRLA==
Date: Thu, 5 Jan 2023 20:58:53 -0800
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
 <macpaul.lin@mediatek.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH v8 0/2] arm64: dts: mt8195: Add Ethernet controller
Message-ID: <20230105205853.7d86342b@kernel.org>
In-Reply-To: <20230105010712.10116-1-biao.huang@mediatek.com>
References: <20230105010712.10116-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_205857_401090_D5EA8872 
X-CRM114-Status: UNSURE (   9.50  )
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

On Thu, 5 Jan 2023 09:07:10 +0800 Biao Huang wrote:
> Changes in v8:
> 1. add reviewed-by as Andrew's comments.

You don't have to repost just to include review/ack tags.
They are automatically gathered by our patch application tooling
when we apply patches to the tree.

I will take patch 1 to the networking tree, I _think_ patch 2 is
supposed to go via Matthias?

