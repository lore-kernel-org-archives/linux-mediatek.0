Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E75C87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDpX38D9LtYr2zQPNnquWb4pOTNJtKe/I6FVrSJt1gE=; b=3b/iEHlLkSMAHyciclMQwZfvza
	LdztDAY2Q7nSh1mfgQT6ckc+pNNdHBz8xBh9il1SJ5P2kOipnxfsVpyn9z0oNF7EWYoBq/ew7Hoso
	TNM5oHkkUf3wnHkhnlVi2LGlQQ8yUJeH8N+vROwC3++4kjk8lvqFWrbjmHQQ+YY3R+89ObvfYbjr6
	79y3eakh7PT2F8afkdmJDSYZh33t32F6eSP2ruW9HtLjUBYxzEHV9FhKqaBhpCZ+b1D2FEP3MzpRt
	agqFdKUfMBAtmT02hdGkAIb6MOsv7rv/qNVQNBmS4AxTLezcikH8B3Zi293EneJQ9zgQfBLgpQkVj
	8B5lol0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP1m-0000000AdjY-0gC3;
	Fri, 25 Jul 2025 20:28:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP1j-0000000Adi8-0OOg;
	Fri, 25 Jul 2025 20:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B8C4416DC;
	Fri, 25 Jul 2025 20:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DE1C4CEF6;
	Fri, 25 Jul 2025 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475302;
	bh=90YjidsW0zLfZ2EVgtXoscfqDLtrHgB9m/jDQVG5PWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCV5qzX5FcJQA4jUKlOvPOf0uPNZFnxjS8SpjO4vPyWdTLmiiniC01y1vRcAEqpuQ
	 ch5awJmTQUZXLkBsqHUw8LR+DvmjjRGNmsiUY3gnWa8juFrOwKLkFaNAywPkRH6X1L
	 2T0Rm+Hnl3I7WH874DB9G1Cfg/rBdOomAfOL9Z0F4gujhwDlk7z4Qvs41FKYpl6kvB
	 +oKfi+dcjn9xFtoLqSl9eOho8FtJ+BZkG4T8okai1wn2zzuXT59v/kd0lUfL7zYJ5a
	 5n5RQAebqjE94nWw6X5XcvwBXf1t/4PmAN0PROqQuBvwdbxGx/oE9W1UiLZLYeAWPz
	 ipk20JnM64rnw==
Date: Fri, 25 Jul 2025 15:28:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 03/38] dt-bindings: mailbox: mediatek,gce-mailbox: Make
 clock-names optional
Message-ID: <175347530117.1835509.4802205566620946645.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_132823_151538_257F6C8D 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: jassisinghbrar@gmail.com, kishon@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, fparent@baylibre.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, mwalle@kernel.org, airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org, herbert@gondor.apana.org.au, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, ck.hu@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de, arnd@arndb.de, sam.shih@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com, linux-sound@vger.kernel.org, chunfeng.yun@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, mripard@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, daniel.lezcano@linaro.org, mathieu.poirier@linaro.org, shane.chien@mediatek.com, atenart@kernel.org, sean.wang@kernel.org, maarten.lankhorst@linux.intel.com, lgirdwood@gmail.com, houlong.wei@mediatek.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:39 +0200, AngeloGioacchino Del Regno wrote:
> The GCE Mailbox needs only one clock and the clock-names can be
> used only by the driver (which, for instance, does not use it),
> and this is true for all of the currently supported MediaTek SoCs.
> 
> Stop requiring to specify clock-names on all non-MT8195 GCEs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


