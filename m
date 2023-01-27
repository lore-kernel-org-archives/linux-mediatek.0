Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A62C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woil+12cCxDARYtqm0G3bhtuIiQv4RbF3SsedckFqcc=; b=PqLckTZoS3SrUPSdrHX7tkjpSr
	y08tVgTsa3A3IfiWFF6UET6hNVtq+nxQ5giRGGhjAfND/CPFhokNr1EWmQCD9d0fvt5E7J5GtRCqF
	K4SQz3tRHanx2DjOAv5egBTEP+Gn4qE+fLaDBE8yQHNZaq1cGqkxlQ+S1JJPBcpmSeDtxQWGLglcW
	rrhHitKaPTZ8VLySX/qlNRhjPnpFJLZgPMVWbmO0/sPT5kFdce1qBgzzpamJt3hxMebAO126ZC8JS
	EAHccTtAAIVtxF4i9ha7tfZ3LOu0VDJeawigwnJFb33yKsDrsHW6+X588fbkMazedLT/vpFv8pHfg
	TclpfV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMA1-00Dyei-Nz; Fri, 27 Jan 2023 10:40:45 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLM9j-00DyWz-Hl; Fri, 27 Jan 2023 10:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674816027; x=1706352027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCLUqHrcYs/NeE2BNqrGmzOjvERZA/RdL1uGV47JSSE=;
  b=jrj3YbUzar2RtFakPdhDVW0Gdx5b47B592VZIXlav4+m9msIftrX6rZw
   srAWc4x+8/5hHTIHbo3L+KbprxFNRbdWS5QTAKTwXs/XAJfSFkB4xTZGd
   nBuxLx0DAGsmb4RRwE0TK1dJX1GLiDT0/fL9ZeUzEupU7iXKDbgizoeL0
   yESk905vzEVhiUmgLgSfjXNQJpViDa96lXmpHQKJ3da6sIhL1KiFKMQM5
   UswTGNfcN0mHv8L23ZwJ78LvFytXIOjQfu8eb9mritEfJmCKtCqqttmyk
   bClnymepehjH03znP3P1f+SaTcmqaUe8KhGpyXAG8Jm+WJEsJvtqAyt71
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="306711291"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="306711291"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 02:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="613137946"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="613137946"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 27 Jan 2023 02:40:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pLM9Y-00Fv1Z-1p;
	Fri, 27 Jan 2023 12:40:16 +0200
Date: Fri, 27 Jan 2023 12:40:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: ChiaEn Wu <chiaen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz,
	matthias.bgg@gmail.com, peterwu.pub@gmail.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>
Subject: Re: [PATCH v16 1/2] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
Message-ID: <Y9OqEC4A/PT2H83s@smile.fi.intel.com>
References: <cover.1673886245.git.chiaen_wu@richtek.com>
 <1c4cf50600bb0334bd03027f49d7511b394c6ced.1673886245.git.chiaen_wu@richtek.com>
 <Y9OlmCZ+7NpKztee@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9OlmCZ+7NpKztee@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_024027_739621_C472AFE6 
X-CRM114-Status: UNSURE (   9.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 27, 2023 at 10:21:12AM +0000, Lee Jones wrote:
> On Tue, 17 Jan 2023, ChiaEn Wu wrote:

> I see that you guys have been super helpful reviewing this in the past.
>
> Have your queries now been addressed?

As per previous answer, not anything visible right now.

-- 
With Best Regards,
Andy Shevchenko



