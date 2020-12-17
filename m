Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C000BC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 14:22:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C80B2389F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 14:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C80B2389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JSNcULFqt+wa51CCwVM/XnnjIY+vOm6NbICu7XzGydQ=; b=o3XuhLi1eUp3BgokxUFMBFo+S
	Xjg8YR4wKrSyFlFtp0VVMcmOY15wiFhUO9T2aWF8QOcC6CmAWuRfP0hwNu5c8ILTevwD0y17c8Tt4
	9+Qbr3yE6TUhRxskOpEmdqFscEqxelIzrCcAbkssYrM206lJwoKqaS9dCo3wN599c/rr/TOfP0deJ
	PJrtwh0RPC1u9TokqTUBUotKhvM6nB22H5wK7vJnHml6F61d/1hkjhmyvTc3DtxURjtCcgmmzMree
	/Lw4DtMbXPBkuBKXJ5m6q82Csdc7utRpNWlCVnjJPEDRjbD6y9hzsoq4XfdLHfMzRqNnRs52EDZoR
	fNMddRsBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpuAL-0005ME-3l; Thu, 17 Dec 2020 14:22:01 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpuAI-0005Lo-M5
 for linux-mediatek@lists.infradead.org; Thu, 17 Dec 2020 14:21:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id o19so32154872lfo.1
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Dec 2020 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fEsDcXj7kC0e9QLMNZJRwfmrhQOpyffdTx2CokzQK+k=;
 b=riCzgX1IMRf2nv/TCtl+S/ZuEImnBSmdHagRA2iR74qGVwX1jubwWafisAtkUhzJj3
 ENOvThhHTo4nW3yj3tbG029Llth4Hh5JAp2slI94u4dQk524gEYVrOkD4+bpTmqiyuBt
 kYBek6VlF6V+Oo1NxpygfEdo4i1DpvjcIx3W+OCwOfID1kPt3GN9SDRITJ+s3HnGr+x6
 H5NU1L+sefw/qMFIecLB/5xzHN1G0wTL+KU7n6YxjjtY/cq1BIg/440bWC9A4sszE0Mv
 oYTPL5Vxh35Q2Z8IQ4Diib5LqWkZyvwFtC6lo5VdkDmJ77tqNL128QMhOM90akJGR3fm
 GffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEsDcXj7kC0e9QLMNZJRwfmrhQOpyffdTx2CokzQK+k=;
 b=KveMAKG+GEGpDBlka5WQcqmheKmdESgDQJm1xUr4GDtvGXjHcbPm/dJnFKU+YWdBuZ
 DyY9pgRwwRf1JH3YVmcqcYbS5IFpzPcf6XY55w90gvOKrJxo2Q/e+QoJV5pMK/uAKeFo
 Mpf8yb2wYZF+d1dCSRJFWVrxduW5BzfMG6IBCFTd6rQhYA60NLtCvsWj8GbDan257yms
 pEILJ+hTJc3sy6hd9bgIrHOKEjqlKwymfjRfLucbptbUQWEfpH5E4sof94PuBVCfH6PH
 vIuadp5Pa0xCYWHZ8hqzj5tOpNFhvkWB12oYFVLbyIpi5wF4UMZGIgaASpu5qXoZBAX2
 H5Bw==
X-Gm-Message-State: AOAM531dLGHfZ9yyxaM/gpZH9bNR20g7ew3wmnMQILHeOcJgCnf8b4DH
 XPa3t3Zh26EK7qVnRTj32qvxg8Yuo4yJk8I6nGDCkRP7gsc=
X-Google-Smtp-Source: ABdhPJyUDc+putV0OYw316T4PZsBgszWBOXNkJyofvl7KyfCUKfxWMXfSayYicYYw8zqZ8CH4DI6NBB5PmTmdGVCoDI=
X-Received: by 2002:a19:495d:: with SMTP id l29mr10494795lfj.465.1608214915009; 
 Thu, 17 Dec 2020 06:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20201217083420.411569-1-lee.jones@linaro.org>
In-Reply-To: <20201217083420.411569-1-lee.jones@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Dec 2020 15:21:44 +0100
Message-ID: <CACRpkdbogmGxvs_VsFoB8rbq8-51s2rQWGHwTStBzozmSShT3A@mail.gmail.com>
Subject: Re: [PATCH 1/1] mfd: Standardise MFD_CELL_* helper names
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_092158_799356_73641A41 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 9:34 AM Lee Jones <lee.jones@linaro.org> wrote:

> Start all helpers with "MFD_CELL_".
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Gene Chen <gene_chen@richtek.com>
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Makes sense.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
