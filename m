Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A9C3DA70
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rkpxy62sap/v0de7rLYh0hFWA/R98p0D6uOjSFtLYro=; b=UC7UwH1XcEzcvPAWD4SMSVoi21
	hOWkG4U7YJC/2tUnFfSBzfNlCaJ6vtf1LUz4nlGFo64rSrTUk9d9txCLMi2NtwTF6LAgpJGSufxhF
	4hdCmqPoLcj1NGN8zqDl8s63fbLkRuhQPA1r7t0vEBUr+wNFgzn1JXWcYam2UrqBINW079tgFgl7j
	tyND7DRSgB9xHZg0NDo7TtjZBweK/uPNhstN2NNm1+5sZK93VEWKqZ63sKOGS9PDFy5XtW7bNy0Mw
	pIVttTiybxPwOInuN2wRe/8N8JfyOaht+CWlZvH2u1dSy3SBbTshv1ei6GTwvzpmBgdfy4D78e4Co
	mOsV/Gug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsik-0000000GJRV-0Xo2;
	Tue, 30 Jul 2024 19:41:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsiG-0000000GJIg-0xqj;
	Tue, 30 Jul 2024 19:40:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CA1162064;
	Tue, 30 Jul 2024 19:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3931C32782;
	Tue, 30 Jul 2024 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368447;
	bh=yCM3/ONv7sgmKodDfOdg/vxVtJXbnZ+0yfS9M1BxH1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFbRrZsjbMby5+hIDPhgxWRFRmTymaan/SCi1u62rN7tx2gnrTKhOi7MP30Qv7xAV
	 m8248xGAjo4csrMjg922lr4p/Y3Uq0ent8tubJK9CV2333gYRPaWkjkQvJ04YkhUsZ
	 BSGToN6YDS2SWwpYVMjR3aNkdut/JEdbAfY036jpmwzarwrWvWvHPmXc4IPI0T1y6D
	 xEwrgaF4Ll6LX8pE2keyMuvLPL4gGTxWRgv6rumq1zkk2gsbUhuDGPmXYh6Nkum6DM
	 m48x6XYwftJ9rk5fWz8Ne6ICsXOFR9LPo0n/okn2COPkF3rY30LNKIr0oMKmGE35sf
	 upsN21EPgn9qg==
Date: Tue, 30 Jul 2024 13:40:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Hsieh <andy.hsieh@mediatek.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <172236844509.2029627.16667161113171422418.robh@kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_124048_345478_2F441301 
X-CRM114-Status: GOOD (  10.68  )
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


On Mon, 29 Jul 2024 16:48:01 +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 110 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


