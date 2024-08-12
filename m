Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE01DC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2HZKyQIlRWTm/LdwqubpDUwV197NKUKNRzzO+49+WA=; b=pS+OHGatT5qDROkSFlJffzBhQg
	OsEEQPQBj68wRuy5Ob0RZHZeHNihSExmV4ai0pt+ys0ss/tzWzcHFaHER8vLSOoEhqIyBarSDmPcY
	Y4zzgOrpbS7U1vzFv3eIbL/P35WzhTcV+weBRKVa/GrAVrvw+hN4NRTIzX15RiI5X+moDBYBRkTdR
	yKFJXyM85pPLdOQwhGDXAw+GxoChZT3Zh9aT02njYvx7A5MZ4jPFrOTQD6CKxk1gPBXC1y+NRjwiu
	yl8WofN3rRSN5/POnxFfgyi9tNj1o7+HF3vhdoduWAQIrYj3RAbVs0oQ+cAEcFIK+GlXwzIsjIiYb
	5rN2Fcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdcEB-00000001ZUJ-1tGT;
	Mon, 12 Aug 2024 21:05:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdbyk-00000001V9v-1cmT;
	Mon, 12 Aug 2024 20:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73ACE60FAA;
	Mon, 12 Aug 2024 20:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32008C4AF12;
	Mon, 12 Aug 2024 20:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723495761;
	bh=u2HZKyQIlRWTm/LdwqubpDUwV197NKUKNRzzO+49+WA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WUdVZaN77H8UjrVyJ5W/Co9aB1M42l0It5ciH8J8rlYMUUI/pG71qmaMndv49E6C9
	 lvY7LMqIgiARqs0sGcJIh8wfrCHD+eZttZMrUWwcb8vO+Yps/70Zw+PJdvgFOuNQyd
	 X6fy2EegfDuMh3ZGNvIYkAwMBufhu/Lf9E4wbu+kvUYw1FmW3zcR7x80KtTCSo6Pd0
	 htTrGaaSUO/lPYMnqpHea1fwRmt3w9YACEZENO1xqKrWEuUQdk0JRQkps17s3Amy8E
	 b+Nc7ZRfxQ3LdU9gL2mrJ41D6k+K5i3NoQbLAU+lOqL2DonJpF+7aMWN7qBMRjtEO5
	 5iHfjG1D3W1lQ==
Message-ID: <c71cbc08ad285cd494742cd735e1e3fb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240807-dt-mediatek-clk-v1-3-e8d568abfd48@kernel.org>
References: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org> <20240807-dt-mediatek-clk-v1-3-e8d568abfd48@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: clock: mediatek: Convert MediaTek clock syscons to schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Mon, 12 Aug 2024 13:49:19 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_134922_516575_B1FF79E1 
X-CRM114-Status: UNSURE (   7.65  )
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

Quoting Rob Herring (Arm) (2024-08-07 09:58:55)
> Convert the various MediaTek syscon bindings which are a clock provider
> into DT schema format. As they are all the same other than compatible
> string, combine them into a single schema file.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

