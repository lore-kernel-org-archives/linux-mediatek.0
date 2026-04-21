Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A5F327B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaQ2LCXBwcBGqjw+fLnKkeX+Qfo4NM8FO+9et5IUg+I=; b=qRu+1OP/1/DMxl74KypVmYG7Qt
	D9d124CYk3mrCbkdM7F5AUgX1rtYPUzNM9Oth3qOmLGdn7WdYzZJA56CLTvTaSQBJLko8R0Ttv0DI
	9XDXv2m1lCEbq/2Vz7q7WG22tJt3kcy0BJbrNmM01zBkMITaBp1yAVmYNmmg5JhAAkHyT6X/BvCkT
	DiOgbdMrSUUBHi15QWYAV/InNkEkj2G2vLC1g+F9f7G4mNqjqgZympywz9GpzykStRyatFTU5gKAI
	ANkd5/WYsPhmAKmdN2qLTO5cWJKkxZta2gZcdhsrqVscF9S0xa/cwa52jCVo9qCoWZJNJPmO0NAQm
	kj4W6xMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Lf-000000089cd-0nzi;
	Tue, 21 Apr 2026 07:16:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Ld-000000089cD-0NEM;
	Tue, 21 Apr 2026 07:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 863986001A;
	Tue, 21 Apr 2026 07:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC988C2BCB0;
	Tue, 21 Apr 2026 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776755800;
	bh=PlcRVfR/vAZ3jRFPOEYEFhF3xy4lVkpygdA+qLPzc+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjELeC2AjXDIcOyYBIPSrWENjRtzqgCQ28UrHMMo6qQTwvHt+lCL+2aF8iNKaE1PZ
	 9yUORyrXv4P++xNbABelxAyxf9fG6fSun1s54xVvqCsBXTPCxIZD2eK0+DWjpzF8Qg
	 ryNLV20WDpaD01BVSz2CIAZXduB8JP9PrPWzGAnsWXgUMyLnmcS1Pm1yWGlINKM+ba
	 xaTUMyCY8WS00np4/+bkSf0QLhVFqiGQtKQFTy9O9L8SLhyPZWBnFydbCZh/oELYyD
	 cQF+bT3FqyIWluatCaGQNEfF2NkrB6VryPgqZfT1lZDKQ8RX2sBaR9bFCSYfvGLDDF
	 +XOLr01mqQsFQ==
Date: Tue, 21 Apr 2026 09:16:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: rng: mtk-rng: fix style problems in
 example
Message-ID: <20260421-congenial-grumpy-teal-56615b@quoll>
References: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
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

When doing such trivial cleanups, fix all bindings in subsystem (rng),
not only one. Doing it one-by-one is simply churn and I DID NOT ASK to
fix existing example to match the expected style.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


