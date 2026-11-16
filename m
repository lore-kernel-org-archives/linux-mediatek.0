Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901B606A333
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qbxnl0eP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6oNDrzY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NUiUgTi9wA7PEI92DOKS15QskouMnxo0HHKzo2bCrm0=; b=Qbxnl0ePN+ybZB+AvxVYzjkTgs
	cEsEKGKFffo/yn+AAKYupq+I4EXrhPusiow+kcX5qhqToORTIunZlWBNAOZnbjVcXo5N4EzVsgpR+
	kY7xPmBn7PhKMSK91RjbQYPQruv4TdIQ0eI63u7uE7MkmJQb2w4q4TA+62IcGJhVloSFUZBm2Ph2O
	3imj33098Izj0eIkdl530l/KBmJWaCFr+83fWu20afFw2BuNasMbI+BEjbhhYLfZzUsrepqGcTwhl
	xbA1qxB7MrEuBm8vBDfNinOtr87mXipfIZZQawuisXWFxAuXGhRV9T9tHJJ+wRL6yLqzEmqELD4bZ
	p1BYA5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw7I-00000002Sgv-00hA;
	Mon, 16 Nov 2026 12:47:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw7G-00000002SgK-2AGo;
	Mon, 16 Nov 2026 12:47:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D7F343443;
	Mon, 16 Nov 2026 12:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176CE1F000C4;
	Mon, 16 Nov 2026 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833242;
	bh=NUiUgTi9wA7PEI92DOKS15QskouMnxo0HHKzo2bCrm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j6oNDrzY/QFTLmT4LN5cbHdvxqBU0xkgsTPREFIlOzk3IJOaq5UsPtKF6HN4R/DR6
	 3KyYSjchxwnWO5yO6x1NglTnQUG5AMxeHwPeeync1dBlBU4SLcLDf7ihuYXJTFuBUz
	 fVUXyCWPqZ7VU77Rz+3qZ2FlTFrfuhRqoUqhRpXt8eHauY/oSRm6SL32YXekLKaQg7
	 J+Bw0bcXM1sDCNRkDzWN1NNy9UW1/2SUxa9+pfFXMY6d0ueCmVHdUKrBAvLr09a0kx
	 cl+cc4KRZ8LFcZ2ROQGQYi23uXVVYWM/aOmP3FqNypkSi6hWiSuxmO51sQhi68KHZN
	 DzkxhLJVDqIVg==
Date: Mon, 16 Nov 2026 12:47:15 +0000
From: Lee Jones <lee@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
Message-ID: <20261116124715.GO6323@joneslee-macbookpro.roam.internal>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
 <a6bc9228-8e81-4f16-bd26-2d9c72e9998b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6bc9228-8e81-4f16-bd26-2d9c72e9998b@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Ryan Brue wrote:

> On 11/13/26 12:50 PM, Lee Jones wrote:
> > On Sun, 01 Nov 2026, Ryan Brue wrote:
> > 
> > >   struct mtk_rtc_data {
> > >   	u32                     wrtgr;
> > > +	u32                     con;
> > These are terrible variable names.
> > 
> > The nomenclature should be self-describing.
> 
> Hi Lee, two things:
> 
> 1. I have a v2 out [1] from early November that fixed a null pointer
> dereference that Sashiko found. I can spin a v3 or resend v2 depending on
> the response to (2).

Happy with whatever makes sense.

> 2. would you like me to update wrtgr as well? I can add a patch to a v3 that
> changes that name in addition to con.

Yes please.

> [1] https://lore.kernel.org/all/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com/
> 
> Thanks for the review,
> Ryan Brue

-- 
Lee Jones

