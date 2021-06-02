Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06970C47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 10:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA95A613B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 10:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA95A613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uX/lpYtINlcLol28sT/fbqCAtwNrnMPwldGvuSf26E8=; b=Yt+E1zROSHXL2p
	+LGtqAqgOMPfLMLAGxKJKNCM7L4LKiMJwOa/7I61KPhLVuNjU4fOx4/4zJLTZel/6TeqT+bmPLjqq
	/fwe5RFQDazWOpe1ZnGqTvovU1xr12dJ25dbaJZ0oHSTS9r11N9WoY5aJMvfjJtHBbmEZfwifH5+D
	69WFEj+z/PEe4SvFmFrtP4trhWCiPZOOQX0JBfwgarMLg9R5Nuzy5AD/xHWOEd88tIjllFvPxzs2t
	MCpqDVtWtLNy1vaoJQaCPMcZ+LdppeoGUuse1kp7pjApaZdMg6IY3XENnttWHzQFLPVZEq/JO57fP
	/lBYrHBqRj/TR1OekgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loOO6-003R48-Tl; Wed, 02 Jun 2021 10:46:14 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loONj-003QvA-DI; Wed, 02 Jun 2021 10:45:52 +0000
Received: by mail-oi1-x233.google.com with SMTP id f30so908044oij.7;
 Wed, 02 Jun 2021 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eXKINWXa0bjDJgK/ywcDJ+ojBskVf7ukQn1t5GiFFaw=;
 b=oYoulyT2rIcq8A0JTUO9ReBCmTJkNP3CqX8WVjoCNT3Qtwnk5oabTdyWlfx5x9ObsX
 N5BNsuUqJlBh3SszN5WaVb20Fj87IYi71bU53qQR1UfajYxaiNmqTFA50Oa4Ki6v5EWn
 eB6+BFqK+mmbA2NxIANCxSfzS43btbRXSFEAN4/JQbK+vLXAG1TVnOM1YSjhLGOWOkmt
 SkQvUALu1rlUQvd60ar9nY0fKXJR37Dgt31klarABjmfA8y1bDIMoDSUa+jRxIeX9xvx
 WBfpk6fA0jj8dFKRi6EpjYG5R2QnlNEPqfSwM6Y4KUKdBTTazcQMUleaT9gPzZP+u9H4
 amGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=eXKINWXa0bjDJgK/ywcDJ+ojBskVf7ukQn1t5GiFFaw=;
 b=NiTJ/ZtME48pztpvx0Oc07ypaG/ZPJrXWyu7SCNNCOKd97jZ9EOn6xpljmTO0+KGt/
 Zd1HbbAE2x0RGkXyvtotRJT5iGyQ6E14cvnK8gGiJFoT9j+/pC9c3qGJueNK18Dp3+3X
 7Lr4F9cvJYaYWi1THfuHotTF00iC7mA0qsNoMmxAlI35NhJWzJXENNNzbhg5OGtFitQQ
 01Vk2WI088E0dn2SAFvuRip8liss8z2QW7wFUxg9m5AB1SZlTuLA7u0Zr50GKgDP1Zht
 bqreQzukSTmvzEG4uCEWYxzchHvAAJeY+YHZ/QWnJihZw3X7VJTrNRkufauW3c9Atos3
 toPQ==
X-Gm-Message-State: AOAM533sEBYjVqHOCNVd2pn09ljpDX3kfe6sRLWywvFo10x7aXJ4WInp
 l9e2XHIADl7Eq3paWCnc1UM=
X-Google-Smtp-Source: ABdhPJwc6PM8HlyjkbWQi5wLaodwmu3gvioqwFls2B3zprH7RHff/PIsMDTLIl4iHpOVzLqTImUA/A==
X-Received: by 2002:aca:2b17:: with SMTP id i23mr21517722oik.87.1622630750364; 
 Wed, 02 Jun 2021 03:45:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q1sm3922934oos.32.2021.06.02.03.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:45:49 -0700 (PDT)
Date: Wed, 2 Jun 2021 03:45:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wang Qing <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V9,RESEND,0/2] watchdog: mtk: support pre-timeout when
 the bark irq is available
Message-ID: <20210602104548.GC1865238@roeck-us.net>
References: <1622425895-32111-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622425895-32111-1-git-send-email-wangqing@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_034551_502812_5E8A4821 
X-CRM114-Status: GOOD (  14.98  )
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

On Mon, May 31, 2021 at 09:51:33AM +0800, Wang Qing wrote:
> Use the bark interrupt as the pretimeout notifier if available.
> The pretimeout notification shall occur at timeout-sec/2.
> 
> Wang Qing (2):
>   watchdog: mtk: support pre-timeout when the bark irq is available
>   doc: mtk-wdt: support pre-timeout when the bark irq is available
> 
>  .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++
>  drivers/watchdog/mtk_wdt.c                         | 77 ++++++++++++++++++++--
>  2 files changed, 77 insertions(+), 5 deletions(-)
> 

The series is already included in my watchdog-next branch, making this just
noise. On top of that, it is v2 without change log, meaning I have no idea
what changed since v1 and if it is different to the version I queued.
If it wasn't queued already, you'd get a message telling you to resubmit
with change log. As it is, I'll keep my version and drop this one.
Wim to decide what to do with it.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
