Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA32C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:16:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE392070B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE392070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dVeP2uBVHKbz1RLgBTOXbdxctN98PwA0vsbdGX97Gso=; b=Tve9dlmHZ2Myn412COFiLF2f7
	OqbRlC4OmYjUAHlBlL14JD2mx1ZaxTX4nj6pqG7LHF236Xe7J5Sv/RzYP2HUjSzCQ6bRiJDuychqd
	3VwKzK+b1a0P7LuWn7wOAUOidsTXT2N6eyhZkkB0sEK12sTvWR9U/ex+KyrrmNEziTjAOs+I8KdU1
	t0gekmwFsCmMGYT77goWf+bnZZZdikdrZssFfaEaYWuD3I6mA7QEptDLWk2VhyxNsXMShZT2ePDR3
	eEXlnCKRLCXZoSao+vKOyRXKHrGOJTETMfRctiEqEirLxSyXYlE1KA8EJpPTVPM9vi77hq/gjH6uq
	HOQ7CQf7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzJo-0000Bf-50; Wed, 23 Dec 2020 08:16:24 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzJG-0008JP-CT
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 08:15:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id p18so10136757pgm.11
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Dec 2020 00:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XucMaRIeMybHCwI/S50c0P9P/PzyTr/MY7GdCt6gQ/Q=;
 b=aZzdXz0SBtVFnO7PRB2b7RV7mkqwrJBV3MhQ+S6S1rTiukgrEzwXVuVmBglEF6tyx7
 sUMj4R7PThczRRpPOGxwzIDDnG8jhFuhzW11Y/PwPYVvWY8B1h6o1bjgby2jsWczSAK/
 SrYuIgiezft8tCl9+en1fO6d6CqE4ft75I0eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XucMaRIeMybHCwI/S50c0P9P/PzyTr/MY7GdCt6gQ/Q=;
 b=gVm5t09T4ricEAiUm8hsOcVVVMGbz3UjDV3ZaDHI/x30vBvtN9+eSoWo5cCk2ELkfL
 Vzwrgif2Mj/ZhhlIoUdNMPzfaYH6TKd8guJnDoXjKzsCj/qQVoUokErkG8gdiOHW9a2K
 E8DNlA4cPqTOtaAOWh0HcO4OWQpOG9tR+KdW+a9H7/rBU/mpXXUTicoio8xaGwVW7//v
 kXK8zvBCYgoHLRflUkfWh7Xwr2C/YZrnmx7qt16yCIraDPomAMRGCPDLb0mS0PKNS6Ps
 EaysIPDUi/9+p6nDU2UqhLIv+lU+MbNSSQ1k/Trgi1EnRnO1b+QJami02WtsONr3ZQ7r
 CuPA==
X-Gm-Message-State: AOAM530byuASfPyX0dDVJl0zzzzKLSPwxDJ8ngRjLbfj7ogPYSNq1Wqk
 C/SBmb+OHPJZXZFUMKN/bMxeOA==
X-Google-Smtp-Source: ABdhPJyifhZqLvN5ckPbaOURCHzmY+l/YaYK8cbQmz0WktjwzfkVze0lIG/pGDQESzamQk6LNGPbAA==
X-Received: by 2002:a63:f12:: with SMTP id e18mr23981690pgl.101.1608711345895; 
 Wed, 23 Dec 2020 00:15:45 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
 by smtp.gmail.com with ESMTPSA id z11sm21421970pjn.5.2020.12.23.00.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 00:15:45 -0800 (PST)
Date: Wed, 23 Dec 2020 17:15:38 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 04/27] dt-bindings: memory: mediatek: Add domain
 definition
Message-ID: <X+L8qpO+T7+U2s5r@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_031550_522244_9943305A 
X-CRM114-Status: GOOD (  23.30  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yong,

On Wed, Dec 09, 2020 at 04:00:39PM +0800, Yong Wu wrote:
> In the latest SoC, there are several HW IP require a sepecial iova
> range, mainly CCU and VPU has this requirement. Take CCU as a example,
> CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).

Is this really a domain? Does the address range come from the design of
the IOMMU?

Best regards,
Tomasz

> 
> In this patch we add a domain definition for the special port. In the
> example of CCU, If we preassign CCU port in domain1, then iommu driver
> will prepare a independent iommu domain of the special iova range for it,
> then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
> range.
> 
> This is a preparing patch for multi-domain support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> index 7d64103209af..2d4c973c174f 100644
> --- a/include/dt-bindings/memory/mtk-smi-larb-port.h
> +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> @@ -7,9 +7,16 @@
>  #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
>  
>  #define MTK_LARB_NR_MAX			32
> +#define MTK_M4U_DOM_NR_MAX		8
> +
> +#define MTK_M4U_DOM_ID(domid, larb, port)	\
> +	(((domid) & 0x7) << 16 | (((larb) & 0x1f) << 5) | ((port) & 0x1f))
> +
> +/* The default dom id is 0. */
> +#define MTK_M4U_ID(larb, port)		MTK_M4U_DOM_ID(0, larb, port)
>  
> -#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
>  #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
>  #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> +#define MTK_M4U_TO_DOM(id)		(((id) >> 16) & 0x7)
>  
>  #endif
> -- 
> 2.18.0
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
