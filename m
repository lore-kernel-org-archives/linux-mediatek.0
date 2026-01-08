Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C26D1D468
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RMxX8fLudzgzeaK8Hxa/jVqGVI3C6mJxtJKkvtOXWM=; b=J0psiuh6bs3ln7OIVMfBoghhwZ
	qXCufy3vlTgRBa6PMSd1P4FNTsk0ZKVazw3LxtnJzLswUeVnAp/LH7ChKUfGvBzjCeeQcuAZOtSyA
	rHl9ZZS0vm3dOyjU3xYsKBzmyN9Z6dhQQVTC5T3tIPr5Qj9qF6R4vZUDxeDSqvhrjkEJpwoREHqnR
	A6sEVhQo5p0WdcK05JdbrKCBwO8tkzm92FGh9b1sJHkQDuOixOt1+c7BFKs1dzN4R5k8sEk7Cz6H+
	U+UBMt2wIkJTh7ihz2LbBYo9tcFGoarXAkwU/Hr7SYqpQeickHaFBu0q4czPXPcKxjAKOFV6zwLBw
	OF4v85Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNY-0000000HPsZ-0rZl;
	Thu, 08 Jan 2026 14:52:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNW-0000000HPs7-1Rnx;
	Thu, 08 Jan 2026 14:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5RMxX8fLudzgzeaK8Hxa/jVqGVI3C6mJxtJKkvtOXWM=; b=KJqPDJKmVz+M4zQgH4OFMgVB3y
	6RvmJkHl/98lQmG2DNq9J2/+8j9t5nWg5L7QyCuVoSQhsWvxKwbZuaOPI+HFuuwzxHU/E+unCvLaH
	MRWw7SZ7+w7JNsH86/905vD1S4WppfzwMQN8jfRsUYAyn2NejqVDj3wizGaklc1V9b0mdnzd8KPUy
	FyQQY+WDqIn+JBX4/2oqjwbiPWarxVITP2EtAcGEZymOyq1fjrB3WQj3W3t6/acd4EANOgYPH9og1
	plPooqMX3HjiRLcP/b96vvoQWJvF8fa8BsTlDTpM7LGQnbyyTWz29Q1MXymvLc5jOYOKBaLdVEwAr
	VROE9p9Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNT-0000000DQlJ-0ao5;
	Thu, 08 Jan 2026 14:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5RMxX8fLudzgzeaK8Hxa/jVqGVI3C6mJxtJKkvtOXWM=; b=sfgH9SDDp9NHn9HDL2Qa5RRGQb
	aPYiNW/CMH3y50KuXB+F2eWH7m7hdmM0w52cPzR7Q1QsnMLcmcVPA7ahlWtSmWQUj+blZ58Vyb7si
	sqBUI5kxMY7in/N15dSdqgbEKH6i+xi3qVaSVfTxcHlkOsdfrXYghOf4y73nwWWFlNrU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdrNE-001xse-J5; Thu, 08 Jan 2026 15:52:28 +0100
Date: Thu, 8 Jan 2026 15:52:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
	robh@kernel.org, conor+dt@kernel.org, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, matthias.bgg@gmail.com,
	atenart@kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: crypto: inside-secure,safexcel: Mandate
 only ring IRQs
Message-ID: <c65c2f98-7530-470c-b288-d135fd621005@lunn.ch>
References: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
 <20260108110223.20008-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108110223.20008-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_145243_259911_D3FB9BAE 
X-CRM114-Status: GOOD (  11.90  )
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

On Thu, Jan 08, 2026 at 12:02:20PM +0100, AngeloGioacchino Del Regno wrote:
> Not all IP implementations of EIP97 and EIP197 have the EIP and
> MEM interrupts hooked up to the SoC, and those are not required
> for functionality as status for both can be polled (and anyway
> there's even no real need to poll, but that's another story).
> 
> As an example of this, the MediaTek MT7968A and MT7986B SoCs do
> not have those two interrupts hooked up to their irq controlller.
> 
> For this reason, make the EIP and MEM interrupt optional.

It seems like the order of these patches is the wrong way around. You
should first add the device specific compatibles, and then update the
constrains based on those compatibles, so that the marvell variants
continue to require 6 interrupts, but the mediatek versions only
require 4.

	Andrew

