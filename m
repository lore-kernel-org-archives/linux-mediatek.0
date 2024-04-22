Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DFCC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgZUmAUTdg4YM6SB2rhexNDSDuSLY2rnSTl6C2oQyE4=; b=UtdpPCz3VuXE9DDmyWrvhOrd9N
	LGqtpuDawjdKxhQ4py7Ukq2VOqg/03O5GV69kkufDaWP/Uc9PIHLGvKKlqUp00OVynru0fv39vXcb
	ycHZhtikQi7+Lr4Eb9RLYbpK3xwrZHUSuxKzjJJ3j+R7EikGoCXyQBoozAcZr4KE9rvPNKMzXBS0u
	LT+o0Ot/iyRTq7uIMIcXiZ9HhJ8gZg6rh84euNuy6DLK4Ik7mCrfvf1x7y/2j0cOFCb1mGGoB7X6o
	LJyMcU1l0bXKFRIjKV1a/AMi7QxuFtCKt4+uEiF/rIClVVQoVTQBow1SgW1V9sl/adaG+tDxWsYNy
	9+MNKIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytlL-0000000DkQq-3MtI;
	Mon, 22 Apr 2024 13:31:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytlG-0000000DkOX-1xHG;
	Mon, 22 Apr 2024 13:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98ED5CE0987;
	Mon, 22 Apr 2024 13:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93824C113CC;
	Mon, 22 Apr 2024 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713792666;
	bh=RmWPWoJmuT/0TeUYKPz5ezD+M2RoaksC3ftBdfD+wfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W7E4rY9do8FFKN+uduXw6rv2lCPWOHbnN1YJi3knJ+DQTYw4r4KXDAWKNgzOBD7iX
	 8pZGOBSQqPYmYyn6x2u/uUdigsbXUcNmQ6Br276FHoNjr7mXcltAje56eszwWeGUUN
	 3QgU806dbPZ6qj1Zcy1ye6z6E1RYdCT7rF2QsUYYfcEOkmfdmnXPLgonxCaCb8GEff
	 jj9ZyOaGHRCgxsXYEGtuaQPP7IDP4RqNo4jyrhIWk+qiUdSMxMQnH31GD686Gz4u4W
	 V3mats/Z4lDhC6ePu2nxABTI7pR7qR7Nw1CPx49bcflqyMB1+t9kx29kGWHhyuNnZO
	 +33+ZbY7NE5lw==
Date: Mon, 22 Apr 2024 08:31:04 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com, gustavoars@kernel.org,
	linux-pm@vger.kernel.org, matthias.bgg@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, djakov@kernel.org,
	keescook@chromium.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org, wenst@chromium.org,
	amergnat@baylibre.com, broonie@kernel.org, henryc.chen@mediatek.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/7] dt-bindings: soc: mediatek: Add DVFSRC bindings
 for MT8183 and MT8195
Message-ID: <171379264441.1122105.10432183532468198558.robh@kernel.org>
References: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
 <20240418094134.203330-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418094134.203330-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_063110_776959_3EC7080B 
X-CRM114-Status: GOOD (  11.20  )
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


On Thu, 18 Apr 2024 11:41:30 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Dynamic Voltage and Frequency Scaling
> Resource Collector (DVFSRC), a hardware module used to collect all the
> requests from both software and the various remote processors embedded
> into the SoC and decide about a minimum operating voltage and a minimum
> DRAM frequency to fulfill those requests in an effort to provide the
> best achievable performance per watt.
> 
> This hardware IP is capable of transparently performing direct register
> R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


