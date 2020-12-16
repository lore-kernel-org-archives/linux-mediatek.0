Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23058C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 15:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB6D23104
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 15:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB6D23104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7qA45umOXquvd0JdgRetjLadfpNTFNAosvl8SQtvMOA=; b=nFgQKNNFJZTEjOPUEI7JPRt3G
	C/WaB7mHzqU0pSNDps1Ha9CopZThc+2rj1zI9/nIQP7xdnnVUuIFwX6xSi35Q9p0jgtfWsaJ6Qp73
	b2wKpl24o5t7Y3LZtsk6ou2CLJAmDkefQHCwnTBNlBZ2mh7k1fcSGWA0vt/79pTlBkelPI6bD0ZJA
	bNNCJBVjHBQyuBVqBLjw7fgzgWCVGrBxh7EsfHFf2aaeykLNGjsSjoyzVnPlYzPGatGAg5UVTl7wU
	axqoZlECUM3b7ljmQUhUdhV1AIGjeXm5Y9Y2qccYM68cQTbhl3NRI0Dnp6IKGrzZZ4BA08DtmXwgR
	il80d1okg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpZC9-0006JW-OV; Wed, 16 Dec 2020 15:58:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpZC5-0006Ib-PS; Wed, 16 Dec 2020 15:58:26 +0000
Date: Wed, 16 Dec 2020 15:58:20 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: Re: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Message-ID: <20201216155820.GH2511@gaia>
References: <20201125103637.GC70906@C02TD0UTHF1T.local>
 <20201125114130.507-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125114130.507-1-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_105825_991293_8039AA39 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: mark.rutland@arm.com, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 07:41:30PM +0800, Lecopzer Chen wrote:
> >> In order to select CONFIG_APM_EMULATION, make SYS_SUPPORTS_APM_EMULATION
> >> default is y if ACPI isn't configured.
> >
> >I'm a bit confused why this should be enabled for !ACPI. Which DT
> >platforms need this, and how do they use it? Why should this only be
> >enabled for kernels without ACPI support, and not for kernels that
> >support both ACPI and DT?
> 
> In our internal patch has no !ACPI here,
> the reason I add here is that in kernel document[1] it mention:
> > No, sorry, you cannot have both ACPI and APM enabled and running at once.
> Thus, I try to limit the scope for who don't use the ACPI because I'm not sure
> they could exist at the same time or not.
> 
> But I think it should be fine without !ACPI if APM and APCI
> config won't conflict with each other.
> 
> So if it's better to remove !ACPI I'll send v2 for this.
> 
> BTW, The platform is for our internal kernel drivers, they utilize APM interface,
> /dev/apm_bios to do their works in arm64.

Sorry, I don't think the APM interface makes sense on an arm64 kernel
(and it's also used by an out of tree driver).

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
