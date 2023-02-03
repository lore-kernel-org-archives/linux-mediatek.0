Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B0C05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 18:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bjPh0iT94QVZCkysZQQHnFLioRTLBYvi144JTODXNU=; b=VxZcrOfjaeXTTNKtik3UqdshFa
	+9yNYDH/UADivZ6Y7hQ9w6613+O0vT7WBL0nX2HJwQkGv8387NeHjopi7mGNF3bcw3+f+1mRNREQ9
	sNKSprCsa9Im/j0n4NtKOcqUuYLG+uqE5PhkVxd/6FQM8y/3y8sY8Gu+BTG7SUTDgOJN92xmchQsT
	GBqXnmCPXiI8SycBooOUnVyX/zlEC7CmuRdNRzxHPAU7mB2em1JA4FMVEfx4XG5euyAKaFlCINvEs
	+GVJMriDT+rJ4wY0po4I0tHLQYoWCqYPiysBQ02RTcQa0UCi2tryFpPCsnmsUyF0NXDSrgfOaFykk
	hILzli1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0Wu-003CMO-GT; Fri, 03 Feb 2023 18:11:20 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0WN-003C0s-KZ; Fri, 03 Feb 2023 18:10:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19BAAFF805;
	Fri,  3 Feb 2023 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675447843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9bjPh0iT94QVZCkysZQQHnFLioRTLBYvi144JTODXNU=;
	b=XhDkeWUlEurhZ3Bgl+5msyAWrbPKfkj3YTYEnmQLMeVYVWdU5m6CKF7q3531ClOozMraox
	HUAr/RAHLitM46YO2BSWtH+lIbL2yWIQjAQYvF8vtpuCEthQk/mjToEbJ0mwtZruv9q6th
	KoImtBb7r6XfuhLTdzENxcsC9lRcLUf4nTfVtKGfEiyhSz1+mp/RJHPJV/vQdG/ojbts+G
	y/mBMCjwvBe9gVAvX0pGzfuVUlhkte9YcvMSleuAlo8MOyNYJQO1MzvSktgG4s4sZHkOI8
	4+z42D78om4UtgsLdXkboKguxmJHFHkqDwUenexArPJb6bUimaXbAh0/5cwxOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: mtd: Split ECC engine with rawnand controller
Date: Fri,  3 Feb 2023 19:10:39 +0100
Message-Id: <20230203181039.436352-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201021500.26769-2-xiangsheng.hou@mediatek.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3af7ade257649d8e2e17eae96422b7868ed215a8'
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_101047_856102_5FBD5A2E 
X-CRM114-Status: UNSURE (   5.94  )
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

On Wed, 2023-02-01 at 02:14:56 UTC, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

