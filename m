Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34F3C07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkCrzoaP8Le6U4BMdmq93OZywG8t/RJ8WmbNblDalkw=; b=aIxlvh61oItobkO2a5oHNRN64X
	wdhI8MfrKfZgEermN1r541r0sDxC3/31j//zQjzTD+ALejwhfqwfsPOmbn0i2KJOgE1z+sY6Cfkmr
	wY2A7bR9MCpomYRulPs9/Mt8SQZ1R3gJeKlA5onOuBzTtEECC7kwjqxK/sF4cTV67pGbIT9EBjLtw
	cwxl2+Uf+JKD3bVdSF1Irj/Ag27UgiZ00I53/jmMvhTi4sBrZtzleV+DRNJKHWFdX8pZfzkKHRuW5
	SHlKTBLJkkLTNJImNBdZpefpyYpb/WrBvh5z6fRztQDXbLZADNHqrzOaRsanoHAZo/egOeW9TJqFI
	mHCQt/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcW-008Sdg-3B;
	Wed, 29 Nov 2023 13:28:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcA-008STc-07;
	Wed, 29 Nov 2023 13:28:31 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A8956607323;
	Wed, 29 Nov 2023 13:28:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264508;
	bh=HlqEFTwY2FP70HIxpwXJdIFjuEH7u8FwV+jprgf3CFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jb2RZYuOk8xi1OQ/9R8MGVhR6I/09yX1dkEfwdbQldV0arEJhK8rc3cHSIYTFzmWj
	 HrbpWO02iNzsYrRMk/9nhnJnWJ+jLkd/IY+XJcW3crxtWVERdxg5E5SvwWMKorhK3e
	 52Fxe5EL0ntXYUfhHEjQZg+qGFYzMRbg7MvzMgZ6GNNGWX9/keWJIKzd7fnk4SWNkP
	 qozljNtJRaGXd9MkRjQ6SqMNLX3VcH+B/wCJg3/gAMKP6O01JQMO41UJptoeD6XPQb
	 C0rBL3vIJh2Vti2cv3pskRPtVxiiHrOi2e2A2M0EaiAWv04JmsgQ8NBMRzNsgZ1rl4
	 SoXTg+7NZeHzQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	matthias.bgg@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	allen-kh.cheng@mediatek.com
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: fix clock names for power domains
Date: Wed, 29 Nov 2023 14:27:35 +0100
Message-ID: <170126437824.153055.4332552662012984056.b4-ty@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005103041.352478-1-eugen.hristev@collabora.com>
References: <20231005103041.352478-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052830_203453_D160901B 
X-CRM114-Status: GOOD (  11.43  )
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


On Thu, 05 Oct 2023 13:30:41 +0300, Eugen Hristev wrote:
> Clocks for each power domain are split into big categories: pd clocks
> and subsys clocks.
> According to the binding, all clocks which have a dash '-' in their name
> are treated as subsys clocks, and must be placed at the end of the list.
> The other clocks which are pd clocks must come first.
> Fixed the naming and the placing of all clocks in the power domains.
> For the avoidance of doubt, prefixed all subsys clocks with the 'subsys'
> prefix. The binding does not enforce strict clock names, the driver
> uses them in bulk, only making a difference for pd clocks vs subsys clocks.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: mediatek: mt8186: fix clock names for power domains
      (no commit info)

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

