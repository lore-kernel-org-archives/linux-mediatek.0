Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCF4C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:06:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 003AC6127B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 003AC6127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pmKJ4COBUKpOqo17rvnQARFyKjiiPJ7m8355nh1xkY=; b=h/PFguoNL4/F7q
	ILaQiXPnGhL0fs5aIO9ZOQuBLMzW94QqnkSC74CBDjPD5eq6T08TKCEVpney+DuoQlgDMYxjKcWdI
	NMPPi4ISHaeXFZk68q+gMdxCp0w77JkP24ef8DYndB6XCV9qTa4Ie42CdrFc7wfGGyI5SIfnYgxnS
	JfJoDMBC4bUy8599Q8u7p+cUv8qsMML0zO0Z7jFxc8zx+D9XyNhZ5tlklrQIXgoCiUfAidUUkRyqb
	/mrdU+LJnCtPYOIOdKsxwmvMoymEycFTUAmEx7vmbBmJNJzs0Zd1OMXHCPCRVq4vHsrB7/g5dYPPY
	Vk99hcHiGhuDwap53Prg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIY0X-003ehr-LU; Tue, 24 Aug 2021 15:06:33 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIY0U-003efb-63; Tue, 24 Aug 2021 15:06:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 a20-20020a0568300b9400b0051b8ca82dfcso25950957otv.3; 
 Tue, 24 Aug 2021 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=atzFJRXRbCbQFJp+Cx+oxoNlg0fdbGcCA11T+Oo8BfQ=;
 b=rcMgLQ/niWzQ63BA59QilTaas8j32JoOgGcgNT+tsSgfqFJ1WRBukFpKrazCE+Nvxb
 +FU9JyWunrSUSAp2sQuKjnhwFBmqKq4Q7BP+rfkFlDTwZcrOnDDNDJj1nyf8Dlbp3tpt
 TGH+trQWboaPiSN9SVpdSJhhMvbHVAnk/XajpFLbLlZIqeoemVHLu21RZTCwLQdh8IYA
 JifdjUAYwePcCGSuZ6KSSQrzElW3ZrUV0IQu6gNhIf0R1d0cLkIi1k6iWpaCSwvwdF5U
 Rs9cNX53+Mb3l43WYD+WSuPr3vCMR0xex1ksWDAAhlSIPGyRBXjR2mTg9WBGpd1xEl/m
 8pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=atzFJRXRbCbQFJp+Cx+oxoNlg0fdbGcCA11T+Oo8BfQ=;
 b=DeXuwgmXNOftuWyUOuADNa4i8KPSSYSsTvJ62hj9DItAgZSoqFF0p/jI6qU64pQNrQ
 gHgT1wx17Dd7TSdga8p8i13snv4zwDF/48b2OoffeBpjwmFZxQIMJnZd0hTnkAzRmd2/
 96UBXnyem0SOa8ggM5LbGs5JPmM2/V/FsdaDcXrW9Bv+F9JIkZvN6rFXU6tLKhhscjbp
 6UIDlSSkCQVcNg8MMAHZQCKNXy8mVvh8zsTiJUfwQE7EKIPQUqS+LeWUjThwM+WemR2z
 HV9xNekjKUi/hx8IB/ffYlWLujhKrVvpRNjEy/HwjWuTIzsjJBPMt9f9tbLHTzEdozUt
 LBSg==
X-Gm-Message-State: AOAM530mth90z9AuSxZEccVYLV28ooPLyW8wukCIcPiEjXUN7Blmde94
 3Vi+PZVBP+UDhsYQ9r8o2T0=
X-Google-Smtp-Source: ABdhPJwT1EFS3KoLFxituJ+ofchSqtIKpCCv/eOETdOlQdsZA4Hkq0g2vsZi1mRcstTmhpJpqAvYvQ==
X-Received: by 2002:a05:6808:208b:: with SMTP id
 s11mr3085370oiw.95.1629817579204; 
 Tue, 24 Aug 2021 08:06:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a15sm4569159otq.13.2021.08.24.08.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 08:06:18 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:06:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 seiya.wang@mediatek.com
Subject: Re: [RESEND v8,0/2] watchdog: mt8195: add wdt support
Message-ID: <20210824150617.GA3394785@roeck-us.net>
References: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_080630_272564_B44067E5 
X-CRM114-Status: UNSURE (   7.79  )
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

Hi,

On Tue, Aug 24, 2021 at 02:26:32PM +0800, Christine Zhu wrote:
> Supports MT8195 watchdog device. Supports MT8195 watchdog reset-controller feature.
> 

The series is already queued in my watchdog-next branch; no need to resend.
We'll have to wait for Wim to pick it up from there.

Thanks,
Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
