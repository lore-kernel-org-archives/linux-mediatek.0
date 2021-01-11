Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35BCC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 18:40:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6928E225AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 18:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6928E225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lb5ieErwloCXzJIt5kSJUHiVN99mWivQ2pXXvhjHOQY=; b=kxXp/OE8aI5NgAqQv5oSwgyKi
	/+Cv7nAHzzFEO6adcDTsLm9hf7OyGfQlFM+aDemFWYc8I4eSAD5w1G7ouAuO3bd/evTMCEnpLDkJu
	82zqnOSKRHElIrLelp7IoFwyWV6dc34d5anfhaXOCmtX+xaWG0CJPdDsh9CR01EIXHmcnNk3bYvGj
	3vetfQWF/6SMPPfiRoWy45r2IgxM2gjPv5a/9zPpc4RqS4/sghRLaRIKxFzsQOFMERn6TIdPWNzTx
	DqZ68t6EYfqDZyS0Wj0RSjQcv/AoRFSMdiu56Zf27f7fu1uAbSGuljtzbeNH3j/r6doQ3xn80CASB
	l536H+Bjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz26d-0003mc-Qv; Mon, 11 Jan 2021 18:39:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz26Z-0003lB-RW
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 18:39:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id t6so321968plq.1
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Jan 2021 10:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9lAT4gKX4N+kdUDda1+JDYp8tK350gAlBUTh8cpLiXQ=;
 b=Ml5QXNX0McUZcH/qRcQsL68Omvcbc/J5ypXbrpMdc82fn1kt+R0oaoU+PLwar+pdbF
 C2zZqo2Jp7HUR1bR0q0Tiyy8GdeyZMFcC1nGizmtEBr0eHHKSP2keKuE5LV+tlKyLAy4
 DwdNpx8mM20lfufWJBq543oGdIqjpfInocEZVPtaZ5j9XuubyzgQD8N1o93YIKsbtFUU
 /oON46rmpCkoyYy4XI8RpG4bR+1UJozwcqnKiuHzI2ehoLCH19AWqiklMkKuHeN9oNRZ
 dsB6Cd0CQ2CibVQY9v55BRTBvR0sHM18rhGr3gI7pXfIaFDqxRzQTyWAlhmIj0HdlP60
 r4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9lAT4gKX4N+kdUDda1+JDYp8tK350gAlBUTh8cpLiXQ=;
 b=gl6hzTQXVFe0CanFuMr58s1MoGJXI5e9wwDRZnnrZJ9cCC+/D8H2Bh/yqAEVgjSE3p
 Nbky2NOyJLPmo0YeKmpWn62w1y+eOtbk19UVYWfcYO1lgfoy1HEeWUpH2F+xkkgRvaCp
 dGShmbYguISH7A7CeOWvWoXuZKwQp45BRsHGoDmRtcI7hF8nvaPANBomjJlLrIrBM/YL
 Oslv70g2b+n3gi8x1JAbZ5LW9bMVElQj3o5qPw3nEhwFTjqQa31H949m0+Qs2ymN0mvM
 WGRtFxupR1R8c4RnK7GjQhb3eMKH1UzmTPb0NEYTwbPBrIwpQPbT3jLseB7r3lbJtTdR
 QpvQ==
X-Gm-Message-State: AOAM5330Jjk86pERnIFVea84l3IjFIuEyw9qYS2mMEJAYRRZ/yQYs/Un
 QY0mHNDZ5z9xc2ZMH4PR2/Q5BQ==
X-Google-Smtp-Source: ABdhPJxe1wECB4rRLTdTsDQ2iih4uD9koBgZY0kmmOINViCN2trk/kywbpYH6QpBzsTWZSxuSj6aJQ==
X-Received: by 2002:a17:902:aa45:b029:de:2fb:995 with SMTP id
 c5-20020a170902aa45b02900de02fb0995mr1020149plr.81.1610390389026; 
 Mon, 11 Jan 2021 10:39:49 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id v1sm410339pga.63.2021.01.11.10.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 10:39:48 -0800 (PST)
Date: Mon, 11 Jan 2021 11:39:46 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2 0/4] remoteproc/mediatek: support L1TCM for MT8192 SCP
Message-ID: <20210111183946.GC144935@xps15>
References: <20210108081738.2175224-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_133951_911336_5CA2DFA4 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 08, 2021 at 04:17:34PM +0800, Tzung-Bi Shih wrote:
> The series supports L1TCM which is a high performance memory region in
> MT8192 SCP.
> 
> The 1st patch replaces platform_get_resource_byname() and
> devm_ioremap_resource() pairs per [1] suggested.
> 
> The 2nd patch enables MPU for all memory regions.  The patch was
> independent but merged to this series per [2] suggested.
> 
> The 3rd patch adds a new reg-name "l1tcm" for L1TCM.
> 
> The 4th patch supports L1TCM in the firmware loader.  Note that MT8192
> SCP is still under development.  The patch breaks early MT8192 SCP
> firmware which should only break our own development environment.
> 
> Changes from v1[3]:
> - Adds 2 patches at beginning of the series.
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/#23879113
> [2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210107023020.3224002-1-tzungbi@google.com/#23879623
> [3]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287
> 
> Tzung-Bi Shih (4):
>   remoteproc/mediatek: use devm_platform_ioremap_resource_byname
>   remoteproc/mediatek: enable MPU for all memory regions in MT8192 SCP
>   dt-bindings: remoteproc: mediatek: add L1TCM memory region
>   remoteproc/mediatek: support L1TCM
> 
>  .../bindings/remoteproc/mtk,scp.txt           |  8 +--
>  drivers/remoteproc/mtk_common.h               |  6 ++
>  drivers/remoteproc/mtk_scp.c                  | 62 +++++++++++++++++--
>  3 files changed, 68 insertions(+), 8 deletions(-)

For this set:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.29.2.729.g45daf8777d-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
