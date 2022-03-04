Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FCCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4L1vplw/GZU3DKfOMqpVCT2srO05zbMtc72FvERS+jY=; b=RcDH37dgEKorcB
	EECy9UaD1lDndnRWULwjq2y73o7z+OaOntUBLuRKybqexegEAtiNA6OcL/nJ8qoPTCNgtNAwd1iCw
	bvael/6+fudVDzDP/lgmaDZBL+4QuPMc3nhRrulpz6XMR+auxHgRGngJIXZOzp77YDTZMPSd9oY1r
	ebjCgA4FHvafvoCq0JcP/D/9zq3BWve60tkKmXIRgug6VJrVFY5gxoP+SY2yBdFZdUGt4visIenjZ
	D8uX+SFLT7aCpRGLhrU9a74o/cJZgoCIIsMtUeCl4o6SRgqPMzbvHeIVbZDLuRS/v+qE6nY3rXNvO
	5Vho9JkjfER5oubOEg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQH3q-00CHXu-FN; Fri, 04 Mar 2022 23:10:10 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQH3o-00CHXC-EJ; Fri, 04 Mar 2022 23:10:09 +0000
Received: by mail-oi1-f171.google.com with SMTP id l25so9363040oic.13;
 Fri, 04 Mar 2022 15:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JW+rxnZpE9+fHEQrxDlG04ae248q2vaFTXN8LAiNdGI=;
 b=56n/aNCbQvaCEraq3gT2Go+pdN3TxlB9fddwF99TUw/1X6FlPOVqn9MiDL08HJFO6/
 kWjQMROX7OUZY9wkqYIekZqJtHxBlsdP81UVJOay02u9O2jpnUPAsIMdyJm6DAzgMbkd
 /7pXmmSjX6WEHZCXl/R9APU4Gnv3ikURtp0oxSAi48Hg6wvh6f3/FrijtBJOzARraVVT
 wigwrkisIheYFSlucQiL/kj1RGkK73c8fpObZaldtOxQbnR7lxmAlDGtzXwNmPqrEF6Q
 bseWq9luC4I68NSZTFjXo4S1kdeSKYBVMJ20M4UDMMgQqPnhe6MVn+zte2iP6VM2MECn
 ZCBw==
X-Gm-Message-State: AOAM533k/ItCIyaubheJeApqVOxKtDZqwaLH0O8S5dlpthqXaG+QjE/Y
 KLQ0qDHLgLVTAjfP/m602g==
X-Google-Smtp-Source: ABdhPJy9RdDp8xAHMMBepzvrVL3O5MwKYsIJ1gbpJkxbzCBhqvIZ4bNVu4BUg/Vl7bnetGqDDVqZQA==
X-Received: by 2002:a05:6808:11cd:b0:2d5:3f90:b9e with SMTP id
 p13-20020a05680811cd00b002d53f900b9emr474875oiv.113.1646435406761; 
 Fri, 04 Mar 2022 15:10:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm2900602oti.49.2022.03.04.15.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 15:10:05 -0800 (PST)
Received: (nullmailer pid 633452 invoked by uid 1000);
 Fri, 04 Mar 2022 23:10:04 -0000
Date: Fri, 4 Mar 2022 17:10:04 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kernel@collabora.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-remoteproc@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: remoteproc: mediatek: Add interrupts
 property to mtk,scp
Message-ID: <YiKcTH9alpE5FExj@robh.at.kernel.org>
References: <20220225225854.81038-1-nfraprado@collabora.com>
 <20220225225854.81038-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220225225854.81038-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_151008_505793_E6BD3AD9 
X-CRM114-Status: GOOD (  10.71  )
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

On Fri, 25 Feb 2022 17:58:52 -0500, N=EDcolas F. R. A. Prado wrote:
> The SCP node can have an associated interrupt. Add a property for it.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> =

>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
