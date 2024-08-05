Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBAEC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQdZwOVeHf7udvthWkMPGVSKsH0hrajNPr+Zg+3h0zc=; b=QE/ka89Pbq9r1AYnr7NO6VPEHm
	Nr2KoK76hUX9I3cBhOIEpj8gk8b6NMH7vxyYlI69F9dvTZ5xMKykljtXL5iuNwCVkE3Zw06+PiFgq
	25ydaMXeTfPtZMc8HN+/YlMJWDaFX+eDtok4aBSqY8Hc577jJFct4vSKtzjhwqidE29wHHL0mGGUB
	afmW2yThxbZq1Xn56ir5waKewfIe5vgHy9sax7Fn3cM4mr7WUZwMjlxHcF55Qe0DmTH28X0YNRLp2
	VN1gVC0cwbj9wPQ1yoH5helxmalVFjePGRAsGlpTpwylczlBuJOcccfHz+VuQWcTg71GB/XZiPKiV
	+vNC234g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saxTB-0000000Ftcg-3Xa3;
	Mon, 05 Aug 2024 13:09:49 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saxT8-0000000Ftc0-0cyV;
	Mon, 05 Aug 2024 13:09:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722863372; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E/+z2c/rbcBMKfwFkjoxLcGsAmpp2sifRxR2aZzmQt7TybbcxmC7osGbZG9Mx2UKSMx6Xrd5zbphSDvwKE4L0w7KoyfpjCMBhVDFd8yHHxxGGcOHRNg4ziT0y9/Lne9DsGioWX8eQ4956HtFQZGCpgs9mz7RmWgHLdA6UXOjl+U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722863372; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VQdZwOVeHf7udvthWkMPGVSKsH0hrajNPr+Zg+3h0zc=; 
	b=QmNUuM/E63RgQV8j7SD/TwNHzlTePvdQxi9xH5W+e5RI88rCR0Q2ChhqDyRq8xv85+LiVAOF+ppA/EVEm68kLp/X3h2WwSwr04Kqdc1bDOmK0krHTfif7DUq3YKhSGg1HqAwZ3xvDD5FudJHdtViXRU//RcRMtWkIb2aBqTqr8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722863372;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:In-Reply-To:References:Subject:Subject:Message-Id:Message-Id:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=VQdZwOVeHf7udvthWkMPGVSKsH0hrajNPr+Zg+3h0zc=;
	b=jhZjNKYzskUl5AR2tRoOrGFrPG0ufWPv8VdswbSResCliIZTlJDQF6usyr65LA5D
	BxKt7OG6xyNVmecST78Ux/HhgXWM3FPikzTzJya/FDOKKm2RD6ythrQfHRNmYOjNT4d
	FE7KGbSE7BnTK4L+7UI6v1P11IHX1NfBoIUCPG2o=
Received: by mx.zohomail.com with SMTPS id 1722863370677901.5009092360644;
	Mon, 5 Aug 2024 06:09:30 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Leilk Liu <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, 
 Daniel Golle <daniel@makrotopia.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240727114828.29558-1-zajec5@gmail.com>
References: <20240727114828.29558-1-zajec5@gmail.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: spi: mediatek,spi-mt65xx:
 add compatible for MT7981
Message-Id: <172286336774.159349.11641344023226558770.b4-ty@collabora.com>
Date: Mon, 05 Aug 2024 15:09:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_060946_433235_B68C9F4F 
X-CRM114-Status: UNSURE (   5.86  )
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

On Sat, 27 Jul 2024 13:48:27 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 has SPI controllers based on IPM design
> 
> 

Applied to v6.11-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt7981: add SPI controllers
      commit: 64b1cbad62cb11ab25ef87ed71561bad92ab93e2

Cheers,
Angelo



