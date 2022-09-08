Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A3AECAAD5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adoeW70AatjMutwsKP8sauG53vCHad/2gXKEdy8p6Bw=; b=0ICVXat8J+j2Z4Ui0Hu+7MaLEY
	z1JtvhYpUb/S4tabRwuKL/eIyYZPYvuKs985IqcTuxygZk1ybJRTzymHB52qYpzKW9svZHrO60uRO
	Eam9OdZU/DpYmeNfKA0+sRqYzKdp2WADOtswufnbW4JPRUvrdvPFUi3S5AsbLA/ccH0bBwY9V5sVu
	wCbA49J/tPOYKcpu+7+DcVNuchG/Veq2E+Vvu/yTLYv6376LvW0p7LIGGn8/czPD0Res74fyI9g6Z
	1AM7C2SuO51gVo9lWYwAEDVoQtenjAeSPojbs7bEBZTW0SAqfNQ5NUe0ml1nmEA6dZ5MPHCPdZgAe
	LALADQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWEvL-002MdS-3B; Thu, 08 Sep 2022 10:38:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWEv8-002MZ2-GM; Thu, 08 Sep 2022 10:38:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id EC7E7CE1EF7;
	Thu,  8 Sep 2022 10:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EC0C433C1;
	Thu,  8 Sep 2022 10:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662633482;
	bh=aVgNvnlf+obNPZ41468yJSBJvyr5RJlsGyre5mdxcLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBSxgTWuXbBZWViin4YyOhV6IqZykDgfz4WKfqifjkTCw1a01+owwQGyjrVwq4w9x
	 OQQTd6eWP83SseyVesif4Xo1Vu+7C9IsDlMjCDBTgQTt3EhWY3q9kdPtzefXvl/EwG
	 cx2uvALOusP+EvU4opD7ylyHs81mwuV1KuL9HEBmB/9xLxPY+UIohbiXWb1EdaHLgB
	 mtTzhgfjpt3cGxTG3g4P1lTs9gFf5RZu/sL4/T4CoUVA8Z6URnoPqe+cPS4bHcPvqG
	 jRXticwyf92yNDifATJqVcrBkg+oq4jJyWOhkRBOex2F6LnmzeBY3wToBK/Fq73Psd
	 JUIrBCAVWR1Dw==
Date: Thu, 8 Sep 2022 11:37:56 +0100
From: Lee Jones <lee@kernel.org>
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	mandyjh.liu@mediatek.com, linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: Rename mediatek,mt8195-scpsys.yaml
Message-ID: <YxnGBN4QEb1yMrGw@google.com>
References: <20220830091110.27857-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830091110.27857-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_033806_746001_E2481853 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, 30 Aug 2022, matthias.bgg@kernel.org wrote:

> From: Matthias Brugger <mbrugger@suse.com>
> 
> The file describes the scpsys node for all SoCs and not only the mt8195.
> Rename it to reflect this fact.

Actually, this is fairly typical.  Same with actual drivers.

Both tend to adopt the name of the module first supported.

> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Fix id
> 
>  .../mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml} (96%)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> similarity index 96%
> rename from Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> rename to Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> index 3737207d8504..1a5901ca90f5 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
> +$id: http://devicetree.org/schemas/mfd/mediatek,scpsys.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: MediaTek System Control Processor System

-- 
Lee Jones [李琼斯]

