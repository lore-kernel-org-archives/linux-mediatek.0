Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96777C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=499Rvz6m7Hhke8GGktz8Hj2xCXvEHWlkBytiddVkJdU=; b=gOXBnukx87HjBf
	7HhlzVDelTMps2OfyG3u4P1VvtIvgFx9m5fMSsYlxJifuy2vO7Xcq4ImXSM0+6rU516ygaVro7s2b
	qcb5VA6xDwefHDM3ylxeg3KRE6uGEZnm+amIRMGTpIldCVZRQoA6M6K15EOe+tUWomQ+HzJGzOg0k
	8dcFa4NrzDzTrp5pZCTYNGo0lKi7cI7fLTSJaQwTgg8yNL1yB9If8SgP0WwTmFVgJzpDr9uD1p1BB
	RpMZAUB0o1XuNQMXAzM7uERbVNvxxlFDrfbt602LvzrslIT0iglIl1uuAHY9xtNt+TnS45qJ+iCJk
	lBW1oePbze1uCEI/OprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSZv-0030u2-3C; Tue, 10 May 2022 16:19:15 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSWr-002zG3-PM; Tue, 10 May 2022 16:16:07 +0000
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-edeb6c3642so18878685fac.3; 
 Tue, 10 May 2022 09:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yWEAxj3WPRQBC5FN17GwqJjtdGdcO5UU/yliiYm9s9w=;
 b=4BsZ5tHdbJPHwDeyUyQyT7vshepwUZ2Os0+pLnKpZkKZDivydSk9M9hVWmLMDccI16
 RzSVYuEr5CuwEU0ubhUq8MPaPaydovO5NmrYdDjEGVwgl1IHKuNvlnCJfbH2x2wnP1Ga
 1H2N91FZ10Cm1j/MG2zg5e5FRkQJbUy3eYwZ66VyWNAJJmB3BKV8UDRmxltAIcuYuQpw
 lcpRU81KUCIBuGuXIG52ER5/vvwq+lWozVhqqyH46IoNyr7/sg/TYy/Oo2kOBzAYaZ71
 8wrTtcPtod6ZBS9HGfcD2TdAf2cZR/r684BXg3Oij2eMm1aaXtdB3nRg/VPRCKIFxgDa
 lQKg==
X-Gm-Message-State: AOAM531cNwuFQPfqU/avWjZVVU0UF79PggqjXarLbgyReascpuZlihHz
 SwmrfvB1plYj2v1rBpBn7g==
X-Google-Smtp-Source: ABdhPJxbiyuXrcBRwIgYtVh2j/YydDKn9KG1/3/60nFKJWQvyogrwI8iViqWt51KaEpv+8ewy07nJQ==
X-Received: by 2002:a05:6870:2396:b0:ed:2873:9cf6 with SMTP id
 e22-20020a056870239600b000ed28739cf6mr453357oap.131.1652199363625; 
 Tue, 10 May 2022 09:16:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bn6-20020a056820180600b0035eb4e5a6bfsm6212759oob.21.2022.05.10.09.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:16:03 -0700 (PDT)
Received: (nullmailer pid 2123159 invoked by uid 1000);
 Tue, 10 May 2022 16:16:02 -0000
Date: Tue, 10 May 2022 11:16:02 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxim Kutnij <gtk3@inbox.ru>, Sam Shih <sam.shih@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, kernel@collabora.com, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2 02/16] dt-bindings: arm64: dts: mediatek: Add
 mt8192-asurada-hayato
Message-ID: <YnqPwj5EulBgxyAH@robh.at.kernel.org>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
 <20220505194550.3094656-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505194550.3094656-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_091605_853787_8DF67BCE 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 05 May 2022 15:45:36 -0400, N=EDcolas F. R. A. Prado wrote:
> Add binding for the Google Hayato board.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> =

> ---
> =

> Changes in v2:
> - Added this patch
> =

>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
