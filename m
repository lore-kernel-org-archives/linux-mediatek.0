Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78604C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 May 2025 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmih8O01GdluSEf+8GMoW+3uK9Ncp8kLJDQuqUouzDc=; b=5DopaftP2UL5vG/6GnSrmKq/3z
	KOStC9uzJo33nafhC7km96Pp6dPLW01eYWoXp6Ris6mvjsNzhVRPgsH7eGtqwPxpghvIAgGAJbYRf
	wnL6eE3yNvIYZHWSIefShLXGdxn5PSCTovbnByjfCxDdAoZ6uvt3NtGNaLmeWQy2C5CUxdMIybnlF
	F93wbIpOjUYSCoZN72zwn0lGQ5+p6+eJUQitOd+uMgcNO7dnctqll6O2V3aTdihxowhqZ7z7iFsX3
	ca9iZAeAD8tn71tjFlRZ2Kufw51yJDPypRN35G3rJsf/xl/DEUrf/EjDVs04iasLrKsdNh4PiZTeu
	f5KfKRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuDP-000000088HU-2U0u;
	Mon, 19 May 2025 06:43:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuBN-0000000885M-0eQx;
	Mon, 19 May 2025 06:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50DCBA42DE8;
	Mon, 19 May 2025 06:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63780C4CEE4;
	Mon, 19 May 2025 06:41:03 +0000 (UTC)
Date: Mon, 19 May 2025 08:41:01 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Subject: Re: [PATCH v3 03/17] dt-bindings: display: mediatek: add BLENDER
 yaml for MT8196
Message-ID: <20250519-orthodox-wolf-of-piety-7cecfd@kuoka>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-4-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-4-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_234105_263521_C0F1071B 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, devicetree@vger.kernel.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 15, 2025 at 05:34:15PM GMT, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,blender.yaml to support BLENDER for MT8196.
> MediaTek display overlap blender, namely OVL_BLENDER or BLENDER,
> executes the alpha blending function for overlapping layers
> from different sources.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

No blank line between tags, wrong order of tags.

> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>

If you are the author, what does this SoB mean? When was this patch
written, by whom and when was the review given?

Can you start using b4?

You did not provide proper lore links to previous versions and tags are
not correctly added.

Best regards,
Krzysztof


