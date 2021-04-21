Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AE3C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 17:05:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F8361450
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 17:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F8361450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kfUeJEwmXAdvVcPV86VH+sdnGUtQ452FHam1igc4zAg=; b=Cft47yvbzkfNjTtR4KTRfIbVj
	fT1dslPaYfbHgYd3Eztgd5bektdZxkA0hm165ELiyhq104ZhweJJZAxS1HvvRrrpEq04sJzX9LPSx
	yek9FLNPK5JQ3ZbP9h0ksFIF9w30pJ1M/OyTJzUcb5+3kcfEPPm+IjwkN4S5CUAT08WVqidoHM/bD
	55sip8H/Z4mfEXGyYu6scbqLqVufz3TkycI7IHFUnje76MQk6/af02pykz6SrGCWcIvxslm8Ou8os
	LPHjBfHRz8bukVqs1lOUR1wPtdVVmtA3i/R+WuTMO+/xrHtGzm4SEmkBVRz0oNHFKyrXwEahR0gpv
	UiDzEfV3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZGIF-00EoTp-Hg; Wed, 21 Apr 2021 17:05:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZGIE-00EoTa-2f; Wed, 21 Apr 2021 17:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VnNhlqosJN6VFBQj67DgFC5yjath8Pyw2MjPCOlu98I=; b=jyXVCYljXGF3noZMKSbjOFntIF
 x+QQUJOTU1vK4wfuxNs2gX/gYi+0qjL0qs+jmiklEBvSylOwmfewfTXyZENI6430FIANkXWTQHM0s
 0OOvWpJul4/nj/yzv/Zod3iPnhh5kB49dOtapIjihGoqVLZLAa3a5SVVnvXyxPHpVtaIukVq/cN+X
 rFAegiyE47UuX39A0dSiX8wJfqyYpv74UIAE+lFSvvJzxtpVjwsb+weoon5oymip6UoCT91IAhzmy
 RZGu3LKZrixxPBjpCwm3EMI3ybP5AGDnZzzV0Wk5SHIr/Rfvb9FqujbOtpWCdNeEibEDCswqRDqhS
 Sla6DJng==;
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZGI8-00D35U-M5; Wed, 21 Apr 2021 17:05:36 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so34456644otf.12; 
 Wed, 21 Apr 2021 10:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VnNhlqosJN6VFBQj67DgFC5yjath8Pyw2MjPCOlu98I=;
 b=M3Pr/+PLcqHOupHgeVEL+aS4fbfbG304QkgwsB+viEsebyyyGdfVQQOs62VpsAu/q1
 22OEPr1cSsVzPj9K13YucZ+u+JlR03sTF8nAS9V5CAb/4B0qYGdrUjYc8TuVm1gtOO2J
 DyLxTlOouZRcjMn7Fh8WsybSAIWTopJt4IzUKBtx0oIlouoUCijZkfr5pMc5m9sFd1p6
 JtqrKz3AANvy5W0kdgS8PQwpifAHN8dI9CJ+W0upD2PQ5tk0RvNcc7PnNPtugCGASDhq
 IKpfpLF/U26gaeD8ZPum2jRvLPsVtHfeHgFPha++S++S4hO8s64J5q8tGZTn/uTlrOHr
 WpWQ==
X-Gm-Message-State: AOAM533CMNT7GyoMC+Sm/hpO5MJMVUZBun25Nd954c8EgS+lUx0iuUc1
 OoASzs030d3NO06BXc7CWA==
X-Google-Smtp-Source: ABdhPJxGxlSet0sEADtkRKnhfmQuBwGN5IXkVGmSuiXkwvuaZPHYwC/G3VRmp+wcC3rD2bbZcrYz3g==
X-Received: by 2002:a9d:2230:: with SMTP id o45mr6550457ota.104.1619024732078; 
 Wed, 21 Apr 2021 10:05:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x2sm696611ote.47.2021.04.21.10.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 10:05:31 -0700 (PDT)
Received: (nullmailer pid 1300033 invoked by uid 1000);
 Wed, 21 Apr 2021 17:05:30 -0000
Date: Wed, 21 Apr 2021 12:05:30 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 05/10] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-fennel
Message-ID: <20210421170530.GA1299957@robh.at.kernel.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
 <20210421090601.730744-6-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421090601.730744-6-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_100532_740203_F0AB6D58 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 21 Apr 2021 17:05:56 +0800, Hsin-Yi Wang wrote:
> Fennel is known as Lenovo IdeaPad Flex 3 Chromebook.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
