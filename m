Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152B6070AA3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gtbZxM41;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRQ7geCx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5pKcFRXYhUfRt/NFgpZQiyJq40B9sdnA84VTi8AATL4=; b=gtbZxM41+FbqRyWKey0QXHXv72
	sAcDLEZBIgRCqbHVbd9N3Q4UKL0WhQvl7h+22C+hcJS4aOmWgyFddPWNpp0z8HSvzTO7dInzOsXMI
	mVNR4QzcuLkfTxRDOdhplVKPwNvvOplVFSMYvQcVRN1GXa03RuRpg+RzEaLhLPgN4BqAL5tJtoNUG
	9GathxWsbx15P9PX1lgI6zn7XvksrtIS1wDPa0ewQl8BnzppJW8nhwyKT7u3Cbr05MtD+Upk3NfoV
	3r7Dzzz5SLvip50vtmwU52ekcBMttdGpU5RLNnzO7kfxV77VVcHq853nBMIErF+ukVCcPeGxTzbQ3
	GniOt/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCFC-0000000278w-3Qs7;
	Tue, 03 Nov 2026 10:59:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCFA-0000000277h-2jQI;
	Tue, 03 Nov 2026 10:59:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E3D143A82;
	Tue,  3 Nov 2026 10:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456CD1F000C1;
	Tue,  3 Nov 2026 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793703595;
	bh=5pKcFRXYhUfRt/NFgpZQiyJq40B9sdnA84VTi8AATL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YRQ7geCx/qjrzWWDNYRgg6axSKgU5uvHghVLI81Zpn+1oDAhtH6BXWRZ37uqV4pi0
	 71M5+uhW+qULQlK6pZolWG9o7RpQFg1sPKE9fr8Og1B/p+UOrbEDiHnIvazdTiy62U
	 0IG3igKkHO0AJHcjPccEOkDbQR9AaS3Sj4E+4C7HMutrmM8WwyZ1Nr3lzaMupa6Wfm
	 +4riYs4vvmV7kdBlozp13+EuwLkb9x8ATTTbT0aiMCaYkzOBWE++TXkkV7tpqP6iFt
	 V+2TNl32cMMO2SSbtgLv8D+ahHTaPJ/67imKLF6+srU+qQyncAt6z8YnQYQIjF9yG8
	 6oZ2tGLfaCZwg==
Date: Tue, 3 Nov 2026 11:59:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com, daniel@makrotopia.org, 
	linux@armlinux.org.uk, arinc.unal@arinc9.com, Landen.Chao@mediatek.com, 
	dqfext@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Subject: Re: [PATCH v4 2/7] dt-bindings: net: dsa: mediatek,mt7530: describe
 'passthrough' hierarchy
Message-ID: <20261103-magic-ingenious-buzzard-8bfbc5@quoll>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-3-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029184202.1859843-3-cjd@cjdns.fr>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 06:41:57PM +0000, Caleb James DeLisle wrote:
> Due to hardware limitations, full switch hierarchies are not supported
> with DSA based on the mt7530 DSA tag, however it does support a simplified
> hierarchy in which one or more switches act as passthrough conduits with
> only one CPU port and one DSA port active. Document this capability.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


