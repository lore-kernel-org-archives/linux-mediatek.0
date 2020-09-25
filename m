Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE6EC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:12:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8371E206C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EPlpJesl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8371E206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q3liyKw9d+oppFV8AEhUgb0e+IMr2DmDRbb23nQnv3s=; b=EPlpJesltU01wFSHJdXKEbv51
	BXBvlKXgz3HqVHhZn0yYhaDgoB/AWdh8jnaEUDe1qQIHJK+ho7HmzNOBp5OsSOdnyx/ES9dfa4jzr
	367Ypa3C3dpbEKa8LadpZdcCrYuzD/WxuLjY09y+lXezqqIXIB3XGd5s3IiDUp8B6aVBsfhfyqpSU
	8D/P4UE4Gamvln8+lUTLlXFPRj5B2ZTrVOVDPlaPX6eZszm3OgyC6Wpv0yRv6AsIvlfGtJgOPhcun
	CU+qHwLGEaGiLEssnY2+f7dJR53gWGFRLFzh2ZfT5bdVvpIo9wCfQnZy54Ngohx047SUa24aNz2dP
	wTkKcviJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjm4-0001Eh-2K; Fri, 25 Sep 2020 09:12:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjlo-00017S-EA; Fri, 25 Sep 2020 09:12:04 +0000
Received: from gaia (unknown [31.124.44.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C315206B5;
 Fri, 25 Sep 2020 09:11:58 +0000 (UTC)
Date: Fri, 25 Sep 2020 10:11:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Phil Chang <phil.chang@mediatek.com>
Subject: Re: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Message-ID: <20200925091154.GA4846@gaia>
References: <20200916133324.6280-1-phil.chang@mediatek.com>
 <20200924141514.23930-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924141514.23930-1-phil.chang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_051200_646409_C3EB5217 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: YJ Chiang <yj.chiang@mediatek.com>, Alix Wu <alix.wu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2020 at 10:15:14PM +0800, Phil Chang wrote:
> Actually, In a embedded system with 3GB memory, the memory bus width is not the same among the 3GB.
> (The first 2GB is 48-bit wide, and the latter 1GB is 16-bit wide.)

So I guess that's the data bus width. Devices can still access the whole
memory, though at different throughputs.

Does this narrow data bus apply only to devices or the CPUs are affected
as well?

> For memory throughput reason of hardware IPs, we need allocate memory from the first 2GB for
> the hardware IPs. And that is why we setup the first 2GB as DMA_ZONE, and use GFP_DMA to allocate
> memory from the range.

If it's only a throughput problem, it looks to me more like a NUMA
configuration. I think you can add the first 2GB and the last GB in
separate nodes and define a "numa-node-id" property per device in DT.

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
