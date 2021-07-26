Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B645C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 22:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDE5760F90
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 22:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDE5760F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EUGXIgsYNUE27UmZRePCyesjDoP5n9zYBECmpbU/DI=; b=ZOzm+r8bMvbJFx
	6UzHGtBqLouYZVcy38HPnysFDTHXaT5GgSV+o1hRyzMESsioYObNX9nOAHHb7YolHJCcP7R5pF8mZ
	8Xf4EYbJ4YXH8SiT1aur2k7hseSDDUjTIooqFV0EmcARFn/q7x03KSwIB4s4ewshg8G6m3jWwo3V2
	5MTXNKlF0BFq5djvCErqN8z/gBQEiCqZ3Ju05tq+Z1ZD6cHfxI+35lnMoFLIsGzQndd1uWcTfowHF
	kJMibr6EIDsQ7ZLd8YhdbijAj4hdQsWwAOX7cyRXiNmsvb2w+2z+DYEHarL4R94yi1fUuJ2ruiTCb
	E5YXXm0Ce48BbcHsLkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m890t-00CZT0-Sp; Mon, 26 Jul 2021 22:23:55 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m890q-00CZSV-ER; Mon, 26 Jul 2021 22:23:54 +0000
Received: by mail-il1-f179.google.com with SMTP id h18so10440266ilc.5;
 Mon, 26 Jul 2021 15:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dOz5E7HVjFqVAWLA76t/vpT1NocpXtD+l9AS40cwRw8=;
 b=IEx6OzSG4+Cb8b4YdlNi34OYba5dXjBJvKwCmrWB1IvaTIcbbu1LttacuTWLwzT1UL
 sxgPWauHzdlZd1km06T5ia4RgHRvh/aS4TgR5WfimJiF3mn6/2yTxYaEgn/Lh1ilHTbF
 ccKgLumzICKqlFYCgaOX/vBJSvV0g2rU23WcfmSnjRIO9Ec2VNYLDbB39LA1yDxuDVUm
 ywDmmdtjrZbl/Q5JzaoQwEr2CnzJKCp6tebUXHbHl80cQkJ3/AopHJ9rmApWHtosHnWL
 IVowOjhzkYcjJoDr3G1j5hQ7QJO6Adi9rxfT4YuLIf4tsw5Mo2SMaaLzsGBk4D1hMM2f
 +j5Q==
X-Gm-Message-State: AOAM531ojm+JfbpkCJaOkov5zHBPZvtoW1YlGTkaM62qz5M5fQ/bYg6J
 QERnxV/LMNNyOZDq9CO2Aw==
X-Google-Smtp-Source: ABdhPJwSP3kbL1KH7zx/6aZ6tXF7AlLcNfp88AXqdvjydYHLaRjr1AFxmSBakwlvWBCPEYgunztqPg==
X-Received: by 2002:a92:de0a:: with SMTP id x10mr14678766ilm.215.1627338231045; 
 Mon, 26 Jul 2021 15:23:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id v14sm689132ioh.11.2021.07.26.15.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 15:23:50 -0700 (PDT)
Received: (nullmailer pid 980634 invoked by uid 1000);
 Mon, 26 Jul 2021 22:23:45 -0000
Date: Mon, 26 Jul 2021 16:23:45 -0600
From: Rob Herring <robh@kernel.org>
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, robh+dt@kernel.org, linux@roeck-us.net,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 seiya.wang@mediatek.com, matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com,
 wim@linux-watchdog.org
Subject: Re: [v7, 2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 header file
Message-ID: <20210726222345.GA980575@robh.at.kernel.org>
References: <20210726122901.12195-1-Christine.Zhu@mediatek.com>
 <20210726122901.12195-3-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726122901.12195-3-Christine.Zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_152352_527254_CF52C8E2 
X-CRM114-Status: UNSURE (   9.39  )
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

On Mon, 26 Jul 2021 20:29:01 +0800, Christine Zhu wrote:
> Add toprgu reset-controller header file for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 29 +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8195-resets.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
