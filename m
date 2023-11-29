Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD2C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8mHZYV3MUFWL5co4ZnmTg0MJXs95KfzugQsiHEhxzY=; b=W21doTFey0yOswUtAQ5cNubgEv
	U24l7coM/NXBF82oMIuK8L5b6W5BQg4o1PRnJdsyDJxJEtaODN5QzOfkoW5QBfG/xXnaUhmbBdtcn
	KwVGZmd49m5+htiSV9bCfiAq1L24fwOLLAP0E+A4nUv5N5LKyOLrfdpbUHZHSL/5un5D0qw9I3oI4
	5kZuN1MiEdQT1xoGh7UOS0kkF+dHQ5ab4e8W2U/kGXI5UQeH0bOdYzZxMPm7Tb/cX/W1l6lTDnhiO
	wpqG90SGJW5gmThPm5Q/bx4qU2W4ga96rEAIsBp36kAB5XC//iFrC8zUbBPRcreodlTXb93NG19pG
	dtdFEygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcK-008SZW-21;
	Wed, 29 Nov 2023 13:28:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Kc9-008STG-0U;
	Wed, 29 Nov 2023 13:28:30 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3833866072FC;
	Wed, 29 Nov 2023 13:28:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264508;
	bh=6LCAIT4P/nvAhPgTDUDx07TqLshXCpjOmlXXLCHI4To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NEF6gWlf2ddCV9DPiXYopma9Lf7I5mUfAmKhSeoibvHwRiZ7USgDx//Y+EHFBwQoK
	 rYgx4Q7t2ngsR2ts4MssQy/JpV9eiLTRFLVTZERrq7+iXeAH9Ok9JjRvQDv8EDlMJv
	 AkK7ECAk0tLrA6j3hOcUY88def0Hya1iZY+/sDYEhds983G6y2pgjz99v6UaR6NtAA
	 0H98L/57riKpOwZlaxESwok8IjyRsMy8D6ZuAvk+2KE3sV26WC1FqT7BRvZlx5G4We
	 jFgf+An2yRtk1r6PzcH60B+/7IuS09J/fS2X+A3J2M/Vl67db3MXNd8phRHLaxFiQq
	 I7G25aP7mkE1g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	kernel@collabora.com,
	hsinyi@chromium.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
Date: Wed, 29 Nov 2023 14:27:34 +0100
Message-ID: <170126437824.153055.10626099314938040381.b4-ty@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230814071053.5459-1-eugen.hristev@collabora.com>
References: <20230814071053.5459-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052829_315863_C82F6143 
X-CRM114-Status: UNSURE (   8.20  )
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


On Mon, 14 Aug 2023 10:10:53 +0300, Eugen Hristev wrote:
> dtbs_check throws a warning at the dsi node:
> Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Other DTS have a panel child node with a reg, so the parent dtsi
> must have the address-cells and size-cells, however this specific DT
> has the panel removed, but not the cells, hence the warning above.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
      commit: 4b66a34afe29d991155081b2f1e10482bd00cbaa

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

