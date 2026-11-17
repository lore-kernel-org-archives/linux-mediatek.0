Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD760A2613
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KxEv3KDP;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QAQUUQk2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m//akQsPn9JtkIDkyJkoy5a2KvGmB9mNZhCGPYriT9M=; b=KxEv3KDP+Gojom
	rvtmLLCwMX5NkLl6ogNNUZcqA2tVtSlpbhcoN4qAAzBZxSQLmXXQ4h2HSV50DVhHKR7qlBY/0+fAt
	DNC0eeKLiwhjSSGaPJHlT7sO6SKoaSi2ANtFvSRM4Vx2o0w02+p3KbyKMAaevOMQqrIMSiv/FzTYp
	gG5uAMyV5btqo0pcgfB2zHitqEq5h4oAVNhig6HNGwA7+KdvgzYdmchXfrO7VwZ/Q3D9beRtASdXi
	+CIG1R8CqLWpQBqDPaqbKC3JGSJGJoMETDS0sRNtbEk0A5lfDbgmUMEsm0LYVUZsWO5f0jdFTlgp0
	xVZcMtLsVtX9l63AFPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIeK-00000005jvx-1mro;
	Tue, 17 Nov 2026 12:51:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIeE-00000005jsj-1hG6;
	Tue, 17 Nov 2026 12:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794919852;
	bh=/NNQdnvNk7fbdVxY6HWPt8tiESYBlaF64MyDZxk6kR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QAQUUQk2XnKGQnU7PdVPFu1sH89zSlyTMWLLxn0vnY9qL2Y88IyD3G4pQgZI/aeVn
	 B4OvT0d49SQKGJlc5ZCZ6Y1PW1zXSR3nMlcc82y/xht5aWLwUNTTipNpCAMs8bn3On
	 hrNLLc78iMilcMrfo7ofuWulPedX3ONL5tr/OB/3c9HmTMBlUvXD3KcnSIPuC5eBMQ
	 dSSNmah1e6qkDxReXzxsaAeVgzTSdgBcegcMVSGu/zjUbJuU4aKt2tu4Mtr9axVRO7
	 TTyS9yHCjitgjo8iQWiT06HOiCtpSxdpP0Q9611dXatIKLX51j6WpQGJczDF+Z51eD
	 r5XHm26IhcGnA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E61417E0311;
	Tue, 17 Nov 2026 13:50:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Subject: Re: (subset) [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply
 for Startek KD070FHFID078
Message-Id: <179491985132.188092.5906284430538056975.b4-ty@b4>
Date: Tue, 17 Nov 2026 13:50:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045055_228780_6C04EC8E 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 06 Oct 2026 15:25:00 -0500, David Lechner wrote:
> The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
> DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
> and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
> 1200 EVK it comes from its own PMIC LDO, so it needs to be described and
> enabled. The existing Genio 1200 EVK device tree also turned out to
> describe the panel supplies incorrectly, so this series fixes that too.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[3/4] arm64: dts: mediatek: mt8390-genio-common: add the panel vddp-supply
      commit: 949fe0bd3a3a6ff0e4451ef38ef780f596d0089d
[4/4] arm64: dts: mediatek: mt8395-genio-common: fix the panel supplies
      commit: 036ce7562bef9a85d46ed6ba5b83ef4f5e60ad8b

Cheers,
Angelo



