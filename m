Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2B5C2BA1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0mYr+1oweU0YIzqz2hM40zQCvt2PrfPUBdZ+lvjK+0=; b=Lfjs2FV+9JWz5FoUN8aRlprQfx
	kNZNEpqauLalYeGKc4AkJ0a47BFbph++HT4/6/5mJ4wnG956Phka30szfff+G7D7PdqP04Bn1nS8Y
	sBKuugOxAGfqR4GuwsoJ7E2Z3t2reLl1HrgCKNc82auSMEW+TIGNIHL5gsS7XsdWL9pZHaD2FAsGc
	39vLXvPBVw6mGL9Ykcq2jyZiRsXZsDNcIm/ubmESdOU4vvdEIn61ppfoDznBCNvx9EBRLgGkbWwr8
	2GdbKJRkmuLtT/1LRF3R1oms4Hh3oQepUpxOuqJcaOdEhcv6l59PuFVqhWIwUAMKkx993H+BfR3AH
	vhVFXdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgZd-0000000B0x0-3QDh;
	Thu, 13 Mar 2025 11:18:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgRp-0000000Azo6-1DxN;
	Thu, 13 Mar 2025 11:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C48D35C5BBB;
	Thu, 13 Mar 2025 11:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B53C4CEDD;
	Thu, 13 Mar 2025 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741864196;
	bh=y5Rt/A3I0puk2tWJqwdD+VS9AYs8xTcIZQZ75uLi/aQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OFpakx8qWuEP5hs9WCekvz25n4fnw63dd3zf1Hsha7Gk7+1cmshaz6E6oE8d6Ieh+
	 tBzkhdDKSaYH1OgAoNK+7jfD0fdJN4xQ1W2eZZQZ9HelvNaxoDzMiG4MttBJXWwp8t
	 OYQ48FdLg1Aw9IqOqJEj0BBUa8qX6V/9YjFqw9jvVKWW22JNwRMHhG8JnhrlhbaW6S
	 29uLDOm+zyzCye6P/FtsnHmuM8tJKNGUgYdVxO1sAeEi7yoQhyS/YRufPMcwDeeXtg
	 ax/RpzUJ7Toj8NLazkxeVIel3BUqwjK+RCDn16ltaxBF+hnLwAAfRjkh+iPS9k7Pz+
	 SWDFtToOpr/aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB6693806651;
	Thu, 13 Mar 2025 11:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: Define interrupt constraints for
 DWMAC vendor bindings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174186423076.1466791.15724461347771862891.git-patchwork-notify@kernel.org>
Date: Thu, 13 Mar 2025 11:10:30 +0000
References: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 vineetha.g.jaya.kumaran@intel.com, biao.huang@mediatek.com,
 xiaoning.wang@nxp.com, linux-imx@nxp.com, david.wu@rock-chips.com,
 christophe.roullier@foss.st.com, rmk+kernel@armlinux.org.uk,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_040957_382898_BD60E5EE 
X-CRM114-Status: UNSURE (   7.84  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sun,  9 Mar 2025 00:33:01 +0000 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The `snps,dwmac.yaml` binding currently sets `maxItems: 3` for the
> `interrupts` and `interrupt-names` properties, but vendor bindings
> selecting `snps,dwmac.yaml` do not impose these limits.
> 
> Define constraints for `interrupts` and `interrupt-names` properties in
> various DWMAC vendor bindings to ensure proper validation and consistency.
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: Define interrupt constraints for DWMAC vendor bindings
    https://git.kernel.org/netdev/net-next/c/5a1dddd29444

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



