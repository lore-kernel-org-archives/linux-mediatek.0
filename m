Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 23:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5TkeqV3G9zxvCFod0/RzZU83U1D+6jWZKyK1kWRRpo=; b=GeTwKHScY7PEkde3wlR67EUPeg
	vALvO6tvtjnKt2WHW5OOuoNvbi3+dex/KuO1CCxl/DOEakYQEUQobylT4A8OJmte+2PZnPUAfbKny
	g40Qsr7qF/tn39uMPY13+H1u7NlUHrPGM4FtL4MEHxYv6YS9DjzqCqJGYsFP03LGqHokBgkU0uvPm
	57fGCBkwrQWX7zLaJCQArmmcwN6paZv2OMa5oo4mSq6lHGhaIZfPLOf6Yu13vmeRG4bKu4t++Uh+4
	U+Z8T1BLMrnaFxpmrIckofe+MG3CW9zYiQP9K56e3P4DoAG8dAcK4uohayY5+eCdzNataAWJZav9A
	x6qd1ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG7aE-004Kl9-TM; Mon, 25 Jul 2022 23:33:54 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG7Zu-004KVc-HT; Mon, 25 Jul 2022 23:33:35 +0000
Received: by mail-oo1-f48.google.com with SMTP id j1-20020a4ab1c1000000b0043576bcb9b1so2440299ooo.10;
        Mon, 25 Jul 2022 16:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M5TkeqV3G9zxvCFod0/RzZU83U1D+6jWZKyK1kWRRpo=;
        b=IeraclqAajZ0qjkNzq6Isoul5fwJzzkSeYvyahGViI1L1UB0/tTBKhfvgVBjYN19Ag
         o95WnvXNGaCXUVeqLXKkCzwOBezPGXMSuDpjSPQZKqXlmNxIKz8fAvjoXAEmsdEbkeYr
         JGZvSzXqjnxO0vdK+B1VQhuW2wLlE/dQAlNFeCHSD37mZtXb/oYdDvHfcLeTBiF3p5m/
         fvCbgAWraXVGqaRwNqVwkKf47wuzgEPWQjT4oTjRjlVNkC50jb1ypDpxK7L137qOMpmN
         zdXAgBm05KAh3Xr68cz2CR7L+VwEMDoQS6ZG1GY0Alx9Wyn5FfVkOdPvKmyujk+yf/62
         uwRQ==
X-Gm-Message-State: AJIora9+T5mygvDjioyQ054f7dLE9R4/DGgumJLbfM/S285yp/umJ5bf
	kTBJnRFx1t/Q2SDkcoeSFw==
X-Google-Smtp-Source: AGRyM1t3ptpQtY/C56bEyrQAR2wlVNxqnBKvjmVyYxyOIFNZBDbO8RwPFSdn+bPGwqwRBfxS2l7GGQ==
X-Received: by 2002:a4a:d621:0:b0:435:d6cc:b2e1 with SMTP id n1-20020a4ad621000000b00435d6ccb2e1mr4989526oon.88.1658792012486;
        Mon, 25 Jul 2022 16:33:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k23-20020a4ad117000000b004359b581401sm5375799oor.25.2022.07.25.16.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:33:32 -0700 (PDT)
Received: (nullmailer pid 2965235 invoked by uid 1000);
	Mon, 25 Jul 2022 23:33:30 -0000
Date: Mon, 25 Jul 2022 17:33:30 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, angelogioacchino.delregno@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8186: Add gpio-line-names
 property
Message-ID: <20220725233330.GA2965207-robh@kernel.org>
References: <20220725110702.11362-1-allen-kh.cheng@mediatek.com>
 <20220725110702.11362-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725110702.11362-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_163334_613251_63031C22 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, 25 Jul 2022 19:07:01 +0800, Allen-KH Cheng wrote:
> Add the 'gpio-line-names' property to mt8186-pinctrl, as this will be
> used in devicetrees to describe pin names.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

