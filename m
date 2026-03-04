Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B604CEB7ECF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RggGFLYhq1K3LXLSljS2hs9MQsZcd7If1A/dhos4zVY=; b=wgc4wZzsBqJa9mSn4BS8Aeqt5N
	+1NXjGoC2xALNw3owWo3HWUV8PZN/mxffXnkQQMVNL2NT2iCcPXQ3Ud+eAvSsBnLVPOHaB2pkhHad
	bZfAtvuIQKbdPsAqCVa1iTGonVIesPIac60vFPzcfT5Mpe7Fx0aRWSHrD6z2O/EEtNTZrAusOzXsc
	u5hcQF6M6egXxl3FFvONJdRqca8KXiHkXs7rURMGOhOnJGO+WjJBwickTLfLLhmPFwqExzy34XMPc
	KYtsUGd3iN7rqlZ0+6lqK8jqxgnrLaIGVmcAliUANAHcnTP9wZ9vv9MNscNR6XzvMbuRr7Sv2BtfO
	TBommTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlEb-0000000HAwZ-3RIg;
	Wed, 04 Mar 2026 12:21:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlEZ-0000000HAvo-2onl;
	Wed, 04 Mar 2026 12:21:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vxlES-0000000031c-25Dx;
	Wed, 04 Mar 2026 12:21:40 +0000
Date: Wed, 4 Mar 2026 12:21:32 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <aagjzL4c-3jVuOM5@makrotopia.org>
References: <04622e0bc917aed4145a9a3b50b61f343fc89312.1772585683.git.daniel@makrotopia.org>
 <20260304-defiant-echidna-of-examination-b1e798@quoll>
 <aagiPIgoosVqsA0t@makrotopia.org>
 <8e685c37-afca-4f2e-ac0a-76a0b060805d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e685c37-afca-4f2e-ac0a-76a0b060805d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_042147_707248_CE0F92CF 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Mar 04, 2026 at 01:18:20PM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2026 13:14, Daniel Golle wrote:
> > 
> > Starting with MT7981 and followed by MT7988 and MT7987 it is
> > technically the same hardware, but on those ARMv8 SoCs TF-A assigns
> 
> So they are compatible, I presume?

Yes. MT7988 and MT7987 are just like MT7981 in that regard.

> 
> > the MMIO range of the TRNG to only be accessible from within the
> > secure/trusted land, and TF-A provides a (vendor-specific) API
> > allowing non-trusted land (ie. Linux) to acquire random bytes.
> > 
> > With MT7986 they made the unlucky choice to initially allow direct
> > access to the MMIO range, but later updates to TF-A then also locked
> > it to secure/trusted land, offering the same API as on the newer SoCs.
> > So for MT7986 the driver has to try and figure out which convention to
> > use.
> > 
> 
> 
> 
> Best regards,
> Krzysztof

