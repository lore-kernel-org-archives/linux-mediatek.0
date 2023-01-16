Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4D4C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wex/E6ADFcsrQWYTNlA0xrKfTIWSKEBPY4LIi/xz/m4=; b=Np0YV3cJ51QuUQheumE7IidiQ7
	qu6NEdpPP9U4QmqkGixTylPlCiMQ3b7qoSmcfhXzU8l/XO+e/EW/owJCOq4cn33ixOJWEDmyOPgKp
	2pKSMfnLEIJ1oSP40a+H2yBLFx2jw//z2lwCBDshdr4N0fc3yepTBiL/EXYYrCTDAya8Sj9nuiSpw
	yej+g7sKD+nRpCh72x8uH8j9vvcuKXkkMuU484ktLRdj8X09l2NRHSezZkOQwy2QOJIrm43hB00jc
	rAXL3aejXcS9cDAddNR42ET6OPWm2/Jj2yt4ApbJd3SHs9PyZtgZmcMXxxiHVVQM7+lhTs6v9sMk5
	NxwVMgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKHu-0093xZ-L4; Mon, 16 Jan 2023 07:52:14 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKHj-0093v5-FB; Mon, 16 Jan 2023 07:52:04 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 13D06B8B;
	Mon, 16 Jan 2023 08:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673855516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wex/E6ADFcsrQWYTNlA0xrKfTIWSKEBPY4LIi/xz/m4=;
	b=gvFMHaDms+nw59CSILYnAkCxJenNCQWr8lE3DeHdKlcmYNCeRTEiSZg8NL/YT27hks8eVM
	3M90hSRPSzkdi4xbr2cE/muF4A1OLTrsC3p9OyihQEspNjRTBuKeJui2F2W1Usz155OazF
	d4QTJ6fYpzWMIDU735/fsaVnkmUPGTK017U8u+WKMuUxzCBUvFZ2qA9DLBlyrl3HMsORW5
	xbW7BsYEVfujReNcbKKw3NFU3VsvSYT1zngjoNPuhAzUtV/TcmjAN/Ka/wsGIQWYAz7P0e
	/uI69FttYFKwZ+CXZi8PnHLaEH4dGoxKW5gLOpRdlHF4/JnJQfAzHOhTOFoUZw==
MIME-Version: 1.0
Date: Mon, 16 Jan 2023 08:51:55 +0100
From: Michael Walle <michael@walle.cc>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu
 <Jose.Abreu@synopsys.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang
 <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Luiz Angelo Daros de Luca
 <luizluca@gmail.com>
Subject: Re: [PATCH RFC net-next v2 11/12] net: dsa: Separate C22 and C45 MDIO
 bus transaction methods
In-Reply-To: <20230103155633.tfdxncl75s4tb2ln@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-11-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-11-ddb37710e5a7@walle.cc>
 <20230103153134.utalc6kw3l34dp4s@skbuf> <Y7ROa8ql9R5SHPsK@lunn.ch>
 <20230103155633.tfdxncl75s4tb2ln@skbuf>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6208c429b0b5541a4f6d2a8556ae1fcb@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_235203_709591_DC2059AF 
X-CRM114-Status: UNSURE (   7.53  )
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

Hi,

Am 2023-01-03 16:56, schrieb Vladimir Oltean:
>> So Luiz patches may allow a C45 bus, but are there any drivers today
>> actually using it?
> 
> I sent a private email to Luiz a few minutes ago asking him to confirm.

Any news here? Do we need the c45 methods?

-michael

