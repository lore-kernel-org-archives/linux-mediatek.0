Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4FCD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJxxlkmFdShZIgMQ331CHpQnPfTEo/UuWml5fuFW670=; b=kgyTpCxdtQsJvFmM4+pzIbQ+xI
	/FinkTccgsZpvcxnPUYRIcGv7hdA2m8y78RKtwIgyGNFJA/0tvNkUodlldHVZSJMjLKRsSh0/IJh8
	vHyK1t53iD45zuGCVrhjg959a0TH4Jc8zsOLoCX3rGJ77D7hFGeCrk+qxWFNFG1JmjYswKwo68XNR
	9kpIq3W16SaPuNbqVtr8DMu67IJ/A1mYLFNQPClI66/tBfWlzJ91183izW1XJkh6W+wDMxxxMs+fq
	cu6+mptMBKOZ9Oa1jf0HauRfUj+WJ2Tpw/g9k4GnLC7td+TWf3nCmOPPjaE17ew7cOzlANZayvWK6
	o4BoRWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubsQ-00000008IHq-3RMT;
	Wed, 10 Apr 2024 17:36:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubsL-00000008IFB-2lb9;
	Wed, 10 Apr 2024 17:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712770605; x=1744306605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C2Ckdhh6MShRypHTQfGnWVcfvy2wO5tJ+RrOIcXU+GE=;
  b=bFK840eoHZLQPVPHg72TJko88Kv/60R/3zlcZ1s/zXNkvcnR0HaqnX8Y
   Mql1e4rKygW5uTppPvFTMwhPJ2nv+xmTdFrkGdj7HdUZHnETqcYHImKd4
   dUU30aT30SJqzwS3OdlqMz2OwtfHckiqdYqQnvHdC2fNSiOzzGsPpAyny
   R9gFx0vfEddfE5fkaHEvkKAFBLu2Ee4yahF6cvAXXskf5FPUp3xKb284O
   5BKpkIJQfjLZ7twRy5op5OPhvFQwUZp7mJUQge741/NCp64YFyBkwxRc+
   5vAyBzvRvwrAhpjOoYeDAYk6MKvLu3kchISeuedGgpG//37gnIhFcxZY3
   A==;
X-CSE-ConnectionGUID: 7jY10PZYQyW86qJ7RsmOOg==
X-CSE-MsgGUID: wyWjDQyYS4SOAAExJNQdRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8328259"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8328259"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 10:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915438867"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="915438867"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 10:36:21 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rubru-000000038N0-3OjI;
	Wed, 10 Apr 2024 20:36:18 +0300
Date: Wed, 10 Apr 2024 20:36:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Felix Fietkau <nbd@nbd.name>, Alexander Couzens <lynxis@fe80.eu>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH wireless-next v1 1/1] wifi: mt76: mt7915: Remove unused
 of_gpio.h
Message-ID: <ZhbOEqO4BIE4q7Vv@smile.fi.intel.com>
References: <20240228200321.3607764-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228200321.3607764-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_103645_770382_7E6BDEF8 
X-CRM114-Status: UNSURE (   9.52  )
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

On Wed, Feb 28, 2024 at 10:03:21PM +0200, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.

What should be done to move this forward?

-- 
With Best Regards,
Andy Shevchenko



