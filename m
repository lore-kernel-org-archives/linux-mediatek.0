Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A917C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4E6Cki9HfqGSDVbiD52Vp3nRo20dh1MtOK1VNICT48=; b=O28RXRPnprDmvi
	kCVcV9nj4gR572tR+zP5R/yutEDnF05Z6aglbXXiyo68DMPEmD3oeqYcn+lyE8sKvtuuEYZBM5o6J
	/s4D24bFKtSab7ixDlp0zLfyoTjWySc22m+9wfvOwHlStBJlNEKbBqlNnjummavKCG7NjTYiWNHus
	NjiNoYg01japDgIIZYXHATtw19EAztGJmlVQNDUd4CqmezFKWwkD0ZCWrRdlYKo6rPiBCd1xTZFlc
	R25TQhXO+1a3ZeBmlCKh+y8s+aCfa5thh/l+/uEdau60zi89w6SQd05AYCbCESajZk/xN39Y0MM/l
	ZcnVfyuvsckxumsP230Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltKb-006CVH-K0; Tue, 03 May 2022 14:16:49 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltKY-006CTH-Ly; Tue, 03 May 2022 14:16:48 +0000
Received: by mail-oi1-f176.google.com with SMTP id e189so18283570oia.8;
 Tue, 03 May 2022 07:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ovnSXO2ai7NY/FkSGEqe8YZBBuc5/87pe4zQahwdIPY=;
 b=KMPRf8XJoYLeZY+8eTjn6tvJPNgGs7IarUluxSzVuPyqfCPKuHCT3StmcOTR2u+Bp8
 4fpeZ9tElf7GcOvWC2MTxVQIQU+MVchfU6GyEN0GkSu1ogxOVFRz4IN2zjC3MMCkfY8c
 AkqZVWBZvDLcOg3k1XAM/62S6iid7GA2qVLw6Ii6gmyAf4Lw8qOzveE0Gc/fqoUaXLXh
 zG7B+LcrMs+c0m6UwcuZ2e+/HVt+2A4RqNWEmY0G1QaR1dX50A7xx/erc87dpWeZ8H6C
 15NyEvwTSqNSFaVJkSJzA6S7Woad3BppuFlmqyzSBvmDsAK02DU7R7WDQ4EtqcNLjc4/
 9z3Q==
X-Gm-Message-State: AOAM533GDRmfqBx8hDmAor9SXrRfydQ2HEowxZQ6OwMUPfk7ZBWT2Ick
 UPB7777qHH3jHMY9hhl/WQ==
X-Google-Smtp-Source: ABdhPJzzZUL47cd3wp/QQrD1PTtAZ/Rx3sEuLc36LxZ460xFml881B1M+erBIePNQvzpcbDCmo/R3w==
X-Received: by 2002:aca:da83:0:b0:325:432a:b45c with SMTP id
 r125-20020acada83000000b00325432ab45cmr1993812oig.11.1651587404241; 
 Tue, 03 May 2022 07:16:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 13-20020aca0d0d000000b00325d7b6cab8sm3013442oin.16.2022.05.03.07.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 07:16:43 -0700 (PDT)
Received: (nullmailer pid 3572067 invoked by uid 1000);
 Tue, 03 May 2022 14:16:42 -0000
Date: Tue, 3 May 2022 09:16:42 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org,
 Tinghan Shen <tinghan.shen@mediatek.com>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk,scp
Message-ID: <YnE5Sq8H6juQHpbM@robh.at.kernel.org>
References: <20220502192420.2548512-1-nfraprado@collabora.com>
 <20220502192420.2548512-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220502192420.2548512-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_071646_754049_B4BB5EA1 
X-CRM114-Status: GOOD (  13.73  )
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

On Mon, 02 May 2022 15:24:20 -0400, N=EDcolas F. R. A. Prado wrote:
> The SCP co-processor can optionally be passed a reserved memory region
> to use. Add this property in the dt-binding.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> I left out Angelo's R-b since of the 3 lines in the patch from v1, only
> 1 is left.
> =

> Changes in v2:
> - Dropped type and description since it's a well-known property
> - Set maxItems to 1
> =

>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
