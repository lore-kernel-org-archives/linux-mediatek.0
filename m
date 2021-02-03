Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C038DC433E6
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 12:38:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722B964F87
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 12:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 722B964F87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vk/dLOfbv93YN0VeGqEgxMNZrtSM+Ts+c8peI3APxSc=; b=l1R8wa2bsUsdDRJRXRnFXiGLV
	VakZU4/tlWB/IELPaeSBfYFv0c8iRYS0uibHnHV2RRkMLH7KekIPf1GFSbvA2CIB4PQgub1GhjW2S
	/kjhteIPqrieIhDyDLeaTIK4MgKdAp3VrIii1T4Jca5jWHziRbHCIf0txWBkQcae16wQbvCOqbunC
	WjTDopxiXxYJAjVfxs91f5aTy7kah3J4UAI67Rg7xpXzRWh2zk2rUKhkV7tnZsDMeLHon0w75foqm
	InuHlcLtf2cWWeDOmzdBz10oyEwYuU6MqY+vak1kpypp6cb2e8lIzUvi9k8Y3lHBQUewtnpWMfqhK
	/7Ca8tL+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HQf-0002cG-CN; Wed, 03 Feb 2021 12:38:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HQZ-0002aO-Ey; Wed, 03 Feb 2021 12:38:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC7C713D5;
 Wed,  3 Feb 2021 04:38:34 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.11.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 211C93F73B;
 Wed,  3 Feb 2021 04:38:31 -0800 (PST)
Date: Wed, 3 Feb 2021 12:38:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Seiya Wang <seiya.wang@mediatek.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/2] Add support for ARM Cortex-A78 PMU
Message-ID: <20210203123828.GF55896@C02TD0UTHF1T.local>
References: <20210203055348.4935-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203055348.4935-1-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_073835_580643_017529D7 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 01:53:46PM +0800, Seiya Wang wrote:
> 
> Add support for ARM Cortex-A78 PMU since it will be used in
> new Mediatek SoC.
> 
> Based on v5.11-rc6
> 
> Change in v2:
> Remove change-id in commit message
> 
> Seiya Wang (2):
>   arm64: perf: add support for Cortex-A78
>   dt-bindings: arm: add Cortex-A78 binding

Both patches look good to me:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Will, I assume you'll pick this up.

Mark

> 
>  Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
>  arch/arm64/kernel/perf_event.c                 | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> --
> 2.14.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
