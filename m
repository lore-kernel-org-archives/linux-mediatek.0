Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RwBaAYpmLqPaWnG0Mfzb1p47yRQni/+GgNVvUEvbVA=; b=l8rTBdnqKHa2dkU69sdpzKqS5B
	TNbYNMY7TpRqaDSDSJYXJKBwIrZ/j3fyev/jHGYWCfCqoKC0OBe1Qjh0vEUkpugauwECBZFpkeW61
	c8Er2Ox5693cfcPpe7Ec+lOM7DhYMQatUlvrbJextlauqddkt/nRyODekZEabNDrb5rH1FVyjPEdX
	bzoI0C6zabHP4/E1DppAcZa2E5yy3SiM5Cao46juO1XVZnE8ULeVyJoiChca3Xws9IcCcE2O5jD2n
	Q0C+zHaHZpqxkvTKPERlQQHJgKzQKj08pd8aUFfGga400hCvwIUVPg1snoQxDQgBSK1YlsP29Rqi6
	iSl2RXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvH1k-00Fg30-JK; Thu, 09 Dec 2021 10:51:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvH1W-00FfxR-Lg; Thu, 09 Dec 2021 10:51:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A67C31F45FD3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639047097; bh=yDtQlqleMTCGJ2UJdUDxkZCymbk8Fpf4x8QbZvJtjOs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NfyMpnzCtqpvhQwzmB4pHOQ/YwSSqt2ZGRhy5odR+OMpvByMEo1sFwC7rvYMqXNxb
 BHbqzq3PPKvySzejU7kbkdqnLbMjv/neugoUxTCeRYNINPPkf0PZCrWtbPqeoCdtmy
 KIBqseVsM9zS8vRqEhFFYGlQlo7VR/p+cv4AGLhY7OWCFFKVSrlINkePNqeh1ZHzvK
 +mRznjk/whIyYvknMIE43vutB+79VGfcPzFiAgCWaL5uG8vpF87vRseRXr9F5QIO2S
 Uv2AtBjdef+t1+J1QWSew0jiHnXvq5kpsew+U+gaKhlb5iJzczdhUUEtMYC9g0vApI
 E2nuz88DdqksQ==
Subject: Re: [PATCH net-next v7 1/6] stmmac: dwmac-mediatek: add platform
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
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-2-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2e8ccd43-bba0-9695-8d6d-d37e0b71fa7d@collabora.com>
Date: Thu, 9 Dec 2021 11:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208054716.603-2-biao.huang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_025138_874343_56AEBE12 
X-CRM114-Status: UNSURE (   8.16  )
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

Il 08/12/21 06:47, Biao Huang ha scritto:
> This patch implements clks_config callback for dwmac-mediatek platform,
> which could support platform level clocks management.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Sorry, I've sent my ack on v6. Sending it on v7.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
