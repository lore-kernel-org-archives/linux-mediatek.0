Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86E3CF31AE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkpSo/JUBaK5C5VBWSfbV9/acqexmEem56xdOc8RixA=; b=JrGhtOonxhYe71sRwkMEwO3JSh
	87L/H1NPqpUbMAQgKI53L0UTofRa1UwG9MVT240rSw7AjJlR+aWMHfNWIR4tBqBlFO1iYGwnBza6b
	irAeTezWURtPWcZmmLUfS+JqeKH4PxO3MClr/0yK1JAxaHqL7XyNY0zInYDDoPz/1RilRBQmNVq8T
	zq9QOhiILa1WOyEQS81CGafCK6H1n41L4SZ31TprmSf/zwstHqjzQM1aiB3PqS+NQ/+W3phJNI/Od
	hOFsroOr4E/7ygCrQiKy7E+2OcUrpkf7x2FxD4+opBj1GkN6DgAqjSNNvameWjNuOQke4vZc40IZi
	f93hOgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvrd-00000005NBs-1865;
	Wed, 02 Oct 2024 09:41:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjg-00000005LfB-2HH1;
	Wed, 02 Oct 2024 09:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861611;
	bh=73Y1hofBdzftE9emw1h4sgSdtWbw3t5KD4Ae+00mWZ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZcGORcVIoEv/QucTxE9d6FFbQpEv/unJlHYP6JXDtWZGBuQ3Q3nkwOmKNSEXy+USi
	 +iIg9y3t3ie2k3TcjD8riUyFXUjV6Xzk9lhKYyad8wwhPZf/ArBAt1iif/Li5PPGXu
	 cAY1RHZo0OA69oRlQxKWW99Ij0+FpZwc0BtNl85S1nAUxCmtQwDAf3JN/Z8R8i0k1c
	 O5YIzOGzA8pfu2KQ1keF0g+a5dn1ArU0ZSH5csYeGIpsJNhAnL36KC26FfSFO6ll7x
	 qrG0bUJ8/o83es1/USqO3qMnQlOe+u3bRC/bCGlLHZuGlrJCk9gSKc4gfivKuET4j9
	 1nzMDEts0XvYQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9727717E1227;
	Wed,  2 Oct 2024 11:33:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-kernel@vger.kernel.org, 
 Max Weng <max_weng@compal.corp-partner.google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240924101559.879167-1-max_weng@compal.corp-partner.google.com>
References: <20240924101559.879167-1-max_weng@compal.corp-partner.google.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8186: add FHCTL node
Message-Id: <172786161056.39477.7674013877665193650.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023332_790562_E1261CB9 
X-CRM114-Status: UNSURE (   4.95  )
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

On Tue, 24 Sep 2024 18:15:59 +0800, Max Weng wrote:
> add FHCTL device node for Frequency Hopping and Spread Spectrum clock function.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186: add FHCTL node
      https://git.kernel.org/mediatek/c/43a9d9ea

Cheers,
Angelo



