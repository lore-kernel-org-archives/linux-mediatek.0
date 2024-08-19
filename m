Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD6BC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 17:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDZ4EEZJgESEUQI9bPhXNFFfr+uX7DzB31IM6nFIOJ8=; b=hE9l9V6hLo/rDTHxHbCEGGCHP6
	vqLbh2yvFf3rNgaQ6OWpnzTiCFj/8CL8BUPUK4E8E+omKe6JgVESeLyIdvCnhCyKV2rp3KVFDa0XU
	0IDuNtQ2v2cHZDCiKP8Ycp4N0vGWTuH4mK8kK8oz6ZNEbWs9NoBPVULtAnesw/sSbddanTEPMIg6C
	nBhiJHgKUog/c1F3Xuvkrgv7QC+aV6CQLj386TPg3GyTb21g23n6hl0GcTkdOXStU8VmZM93SPkE8
	Y23XqoM/qqA9Af5XEp827GpZ1kfOmOhdm3gtg9MWirWKmqZDGhAZt6yZo845trjbJCPhU1Z9/CrKU
	X5L44nxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg69r-00000002PE1-1stC;
	Mon, 19 Aug 2024 17:27:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5yH-00000002MJl-3jsc;
	Mon, 19 Aug 2024 17:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2DB95CE0AEF;
	Mon, 19 Aug 2024 17:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD85C32782;
	Mon, 19 Aug 2024 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087707;
	bh=OE/RHkNYDMlFrxPN4ocnZguUrifbzdwI4ehlWTxsrR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OC+U2BTlj2oEcHBpjVJY4h1rRr5Wd0NGSzTcMVxjtIqe+BXa7bbGZ8TcLx/UKA3I+
	 dofXLiCOsl3QuvEmQa2It6cIM8FrFRthx+2gybF3ZmNOD4cRITrchGPfgJVHiTYCdJ
	 mRs8cWl5gDJS8a/rY3W6d0ba3+dTYHqpRoJUPITODA8OQv3Wt97hURYw1ad+OR0qZx
	 5nlzGpAZLYfwxBN/wTULm+5NBCCDiUvbANzmHLZCZN0ibYaHLR+W4UBbZm3VkDgNl3
	 R623TEP7NclNwMAxGCYk1XTWwC5LE5QXekd8X5oDyOiQZRNr2nWrapCVn1JZp6Iv9b
	 kNRvwGxrput+g==
Date: Mon, 19 Aug 2024 11:15:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Eric Dumazet <edumazet@google.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: mediatek,net: narrow
 interrupts per variants
Message-ID: <172408770465.1699134.17451371912936634019.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_101510_126420_223F74E4 
X-CRM114-Status: UNSURE (   9.90  )
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


On Sun, 18 Aug 2024 19:29:02 +0200, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


