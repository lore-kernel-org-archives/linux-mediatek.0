Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2F2C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq9NLj8lWwM0YOEUcLpufhiZTMvrGVKxVP+omNZD4LY=; b=u4fFclf0neWc7d9k04vCkv7coO
	aJsHf1Gf6dkmdsdjmxlU1Cs52ch5PnaheMzvI1/50MsOV7MHcnUnhtO/glVBCKbmK2Sy1UwltGOB+
	lenjHBc3dG85lpZphEsjFlzONvUgv3FZ6Ujxdp4hp0FlIir7YhNQKx69WUQ0wMU4hTSQgp1d36gtn
	L7h3LL0v+r2UYfI07m7lC49/VoxDKbP4WX1wNmdxvm8pfq1PS6FDeJ6iCDC5eCBjYpKRcBzMTDCPM
	4jO/qccgUvgHccIf0PTNng7Eo9BaYhuZ8qD/zLNjYPx4qRClMx+LASXtwj4c5f8Hc8BaO970VzUZv
	j2svUGPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6A3-00000002PGP-15Ko;
	Mon, 19 Aug 2024 17:27:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5yW-00000002MNr-3sEV;
	Mon, 19 Aug 2024 17:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 387B560C58;
	Mon, 19 Aug 2024 17:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8334C32782;
	Mon, 19 Aug 2024 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087723;
	bh=udTdekh4LnZq31jsqnNO6CLZAotYHxV+VVWUpWfDues=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqnYrRtEk63eA+djUezWmBTNOwX+aI5mz8nZu1K4314tDdOIBXOO1xLFT1lbbvhzn
	 UPdnI8K0lO1ifnqnNv6CKISHq9r7jpgAbHpcdEq4KsrC96LptUMigiXeIMu6ny/gYM
	 VI6Ga9YAskgU97rTqgkQBielFDEO7X6uDJ5xqIanair71cMjEeoZyNIwn9XobAk4FI
	 8n+Ot6FcNnNsXRL4fCoBe6G8kEVeORotMPRgKNF5DVx+0bjteWzJTu5GJ5mx52nHD3
	 iy7vSbDsGiGPMlUznK/Lgij9yKq5ahVWsia2aI/HSrV61nxqfeRaWuObTM8WbCTDtx
	 FleLrJaIHgY8w==
Date: Mon, 19 Aug 2024 11:15:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, devicetree@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: mediatek,net: add
 top-level constraints
Message-ID: <172408772099.1699601.13503092199096446206.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
 <20240818172905.121829-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_101525_033380_940704B3 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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


On Sun, 18 Aug 2024 19:29:03 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


