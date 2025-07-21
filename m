Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB1DC83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CssOOH4TmPcEDCFNuO0ds7142thjSiE0reYlRnWtUE=; b=WQy8VMJK8ulWVU+sugWMK+urRZ
	t3tR9ULhLDUyvIBvYnHmQ1vSQyvkS1FlHscub/ynJ+y5bvy7AjbAb2RO9uBWQPJ1nVc6jMDvgTT0+
	uiG1ZM8wyfNNbn+w4hzcEJtCyBimB8X1r5MMHKmCt8Dl053fD6kXW7suLX73yR65QmIehv9WTuQcj
	lcsoGzPWNob2RQo0iUaZ+NQ63+8ljDg7org6QHuoFb43BuvUYfFyTBVdB2hNLbQoLWjqLpN5aV7bq
	pbfnez9lkx1Pq+HbclLGf20VCq0bTkNSr7ARJT7vh7HcJGD/WcF5m0iqvfCZnUkcVufFL3160BpRr
	P/AxnRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxJS-00000000enS-2G85;
	Mon, 21 Jul 2025 20:40:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwwj-00000000bMB-2jln;
	Mon, 21 Jul 2025 20:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BF335C5950;
	Mon, 21 Jul 2025 20:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36CDC4CEED;
	Mon, 21 Jul 2025 20:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753129032;
	bh=zsoAwwBko42CkVECzPsq8auhWL/xsEzIc97plmn6jec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNkNYQMbWATXsZca7uECJh52TBQOODxYQsDYpWchJQxNuXKrA3n6QxfTQqlyf2DXp
	 8O9P3kApfSVThW5ioV5bC6VMj885JSOXK4utaVtFbCq2jmJdYe5W2BnwxgfbzmRvOy
	 u2rE5/BPq2MCA2MKeRo6YZ5tz8KLk4/15NNF5ViPy/FAPnxNp5N3SXMjlgFXm7zKJ6
	 sNpJQWhV9BpOxtx6vVmlXvKvHQBqJtZVSc3chFMUwXgQxqtuIP2rNwHJwnOVQchS3p
	 coEqzM7h36xXVukQtHdWd1TJIkz4F0cvtz5Ym4kGZ9M/5jEaM2Oa27ue8o03jek+55
	 NXaY/8AZThvKA==
Date: Mon, 21 Jul 2025 15:17:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Stefan Roese <sr@denx.de>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: i2c: mt7621: Document an7581
 compatible
Message-ID: <175312902965.1260431.17671364110549858903.robh@kernel.org>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
 <20250721180710.2116-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721180710.2116-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131713_730324_C4BFA82B 
X-CRM114-Status: GOOD (  10.40  )
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


On Mon, 21 Jul 2025 20:05:54 +0200, Christian Marangi wrote:
> Airoha SoC implement the same Mediatek logic for I2C bus with the only
> difference of not having a dedicated reset line to reset it.
> 
> Add a dedicated compatible for the Airoha AN7581 SoC and reject the
> unsupported property.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


