Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078DFC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:02:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3A82083B
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAAqs1e7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WVZUjNsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3A82083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IzYV2cCmELRMtUXjnaU+RADBbXM13mccNfVisynDUYQ=; b=nAAqs1e7la2Y3hWCAp44RS81u
	CIFB9yaMvlsvqHNyHAUGszi0aGxqTDilJwF+CeCUndDrlhcYy8e3sdAK/KD/mALIhFM/dGgDrcdTq
	FAfe50rNtAKmJeAoobGy3pxul/q1Vv+Z+q3vpOPnAupYM82o2gy5SEONoTCZ5pDy5HPEWuXDlonOn
	9msAIU0q3LDMe2BdanXllarhcjeQsX12bZ7yYlIVnUaa65AUrHoBXoJfibcFzB9WGh7FIoEnT5Oso
	fRJw6o160n8qe8tZZXyrdY2Otx9R2Du/P3+4jbkTUQ+My95xq5B1pT7c5Kx9PQY+OaWjjQots6nhd
	+VOjJ8hag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLmQl-0004yL-If; Fri, 25 Sep 2020 12:02:27 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLmQh-0004x5-6F; Fri, 25 Sep 2020 12:02:23 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1sEh091014;
 Fri, 25 Sep 2020 07:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601035314;
 bh=hRluHT8MEUBdje+dfLWcezPxtUriv4zuwVUpPSAXAbM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=WVZUjNsSj7DdGsHdtFkiR6WobLdIx8XVugawvpE65QTk9vwsAt/Qz4j3zskHR1QEc
 NCGmjRc/t6AZZD8KX4ahsaG96Llcrq7w57Kx9tMx8Cl1IhCBZZJVi7cZUB394uAFl4
 NQDbIRGGPr0tGdpwU7iXQ456lMatKte55cMYBvlo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1sZM055785;
 Fri, 25 Sep 2020 07:01:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 07:01:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 07:01:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1sMi029536;
 Fri, 25 Sep 2020 07:01:54 -0500
Date: Fri, 25 Sep 2020 07:01:54 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 06/15] arm64: dts: ti: align GPIO hog names with
 dtschema
Message-ID: <20200925120154.utjxncf4qs2usuo4@akan>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-7-krzk@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_080223_317706_4B52A334 
X-CRM114-Status: GOOD (  13.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, Fabio Estevam <festevam@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17:57-20200916, Krzysztof Kozlowski wrote:
> The convention for node names is to use hyphens, not underscores.
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied to ti-k3-dts-next with minor update to $subject (added
'k3-j721e-common-proc-board:')

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
