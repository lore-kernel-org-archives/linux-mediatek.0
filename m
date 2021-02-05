Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A19C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:02:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9067964ECA
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9067964ECA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y9zPU8KfHtnghUjXv9vyj744IZEvc5NOodx4onmpFG0=; b=sTzsAuUtJ+Bm9v7H/9yAGweOS
	FA2AptvRXJe/GL6NsQz+V7dhH1Zx4jtmWg7PbDNDdea2qPSYK5UdZsNV+L3iV4x1B8sD9e8PDCVX+
	XsKG/Jsod03jMbyjE6obVJoTwttLYARblG++YfryB+cWIGLmzVXVnFRbCNlL2ofYX+J43ACOF/cMX
	D54HOwv60FRFt7KIF/mIkAMJwKywu0DZ+FQOQwK7qQGmmhifa7VPkupuGtKjZ8CykS8FsUZd2Km46
	3PSuBLkfkkjderMOGasW5nOBttdMq+UWRoWaI7SkLj3j1hnmSUDUGhqihBdQzlLI+Zjlq88uwmRaD
	cj912neew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l84V1-0002IR-DF; Fri, 05 Feb 2021 17:02:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l84Uw-0002Gu-RE; Fri, 05 Feb 2021 17:02:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F82864E37;
 Fri,  5 Feb 2021 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612544542;
 bh=mRLXcHycpqWz6RYXFguofgmcLIjLH8pb28gtXmfiZCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k3+Grm3Ba3qTErfUpaE6Q8Mj3x1WEQphDRx2WaMnWgsPGoHn66f5fmN/2yqCKCsyZ
 a6ZXinFwLp4coumI+IkweP08nYIKGzcpqmUZA/mvhs4zdon4YYGVqWCvF+j6PuTGsL
 9ONDjwilxLCBTJs1Y3FLFgMrgmsxOnP8ASrytGgeIyXan3XiS6S1YhOZnwMIeBCORN
 4oDGC85tMQ9dpqU6hVyZBxJ2BF7v0B/D+uhF1DxcIEZ2IgR1RPLSw/CudTRRkz7p+n
 0t5SB3l4MoLf+qoQRZg9+r4EcNpnXtjnAOAx1TeoiUbl2hBwFNrmJBD9ik0eC2eBlr
 ghaON+vxn2m9Q==
Date: Fri, 5 Feb 2021 17:02:14 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: kasan: abstract _text and _end to
 KERNEL_START/END
Message-ID: <20210205170214.GD22665@willie-the-truck>
References: <20210204124658.GB20468@willie-the-truck>
 <20210204145127.75856-1-lecopzer@gmail.com>
 <20210204145547.GD20815@willie-the-truck>
 <CANr2M1-=ONun5fLNoODftmfcuWw49hj9yXsrxkqrfCEtELX1hw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANr2M1-=ONun5fLNoODftmfcuWw49hj9yXsrxkqrfCEtELX1hw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_120222_976443_EA2D6F67 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: Jian-Lin Chen <lecopzer.chen@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 tyhicks@linux.microsoft.com, Alexander Potapenko <glider@google.com>,
 vincenzo.frascino@arm.com, ardb@kernel.org, yj.chiang@mediatek.com,
 kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>,
 aryabinin@virtuozzo.com, linux@roeck-us.net,
 Andrey Konovalov <andreyknvl@google.com>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, dan.j.williams@intel.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, gustavoars@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 05, 2021 at 12:06:10AM +0800, Lecopzer Chen wrote:
> I think it would be better to leave this for you since I'm not
> familiar with the relationship
> between vmemmap() and NUMA_NO_NODE.
> 
> So I would just keep this patch in next version, is this fine with you?

Yes, ok.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
