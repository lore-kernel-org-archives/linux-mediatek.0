Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1153CCE8343
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7ReMPjy5eqBkB9PSQ5OUoGAyg1TfT/j3P+zC886qG4=; b=IjdK01ABH66KQ02uE0GYB1IFl1
	aoFJepwc5a3E0tZ/wYQiqEnGOgcK6vIh4S30IkdfYHEY55kGg1le+io2qL1r6q18y3ntx/ydrvX2U
	2GGZhZQEGnPV6PMCME3dI+A9sIyhQQf//c0hRWuEuAN8MU3FOPjF2hzNBfoTwvHez0z/q0RsXMwhj
	eWyWbbzat4bJEmqIwWnH6aUEdi8BbvJrJeKd9VTriR2bO9EhRLPQQ3Lmfhbe24At70KSjTwwLfX23
	ycvqLBwsxb2Sak/E96pp3cJWlP4bz2O6xReZuBILeQWCrpcrAN8xLSbmQXx0+kj2rKON/GLmppcAG
	icFAUsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svG9l-0000000HDE3-3Bqy;
	Mon, 30 Sep 2024 13:09:43 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFQz-0000000H1fw-3DYN;
	Mon, 30 Sep 2024 12:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727699006; x=1759235006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5HBufJuRJTDINVJL3z3VzyjHtxL6XF6TxE9WdkMmSDg=;
  b=iAySZofyHsfbh8q9HbAdBAHQnrT7dQadBZ46ggnpeKm67i5RR6+FbkPk
   YHQciej+WyLJmTZ19uSmDXKcHNMKdUt0CQbR4hGnj6vsI6pzLY0Pg7EFE
   B0A+cC0Q8AjKSWmmYPSAnKgEjUqn59bffN3Qi+QNT4Pv8pqwUOEX+linu
   GQs3Bf3TQ1UUqmyoiQkRMHx60rb00Ws5cK64XQvP/Sb//9xEEUIYuL1wQ
   J62X93IFwAuKU0EoqCUvRnZgw8aJWaZjw/P6okJhpqSfGmlx3dgfhq2Vl
   JtMrFlWfwnQTXo6GzBXQ3q55Yu9iqzWzzENOBpMfCKwwVjo1GowjTK+Df
   g==;
X-CSE-ConnectionGUID: 5PxvBMcISsG/z+/b49qtew==
X-CSE-MsgGUID: LH4G7UHuS327FllkyHz1hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26291154"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26291154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 05:23:20 -0700
X-CSE-ConnectionGUID: V4CLIAaHTQmIyGv8yg9AMg==
X-CSE-MsgGUID: mSvxM4cjQsu5QZ2YIvlypg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="78039157"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 05:23:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svFQo-0000000Eeg1-0fVl;
	Mon, 30 Sep 2024 15:23:14 +0300
Date: Mon, 30 Sep 2024 15:23:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] serial: 8250: Fix typos in comments across various
 files
Message-ID: <ZvqYMV9s41DyVOnK@smile.fi.intel.com>
References: <20240929100931.530620-1-yujiaoliang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929100931.530620-1-yujiaoliang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_052325_839267_59A3593C 
X-CRM114-Status: UNSURE (   8.43  )
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

On Sun, Sep 29, 2024 at 06:09:31PM +0800, Yu Jiaoliang wrote:
> This patch fixes several typos in the comments within the tty/8250
> directory to improve readability and code documentation.
> 
> Detected using codespell.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



