Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B983DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8azhht/F9LF5brXIUzZgIU7U6M8TR+V9WxIp/eSIcbc=; b=EiTy2DwIcLDoTN0Ap7QNi6VRWa
	8/roNvehBRY1uAtX6yyKnAV4o09C76pVpD85HpWjkvuYKBLHOxi95lSU+B3/QNOt2CXwMCpyfeAQw
	emlcpSMW3kligPjRg/jDyw6TuX03yfC7OooMti0G9Al7MV7OmO7qPJSerrwnDN0tB33DrBPHJt7Oz
	pY6ztA37LO5tWy+Z2Gf99c29Sf0Y+vsRy/d7coT2Iq9naMo9Ato5A8RmnjMiAd1gbWsysRNlMCC4w
	AGknEAkL5do7MMpxKGuE/OlDprVQi5wV3eeaA0DyPBKLWkQUU6qRAvHj4aUtzHHbUWoLFpsddSnN7
	oK0ap4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvH0X-00FfMU-TW; Thu, 09 Dec 2021 10:50:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvH0L-00FfJN-Rg; Thu, 09 Dec 2021 10:50:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4A65E1F4669E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639047023; bh=jpV2faF9STe0Dya2ebi8w8EQUm8n1ukAxXF7F9Yrrs8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AXOqV41vE8eCmDRtOEz3SChd6H81t0HFy6zOo3cyocR398C6rjX7ciwPGav50Aa/u
 RbvtaZancKo031NhFYGsCbV2Jr7OfdDylbPPamsyizxPEPThrtXluyl/XQtKvrgy+G
 W2dIIonE67L9TD7EC3p9Wns/UMK4TtBDpMHpJwom6Db6ySw60Mtol2ceEIafEhP+x5
 ms2ztLK1WEYz//gdYeCdHxvKw09r5erQ6yfR6VfGen0l4qN019ugn3axQuH9qtwJPP
 RW5OTS8I8wgl/kgbQqVq7Z6fWHzowFs2pB2NalPIN4i02bBH6vyeRG7oalc4wa2QZU
 r2bhthL8txXtw==
Subject: Re: [PATCH net-next v6 1/6] stmmac: dwmac-mediatek: add platform
 level clocks management
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com, dkirjanov@suse.de
References: <20211208030354.31877-1-biao.huang@mediatek.com>
 <20211208030354.31877-2-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <327a3c2f-505b-5b85-30f6-99556b96cfa5@collabora.com>
Date: Thu, 9 Dec 2021 11:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208030354.31877-2-biao.huang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_025026_106416_2742EA82 
X-CRM114-Status: UNSURE (   7.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/12/21 04:03, Biao Huang ha scritto:
> This patch implements clks_config callback for dwmac-mediatek platform,
> which could support platform level clocks management.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
