Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C639C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:29:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A92206C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QNKkE0cJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UYz/jCqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A92206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M6UQR5I6xlQXnAgWQk0ipDwaBX+F2+WDvKi87f2ImRo=; b=QNKkE0cJxhR7a+QKsIwhnozT3
	NCZ6kk34je5AZvDftQ0yeb6v8yJoc6o1MW3u02K26LYxw2oYGAq76Qrs4ohWqAaWkMdRMYRthTOwo
	7QQNG/C8UfONs0Xn0UY3MoP/H0Udu2ygRQ6k1bqZyIeOgNoLhDSpwYebtTsWrGvHLtZTE1+hm5TOP
	0byhB4jaIxnxXWg1T7bk2tpXKWrgfhmCrQJxvOmL32QJD+ER5p9JdJHck7rCNyLd3G+TwD7PCpITS
	H+iJC0LRUbku7S0WFikf77BcE4dAzdEv0zP+I5q/DYIw/8HtbVmMZyquBNDGsRO088cDuqOXz1l33
	m2yEyFxuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsyr-0001VE-0j; Wed, 25 Nov 2020 11:29:01 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsyp-0001Un-9u
 for linux-mediatek@lists.infradead.org; Wed, 25 Nov 2020 11:29:00 +0000
Received: by mail-lj1-x242.google.com with SMTP id z1so1912550ljn.4
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2020 03:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2nOPkD46qA6zqYvfk5N1mr7k9F+AjAsV4itAgMMq35k=;
 b=UYz/jCqr2QvHnOp8GVH62QzciFhLIGNOUqAxPEPAMeNaYMIl9PjcgIpzya9CXKYaE/
 SQBBiQY5ovG8meLwtPVBh5u8PxOUXuIYTupgxrMdcqk9YSvndHs8R+iKqEa2HGcMnYP2
 CsXXhHkNkhMMx9d/wjgKRbFoGCu0pDX2G7cCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2nOPkD46qA6zqYvfk5N1mr7k9F+AjAsV4itAgMMq35k=;
 b=IjWNOgOGr8kFYKJsxbNzOnRpTwAN2tXTRAOv73kFTw0z5WS4kocEJixf/XvMbNk0ZY
 qbk1UCoEV5iyGuVC6dNvntgl98/gb57hp7rwEaCdg0hsKiqgKqT8A2Q1iy8g6I9Ze2vy
 dBoAggBv9ur1Llt/aa8erRVOkjBU5DN1+z0+1MSICisO/jNWQ9vKz1mJim+T2K142/ZU
 kUYDwP6LM7UnFkvE9XNR0qHpZtEYcoF8jCawS3pSk3fv5B5mb5NqtIfrFb2v5DFXbD80
 geu/ShE+ICvrVZE96+l+qcYrRDmVsQB9Po9RMQQXDmfIa06LGg6kIfnqWWk1TlXbsXOc
 jDtg==
X-Gm-Message-State: AOAM530Uxv+TbKJhJtHa1GbqXiFzFDdzz5Br93iSY6/aVrGSRCXmFF8M
 s1QofdsVV2/qjDABe4h7t74iiNiiJJYk+rsj
X-Google-Smtp-Source: ABdhPJxEQX8ltxkL7eldwpoIz4/urAORyjHBXJcac75zx9qwKEYILkgRXzQ3kF8bUuw4qikoaMyaag==
X-Received: by 2002:a2e:7d10:: with SMTP id y16mr1093086ljc.257.1606303737181; 
 Wed, 25 Nov 2020 03:28:57 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id k9sm221175lfk.288.2020.11.25.03.28.56
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 03:28:56 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id o24so1897896ljj.6
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2020 03:28:56 -0800 (PST)
X-Received: by 2002:a2e:b4c6:: with SMTP id r6mr1243590ljm.248.1606303735968; 
 Wed, 25 Nov 2020 03:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org>
 <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
 <20201124083925.GC3940@paasikivi.fi.intel.com>
In-Reply-To: <20201124083925.GC3940@paasikivi.fi.intel.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 25 Nov 2020 20:28:45 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVZshFO3kiHXeP4FAgJ7am_SjZfcHrbF8h4SXUz+MimVw@mail.gmail.com>
Message-ID: <CAPBb6MVZshFO3kiHXeP4FAgJ7am_SjZfcHrbF8h4SXUz+MimVw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_062859_387165_3898AEE4 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 5:39 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Tue, Nov 24, 2020 at 08:56:00AM +0900, Alexandre Courbot wrote:
> > Gentle ping about this - we are already well into the 5.10 cycle so we
> > don't have much time left if we want to merge this build breakage
> > fix...
>
> Thanks for the ping.
>
> For the set:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Ah, just saw these patches included in Mauro's latest pull request.
Seems all is good, thanks! :)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
