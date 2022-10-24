Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1923ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InVIRT4wz14uWEEwh7HiHSLlWViaSqL2Ja35aIQ0Tog=; b=Z/EYD/O3+St5ppV27KcM4lSUBb
	GNEb8sRI+Nq4MVeKgcV0WK6OrMZ8IpKoqx+7tRd9R/Cu+80ICMoUKcMnJMRhZ13FvHLVAK/X+3El1
	j0y9WYT2semfZ8miM7mai8rtpuZXI8B1FrlxUjxoMqbE5AkX46oiMMCbDrh3YUXfnhfviCLLL6CkM
	NJG2HR6BT7VhKShhPHHybnKgydqff2ICJNoJf8spRdTR1a3XQPz1pYeR5O2vbcDQ8D5VsCiVLllJn
	8+/iamFV0Y1H8o6W1Q4feVrMzYf8NC/tKpPj43WsR4+nTSsKwSa+yyY5RM0hCrpFIDTuO+Qb6O7rG
	7cxS/VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omvrp-001AKc-IS; Mon, 24 Oct 2022 11:43:41 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omvgo-0014AY-2q; Mon, 24 Oct 2022 11:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666611138; x=1698147138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J//vhD4MqQrSeKUj+KUsipHKrzYYM8OFew0w8HAgIXg=;
  b=jTNiYHJbG0L4LLKOSDLmrJI9r/rDxEE6aPZS8Mn9quYkNAIHw1C88Zjr
   EEsKOmJd+58yiWJelkfjH4uRPHusaKwOQBeE9TWDGjTtXBNwI0oz86Obo
   gBcODe54wAnWbjZAbaSrjAVKlBMyHyumjGHilhVrvJBPFp7+CneF00KSl
   l2snt7ANby59KQoQrFmTqgMwMBjhxEM0Bdr/gErLKWePov0OCxqb31AJg
   CpymW09+9UU9RnpNaohJDxlhsutrX9T31uu2o7A7loDe0/cIE8naJ7bVc
   Mr7URbdEVMRGmg5zPaMKoK1ZxCcLgvanyo9Qtx1SgPeKqPm9w9tUkA/Kf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="290695450"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="290695450"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 04:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="756541972"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="756541972"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 24 Oct 2022 04:32:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1omvgf-001Pmz-1z;
	Mon, 24 Oct 2022 14:32:09 +0300
Date: Mon, 24 Oct 2022 14:32:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v15 0/2] Add MediaTek MT6370 PMIC support
Message-ID: <Y1Z3uWt0dnWjqzTB@smile.fi.intel.com>
References: <cover.1666636223.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666636223.git.chiaen_wu@richtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_043218_193915_837AF4A1 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, Oct 24, 2022 at 06:59:34PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> This patch series add MediaTek MT6370 PMIC support and add a index macro
> to <linear_range.h>.

Is it? Please, align the cover letter and actual code series.


-- 
With Best Regards,
Andy Shevchenko



