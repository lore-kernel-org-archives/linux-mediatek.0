Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0830EC4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 23:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McPH5Kgx4dLvymashAk0H7f0hwukVEhXz16mwybuMLs=; b=yk4Jc72wq8eqnVkIwI9HXMRhc5
	q8cbPHzQt1TxIwXKvgTtTvS+kQ76wW3zwduLV1teGmyFmGuxJboBXRmpjcwqc+ryvm8gqblhDFmKu
	1VzJ2OR4Txi93b8sbxsSp5CGLT3f5VShzTYVGPquw6O1m/JvWS3m7AEhNeCnDs25yh97d4CI24VqN
	U3z+AzyhD0I3C00Bur7flCPj407qB6eOU8VQiwtyBJc2F8JyrIfVHrkckT9T1ZtBcyCNeB9Ocwlf2
	LiZbs79XZnNKHAn2DfcojLf54Qsv8sOW7cnTGgU5NKXgzQqNApNi3sGUPRtVRwHZNxvKXDcEdwgFL
	BN+UfT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1EBW-007PG0-2s;
	Thu, 09 Nov 2023 23:11:38 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1EBT-007PF5-1g;
	Thu, 09 Nov 2023 23:11:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r1EB5-0003nC-0D;
	Thu, 09 Nov 2023 23:11:11 +0000
Date: Thu, 9 Nov 2023 23:11:02 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 1/8] dt-bindings: phy: mediatek,xfi-pextp: add new
 bindings
Message-ID: <ZU1nBgdspMtsI5aS@makrotopia.org>
References: <cover.1699565880.git.daniel@makrotopia.org>
 <924c2c6316e6d51a17423eded3a2c5c5bbf349d2.1699565880.git.daniel@makrotopia.org>
 <797ea94b-9c26-43a2-85d7-633990ed8c57@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <797ea94b-9c26-43a2-85d7-633990ed8c57@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_151135_556004_630F320A 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Andrew,

On Thu, Nov 09, 2023 at 10:55:55PM +0100, Andrew Lunn wrote:
> > +  mediatek,usxgmii-performance-errata:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      USXGMII0 on MT7988 suffers from a performance problem in 10GBase-R
> > +      mode which needs a work-around in the driver. The work-around is
> > +      enabled using this flag.
> 
> Is there more details about this? I'm just wondering if this should be
> based on the compatible, rather than a bool property.

The vendor sources where this is coming from are here:

https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/a500d94cd47e279015ce22947e1ce396a7516598%5E%21/#F0

And I'm afraid this is as much detail as it gets. And yes, we could
also base this on the compatible and just have two different ones for
the two PEXTP instances found in MT7988.
Let me know your conclusion in that regard.


Cheers


Daniel

