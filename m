Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85EDC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXAiAnqx717bRGeonWAKeaViFKaciCGQVW+5Eh1jhN8=; b=msB38Lu0zf0zDFHQ1bPZ4akSKX
	khPyVwWI7cvsG03TXXDvocQhOnQPZ0oSpjGsUWpDHp8VriA5Ye5sVc4nW0JgkgTT8nkrzruvHE2HL
	fE2ymjPbzMgotyXbSGwGCnOGw5D6hLqkReYEUgSvPc8AWZWorrTq1J3qgLG5IhH/f2jjbBbCbnQ8t
	wX69PazXpLQCwqKe2iEyz28bK3VQ28mnqtuWUQQ/AHT+EIAWsJeI4xPXG9bi8XR7zcE2551aGZ2Rk
	ijj6DnFvlR08MQx7rXCloO/hJU7ANXYmbWyiS8FvDTw2QupnPOe6DdiMZYO8wGUcXatOfeOLoOVUC
	32T8RJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLM94-00DyFY-3x; Fri, 27 Jan 2023 10:39:46 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLM8q-00DyAt-6q; Fri, 27 Jan 2023 10:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674815972; x=1706351972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AsZgpenLAU9xjhKqfjBX9R9XKFqTNtiIBho92RvLtSk=;
  b=UjuXgAqVQlvKQu4C6ZUhQ6BGC0QBVxjjadiyUp2leXAbohDRjoF4Wkgh
   2BfD74hEAOijnvfH/Lt4qdiYsHGkuMpcTXpM1MPZz9u++tkVDnV8qK2SN
   mM3Qusg46T1dvZqSRwyRxtZFRVioRnlrs3vI2D1N4vJe+fK1oovnXQxND
   CGHq3zrqBoaj5XF/Wr6+JpeYROH9a24AaJHWyXYErvLGR2kICSeTf3Hjm
   Hx1+VPivaCqgRCHiMoUPVecDRSo1n4FI22qyOEXZFReqcfLJqsD3B5imH
   fUPTPp29YWxv0KE5r2D4WMthEtYujyUop6cC4/JdWqB3Tx++zwks1+oc3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="315014118"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="315014118"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 02:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805757993"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="805757993"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2023 02:39:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pLM8j-00Fv0N-0c;
	Fri, 27 Jan 2023 12:39:25 +0200
Date: Fri, 27 Jan 2023 12:39:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: ChiaEn Wu <chiaen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz,
	matthias.bgg@gmail.com, peterwu.pub@gmail.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>
Subject: Re: [PATCH v16 2/2] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <Y9Op3A746oHhgAxc@smile.fi.intel.com>
References: <cover.1673886245.git.chiaen_wu@richtek.com>
 <7a6ac0051789831a7a53c2f3b66010fc0f1e5395.1673886245.git.chiaen_wu@richtek.com>
 <Y9OlXOJ31SUDNtPN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9OlXOJ31SUDNtPN@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_023932_318137_F140CA96 
X-CRM114-Status: GOOD (  12.64  )
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

On Fri, Jan 27, 2023 at 10:20:12AM +0000, Lee Jones wrote:
> On Tue, 17 Jan 2023, ChiaEn Wu wrote:

> I see that you guys have been super helpful reviewing this in the past.
> 
> Have your queries now been addressed?

I do not see any obvious issues that makes me suffer, if anything left
it can be addressed in the followups.

-- 
With Best Regards,
Andy Shevchenko



