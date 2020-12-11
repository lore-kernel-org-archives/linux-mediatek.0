Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C037C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 02:53:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEBDE23E51
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 02:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEBDE23E51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gvBDcG1elaBb2bZ3xUH2mco0STnBaJmRdmLKaJpcRNo=; b=Wdrz9Mh6Y0GDnLP2fgsdNVjkD
	AERoxn+S0B7evzib3YqEjxaerwesQIF506pSWU0AYn3UfNJADdrXrIUkjVIJK2XhgGekabxpfUhlP
	ooNz4bcLGPOzwTiZvwMYGB4OGdnFMkgkJwaIqqJk2e0MeYIEIQoKZEH6TNUbenlyZTpiheowB6hFJ
	0hqoWu+rejfx9QncmneUybc5hGW6nZAr5OXVsBb415mepUCPNrixQia00G8IFGiVkiAOhbZrIrtc3
	JyOXQO0M7LyeW0H2RrWcyXv/acwtKywHwAEgLvmkcU2U59jIJ84uUTT02SIO71Ne0m4inlUZUm6jb
	C/XEEwIQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knYY6-0008MQ-RW; Fri, 11 Dec 2020 02:52:50 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knYY2-0008Lc-MY; Fri, 11 Dec 2020 02:52:48 +0000
Received: by mail-ot1-f68.google.com with SMTP id f16so6975721otl.11;
 Thu, 10 Dec 2020 18:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u730lB6v0y2irZRjPgn18dAMkQ87hO91KDEoZMKd5FM=;
 b=bSk0TcM1yDXwsPAx6CKVFnk2mxbfv4lmsmKVaqlBEH5pVDI9uDU9B+d1iqSz2FMj1s
 K6H9vYJmA+0++GOPuxVkZcx2cfAurPCbVFjZ10emKO/pJLFG09e8W5c2Auhde8wGHr0z
 CcGijbNg72Td1errXBIDvYfwgDHjowDW2KWTwCh5eCrGxxnFKKGJdW6SvURZ/8bIYcsz
 seVcl26E3COyhb3pDJQmOzZVXUdUCFZw9DROWLRs1qReCijiWrlbNTlMd5oThmLb2fhW
 r8NxzbJs5vYBD1/m5M2jLUFE6Vh62Ls6qA09gPfgN06us/+yyfzRjDgovAFMbFMQ+ca9
 oa1g==
X-Gm-Message-State: AOAM532uRu1mRVCR5zltHYKsDsj/qyPY17UpzUeP9G7/ydI5MZ87m4e4
 mP6FXvCWEEThdzUAXnsYxw==
X-Google-Smtp-Source: ABdhPJyQrHbhg+o5ePEtwFe/gxJay541KZcQ7oM/4+PltW0Q7qTn20f08qBYHe84hCLamudqakGgCg==
X-Received: by 2002:a05:6830:240d:: with SMTP id
 j13mr8344090ots.319.1607655164861; 
 Thu, 10 Dec 2020 18:52:44 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y84sm1570664oig.36.2020.12.10.18.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 18:52:43 -0800 (PST)
Received: (nullmailer pid 3524654 invoked by uid 1000);
 Fri, 11 Dec 2020 02:52:42 -0000
Date: Thu, 10 Dec 2020 20:52:42 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v9 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20201211025242.GA3523811@robh.at.kernel.org>
References: <1607586516-6547-1-git-send-email-hector.yuan@mediatek.com>
 <1607586516-6547-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607586516-6547-3-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_215246_770707_F737FE8B 
X-CRM114-Status: GOOD (  12.43  )
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
 linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 15:48:36 +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  112 ++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml


See https://patchwork.ozlabs.org/patch/1413865

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
