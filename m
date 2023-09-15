Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B18EEED601
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+h/j7TvRe2PqBnvRr1bMFokj9BO3pnLvJdVFuLbDd+4=; b=AgR0NRkAejUaFGUXbPX3QjjLsl
	g4jTSFDVChL8pyMup8kEWZZYfVFSCQ/Y54OIzNeZnX3dj7U8nkDaR8hSsMUptDpVjo60dEO+h066/
	sbHRfl0b1FAo8f+0BYRmjIdVBsLmDfBjbxjMb8tyxuHcqj5t0fyUFngEBTFc8JL4HmTQk81X6bWeo
	ljbxMCHYz0Xw1oACsGr8T829eAiBgw1TUyYjb8DG3WYQljnccIlZfxu8ryEEO0b3pT0EGVbzwlIZy
	MPa0i2RyffuF73n8UWwGds1Zz/ekwO2NjZ7oKd3QmYdLHrBcpuywa0uHJtTeYr9Ju1p5eDb7/+WDM
	ggylclKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAFw-00AvcY-10;
	Fri, 15 Sep 2023 14:57:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAFt-00Avbm-1v
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 14:57:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65FB76204E;
	Fri, 15 Sep 2023 14:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8725C433C7;
	Fri, 15 Sep 2023 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694789830;
	bh=OtkCOYaTksGOTSr2+xlSqvyr4706t1k2gV3aw3sS6Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gP/0/4qCtDPsPATni8DaF2olJXkIrr8kzSW+57OixCQYR2yH6HoYMfsHYIJjVL5Xx
	 oYqxrjLkzsuzZXaB3yUA0YqkWZSENUMW+1s2iBHphwMJ9dtxoT4EiYNmIPVt7vsXlt
	 /B5RYIky+601hh38PMBV6FQvGidBmewCmTnjTVmOI4ZaRjsqcGNVsfO9Ku+B4wiesm
	 QqBZF/FIOSfB6cP4ATj7CkyWoR6ucVqeFXBOVZcmk+I94Dv6CHA1nDaP8so4GcxBhl
	 ApWRGTRkVF9Jy4ZAARS+UJ1qSqoUyB1Sf50QI9Pk37ilBdLDpywgYZQINOsDIDW1xo
	 LuuckATwX6jiQ==
Received: (nullmailer pid 3715811 invoked by uid 1000);
	Fri, 15 Sep 2023 14:57:07 -0000
Date: Fri, 15 Sep 2023 09:57:07 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: john@phrozen.org, nbd@nbd.name, daniel@makrotopia.org, netdev@vger.kernel.org, kuba@kernel.org, lorenzo.bianconi@redhat.com, pabeni@redhat.com, edumazet@google.com, Mark-MC.Lee@mediatek.com, linux-mediatek@lists.infradead.org, sujuan.chen@mediatek.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org, davem@davemloft.net
Subject: Re: [PATCH net-next 02/15] dt-bindings: arm: mediatek: mt7622-wed:
 add WED binding for MT7988 SoC
Message-ID: <169478982727.3715757.9192773418484703094.robh@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
 <9b84b6b9641a2eebc91e763e2ba9a341e3de1071.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b84b6b9641a2eebc91e763e2ba9a341e3de1071.1694701767.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_075713_677406_589620BB 
X-CRM114-Status: UNSURE (   8.73  )
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


On Thu, 14 Sep 2023 16:38:07 +0200, Lorenzo Bianconi wrote:
> Introduce MT7988 SoC compatibility string in mtk_wed binding.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


