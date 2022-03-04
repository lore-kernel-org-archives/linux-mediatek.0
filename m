Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2006EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwQvM4YpMjuGRYj20eWiDXbMSkfV7FRN67nXe6bp1W8=; b=wnb4baEDO6KxJ2
	msZ0D0ZQNsZJsWZZoYbjYoYV1DG+fitPJuPPnwq4Is7H2PIsH4RzUUO9JDCg3+jAfQCWs90v+AYc8
	W6O/eOrMERdrnfaxfYe7X3RxIQNxpL5UkqerX7FBrIAWVjlYdjgk3ibl6gAW8ouUUO8YCtIGiMua0
	/VXlXgNDLEpekjAPk2g3Wv3qsooidf5KdjdHvMIqiwJyj7S6nUBoo6PRWJCRRijhVCbMBjdd6FTMC
	MrX2duhnN8P3bE2f8qyNCBLqV9WZQuyTonX7wkGQx8K96ttqPmjWD6KIO1/sLimmLOL6wNgJ9gMJi
	VlCKLo7R4UDWS4mT1Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQH4A-00CHeE-Ek; Fri, 04 Mar 2022 23:10:30 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQH47-00CHcx-72; Fri, 04 Mar 2022 23:10:28 +0000
Received: by mail-oi1-f182.google.com with SMTP id z8so6039111oix.3;
 Fri, 04 Mar 2022 15:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nbp3CKVQIcxHEuP/e7OG3RMLG/oUR9xNYLZDthinbNQ=;
 b=v3ORhnlKgOufHLeVkEqMi1mjMTtMsUK+TvNE2zUuqLev3Og5UHZ3ghmDXQEcpvPhz1
 OL/u2b7iNV5Bdpo/Dy7jdXekWQ+QuakvOSxD7un/mU8PIACPYVEZBC2dXwnQ74KvQhDm
 JcZ0q5CQ+6zPj8A6IPhHPGNXO7TeADL8bgT6stGCrTYDqk5zXWg0vRpraJ29urJ+GHuJ
 /K5CgyTgCk3UdpARW2tw0+NECC7/O7mASGucs6d7udtgLaUtkk+TNhmixq2zxrdUmExg
 DCVETMTPMW08foouGUwpQIIn+GpdSivMNU0MvLypjNVMuGTKQGEHY3Y4kX8f56vwuzbM
 RZww==
X-Gm-Message-State: AOAM532oCdVZsjf9bbf1x7Qci+kqgtWIsKp4sATNqlVI9RakEn+3TFtK
 NO6F4H8wUDqVQeCaLuGW0A==
X-Google-Smtp-Source: ABdhPJwjMiYZe7cZZuhCSr8Iua8jmpyFpnZyHA8jf+ETUHpBIA2Gusw3x5uJKpY+FBB/x9zSLnP85g==
X-Received: by 2002:a05:6808:1691:b0:2d7:9354:3ec4 with SMTP id
 bb17-20020a056808169100b002d793543ec4mr503845oib.62.1646435426601; 
 Fri, 04 Mar 2022 15:10:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 w36-20020a05687033a400b000d75f1d9b82sm2980440oae.47.2022.03.04.15.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 15:10:25 -0800 (PST)
Received: (nullmailer pid 634157 invoked by uid 1000);
 Fri, 04 Mar 2022 23:10:24 -0000
Date: Fri, 4 Mar 2022 17:10:24 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: usb: mtk-xhci: Allow wakeup
 interrupt-names to be optional
Message-ID: <YiKcYCV4HacnVO5z@robh.at.kernel.org>
References: <20220225225854.81038-1-nfraprado@collabora.com>
 <20220225225854.81038-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220225225854.81038-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_151027_276989_5DC66759 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 25 Feb 2022 17:58:53 -0500, N=EDcolas F. R. A. Prado wrote:
> Add missing 'minItems: 1' to the interrupt-names property to allow the
> second interrupt-names, 'wakeup', to be optional.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> =

>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
