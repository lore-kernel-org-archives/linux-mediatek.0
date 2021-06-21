Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D92C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C2561040
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9C2561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNS5+LHVAMX+EQnItIXJoimxXcFL7zptbQp16scbmXQ=; b=Ud9uu0xHFDi/wY
	xHTN73RRlaxuMkkvFlZDbEJi4/Brb+askZPnfpjzGszjLZbBUG5yAkkE3X17RgKgxRRxuGuVTuKDk
	KX3Mf5zTKwJJ4iaiFyGjAXRiYelE/2Aewzf7IRMhBtlm/kE5Qq+AFWdavo1vSwEcxp2Hmvv+47+Dr
	cIetJExQVz4hxkOzFQ/7+9V1qL++TQ4ki6c6URFmtikCuCf1v/CB1D3nadWs3Bd9Uwli+XwLhAem+
	JJCbjAlwUTqMyPeuNR4jpzUHwmel+TI94USJf/Mg1AC2hRtMuf9CpEh9hzYALUQpx68FVrRmqA7g9
	H5Ftlx286veB1DjrfWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvDAW-002GhI-63; Mon, 21 Jun 2021 06:12:24 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvDA6-002GXX-33
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 06:11:59 +0000
Received: by mail-il1-x135.google.com with SMTP id q18so14220636ile.10
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Jun 2021 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dFqcjBkyeVbZVV81wdO/BU0CaNfO5X/9PBfKgEeRgeo=;
 b=WjN0ZfJouIM92ExeXVN/VfvHeYcui9sJMlsZgf7lusL7S4EQxITNUOTsLH5uA7wcCd
 sd9HxvUQEptKg87qlalK3+ECk9KIpBGUueOJphaKYCTcY+zaDxCRt5/EFP2aeiXUE4mp
 WAbKqn1i6UvyfZK8ZbplzZF425eacqmBWN4kxvcNc36b4+piHL9VMVV/7sEZiKiVXHcL
 LWQeNuRua71aYtIUoCjBZ0XLEjxj2L1KBh4riLZuBawH7AYONHm4L4nCGqucnGtPv+eF
 vrcPVPsWJTmgS48Ktr7qVB/f6U+94aoO7Rgu4yW0drPPCVsfANfhxpR3PUKiZBxhRRyf
 4hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dFqcjBkyeVbZVV81wdO/BU0CaNfO5X/9PBfKgEeRgeo=;
 b=RkLH9DY6FmlNYkrQ9WEpL0QTXgb+YZiirvbnVclsiTXfXOY9kNVW8jWsC84hZLe6RH
 AGpiBbH6sBKmfOLB3hPKdgte5RjqfEdNdSHe0/kLxsvCkws17znTmL2aDlpCkbQpPhl0
 NZCgDwRzv+08c57plzb+MjkjJrrtFjDciOhOcl5xA+BqsOg63NJe5G6M4BEiiwh6pdTe
 MjDtfNxC2izmvL5ugAtB+ner0KHROrt0aP8mLSisMRiFQNTk1FCRSoND9gczLUaLbJ9r
 G7hkAZqLDA1rS6I4+WHq0F4+s510Ze5KDClWpWv7/V1gyGfFrBYMgE9szvVmyrBWsKOB
 Hw1Q==
X-Gm-Message-State: AOAM53329FPhDiCHHkad06ToXnjMUBC/hnIfsAT4ct5sswFUD8ju/pal
 3LjkMWq+Pk92cDzMsKYMJKdJ/y8O1fZ5+QP+YK3OTgSZPyE=
X-Google-Smtp-Source: ABdhPJyXrNphIWVha3+XvhL1Wr4g/Hu/IsLOdxATEkfyUq93ra89qOiGrsa3KzRhW7mYzOPs9o+vEAQLm/voaAEOIIo=
X-Received: by 2002:a05:6e02:13e4:: with SMTP id
 w4mr12312587ilj.127.1624255917176; 
 Sun, 20 Jun 2021 23:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
 <20210620134954.15233-3-Christine.Zhu@mediatek.com>
In-Reply-To: <20210620134954.15233-3-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 21 Jun 2021 14:11:46 +0800
Message-ID: <CA+Px+wVTAbU37tEtGWmLGPaMSJkrQXOUyMRzY==rQQ5E7=m6+g@mail.gmail.com>
Subject: Re: [v1,
 2/3] dt-binding: mt8195: add toprgu reset-controller head file
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 seiya.wang@mediatek.com, linux-watchdog@vger.kernel.org, 
 rex-bc.chen@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_231158_192560_C2093158 
X-CRM114-Status: UNSURE (   6.31  )
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

On Sun, Jun 20, 2021 at 9:50 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> add toprgu reset-controller head file for MT8195 platform
Please write complete sentences.

> Change-Id: Ib08da609e87d31ff0aa06b066f9797070931a693
Remove the unneeded tag.

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
Maybe 2021?

The patch needs other proper prefixes.  For example, "dt-bindings:
reset: mt8195".

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
