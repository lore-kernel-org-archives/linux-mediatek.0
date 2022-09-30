Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4DEC43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 01:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEaeJrZz+3FYUQvFx/XpwotdNezw6UTYFfB51CEFgCw=; b=cvvEk1PXqmWOAUUbPmctVySrSH
	TtUTwFN2fjxq/WLZgG3ex+9dskINT34K/w9dvjvNvRCtGNvy1m9UmnVID8VqSYmX7BLyuM0lu2Zbh
	q7KMgcuqiaRtBPZVycLBSoexH++331JOPurw73gIHespkpZeZYpP/vDNIV/nHkhh+ijaydpqdcL5O
	ESFZBg6kXsDqQwH5C8PmRp/bIxj09XD/9XX7tixQOd1HZ/AH4zVL8h1AlOvkuWF5dHPpRuT5UzKlx
	xI6zbAt7Z5kNyf2sY8X+EOkcxVbmTT3DWlQf0mFYQ9fLgA+ch560zP8k1mjHH2MaI1Hs0b2iynaCU
	pdHcbNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe5AO-006d2l-MG; Fri, 30 Sep 2022 01:50:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe5AE-006czw-0X; Fri, 30 Sep 2022 01:50:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 71C85B826EC;
	Fri, 30 Sep 2022 01:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D83C433D6;
	Fri, 30 Sep 2022 01:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664502601;
	bh=GLXUi5XMqb9SWFsCHSWdY5rauLl8NCQnmgT8/QW7ew4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qzPBI2b8OdPAPM1rPavgrFFu2C3uGkLTrjypl29DiDgI41ll/xIWpMnqHct8Z18+H
	 +A2GnxzqismYXm7jKA3q7YN8Ypc5gsw73oAKuOrEeWzieWodb7SdxDrx/Ocv2Og7mI
	 4ine0SqwKroX91BwdXxtDJq4F5pYJLnnnW0qbXDt+nQtmwlWWaQBlyHlex+/J/UfZy
	 ZqMhv6XwBc70RQMnoKU2J5+IhVuDWeYpD87xAkg5yqRDVhqMP0+mCsnL/JdKdSYr3Z
	 ZH1kufJJ2dmJhbIXPGTfbjdaTv+Rh/xclRAjsJHozB4nHJ1n5FVtZWEgBFBfuZKMwO
	 7eVRNAMTEsVmQ==
Date: Thu, 29 Sep 2022 18:49:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jianguo Zhang <jianguo.zhang@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring
 <robh+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [resend PATCH v6 0/4]  Mediatek ethernet patches for mt8188
Message-ID: <20220929184959.2c1458c1@kernel.org>
In-Reply-To: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
References: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_185006_231702_17D448FE 
X-CRM114-Status: UNSURE (   9.70  )
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

On Wed, 28 Sep 2022 17:23:04 +0800 Jianguo Zhang wrote:
> Jianguo Zhang (4):
>   dt-bindings: net: mediatek-dwmac: add support for mt8188
>   dt-bindings: net: snps,dwmac: add new property snps,clk-csr
>   arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr'
>   net: stmmac: add a parse for new property 'snps,clk-csr'

Are we supposed to drop patch 3 when applying this to net-next?
Do I understand this correctly?

