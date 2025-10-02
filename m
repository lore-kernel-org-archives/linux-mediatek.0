Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E9ECCA470
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Oct 2025 00:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4kBldQdxCrN/O+tkzAtFDFnGXZH2zQc6MBqyTriJhU=; b=VqIaG1bDoaVF0e9IY6AZUfF44w
	QnTeHd48/MGI8HIIhBIYWX33vpysJJln67rRebPyhzH7KKbgJ0z+9Q0MF7GdiTrw/gEcQiq1SOFsS
	U86Uedc6ivT7p59kv7PKp/YA5/Fvk39Tfm+RboF+Bs4D02ma+u3BFtpWj8IWtI7ev1JIJPNpprcDC
	Hs4krsdW+RgLei2JQ8iJaKPSuDNtIFp+iSG2VCq+CRv2j6dM2DAcFH8y5pwykOaiHL50XsUWnrN/h
	zzvnVs3yjrpt+hitIWbLvBf4OdKmqmUlsIdD4LvObA6GWIC6U+soUWSEPUS1BpDtp9poMHq4B7bV8
	GqLu8N2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v473t-00000009Irl-0u06;
	Thu, 02 Oct 2025 00:20:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v473q-00000009Iqq-2MiA;
	Thu, 02 Oct 2025 00:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E013D40A68;
	Thu,  2 Oct 2025 00:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7395DC4CEF1;
	Thu,  2 Oct 2025 00:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759364441;
	bh=Z5VycwaRGCTZh6B0+RfFBfHEf7Kh1kkGLViY785TdZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBxfyob737auB/QcF4F3g6r4Kc+F+nDjefh76CK3QaXDH2wX/4RrVopLminyOy+Yt
	 yBKeUbEZdPjS8nkPJ2y6ABhCR0iQWZFX3Vfnl07r2WSpNfY2PRyOtHOF4UIxKKYN72
	 OhqpKdj3F4Q9mKHw0iWbb3gV3msoegcF7YB9llsOqwDPTpO2S8EF4DaW9hXKao3ayG
	 D5ZUfPM1/bdBtx15W3EV3u3vZE32fBWg15xBsPX5z+iHXHPrzLKpM7XkIRL0gWtJ9g
	 mduSCiMtwkcrZjaHDbM3d9afva2YpizvZMPz9VYO/xBjyKiqyr70IylztsVnf/9Was
	 Tlg6E7Z+sKVHQ==
Date: Wed, 1 Oct 2025 19:20:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>, Andreas Gnau <andreas.gnau@iopsys.eu>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: airoha: Add reset support to
 EN7523 clock binding
Message-ID: <175936443940.2629153.2958124902767152491.robh@kernel.org>
References: <20250924094112.1918444-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924104850.1930254-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924104850.1930254-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924104850.1930254-2-mikhail.kshevetskiy@iopsys.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_172042_624740_A9E57E9F 
X-CRM114-Status: UNSURE (   9.24  )
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


On Wed, 24 Sep 2025 13:48:48 +0300, Mikhail Kshevetskiy wrote:
> Introduce reset capability to EN7523 device-tree clock binding
> documentation.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     |  3 +-
>  .../dt-bindings/reset/airoha,en7523-reset.h   | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/airoha,en7523-reset.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


