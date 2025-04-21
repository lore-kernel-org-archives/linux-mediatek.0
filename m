Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEB1C369D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DzYck2iY3gy1/nuPm87HEEb2vSk8bAPQlGo4wb7KG0=; b=WwLECmXGXdxP60W/iLJzIAbY1x
	W0FHfiYCP0sZIMrJMaun7+t61AfvShRrW4Ig+0kSvEGzMEBX1eAEW3b0hn92bkiIuhkwo9pMspr9k
	yCqxV/p4JmzUVZx5ZKp8fkfdUrfpqhNVH2geYNNlSRf1sXtedUbNj0TKBr/bATcQG4PXg6Qb36o26
	U4+tiFZeJOfGtQ7VO5YLmNP9SAz/C9zocqFklXggB95QdLzuAVTFASjJLKzZQWLqmJDWrPA05/LKd
	REtkssWjXdW6yqbKP+zilC22e2m/iqvIOV9NSZ05WyYFjkJyE0/3S4MESXhxcw01+mby3LL661p0g
	RZAb6V+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yz0-00000005Dc2-18xA;
	Mon, 21 Apr 2025 21:47:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yrM-00000005CHI-2t6v;
	Mon, 21 Apr 2025 21:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD8C06115F;
	Mon, 21 Apr 2025 21:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933B4C4CEE4;
	Mon, 21 Apr 2025 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271563;
	bh=BNmQHNDxjQ4r1bN5ceeqHglF2FJStQxb5I0K3hD/Yjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ygxy/+f+us2VIsWP5tF9hAopq+MBToFgYbuJXY+9OAZ62xLdfcy7CogW4t/3P3/uB
	 4m7zb54u10G2RTiafk68fn/9UwSKh14QcJog8q5fXdB4I21oWXjA1+3dzp46w/r1lU
	 EJItI4Ybm8C7VrX6OecBOw59BfGYJxb9gYd9DlujkGOBZJS8xz3HcvIwteBJIr5wR2
	 Y9ZDxE08Ypi5UF2LR9OXjS6nyc2Q3Kzdrx90GgNl2P16I0FWFLW7UT5BVVKvJVq6+K
	 wa0QoKr5syaYHq+XlqaRr7gd+daNYusEJ1rqynMcR0+84luepNLMrED81T4vAFPGBy
	 GkSexJUmmlxmw==
Date: Mon, 21 Apr 2025 16:39:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenbin.mei@mediatek.com, chaotian.jing@mediatek.com,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	ulf.hansson@linaro.org, linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Add support for Dimensity 1200
 MT6893
Message-ID: <174527156151.2973998.9852318001986778818.robh@kernel.org>
References: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
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


On Wed, 16 Apr 2025 14:02:45 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC.
> All of the MMC/SD controllers in this chip are compatible with
> the ones found in MT8183, but do also make use of an optional
> crypto clock when enabling HW disk encryption.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


