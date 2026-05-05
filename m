Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03BACD3430
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxODDZ2GZbzq+d7FoPshQ569sDsyOc2DnK+dDvAlqoY=; b=3rNEEsbpUAoYAMBI2W/1OJq7ZY
	w4s4eCjZzBaszRt9QYBIMbi95V6MhorqSzzY8Y4MrAZTb4VHyzv5OLRXiOO+lc82F0Y+8qmGXwlQe
	ewrWi6JGlNyf0fwbYu9at7WakJlfQwXXzqOk9cW1HAQkzwOcR+LjO31SMVgYy+rgppgxSEm5UdiHd
	e09m7Tjcl4/44ZENUf+XrBirDU2TlEI87mY6yH82LnaOlhj6PEQpzforrM4Nc1zIXTS1snjfZYgNE
	g7URARQJgLV80RtVgd+3aTTC6RhBbCl3bzfz3wDSSrTPWoN7WK5COhRc4VQwrBEqxBYBTQr/8YHl6
	IwcbebeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBVb-0000000FaAX-3q0L;
	Tue, 05 May 2026 08:52:03 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBVY-0000000Fa9Y-2ZhP;
	Tue, 05 May 2026 08:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=qxODDZ2GZbzq+d7FoPshQ569sDsyOc2DnK+dDvAlqoY=; 
	b=UbEbgyUsgu3bKepusTL0WwK3nDooQdLOIc7IFAHq+iwhX0pgbKnmOprymBIq6PeIxMUbv78nXQO
	+/2A2gLpgecZO44JRIwRIREAVr+ro0XfT4sZAKyhPZeodm1CaJkLZ5uVec90MPwSy/0faXRR4Jjvc
	702equrXyyFiTQjDEorlgafGLHlDJZmztwC3h3J6bl/Ih3cHaXH8+NwHceBlgeyLNHQLW0NmlZEUB
	Cj4dH4CPRQjAkih1hTTxUJO2anasN76hpmLs+QgRABVLISezjbBVQ7wFFyLo/G74eSg90yRZxA05W
	v2ES4YgtCXhJmESelEkR3dJULEU+OkllKe1g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKBVC-00BNB9-32;
	Tue, 05 May 2026 16:51:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 16:51:38 +0800
Date: Tue, 5 May 2026 16:51:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: rng: mtk-rng: fix style problems in
 example
Message-ID: <afmvmqI-4wQ0IvU7@gondor.apana.org.au>
References: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_015200_693587_2EEA2AAC 
X-CRM114-Status: GOOD (  11.97  )
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

On Mon, Apr 20, 2026 at 05:34:45PM +0100, Daniel Golle wrote:
> Use 4 spaces for each level indentation, remove unused label, and add
> missing empty line between header include and body.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4: new patch
> 
>  Documentation/devicetree/bindings/rng/mtk-rng.yaml | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

