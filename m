Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA223606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1iuyXTsM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4L6X72q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iegJmaLrxjuEXYo/kXVTXMNsmKwZ8sV4FxYf+lyrVHk=; b=1iuyXTsMPYHfay
	oC+Lry1jOihPgeWkATDVKWuQt2zo1UWzGfBsn/3S2uA9fKNMMpnYkDW5J7Qc4RDsAUZK4d1Rzck6J
	jtulQG7i9z5ZGer2CDAaSpezH9uKy3EXTJFCLVYFZNwayevxexzlE02ar/HfbgHrEDGL8+56dcLo8
	lzMIOHWqz3YgDehmxyL+Ef8dbpudejANvkxk+90d5nQ/3I5RXi91Xp7TvpaZiV6I51E84vwYFsYT4
	AWgRX33bblXbTfZCI8Y2bnKlLHydzoofbW3hpszf42nvxs7PN45AeH7JQeuHJLi7SX8JyUqZZOtLC
	7EQMmnyt8W4mivGg25Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBdq-00000009ka2-1cBP;
	Wed, 25 Nov 2026 11:58:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBdm-00000009kZF-2b3w;
	Wed, 25 Nov 2026 11:58:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C86AB6278B;
	Wed, 25 Nov 2026 11:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92621F000C0;
	Wed, 25 Nov 2026 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795607901;
	bh=iegJmaLrxjuEXYo/kXVTXMNsmKwZ8sV4FxYf+lyrVHk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=b4L6X72qTKMicsxqXokbel7lNBuYiYsZhzr4Bfyq0wcYC6jjDBFz6DbHMjY29zYDj
	 HNh77Io+aw65qtmIfXMBJ+cLcirYxrFEM/H1XkfJ2OcWU/VOp+vyrMr+bGhDQw4Jui
	 hVOU2AdQgfCYvfQWFZ6LtoXnPloHNv6w+KAKE7Oeue3Ijiog5V5Qy8GhLhhI1a/QhC
	 uMip3dbWMUkGyoOw2occOBaZYGVJC29rf0eNftztZNNCvIUzzHYIXd4Qa4ZlEoEHY4
	 IYrDMj0SSeOFcyfNZMyXaTuO9lBLX3fSa6/WydbRK0FHbl24Kk0PumOUTRbjxI5vGb
	 tzGRahh5iVPhQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Echo Zhang <echo.zhang@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com, 
 ming-fan.chen@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261125060037.649659-3-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-3-echo.zhang@mediatek.com>
Date: Wed, 25 Nov 2026 12:58:18 +0100
Message-Id: <179560789852.84329.1942681652314978942.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-25 14:00 +0800, Echo Zhang wrote:
> Describe the MMDVFS clock provider and its connection to VCP firmware
> in a common binding. Document the optional MMUP shared memory and IPI
> settings used by the firmware backend.
> 
> Add an MT8196 binding for the HWCCF syscon and seven mux OPP tables so
> the driver can map clock rate requests to hardware votes.
> 
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---
>  .../soc/mediatek/mediatek,mmdvfs.yaml         | 60 +++++++++++++
>  .../soc/mediatek/mediatek,mt8196-mmdvfs.yaml  | 87 +++++++++++++++++++

.... and this has build check failures :/

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

