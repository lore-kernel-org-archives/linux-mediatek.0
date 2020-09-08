Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C788CC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 11:13:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F695208DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 11:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kY/xweSt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="karhH+Pg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F695208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3yFVKjWD1pQzhL7SzfrwYvmY2q5HnHFv1H1meWGM7Dc=; b=kY/xweStKfGOz8Hze65nf/fIL
	3dCJEr8bRAtRecJ6KlCco/63lAhMHK2l2Q48HHHQyA06BmyZcvbvo7+KljhUTzwBUdTtbWQFy0QiX
	osrQciNOG++l+dKRECdYBEcHAnhb15eimkNRybwBSfrXSV4XklTmgvv0dVfZi3X9majihw5nUQ6SF
	KnzINnkWaD82Waaoi4hUd58zb205KYA6zNCeuPNbrjZ1SjeGr4NCII8oLgjHNuGnqwoJwg7an59tX
	Al11A2jQweXRqEwEHpljaD/CjjfXXIIvGTuGX/8fpu2DD0p/nWXFxWv6ax80cidsJlmBokueZIc90
	ClLQlFu0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFbZE-0001rD-Qr; Tue, 08 Sep 2020 11:13:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFbZB-0001qI-KC
 for linux-mediatek@lists.infradead.org; Tue, 08 Sep 2020 11:13:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id w7so10685677pfi.4
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2020 04:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WVsW5/h4oQT6F2Ccs9ZaXWGd8sXTP+0lzm/VdEkOoNU=;
 b=karhH+PgSODWREXm0p54GPAS5fuKpXKJt+8Af39CQ0dmYw1iBiarVafXJpzDWywJmJ
 DIKSvOLWtEqV5fTY4VG41E0KD8ebLBehgL3RGJ7bpbnAf3kVBO4L850CEl8A1aJapJd7
 JQ3QoaevsqfxrykTQpknub/IQdeBSPVV2v1liXvQT2jv+GzKuquHLazpZ/Ra8aAaE5di
 U3EAuJzzwcfDuAfXJ4PkAGDasgeNGCzwoNghhN0Z4N7KoQlb2nuph1iguJVETLTA6O1l
 eVacXWnmpIcXJtfgaNMO215NZqqgddBf552Xa7E+yvy/iBppLvv++FcgttQzzlql+Vxn
 GyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WVsW5/h4oQT6F2Ccs9ZaXWGd8sXTP+0lzm/VdEkOoNU=;
 b=pctTe6l9J+TJpq0KYuXqiH8zlmGase6HUAXwZT/wzXr0CR7qaAWXm+TSO0nS/pJRLp
 eytfRluIMrPt/yJIW58T4Lx/rHS9caAPU5l1WBHtNSMUCDOKgh6QcnP7N4OW66nhBI5B
 gj996FUiv05hAsbhxtMcdp0XO2SPnocq8KLbNKGa6hBXjOUJP8jiDiZRz7HCOuWPaN+z
 kSPRksfznC88eIfw9WsiuaaCaxNM2Ct3qSO6KXgMbHvFf4HlCFocoKuMyB6zumVa0IAb
 0lZ+7vt6IcepRj/cdlQ4ESzLQckQGqSYzraO5tp/qwDbaNFY3qyMLD3pZvPsQVZkw0tP
 dx0w==
X-Gm-Message-State: AOAM530UCTA2wcr4tHRGU4vBQeaOeAvN54d1lMrYupWbMm0yDa9920pe
 vxneDMsgy5AvkbaCfgvDCWXMiA==
X-Google-Smtp-Source: ABdhPJx8styTZ/vn74fTMnB2guiXpmFzAePJU+SGLWP0r0xJfiKvSMVi9vEJfHQyKmPs/jo/hm/Hnw==
X-Received: by 2002:a17:902:c3d3:: with SMTP id
 j19mr23528672plj.59.1599563615251; 
 Tue, 08 Sep 2020 04:13:35 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id q18sm13906333pfg.158.2020.09.08.04.13.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 04:13:34 -0700 (PDT)
Date: Tue, 8 Sep 2020 16:43:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v4 1/2] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20200908111331.rdvtrvttoapqxaib@vireshk-i7>
References: <1599550547-27767-1-git-send-email-hector.yuan@mediatek.com>
 <1599550547-27767-2-git-send-email-hector.yuan@mediatek.com>
 <20200908102752.r2n6xvghl4fcdrcv@vireshk-i7>
 <1599563425.2621.5.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599563425.2621.5.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_071337_735841_41A47731 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08-09-20, 19:10, Hector Yuan wrote:
> OK, I will define the corresponding exit function. 

Also please add remove() corresponding to probe().

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
