Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCAFC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D30+KTuVISNJkq8cu13QoORHjYLmp/rARmI7rVNmqNQ=; b=zspOiY7OgiWO7bVccR1kPgTwvj
	5+5D2JeqofP/UZ3/bjB4csK7ZPy59PkEuihYKJA1bVCUf9tsq7YCTvQJ715XaciS3O4v8Ow7r08Bm
	ZlwaoDsUvxHYAuBU9aB+h+St7s5KpB/do9VkfWOfrh4lzdfMWYh4c+6yG2NZ0eHPwR687R2UbPr/x
	LMdOsfSRJ7IcpUqKaDyVkSzFhZy94wByVP2c6WeHkQtGiWm/O2sY7NtbBB4ljJOHujiLL9dnekjwH
	nSC+G6LPVwAwokiNCmMLLNhY/z7hwIKShR7Y6BK/2GI+owZfXGVW+cFyfgn6os6ue8HGtS8RhjgPQ
	TAm8Oi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saw0E-0000000Fh0v-1Lcz;
	Mon, 05 Aug 2024 11:35:50 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1savzy-0000000FgwX-0EoS;
	Mon, 05 Aug 2024 11:35:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722857725; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g/GnvcO8TsPWGNycqtXHcNwpaKWPUgO+exdWsluW8aGDtbvOS9DQgXJBpZ48e8S3f91KIa1xycPzv9VAKvxWgihaJQoMszv+gnieR4JZ6oN41ft0UwOuHaNhz2pTYYCH89jHL3ehRKOzkLnmnpsyNsJd5RZ1AH5MqHpyfihx5cE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722857725; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D30+KTuVISNJkq8cu13QoORHjYLmp/rARmI7rVNmqNQ=; 
	b=R8mbq4TT5iq9+/+jYht3D4p0uCqjZTNi2uhXx4mO9GfgFGyw+zLicn+CCUfAyaLNH9p80I/14cMHulKrwNiQFcKvbsCTKNUE9BV5FE07Gk+bOd227WytT8judpLLo0zH5VRA4DyB++CzpqGEtTzI8J27w4gdxcC6DeTdprCXE6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722857725;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:In-Reply-To:References:Subject:Subject:Message-Id:Message-Id:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=D30+KTuVISNJkq8cu13QoORHjYLmp/rARmI7rVNmqNQ=;
	b=QnoumxH7L47I55LMXxRQ4/7i/EyzMfwsellRfRc1xz8A8yv+7mUpmMKmrOK9A8Es
	W7i/QbMt4QphxswrzV0PB+cevZ0XZupFrBW0z7XVg3wLPDfM7GIPUZLiZIu6aGHxQqI
	jjWIgTrGfhjmO/uiiT0hwoyiSI9eGltk/nA/3nek=
Received: by mx.zohomail.com with SMTPS id 172285772333611.108724364058162;
	Mon, 5 Aug 2024 04:35:23 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20240803-mtk-socinfo-no-data-probe-err-v3-1-09cfffc7241a@collabora.com>
References: <20240803-mtk-socinfo-no-data-probe-err-v3-1-09cfffc7241a@collabora.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8183-kukui: Disable unused
 efuse at 8000000
Message-Id: <172285772078.117243.12486644003118718427.b4-ty@collabora.com>
Date: Mon, 05 Aug 2024 13:35:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_043534_163288_74D52AEA 
X-CRM114-Status: UNSURE (   8.64  )
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

On Sat, 03 Aug 2024 10:33:25 -0400, Nícolas F. R. A. Prado wrote:
> MT8183's Devicetree describes two eFuse regions: one at 8000000 and
> another at 11f10000.
> 
> The efuse at 8000000, unlike the one at 11f10000 and the efuse on all
> other MediaTek SoCs, does not define any cell, including the
> socinfo-data ones which the mtk-efuse driver expects to always be
> present, resulting in the following errors in the log:
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui: Disable unused efuse at 8000000
      commit: c24025e978780f0a82f859356caa00cdf20ab28c

Cheers,
Angelo



