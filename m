Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1759C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ozKiOmdY77ZLAblCyazAhBbyj5xSI3khYge6lN51mI=; b=cOtW/wXaH/FEC3/fMw8WvcMUai
	8Nxs1UjhEUTrooHKAOPFztobFM9VuDFbe4VoSVHikRFZCtll0dx25pxxSwy+VOxV62uD4jkWVeG7I
	UAugOViyrFsptGjunWhABIDvBqKGdGPRQuoLZ9neMaNR04Ao2TQIzE/nhg8IOPXt4xg8yAzM5HqKG
	PxwRwxM5us2GArhxcxS0Z7uNEhSt3iReJMgYj64vp3jfDiW9h18SwIuInG3DvxwX5LXlm0AooXSLq
	WfMqR8bhFPhdWmjVNfU4hcmjCNjD+vcuj0GPXq/EMDRYhv1SH9Ae0YTBx0BrDTApX3NEZCSFtbaEY
	hoLawZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPKk-007LuA-1f;
	Thu, 20 Apr 2023 08:08:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPKh-007LtC-0w;
	Thu, 20 Apr 2023 08:08:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32454643FD;
	Thu, 20 Apr 2023 08:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3291C433EF;
	Thu, 20 Apr 2023 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681978077;
	bh=NuiCfwAC6tMz7jWBrBvLf45vkDlVaqOK7W0qEp70idE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G62TCUgDovvCWqZndYPAb45lUB0477MQCqrCzEz1+xQl2iv6Jy0naO7bGMq7lFt6w
	 Hgig0oJd1TGz9zKuhvTTP5+B/fnYSbYo6tBaPKgaC/wLlnbPKIOTKoIDNvuzMa+FS/
	 CNf0Xh5xZc4cohnOb4omp/hswqGtIPNO+Siaf1aI=
Date: Thu, 20 Apr 2023 10:07:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianping Fang <tianping.fang@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: mtk-xhci: add an optional frame
 count clock
Message-ID: <ZEDy1bTsU7AsF2kR@kroah.com>
References: <20230417024213.17973-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417024213.17973-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_010759_382089_58BCFF1A 
X-CRM114-Status: GOOD (  10.18  )
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

On Mon, Apr 17, 2023 at 10:42:12AM +0800, Chunfeng Yun wrote:
> Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: add acked-by and Reviewed-by tags

There's never a need to do this as our tools pick them up automatically.
This resend did nothing but move it later in the queue to review :(

thanks,

greg k-h

