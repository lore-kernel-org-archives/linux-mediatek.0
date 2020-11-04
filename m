Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5ACC388F9
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:24:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3037420795
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wig5RXlX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ux/j4+pa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3037420795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=con2XP7yDjf+VihHbxjQpZAp5mFxd9pYjRjFf5uK+ww=; b=Wig5RXlXVJ6VYfp3Hast4jBAE
	QocN+qSsnnlVagA5Mw2WtMNAKp9suVnDknM8+5vGR4lBN3TdLoWriZk886JyxJFUxvu8O+ajrL58K
	8AuiCRXGc/OXTIF+XcKzOFe9m4whGysUnK2Ye0NcTHMFHt4PiqtmG402yzxWXChWf5ByoapNlrcqc
	La1Gio3V3HWv5G/SJjJJN2x7QvoxN9vVAKKG7QwQqVxqSpnU7j4tu8q7ZUQe5B+M3Xf3MpG04IAPx
	Jmd8mAycB3I+inLflkdeULBeqNSmedFLzSWScJ16aINgcWzLFFPlwUSOwX1W1MGOi5lmMrWaKn4B0
	j1VoP/S1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaWoe-0006pG-9b; Thu, 05 Nov 2020 04:24:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW6s-000145-8Q; Thu, 05 Nov 2020 03:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZS24L4Q1SnbH+3TvbhszBTqlwtEhinFPk10NBRg1yko=; b=Ux/j4+parBNeod06PkvWmQZ+NM
 xsT6I5MZiQpNX9yTXJUhKXz+lga9uZMLZv7d8ea4kpRbeqhfwpvR234++wfOmHAxiXBe98Di/2rYR
 7RxaA47REXYsBupJwRyO8LooRM+iWWmIox4PYMYRJUGdXXZeVr3f+zpCCeW/uuPgF/qay/TnwTBzD
 hiL5q4ABb6SztmWSuXJTaBERoG1XWZ+FITkMR2mwNu6uOlIlpRLERVFsWGbyEy0PFD4LMXQSambQv
 ZxgNPcaLqzaU16/CxwUvY/m9UIgz8A823ERkgWmO/RvMYtIZ4kcK59kY2jREg3EDTCDPLNGydIMyA
 zfF5sD8g==;
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaQsr-00054z-0b; Wed, 04 Nov 2020 22:04:03 +0000
Received: by mail-ot1-f68.google.com with SMTP id z16so218465otq.6;
 Wed, 04 Nov 2020 14:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZS24L4Q1SnbH+3TvbhszBTqlwtEhinFPk10NBRg1yko=;
 b=TMwZsMwJViCqRnijAGlNUuD2OwImk+gLA2sZQ2WBB+VokaeXPEIx4aEoTnAR/wrcnU
 kuQk6cqiTwbyCmA6VaDRm4nh8mKGQKJSv1xFGiT27JEPiQapO0wzP9PiJpKtTUz08ylp
 f2uTiCwD7Q+DaEHWn++I1addONSaRacMRi52MtmmPkxAYoC8uiOgCa7Ierl0s4Ce1gey
 AgkuN2/3l7FZZnvtLUAsCRgEuqC6jQN9DU9hKl8hZSLRQ77AFp13ODgnXsg2ooRYOoVc
 itvZyh3jyss4oWZmVTV6JdMccig0Ujcb1okJ632V+wDf3vsGsh054o/0amMlTb02FKdh
 8wmQ==
X-Gm-Message-State: AOAM531vzqqUd6+EnFkux5bhBlhBgy8yIR52Rzc+9mZlaZG1scR6NCPD
 qYC6AhRs38H63yuZxum5AQ==
X-Google-Smtp-Source: ABdhPJxokC+UXU6bqZgFYIN4rSC5flEX4qMFtuP75+FBYUPFzTsiqnMj/DLbjQAzJoJPttM5dr3PwQ==
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr10255726oth.251.1604527435398; 
 Wed, 04 Nov 2020 14:03:55 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k15sm785105oor.11.2020.11.04.14.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:03:54 -0800 (PST)
Received: (nullmailer pid 7602 invoked by uid 1000);
 Wed, 04 Nov 2020 22:03:54 -0000
Date: Wed, 4 Nov 2020 16:03:54 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v4 10/16] dt-bindings: power: Add MT8183 power domains
Message-ID: <20201104220354.GA7572@bogus>
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
 <20201030113622.201188-11-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030113622.201188-11-enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_220401_317022_4166E183 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: drinkcat@chromium.org, Matthias Brugger <mbrugger@suse.com>,
 weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 30 Oct 2020 12:36:16 +0100, Enric Balletbo i Serra wrote:
> Add power domains dt-bindings for MT8183.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  .../power/mediatek,power-controller.yaml      |  2 ++
>  include/dt-bindings/power/mt8183-power.h      | 26 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8183-power.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
