Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E628EC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsZxY3x/h1CKG5QnfFuRHQidpNEdsOaAbN7HUlphdhs=; b=ACAtOKEU8g+1SyhVk2G+jM9hgg
	ZKa/sPuK99AsloY6pf6x5P0J5R/BETgI5BDLuEM5d5ej4JKAG67F/q2isxfV8oyOB7F1hVscN0jd2
	tlCJ4s6V+/IBfbN2UbxmABQ62KQns4j98tqGx5J3fgKgaPFqluBWu9ntGWc2PrNv+ciFIiFsAuCYX
	wBJMzDncCP9iiBnwWQgD/oM7EO8ITNCXSubji+WKz8v9/89lJAp2s5D+G9IX5GHd4p+b27CiEqUNe
	dF59fkx32QhhNKqcNg4Z4bqBWNHJCjLBMfZRdStbpIKnMKOD+yBsFhMjHUIHKn+XEGvbuz/W63itG
	wLkkxblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6YS-003CAU-91; Mon, 25 Jul 2022 22:28:00 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6YD-003Byk-P1; Mon, 25 Jul 2022 22:27:46 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-f2a4c51c45so16580914fac.9;
        Mon, 25 Jul 2022 15:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QsZxY3x/h1CKG5QnfFuRHQidpNEdsOaAbN7HUlphdhs=;
        b=nHqhBj23+KiKXQNu8mNYoBCt6s3v+/nqYh4DqhUh2gAuBa01birCTLRfcP2QKXmOz/
         SDktasa6bF8qdsMvNp32rK2xJ++EkDIDBMHz7a1cDc5smFbVPDeqi8QqgKutuhrEpC1R
         JKOBPH8OOE7wUreoN9X7FqxLKvpOinCN9Bt2xoxNScAEVtWfThHN/nhyvCMEn4Nl0i2X
         2Q6eEObxLnyeCWeaQsKwZS1UIrscuW0pSaZ2OUULbX51FlJiswbie/1LdU7QEKym7Y3D
         vKoC9YLx7PedWQGrViUF97+5+uExEn+xokyoqpv1lKj5O1CZWxYslcf/6/1cMfqKEoEw
         epVg==
X-Gm-Message-State: AJIora/V/tQ4ntpBdmb1rU82WulIe5P86iAQdmLv+ZVn9KvaEJG2ms5r
	6uLkoa+mzpjc7bTkDBqAgg==
X-Google-Smtp-Source: AGRyM1v4h7huPKooJcptUd4mgfbYV6YVP5u+QrfqMD0TJGGQYRQ6gM2Hy7kwEq6HK0U37c9/yjzedw==
X-Received: by 2002:a05:6870:d79d:b0:10d:ab03:b59 with SMTP id bd29-20020a056870d79d00b0010dab030b59mr6935961oab.39.1658788065042;
        Mon, 25 Jul 2022 15:27:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p28-20020a056870831c00b0010c727a3c79sm6607396oae.26.2022.07.25.15.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:27:44 -0700 (PDT)
Received: (nullmailer pid 2857915 invoked by uid 1000);
	Mon, 25 Jul 2022 22:27:42 -0000
Date: Mon, 25 Jul 2022 16:27:42 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, angelogioacchino.delregno@collabora.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, nfraprado@collabora.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-binding: mediatek: watchdog: Fix compatible
 fallbacks and example
Message-ID: <20220725222742.GA2857882-robh@kernel.org>
References: <20220720125015.13797-1-allen-kh.cheng@mediatek.com>
 <20220720125015.13797-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720125015.13797-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_152745_833706_F64F8B59 
X-CRM114-Status: GOOD (  11.90  )
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

On Wed, 20 Jul 2022 20:50:12 +0800, Allen-KH Cheng wrote:
> The watchdog timer of mt8186. mt8195 and mt7986 have their DT data.
> We should not use 'mediatek,mt6589-wdt' as fallback.
> 
> For mediatek,wdt example of mt8183, We remove mediatek,mt6589-wdt fallback.
> 
> Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for MediaTek MT8186")
> Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for Mediatek MT8195")
> Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for Mediatek MT7986")
> Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add #reset-cells")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

