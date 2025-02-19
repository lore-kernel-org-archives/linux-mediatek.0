Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D0C021B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 22:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1tUyiRXoZsGtaHn5V7OFDYuiYBIS5L3TTZMj8sxNMc=; b=N67UZqH7weAJYmHabMCNnXWd2B
	l+nsQqLusDCW96lfVQDlDNg+un/A+c+D1w5ESXbxEFo4O0gbQGaNL4AxpNTQd2gurTh1WO3z/dq1i
	bG0iT8cict6VixEXXts8Zh5BfU5BlfHuWB6DEPmj+vkT2CfK8oZNtpEmBEw3c+K4otRbL2ZMQ86MU
	DFF5zhgJOUsaZYn1WLx4ZNurqUxbkssbcIMBqCltekf2EHCsSwb9vRJ0L8Jdt5vnZqhbWx2J64CDq
	1Rsr5e2hOxFl9ZVrevWIElwDUESlYom12B27zXxLDzns+im/MHaRlJwIY+4uJdmbXRU0jHSBLwgMz
	d9hQ4g/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt01-0000000FYpx-2IjA;
	Wed, 19 Feb 2025 22:57:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tksyW-0000000FYOQ-0XfO;
	Wed, 19 Feb 2025 22:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C10E5C5A22;
	Wed, 19 Feb 2025 22:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05BBC4CED1;
	Wed, 19 Feb 2025 22:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740005726;
	bh=yPOGyniujTU3i3EYp1mV5Ro0Ed1aoGTxmIBahrWVhCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5yHDyHfKflXsCv0KJrRUoPY2Qu7zHAmEi0xb0kyFMVA9rHPPQa0uOJZlUm/NNe8p
	 zRYzB71H5qGooCPgnngDsHEdJJZJ08HdEbTdlohCXYoMpsaHkAsULAmUgUD2Py71S8
	 zTvERcwWEZfBX6ZqHuXel7JF65LjKx5Yxqhsbg1rwffkiZCtLakUnKz7zyG2yMcwrT
	 nJ+aMWJbM65I+tUPhpoWEvHpLz4kfqySFJU0/mp1adrKUHXyG+MffU641dvoM98Flr
	 1ncI1iDXIB9qTXFZMmCfBbwDQgs3nz3SxQKJUMWtnI/C1T6AJY4vuk4e/fQzlSmK+2
	 wCRkYSqliAxYw==
Date: Wed, 19 Feb 2025 16:55:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Trevor Wu <trevor.wu@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 mediatek,accdet
Message-ID: <174000572376.3122081.10881553608590420273.robh@kernel.org>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
 <20250214-mt8188-accdet-v1-1-6bbd5483855b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214-mt8188-accdet-v1-1-6bbd5483855b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_145528_218798_52D78A45 
X-CRM114-Status: GOOD (  10.08  )
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


On Fri, 14 Feb 2025 12:14:29 -0300, Nícolas F. R. A. Prado wrote:
> Add a mediatek,accdet phandle property to allow getting a reference to
> the MT6359 ACCDET block, which is responsible for detecting jack
> insertion/removal.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


