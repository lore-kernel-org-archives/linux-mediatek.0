Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2048FC19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IBPpZdboXw9OZnCu4zJtxSMjmCfMGs+4tQ6RiHjMAU=; b=cZ6CaWAXLBmENLzFucj2z2xBv4
	IOv+vHo0pTlDah+Dqd4OO6LxbZ+0hhj/Q50a1h/Nd1ohyz7atMBfcD3pixa1G0vZXwA4OzPDFcIbq
	BxAgrXYBINi6yNeTEvlKZGdLSftKoCTQPGMfnsAvYUBgOoLh1SK8eOAvaSY0UYaowSUMZ2SF6vrVH
	02g/CMOx9/NmK05W69ZDRp7ir3KZnAEQH/0clXYPQCVKtuXiJtM3FZdgBaG5i8Y2g7lts4qH9u+Oy
	bivszobfsf+ENuj4bqvWgXn0/JLUmTi+n3KZ8lTdvZJZi2zSJgdo/UUqUoFrJMeUhbLAG1eCZRM8i
	UTHCwJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2Gm-007ljt-MS; Thu, 11 Aug 2022 07:06:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2GV-007lO1-09; Thu, 11 Aug 2022 07:06:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 79725B81E66;
	Thu, 11 Aug 2022 07:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B09C433C1;
	Thu, 11 Aug 2022 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660201556;
	bh=vgb3/iTI5YEipl1kcOFAk88wMPI+HRjfXvkzfOk4dAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMT4dl/aSPCmwBksC4KD8yM9CKqtexuoW8BAjVm5/qyIXmACTc126EsybA4SAAkqR
	 VSbhbb/lS6dq6M5pLbOGzsIwflmiNBkKTxgQhzBrtxh3N5eVL0RR3Py1KGTaABU8LJ
	 UxTzfX9FmjRjGr0os1hsW2k+KS4Yr+0YVwJKZqUOuu3nng7g0r5FV7uFnryne4IAMT
	 9hSL+EGYbKqm5OdsnShfASP9NJ/8sVoOcJVkX0neg8Dt1/PzM85iWBeBZxMGlwXk+k
	 kYQ0WSSeXhoy8CWIk191DG3jUlbQxOf2nvrqwCOg7TlsfJ5Nmqgj9LjLlyOIYwNJsD
	 hQ0q2RF4GUmmA==
Date: Thu, 11 Aug 2022 08:05:48 +0100
From: Lee Jones <lee@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 06/20] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Message-ID: <YvSqTC0aV61sXbd3@google.com>
References: <20220811025813.21492-1-tinghan.shen@mediatek.com>
 <20220811025813.21492-7-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220811025813.21492-7-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_000559_202606_86C5D7FF 
X-CRM114-Status: GOOD (  13.52  )
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

On Thu, 11 Aug 2022, Tinghan Shen wrote:

> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/mediatek,mt8195-scpsys.yaml  | 67 +++++++++++++++++++
>  .../power/mediatek,power-controller.yaml      |  2 +-
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]

