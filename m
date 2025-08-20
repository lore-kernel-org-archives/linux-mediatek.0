Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A0CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71Qkw8Hy/P+iGBViOApzul3IXKCx7c5tsaWiYZHLSgg=; b=29kZv4/9L04UhL9S+2o5nyZk+G
	5fLJk0D/k79h9QsLNq1XzPMfym2S/++FWcIAsFkVPAfP36n3vF8m0qsoRXoXrFrPtj7W5kq0xZzWS
	67DRe1IKO6qwNXqV4WbPidjowwNTBYZHcp9Kb3PL8T3aRSfAPwYOvG+DNPJ56aadSM4MrS8ne2j1C
	J1hm3aw0fT7YWlek2VhneMjvidVPkJdbXdUY52RWqCg829KiWqHvwNSPO8ReQwbh0b7a5wG3780LB
	2ORG1AQPKJ9OgVI/2SDpg3DVWlkc/2Le1hcL3O7DQe6DY0K0q0YbydjseWyiGGKb5mw5C0FbDDqXk
	uxQdb5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojbN-0000000DzIu-3osw;
	Wed, 20 Aug 2025 14:15:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoirq-0000000Dmmo-0iJt;
	Wed, 20 Aug 2025 13:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696520;
	bh=71Qkw8Hy/P+iGBViOApzul3IXKCx7c5tsaWiYZHLSgg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iTq12KNWSC9E9H/1v6af6iHkChbR9pZyRLHBaUbD7YIJFBKOSy6riJ/C4k8FtnIEH
	 6Fiv4EAvB6E7GkwTHALIMoffHcUGvuCwzeMyr6k/zQMnwPQGQQv+JZ+dDw3jtyU8R8
	 fUbxoOGNK2jvDcXAITiU9PJUR0V4Tj3UbKkC1OTWyg6E3mtW/P1Hqs8cr0srLyJ3NI
	 jjvJZKrCYzD0cWrQG8FK59eyvluG2va4mWnIhod/92fvUVHtPXKcy6NlRz1y1/gUpP
	 bY2857VT7F9P0svczGWlSHx07jjQyStRDyX0JEH+LukctjvB9BTUYNjhPy5ZA1pQGA
	 /pSyslgYppzwQ==
Received: from localhost-live.home (2a01cb0892f2d600C8f85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65A6917E01F5;
	Wed, 20 Aug 2025 15:28:39 +0200 (CEST)
Message-ID: <58234e996f245216aa93b5520e4792f7c1ff4a4f.camel@collabora.com>
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
From: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai	 <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev
	 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, Sean
 Wang	 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 20 Aug 2025 15:28:38 +0200
In-Reply-To: <20250801172136.GA3104927-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
	 <20250801172136.GA3104927-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_062842_350975_78C7D4EF 
X-CRM114-Status: GOOD (  11.15  )
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

Hi Rob,
On Fri, 2025-08-01 at 12:21 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:04PM +0200, Julien Massot wrote:
> > Update the mediatek,audsys binding to support the mt8183-audiosys
> > compatible, which uses a different audio controller binding
> > (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.
>=20
> Looks like this one needs 'memory-region' added?
Correct, I will add 'memory-region' in v2.

Regards,
Julien

