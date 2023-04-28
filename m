Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F3C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 21:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAPY815zoxAtMPmlMXHufDygNyWf4XGrhN0PoJVnSps=; b=No2UZNFyqAk3SpwX1zhVlSu51c
	9lymypb4vT8/VyN2ytgpVsimjbhHqEyeGH7yA3ry6UV2DBCGcrDwo23Wn+qC6j5b6g78+fBRs6e5h
	o3x+nMev66EBdlQXPjMBDUKJJGpPh1OmRI6D0yazmgiXA2l8vnVTbX8Czdx/1f72Zu5EQfCGW1Fsz
	aDx/DihrC+ssAFGMEXUROhXql++Ol6lgevJhy290jAl0yFOgP6Sn/1VpARZi46/dYKOBEnUNqd5E8
	yirktHCswUUTe/cTP3TwKieUC9P0aZvW3h96QDWaXE7FXPrcjr+byKDD4sho0ZvWOl3CZDWBymJEz
	WvilwJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psVZm-00Bn7F-2f;
	Fri, 28 Apr 2023 21:24:22 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psVZh-00Bn4w-2T;
	Fri, 28 Apr 2023 21:24:18 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-38e4c98e5ceso201129b6e.1;
        Fri, 28 Apr 2023 14:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682717053; x=1685309053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAPY815zoxAtMPmlMXHufDygNyWf4XGrhN0PoJVnSps=;
        b=Da5hrigakOyf2blf0u98/8xoKsmZdvuAi4r8XHH+52Cg0j0rArrssl8p3WoGwgHJrB
         tSYfzjhoIqxOI7c45U2ImOxiHhfB6ccessFyMRVuI8i5iCxYDmp5fGiB/+/TVyXdShmm
         mWNpnuzLUaY85l09z+dFyhxl6M508cif7c9sk3SiLvr1Axksyj8CRFdE+jm/3j5j2Z0S
         a89l+/MFBZckRcYwWoDjGiD/6wpnItRIawKejBXqo5BuPgxvk87Mo9Sx3niYD0OCDGXR
         8+1+29WhYAuJq8nMZXTx70aSGB4gvzgsYs8afrwElJ7YOObIuXMu7qVDqHD/8fwo+yTA
         Bp0g==
X-Gm-Message-State: AC+VfDy9ydjaCT7Z7CVnceVsRvrvHQo51aXmEX8Pbs+NdpByE1CSvlsD
	P8fEpN6gS/WQBcPe635TkQ==
X-Google-Smtp-Source: ACHHUZ4ejwMUkARoZivIyIZvQ1OVmA6kIV/k9dm1oOfq0PdWN5jKAu6yLm5KZXEfQ/nrJ6VzEGxTwQ==
X-Received: by 2002:a05:6808:2787:b0:38e:dc5b:7bc0 with SMTP id es7-20020a056808278700b0038edc5b7bc0mr3045160oib.59.1682717053559;
        Fri, 28 Apr 2023 14:24:13 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j6-20020acab906000000b00383eaea5e88sm9096118oif.38.2023.04.28.14.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 14:24:12 -0700 (PDT)
Received: (nullmailer pid 299800 invoked by uid 1000);
	Fri, 28 Apr 2023 21:24:11 -0000
Date: Fri, 28 Apr 2023 16:24:11 -0500
From: Rob Herring <robh@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org, David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Jade Shih <jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: hypervisor: Add MediaTek GenieZone
 hypervisor
Message-ID: <20230428212411.GA292303-robh@kernel.org>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
 <20230428103622.18291-3-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428103622.18291-3-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_142417_807522_366F54EC 
X-CRM114-Status: GOOD (  10.32  )
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

On Fri, Apr 28, 2023 at 06:36:17PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Add documentation for GenieZone(gzvm) node. This node informs gzvm
> driver to start probing if geniezone hypervisor is available and
> able to do virtual machine operations.

Why can't the driver just try and do virtual machine operations to see 
if the hypervisor is there? IOW, make your software interfaces 
discoverable. DT is for non-discoverable hardware.

Rob

