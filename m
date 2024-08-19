Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C64C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fwblp7g8fUgcNUhca7kNcPPBpZLi6jipNxo1gXk0J9Q=; b=Hfb7OxH3J23FnMz7TKmhajSU0R
	r692kCDoaLmigjs8qVom9h+jLWzk0nwY//AGoif+xSITXRHjRh1Pqn9Q4Tvibh/E8dcH5K0K6+c7L
	7i0LxhqngWLLc3WcV74r5D/uh4RDEV/VnoaVFYDYHXjrr0XJWUFf/fkEezvU4MqJCJplqMtEyB1AS
	PreOalhNpo5yBcFibgPMOGMiriyF8GUMzM3fK8QW0dgr6SxDE64/2udY1HaJStcl9oX64nsueIUTt
	Z8mJKTBg9NUEJ0nkczO4dipiWvEKAJ5kzcq2iW3VqNR4A1zo/ofajojZhkl0rQISfw0fdJNtxuLlA
	gRDLjeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6AP-00000002PLG-2hZp;
	Mon, 19 Aug 2024 17:27:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5yx-00000002MVv-1m8M;
	Mon, 19 Aug 2024 17:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 971C2CE0B02;
	Mon, 19 Aug 2024 17:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC76C4AF0E;
	Mon, 19 Aug 2024 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087748;
	bh=iAc4Go6gGj1yfEzYX9FwCyQdx12hEgORikYJg534+cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qdwbf33iX7zKKXHhm22kZjyl1OCaCkbh3dR2JQvdmTvUB0mhkeyRet2tWG4BHMV0x
	 oafJsUe0jN7oKCgXhWT2w2yggZPMB1kt68svcSVNjOQLeHVlUL6jkNlY3fHgyua85R
	 45JzgoTzwTQJ2DQQiL5jSqemwc8QDdqO+I/JcYd7yKDY66+Lyd/mYMs/bFSR5AwzM0
	 ylZwyFQEufK+2dG7BoCy7lbUKJnV5iW1UHMRG8q5DKsQcNKMgZWiLWb58fPfhHdtrZ
	 M4sukG+s1tqrG9hVgKgLFaqg1Alszu05ykKq91SWVyRzItSw1ogbqRL5n/hRE+TtN4
	 1xAQhdE0y7i9g==
Date: Mon, 19 Aug 2024 11:15:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 4/4] dt-bindings: net: socionext,uniphier-ave4:
 add top-level constraints
Message-ID: <172408774631.1700340.17970674186244279627.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
 <20240818172905.121829-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_101551_656651_880D9C0B 
X-CRM114-Status: GOOD (  10.00  )
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


On Sun, 18 Aug 2024 19:29:05 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clock-names and reset-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/socionext,uniphier-ave4.yaml  | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


