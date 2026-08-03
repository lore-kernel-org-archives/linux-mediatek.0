Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5C9C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3hwnMFgDGFCuJRAXL8oGqWOBTJI33ph5sUSaM1/MFc=; b=F/cjNV0er0dEZiEh38FJrWDQzy
	bBIJrvIDer23ski09JNxFsD4ZAS8rBy8/POogMUICTOhNDAuf7eh3z4j/4SGmkkXC68xDe+taqJA7
	j7VVU0AA+IaZqcwmXbPxlVrym/vBdw8khW6b8PysJ9VpEZzOIzoOBG0YMF7r8nS1uxmum5SEzHKhT
	MejwfvtIiVPOBHW47pyPK/Gn/OkIlZV9Pl0ajlbtIGlaK+JRdNofYD0H7/gPh47/J9LcOdB1fd/js
	ev75uRfqsabEza6WY1LAahw7AvQpTGlXHg5Gzz/gRGwRuEUozsXPkIlCA7JI7lIPZwLZPSByuOGQ5
	iAk3H7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqygp-00000000Skj-1XEF;
	Mon, 03 Aug 2026 19:51:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqygo-00000000SkH-03gq;
	Mon, 03 Aug 2026 19:51:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E7F060A86;
	Mon,  3 Aug 2026 19:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5571B1F000E9;
	Mon,  3 Aug 2026 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786669;
	bh=q3hwnMFgDGFCuJRAXL8oGqWOBTJI33ph5sUSaM1/MFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=URJ7/siq1x5v5FXaGH5mw6h7Wq7K/lLEqrBnQ4M2Rz2Q33AyEHeQ8POFZumXkhTxP
	 PbcbpOoUbm/o0ejVMKVYThjcBc/5pzCBIjlv+TYtjOIgik0yJi9aZhk7YdgmvYC64n
	 QOA66GvNtuCWIlTb3bnycCgw8OFnWdOlpJuWUqGJBJ8HnBvAbnXFjNdQfjG1fgRl2t
	 dF85vNAxNhin0BM68QEguGAocsfVR6tjxcE82doeGzvRhziaTrEp2s2zLffQ1QWcWK
	 oAIVAHTPzEdusNs7cnvs2CRJei3w84MRagjMzOqsm/Dt2RcZcGSvbXRVAyZn1K4Qhl
	 pFNvgiFe7UsVg==
Date: Mon, 3 Aug 2026 12:51:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, kernel@collabora.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 00/25] MT8189: Add support for system and base clock
 controllers
Message-ID: <20260803125107.76bc9c9a@kernel.org>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 01 Aug 2026 13:20:46 +0200 Louis-Alexis Eyraud wrote:
> This series is a continuation by AngeloGioacchino Del Regno and I of a
> previous series ([1]), that adds the clock controller support for
> the Mediatek MT8189 SoC and its variants (MT8371, MT8391).  

Why are you CCing netdev on this? None of the patches touch networking

