Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BE1C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 10:20:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51BC221F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 10:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C51BC221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9+F2ZisUxjAKiTsdd6Kv0kwPFqDNC9qphuvObDs0DNg=; b=c/xpMo+iDPluL35a4xgrob1Ig
	DDx10EJiJBdT8a8kslDv9r/eZKoG3Gfv7eu9EZ2s3/yVSmzmDxJJMrfX6upRlsoaJ8PAols2iwCkt
	z/Ss8PuTvZtwthkU0A+lzlNJ27gWDvu81Iw5zSW6s1dGXWKENB7FOCn6VJpBxumQjFizPq5HHIRo9
	ZSbdo9VsTAytns8HfoWWb739JkzKTErrc4ZGRbo/9Q4SagqzEqyd/WAxbSgRIX9PwO47i/kNz2Rvl
	19NrVaHX7sNDUEiFnCX48pHXUdpIbp8Gy1a4St1YpX5QyLE7s5rZhAdvcvAJFdGkNkQg7fz/WvvoU
	VKd441DyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2X41-00035X-NB; Thu, 21 Jan 2021 10:19:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2X3w-00033H-13; Thu, 21 Jan 2021 10:19:37 +0000
X-UUID: 886cdf4a701d48d1a1753d6f6ffed373-20210121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AOsDJALpi9b496LtnQHVB5k1qDm8SBMFm1Bv0iE5gpc=; 
 b=Wcm6SUPV4E/dGI+SJFHEHzZnT/8QCYxAP+ngsDhQwZzLey8dje0YXrk4rTFtdgHbzpq6YTXqR3OD2GHd1DUbgoQk4WT0wugNphqXTehVeU6i5PdsSAxwxoMBMxeur8FkgEdp7f32XOXMrW1vZNdjgjKlcBUtq6S661kDdaeg988=;
X-UUID: 886cdf4a701d48d1a1753d6f6ffed373-20210121
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2129335116; Thu, 21 Jan 2021 02:19:31 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 02:19:30 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 18:19:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Jan 2021 18:19:28 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <lecopzer@gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
Date: Thu, 21 Jan 2021 18:19:18 +0800
Message-ID: <20210121101918.11423-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
References: <20210109103252.812517-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_051936_828133_33B45ED6 
X-CRM114-Status: UNSURE (   6.98  )
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
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, will@kernel.org, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com, dvyukov@google.com,
 aryabinin@virtuozzo.com, linux@roeck-us.net, andreyknvl@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 gustavoars@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear reviewers and maintainers,


Could we have chance to upstream this in 5.12-rc?

So if these patches have any problem I can fix as soon as possible before
next -rc comming.


thanks!

BRs,
Lecopzer
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
