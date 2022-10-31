Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D875FA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqnyFAcrnTNqEt+LjWq3mt95iPOhVWydczHQr55iS2Y=; b=ziKZpiHaHFDafDdqogI2cWZBjt
	ZhDobY3Et1QeuwziYbnxuHaKhF3DYpd81/PXDH3Fp8sjXU5N53EY6Fzi6jglUpAhSIlv1LCJ4XZHZ
	RmwZF43504w8O+gpCi0Dax1UV9qvWisweVEkPy2eYix0HolX7yHcFJzp6T1msOkVlNnmSED5Bf7eV
	mYwCw1dTA6T7B7ZNzOhLH162XAPkH6gvYDDf6JR9jegEorf4TzuQZlLWJElUF+ziSWHof6LkPWzkT
	mzoeFuqnqK1Hh5oXZ9k58tHay9xjtNvKAYINaaNpZFpMsI2VE4MeLz/ALfexXb7rRkA2goWY1vkJc
	bPm7KMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWrA-00Cek2-84; Mon, 31 Oct 2022 15:37:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWqq-00CebM-JU; Mon, 31 Oct 2022 15:37:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3FF47B81898;
	Mon, 31 Oct 2022 15:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2D4C433C1;
	Mon, 31 Oct 2022 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230641;
	bh=htosT9j3prhic4OCFKTn+cYnB6WGmmVROgs2Id5cou0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujWCtT6kGi/oxXQiRwuxyVSzSYLo/pusgj3E7kSwP+U2mjtPYV0ba5Dnb4KLO64hq
	 LwqaQqbWAtd9mZbhLpc0xOWHvh3AfJeoi2awo6yFLD83l0EXhlyiA3CqsIRs8mYfuD
	 js7xB3kYBeWGZPj4TTF9stcgePR29RYLGsO0agWHGn0dzGNH7paSqFbMhxe+LI5VRr
	 Pem5QjvEfjt9D/oRZrL1jrxWzThrfop6xCd1uFvDZSFadLSpkP24I6+1+opzA2Qou/
	 Qy/48tE+u28mPPrmvrVyVwNeFsSi9Kls8At2fM5IOVYAD/GMfWGzzz5aX2cNFgGFz5
	 oN6OS1m8Yaflg==
Date: Mon, 31 Oct 2022 15:37:13 +0000
From: Lee Jones <lee@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 net-next 2/7] dt-bindings: mfd: ocelot: remove
 unnecessary driver wording
Message-ID: <Y1/rqW8kP4Yk/len@google.com>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-3-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221025050355.3979380-3-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_083724_799680_96E2866B 
X-CRM114-Status: GOOD (  13.34  )
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

On Mon, 24 Oct 2022, Colin Foster wrote:

> Initially there was unnecessary verbage around "this driver" in the
> documentation. It was unnecessary. Remove self references about it being a
> "driver" documentation and replace it with a more detailed description
> about external interfaces that are supported.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]

