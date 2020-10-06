Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DC7C41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:18:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26EBD20760
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quR67TcJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26EBD20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y3hFWd8WcCXD7q+Y+sj1sJJ1jB64ryQ1Q39HvZn57mo=; b=quR67TcJ0EzUgeTXDpkq9QRJL
	QczTpk8dQ86u7vZJOeUO/9Os98Ei1yOLInosuBnf+5cb5MLeZpmHhiznx60oNyKCEdSRA8z35Rv1P
	VK+b5h23xUjA8Bgc1M/HSOw1tJg/LC3Bvt8gC7qOO+dZ/RdazzeSR0iK11SuC3FNMYNhJ/kK8Qwg4
	MmmAeI+GfCeUJGXG1vckU+ARqDgP8Lcal5l0COen5zKWKM1fSGDa2bDBKwkvnIMxedtrvQSlmyzzx
	iW7Ut0gxc8vtDBpiM8Cvk2DRV/Xs6BLuy1HAjZVlJ8kMPA6IF8ScBYydhpAzqbzX0dtSSrL9AgJ4u
	VPQRhomsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhFG-000690-8O; Tue, 06 Oct 2020 07:18:46 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhFD-00068Q-OA; Tue, 06 Oct 2020 07:18:44 +0000
Received: by mail-wm1-f65.google.com with SMTP id v12so1899744wmh.3;
 Tue, 06 Oct 2020 00:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ITHR5xjZR9qU+0rYpKhMHSvOMECUC8YhvuIaZkbc094=;
 b=oegSY1uiefnnmYyABj4T5OyMPo0Aqqujskm46hOPB/SHuZpR6qDFE8waF0Ff021l17
 X9WbIUtlugZVzXBYhrR3hQvh7+QaPtpyEfy2W6sUyYUjBPB3x5xn/cG/DDZSUiJj8+zU
 PrCarNbDwQslRkET/DEXitpCv/re3QHQJWPjGJ952M1O6sF+QJOneQ9sde1WCzRUyCNr
 SbfsH6KtQHTJ/YCvKboTnOZBmbptuT3slhirc5aqVJb4ssibc4XA+ZNrD0bEIORrtomM
 ihLprCkoMX5ymqb11cUGid3fBhN/Y3lNBKo1OMRoGxab/8N9AuUgwpwa8GL7tw5a3S2Z
 T26g==
X-Gm-Message-State: AOAM5323WK1gaqBz26YfkhaxE23uoevk3z2J4Zv5rmzFAM0eMmSMHKHq
 9sTMeKwh5MNdw69A8HoFwIs=
X-Google-Smtp-Source: ABdhPJx0yNrHEU7UDvNE8lhlFuoDDRp9Cl+ESLoSIMyNzIen0lPioASqSAe2IV+9r6VqPllxNH0sgA==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr3284322wma.48.1601968722386;
 Tue, 06 Oct 2020 00:18:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id p9sm2617wmm.4.2020.10.06.00.18.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Oct 2020 00:18:41 -0700 (PDT)
Date: Tue, 6 Oct 2020 09:18:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 18/24] iommu/mediatek: Support master use iova over
 32bit
Message-ID: <20201006071838.GA5703@kozik-lap>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-19-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-19-yong.wu@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_031843_820177_5F328B40 
X-CRM114-Status: GOOD (  16.39  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 03:06:41PM +0800, Yong Wu wrote:
> After extending v7s, our pagetable already support iova reach
> 16GB(34bit). the master got the iova via dma_alloc_attrs may reach
> 34bits, but its HW register still is 32bit. then how to set the
> bit32/bit33 iova? this depend on a SMI larb setting(bank_sel).
> 
> we separate whole 16GB iova to four banks:
> bank: 0: 0~4G; 1: 4~8G; 2: 8-12G; 3: 12-16G;
> The bank number is (iova >> 32).
> 
> We will preassign which bank the larbs belong to. currently we don't
> have a interface for master to adjust its bank number.
> 
> Each a bank is a iova_region which is a independent iommu-domain.
> the iova range for each iommu-domain can't cross 4G.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c  | 12 +++++++++---
>  drivers/memory/mtk-smi.c   |  7 +++++++
>  include/soc/mediatek/smi.h |  1 +
>  3 files changed, 17 insertions(+), 3 deletions(-)


For the memory part:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
