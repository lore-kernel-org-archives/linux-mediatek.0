Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0219FC77B7C
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 May 2023 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZjhU8K9yNscHwfFIedpFnb9T5NjtGy9r4a8tOJPjGs=; b=y4q+tsoAz17qB4sUhqon8Ci8O/
	KSWWbSNK8e3b/onVTWphO1ZGfn64i1nCxE3y+PZRPRSaShmdP7oFH3Hvhiasv8jTMTd87LVlNR9Hh
	helHE8pBsYD4JoOLqvd08c9ymmO0uu0tP3DAD2WKAh8mWEsC4lvBxJ3rWcYKZiE0GlQMWYWy2hCuE
	s3H/D5X4BzR2edh9cOjiG6FHx5EcbZupT8S2YO/xIETmdBebxjJDUr7t5hhC2d5T0QpJyGZmLq6WA
	owj/93LOdP5hMPa1pCmGAMxhRkhfMGhhauGPGLo0Hdjm/RTr29trTkjEvMBhMZtJDHlkeRp4Ut8hU
	RE+mAdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvhwK-00GSkl-24;
	Sun, 07 May 2023 17:12:52 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvhwH-00GSj6-04;
	Sun, 07 May 2023 17:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683479568; x=1715015568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xadsDlIqSLYDH8jAUQJ+rU/bh9AyzgsU04VnNDkPNZk=;
  b=IKAWd3Fp31vlJuqD6yDVmzdGqUESzY3c1duD3FHg168NNBO7DJbytM3j
   6d3e4Z9pyQuCzfADyQmy5J1uhj/i0LKL0YzJtMrGvr4LK4jAMLXbGrY9v
   MTx5g3VqkHXA3LDa01KUnQyM/4jv/0kCh28UUnfNOacH9PBDfrkh7DVwc
   qo+tAaH94X90OHCQ2vl8Y+xt6sQIRPR5IwT5vA1HtuBoMVWWYUg7WvL0p
   8V6BLxFftWa/hfyy5HvilKsyUbYdTDiVbrZoMfn7iqaR11fRT+4YMRamO
   bpbhOZeZarUbx4r9VQTLMQ550MoAQN6eDdefywuD8PyzvvBdd+/qqGfzO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="333933236"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="333933236"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 10:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842466547"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="842466547"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 10:12:37 -0700
Date: Sun, 7 May 2023 10:12:29 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Ian Rogers <irogers@google.com>, ravi.v.shankar@intel.com,
	ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>,
	Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	kgdb-bugreport@lists.sourceforge.net, Marc Zyngier <maz@kernel.org>,
	linux-perf-users@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Masayoshi Mizuma <msys.mizuma@gmail.com>,
	Will Deacon <will@kernel.org>, ito-yuichi@fujitsu.com,
	Sumit Garg <sumit.garg@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Colin Cross <ccross@android.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	Alexander Potapenko <glider@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ingo Molnar <mingo@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Liam Howlett <liam.howlett@oracle.com>,
	Marco Elver <elver@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] hardlockup: detect hard lockups using secondary (buddy)
 cpus
Message-ID: <ZFfb/bTi22RQwaol@tassilo>
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CAP-5=fUB1e=bJk-w0i8+MEo4sLOZtb_Eb7FMy4u7ky7D2AZm6A@mail.gmail.com>
 <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_101249_153775_B070A3F8 
X-CRM114-Status: GOOD (  17.12  )
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


On Mon, Apr 24, 2023 at 08:23:59AM -0700, Doug Anderson wrote:
> HPET system seems to have a single CPU in charge of processing the
> main NMI and then that single CPU is in charge of checking all the
> others. If that single CPU goes out to lunch then the system couldn't
> detect hard lockups.
> 
> In any case, I'm happy to let others debate about the HPET system. For
> now, I'll take my action items to be:

We don't really seem to make any progress on the HPET series, so even
if it is better in some way a series that is never merged is always
worse than one that is.

My experience is that cases where everything locks up are very rare.
I suspect as long as we cover the garden variety single CPU lockup case well
it is likely very diminishing returns to handle more complex cases. So whatever
gets the job done is fine.

Yes freeing the Perfmon resources is big advantage of either.

-Andi


