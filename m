Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2D9C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtffovqX64Gup4hAyBrcApNT+0IV+LKHJusd+ujgz3Y=; b=CB/UOMsX1FOT0NWOc6EX9pdH6N
	B9dX2+vBdQdST9ipfo6Nlfk8/iWF5gNxmeUF6+8nJaeyCpyEbmHEM2cYEwmtVMpiOM1/RBHccvq8F
	SNIE60X8yHDx0mwTHX3Nna8d2tLezFOgOMjm/kiIgZw1bbQwSj1MxNQyzde93Cm4KytPxXe5WmOuN
	TCa3gVv3UT2fvHKFd8TdEOJxCFZfMNYo//tU3cbYWInX7I2bC/85FC+nE9ydjqhcnJlPrKKDu4Tyk
	IMC64z45TO6iK4sNEE433G0+KBC2hm1rU+M2tR/XWvVYjYksG2wq9jHuC1XblmZPZk8KIy5ym6jqS
	7GTXAj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpLQ-0000000Bcsm-3HZU;
	Thu, 10 Jul 2025 11:21:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnxF-0000000BOSC-0wEW;
	Thu, 10 Jul 2025 09:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92BB45C6CAB;
	Thu, 10 Jul 2025 09:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9595C4CEE3;
	Thu, 10 Jul 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752141156;
	bh=/HJYYChAy20DN1nkebvN+gQiiYH8PgHrzFXUdHv1QKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5BWyxpHwKCnatmuyA0n/neImgZGYGMGy2RhjjVP8r9hJ60tyjc53VqlbIcspNnhR
	 qHrjedu2jDjzVOa0Rs7z7QKD/k5GDHr34HAdmuBm/JN52DTMSF0yNQFmNy9haNa1Ov
	 2xgc4xh1MHaTDf3aEHsN7Egt0qJ82vlvS17nSv86quml+wwcVVp1PaChwjhipZ26Df
	 F99+QMGldthrABMOQ7wJyKoEWY6Eg5SgEnaQcQy/GRoh3tzecGYtyR7SwhyW3aTXje
	 HtD7ULTPrjRTISSkrdwQjv2e/Lkyl7f5V7hniWLnCtKee+CXNsuBcZ0PYY+f+iQeqO
	 r7Im83PPJgYDQ==
Date: Thu, 10 Jul 2025 11:52:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v9 04/13] dt-bindings: net: mediatek,net: add sram
 property
Message-ID: <20250710-masked-intelligent-dalmatian-caccbc@krzk-bin>
References: <20250709111147.11843-1-linux@fw-web.de>
 <20250709111147.11843-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709111147.11843-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_025237_298656_03E9B32E 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 09, 2025 at 01:09:40PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Meditak Filogic SoCs (MT798x) have dedicated MMIO-SRAM for dma operations.
> 
> MT7981 and MT7986 currently use static offset to ethernet MAC register
> which will be changed in separate patch once this way is accepted.
> 
> Add "sram" property to map ethernet controller to dedicated mmio-sram node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


