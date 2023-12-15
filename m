Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F54C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTsMXLHDjbQp3vNOKILlJzJUH5A3mHRypiiWHrR9pzo=; b=aEkorGkU4/81osxfVFK8Yn0d2/
	Mffo1zb6HV6H5ZuoFIaelhn15AKPL40YjLfpjW+SDnRBpmN9tZlprv2LXK/Y8jzerO9mwJpT46xCN
	6Ledh8AYK3wIa92/wYiKrQng+Awoh4Va/ENhOg2FMZwCF94XYO7u6QigCKWGSg5gHsbAdaaYl/Diu
	ZdjdCSdjw93E1ttdCoNIarg8wE/Us3fA5rc8YmQ002ShljAkikiX3okC97mWtjL18y5346wzVPX1g
	IWb49NRe3NwnSv5w8GlWUf6XorJkMfPJauxJKPdhZ2Jk3wPXhjRpATvPxHBh/iPIjugeBMyf2Orhw
	n7h4bEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEKq-004Osv-0v;
	Fri, 15 Dec 2023 19:59:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEKn-004OqY-1N;
	Fri, 15 Dec 2023 19:58:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C39ED6277E;
	Fri, 15 Dec 2023 19:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD33BC433CC;
	Fri, 15 Dec 2023 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702670335;
	bh=pITXZbNjDye/BbUhFXr78ZpH2SoCRgTp9w9h/IC74Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzlqxPMPak3Jjtfrf20ZBzBxqZadmscbesW1ljF4IHMEDtSNJV+7Qg+zILsVM7meC
	 IVkG6PHvjiD8JORhOE6sqAy4982bPq0glyTqETgqYB3xmxKtDk4hN09b7tJybCJZFn
	 k5+7XusMWDdt2AmCOQIFpzALXyO7eP1gCkKsrKUHWY0rYcFJSO/oC2q0idHRxEgwWK
	 euV+A4bJGjLM2QTOf5trGm0u6zl4fgVueyO1Qbnc/xOWy+YH1nijlHFq/3EwtZgE13
	 iD+DLpD38yljmXuEn2pPzu5PH+eiuNxFByutNyuakBaK9UMbMnmwTmq/eXk8Tbs/BP
	 icTNQMoXlaFDA==
Received: (nullmailer pid 294909 invoked by uid 1000);
	Fri, 15 Dec 2023 19:58:53 -0000
Date: Fri, 15 Dec 2023 13:58:53 -0600
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v2 2/7] dt-bindings: media: mtk-vcodec-encoder: add
 dma-ranges
Message-ID: <170267033128.294824.6094667140033672249.robh@kernel.org>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
 <20231215104551.233679-2-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215104551.233679-2-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_115857_511055_506BA09F 
X-CRM114-Status: GOOD (  10.96  )
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


On Fri, 15 Dec 2023 12:45:46 +0200, Eugen Hristev wrote:
> As IOMMUs are supported, dma-ranges is not mentioned but
> additionalProperties=false, thus we have an error when adding dma-ranges.
> Add dma-ranges as a possible property because this may be present.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> Changes in v2:
> - none.
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


