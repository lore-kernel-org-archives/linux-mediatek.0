Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88297C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytwNaqHRym/7f2GxSkmMZLKc4oXAWANiIAv9Z9G0uLg=; b=vG0MQBIAw07V9rlgMra+55w85D
	6ogRYJNHaj5AaP/+MRijIjVVvBYRl/KVXhyDGDllUfuJxeG/nQCt9MiI/kO9iWSIULZPvDvUlLyvV
	rSnZUfIFb53ZYmTW61soDchLlvbzxqTaJ0L2hGvHD63IZu2evvI4wHxtadBNAW/crF5i75b87P4PI
	L6BQ2zQuqv8KTWZuyNe9lUngCyyKNAO9cjZ7H2pfnWB8DTlvt9snPYbMg7rR/zTnNJWDOqt7ARzMw
	EhoXPzK33NDyErXxhFV0Vd9srY1hoICvNx4CvDpOsU3n+9e+G4DWyNi6yVDPoubs+42XO3av/ICKk
	INpNO7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpdI-0000000Fpum-1hJo;
	Tue, 30 Jul 2024 16:23:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpcn-0000000Fpk8-3Y8i;
	Tue, 30 Jul 2024 16:22:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sYpch-000000002QG-0tH9;
	Tue, 30 Jul 2024 16:22:51 +0000
Date: Tue, 30 Jul 2024 17:22:47 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
Message-ID: <ZqkTVygxG8cJULbt@makrotopia.org>
References: <af561268-9793-4b5d-aa0f-d09698fd6fb0@arinc9.com>
 <750a60a6-4585-4bd2-97be-cf944e51fbdb@leemhuis.info>
 <9c498e37-df8b-469e-818a-9b1c9f2b1a3c@collabora.com>
 <cebb10b8-b0bf-4cb7-bba4-c3f941ba2b82@leemhuis.info>
 <1aedb1d4-8dc3-4e17-aff1-7cc417465967@arinc9.com>
 <130518e2-d6dd-49ed-9cc2-ca9cdec93b98@leemhuis.info>
 <aeb255ff-3755-4f76-a8f8-cda27a67f818@arinc9.com>
 <b3fa66cc-516b-4d78-aee5-62a47b52a3b1@collabora.com>
 <2076f699540c3c9d10effdb8b55d3f89@arinc9.com>
 <921f448b-4085-4c8d-85f8-478318d9c054@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <921f448b-4085-4c8d-85f8-478318d9c054@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_092257_902616_13C8B23D 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Linux regressions mailing list <regressions@lists.linux.dev>, arinc.unal@arinc9.com, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Jul 30, 2024 at 06:04:12PM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2024 13:22, arinc.unal@arinc9.com wrote:
> > [...]
> > In my view, your behaviour of not applying a devicetree patch before a
> > Linux driver patch was applied, and then not replying to any arguments
> > whatsoever, was keeping the devicetree files hostage until your demands
> 
> Hm, why ever DTS patch should be applied before driver patch is? This
> clearly suggests ABI break. You proposed to fix ABI issue by fixing DTS,
> which is not the way, because it literally fixes nothing. You got
> comments - fix the driver to be backwards compatible.

I've suggested a fix for the driver here:

https://patchwork.kernel.org/project/netdevbpf/patch/f485d1d4f7b34cc2ebf3d60030d1c67b4016af3c.1720107535.git.daniel@makrotopia.org/

It has been tested and acknowledged by Arinc, hence a possible solution
would be to apply it and there by restore compatibility with existing
(broken) device trees.

