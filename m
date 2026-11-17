Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F3606A32F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PgC0MZwk;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dy2z7c0V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YhC7LMQsZJcFBItk5rzBnnu116ZCqPDPAdrEnbFmiXE=; b=PgC0MZwkYu5Xnw
	ZjFetUu60QFmjHfe3vuav8MMPGevbcq9tVMgFu8Jd2BiBFx2OYa06rsUulvy+1PBjCZHEO2kVeLkA
	0YmykTc66YNBHRc913kbuZ87JFgww8lFekGhriS8DDt+flmgmqZkbMcwG3HAchx8oRaZxhdWVEXb7
	8MXL+p0Ptryd8rpq9NIbN/g7C8CSRmOfGWMlCg+7QhF6C90KQQdiJhWsm4MQDu/asMsVa43XHYymI
	UZNU3lK+wjAD2GOFdvZdweP85FHtSV61Z0uxOD8tySBSLTYd3a8AHPC/jUA0A/H8QzYObFoOjVJZ+
	WWliobuwgzUFzHUrnpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGuP-00000005MyX-2LPz;
	Tue, 17 Nov 2026 10:59:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGuF-00000005MwK-2U9W;
	Tue, 17 Nov 2026 10:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913157;
	bh=TNPoh1km3RiLkwQBgyHz7qvbpEpaEwiiICoDpf0eB/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dy2z7c0VuQ79pLm0D14yDXpjXmOH662JG6Nidn/5yWAT2HeHmYfuDWKBSgDdKheWb
	 cm7Va7bCYdSZEpFd8RE1TJzSt1SdzXFRsbd5caCwn//ww82a4CaT7sj0gkU087ZKvN
	 3FgiC5SpX3fK0scmLeQnuJt7WgvJV6gdU7iy/zpjgJA6cx2HDdeuIFX8vY9OiqwvDo
	 67rU2473FAon/iZ2+JbANwzqhxAXMl9oBp1NzGcEcBnPVT4jFDsB/q0j5Gzwiqo4jV
	 Zi5GyVEFI68u/TnN/aWk/4xbHf2nXb8mDzYRpBxy4sfHtRxFoegWB3YVIgWyRKz3gJ
	 qmTJPeqLxACIQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A13417E07EC;
	Tue, 17 Nov 2026 11:59:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: mediatek: mt8173-elm:
 regulator cleanup
Message-Id: <179491315750.156157.4493365052621090774.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:59:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_025919_841417_2142AF5E 
X-CRM114-Status: UNSURE (   9.06  )
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

On Mon, 09 Nov 2026 22:12:27 +0800, Chen-Yu Tsai wrote:
> This series aligns the regulators in the MT8173 Elm / Hana device trees
> with the schematics and datasheets.
> 
> The comparison and digging through datasheets was mostly done by an
> agent. This was an experiment on my end to see if it could understand
> schematics and datasheets and help with the tedious process of comparing
> all the documents and device tree files. I think the overall results
> were pretty good.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[2/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 compatible, node names and labels
      commit: b94b23b176a4f358b91610399bcbedc6a85328c0
[3/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
      commit: 2a3238d299a3568dca7bc8ffb6d284364c96c18a
[4/5] arm64: dts: mediatek: mt8173-elm: Tighten MT6397 regulator voltage ranges
      commit: e3c69f848f95979487d4230ce59ccc8efdc207d0
[5/5] arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage ranges
      commit: d3551416f5b73a7360e5f1c004a62eb174b82953

Cheers,
Angelo



