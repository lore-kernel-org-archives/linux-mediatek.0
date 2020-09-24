Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BBAC4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 11:51:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366462311B
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 11:51:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MzNuG+EJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="SEHt+4r+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 366462311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m4ovdcKim+6NfrJs5EGxiJgx/LoaccZ9HKyefHJQciU=; b=MzNuG+EJ4tvAHKZ4z8hE5Ww7F
	8VnhhJ5PI6UDxy/S/zvh3+mZ0YJCvKTF5mBSDsQKniWFdDnEZJ0ORfjmowSGskn8K68YDiPHF+f5v
	kTHR802oUmX3is/fvhG2DNZRjNmzLdW35twTRMEVVd1woqkihyTgFoTq3sKAbjLMjNXx/6AxuAv1U
	v056evIrfgwnn3LGoozL60nQF1f2LRrMiYE3WagsyAnmv0ZdzS1cd9mKxrdHloi3On2hCWJ4Dj8IG
	P8y5Oow0pamE2TpCr/K06n3Y3xT0wwGlhHq3y2LxAkygqDLPjuoCiDe2MHv/fq+Xuh8aDS4dwGJlf
	C9Apjat5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLPmU-00023q-94; Thu, 24 Sep 2020 11:51:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLPmR-000228-I2
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 11:51:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id b79so3271355wmb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nij/PwpDmOmT8ZNid9jsa0R9PGd/GWpm5CA06AHzYf4=;
 b=SEHt+4r+uPCHQpoZa/Wbn4JwJBSFVkrIFW139zERL2KF/6JpJAF5lRt7+N1EysT/iN
 niB5CjfsARk+gfXnaB2TvNCzRB4Wc3m+ZvntPTGABL+1t1u2mF4xhVI5XyXYrOccAQJz
 gfjKX40SuCMCiJfICb/17Umi1fMUZMDUkPu79gs2vkP0lq0gmwffKcM5qsa7OEvASS54
 eMA4+9SxY59rYTA0XWghxFjfyJPhyn3CHBB9niU5lfWQdRzZvzqHsPpPloqHerpHvYnL
 f/rX1q4KIIRLTnZ3d4VKoWlVtdeupXofNnqeyO5WXTmUsxprek6SQtluGC2JKDfW5Nox
 p0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nij/PwpDmOmT8ZNid9jsa0R9PGd/GWpm5CA06AHzYf4=;
 b=hAN4Ki5+s8MNT6D65kvbXkt/Q593fmuq5PLn53R/KIak8H657/J3oimTqWZO6x30ht
 GAaCYmEMViJsTfXi9uA4NNOx/EOKYDjuxS+YH4MUKy7ixvuloGlceWTei/O+07SqvIji
 +XRDSnqNQknNv3rF0R+MagyseLzhjcSkcim+pNNN7QL26Efu/0tRB+vxjyYWIPVdf0Pe
 ptCWUlmY2lErJy//PrjoB6llFR7QDiIwH6ZWR1kGnrnr9/rU/yOubVUnFbZQBtxeqjHd
 t+J6A0hBHeYdDvSaMe+3odgjeHHvcMwq0yZmHM014988IhK/cYjciEp5RfL83jxkYGQg
 IByA==
X-Gm-Message-State: AOAM530slyCVWXircRquDOlvrKQulEQ0BgI68fiTZVKGcFJWTl/5TYLk
 +Yyy0FETFFowxwS6oVk9LvMOEl3UECpCIjPCR9e8AQ==
X-Google-Smtp-Source: ABdhPJzhCBlSEE0jw1TCHf+qnnbesb/CWE0fF5+AkItRm0YPwcMYCFojXDQZzsK/GxCD5hnF+OWFGiKk5hx8YvgG8D4=
X-Received: by 2002:a1c:b388:: with SMTP id c130mr4322495wmf.175.1600948278294; 
 Thu, 24 Sep 2020 04:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 24 Sep 2020 13:51:07 +0200
Message-ID: <CAG_fn=U_dshqBB8HBhGyYnn_vScTOcLJX=mfU+8Wi5wjZL2oYA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_075119_630670_AD4612D5 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Andrey Konovalov <andreyknvl@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Tejun Heo <tj@kernel.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> ---
> Documentation/dev-tools/kasan.rst |  5 +++--
> kernel/time/timer.c               |  3 +++
> kernel/workqueue.c                |  3 +++
> lib/test_kasan_module.c           | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> mm/kasan/report.c                 |  4 ++--
> 5 files changed, 66 insertions(+), 4 deletions(-)

While at it, can you remove a mention of call_rcu() from the
kasan_record_aux_stack() implementation, as it is no more
RCU-specific?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
