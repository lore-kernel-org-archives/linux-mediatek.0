Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6EEC433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 17:41:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6C96197B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 17:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B6C96197B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r0VbHYSB/dGQvMwroBWXVUvGvnsJL7UJgokJ+bdizfs=; b=P5W6Mlqcf++WRw053/ysyOwAt
	POQ2aDcWNvVCLPfF0691Fy11Y1I6ue1j/y6p+87g7T/OwcX227LihyYmO+cp1Js3uC4eAATnlELwA
	jFFUv5AG9k/02KVDzZKKBYpZ9Q0Zt8Ndwm1DZ9tHHyqP5bYwnjiqRyjJjKTuy6xcKgFnJVCzOgYhu
	KKrQrYg51Hy045F+7r1c2K/Z52+iWT6FEG/eSikwhInWBEuHcR1oybexXaIoG/nu9lIfTy+I4wIXs
	5xL9Po6wjEdirlNMCQEgVMxSywRuxolToq9/tkXpfdIFih5JmdwLpWMPGaZSqkiAN4fTUZoO1CSi7
	MSkzRJhGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNJ7q-007rxR-CM; Fri, 19 Mar 2021 17:41:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNJ7b-007rtj-Tj; Fri, 19 Mar 2021 17:41:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8E2661925;
 Fri, 19 Mar 2021 17:41:10 +0000 (UTC)
Date: Fri, 19 Mar 2021 17:41:08 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org, dan.j.williams@intel.com, aryabinin@virtuozzo.com,
 glider@google.com, dvyukov@google.com, akpm@linux-foundation.org,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com,
 ardb@kernel.org, andreyknvl@google.com, broonie@kernel.org,
 linux@roeck-us.net, rppt@kernel.org, tyhicks@linux.microsoft.com,
 robin.murphy@arm.com, vincenzo.frascino@arm.com,
 gustavoars@kernel.org, lecopzer@gmail.com
Subject: Re: [PATCH v3 0/5] arm64: kasan: support CONFIG_KASAN_VMALLOC
Message-ID: <20210319174108.GD6832@arm.com>
References: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_174116_168599_89CAE7AD 
X-CRM114-Status: UNSURE (   9.36  )
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

Hi Lecopzer,

On Sat, Feb 06, 2021 at 04:35:47PM +0800, Lecopzer Chen wrote:
> Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> ("kasan: support backing vmalloc space with real shadow memory")
> 
> Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> by not to populate the vmalloc area except for kimg address.

Do you plan an update to a newer kernel like 5.12-rc3?

> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Acked-by: Andrey Konovalov <andreyknvl@google.com>
> Tested-by: Andrey Konovalov <andreyknvl@google.com>
> Tested-by: Ard Biesheuvel <ardb@kernel.org>

You could move these to individual patches rather than the cover letter,
assuming that they still stand after the changes you've made. Also note
that Andrey K no longer has the @google.com email address if you cc him
on future patches (replace it with @gmail.com).

Thanks.

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
