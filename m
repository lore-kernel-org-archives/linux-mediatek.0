Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB9FF94CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YmcdH9TeS4iHIQpL6nm2uKvZy95sP2Buc+DUEPYpuI=; b=0ewRYNAx7zQj+pRcdUZjdKReeG
	rzR2XPSQZRBYtju3GQukK9z6kISzBls2bJkrsf2OSCyp9inukEJYhCqIgi9opdGCe4UPsA2Jt6DuI
	R9YVZB/CPaIg9op90o7KgK5t7i2tlsc3AD/k7dH4OCYNQ6iFcbriYDGqQmpQmfI9ozozdOEbKYUDs
	Bo/E1bvatR79EZ2ajr6BpEp3omGXXmA3Gyd1bdOcMUVQKRKC1ypizUP3qBi8SnopQHYsbitHTazzE
	FGUxMFUsw8hYIGpeC+DJYSu2EozG2/xXgf1cNhgFA3AczpagRn8qWMAslIjlZ7eMmb+6Mrsv/9dtU
	qAlciQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRRe-00000009gTj-3Hil;
	Wed, 22 Apr 2026 06:52:22 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRRc-00000009gT3-0A67
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Apr 2026 06:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776840740; x=1808376740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ay6xjiGJghH7NwHYxEIqhMcYl2BdvlIR3r4vo0PDoh4=;
  b=MDO43mLRqyNsWBJd+Jk0a8faxJADhY0y43yQ98xM9RjH8Uw8TqeThZ2x
   u3iVgjTM+QFCcuhhvf0OHBpBc3YjE0/0FdKLd5XTT5D2vTld6xnwC1E7b
   LGH8poynB0CyxN7lzpWJfmpoXAZmsSy/sD8QLBgmCEGPV7vBcV8FNMPzR
   xK8TmDK3HTSiofyE3GfDWzTL/PRz5PYViSTPasKp8hPXIS5wWwERXNgDQ
   fZ9aci9bNt3X0ekQxanDd7Dia6V7NcnvOjCdQ51L/+7p0ae5UilFiQVf/
   C0MknNfJY/8GpjV3ApMy1ViZr/F5fkcnygOtrrVQaGUbdK0it/SsQ8mJN
   A==;
X-CSE-ConnectionGUID: NtBwuYF+Rh2gK1BVfgKC2Q==
X-CSE-MsgGUID: Nj8a+stTQz2uPwXg7wAbeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65322970"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="65322970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:52:19 -0700
X-CSE-ConnectionGUID: oNTB+0MOS/qpTyrgLA8O0w==
X-CSE-MsgGUID: gOjFpUXXQRy4nD/0p1uluQ==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:52:14 -0700
Date: Wed, 22 Apr 2026 09:52:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux-mmc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
	linux-bluetooth@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <aehwG2Egt93-sPVB@ashevche-desk.local>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
 <aecu1ixyHP2hQvgE@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aecu1ixyHP2hQvgE@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_235220_115031_ED072461 
X-CRM114-Status: GOOD (  15.69  )
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

On Tue, Apr 21, 2026 at 10:12:41AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Mon, Apr 20, 2026 at 04:46:56PM -0400, Luiz Augusto von Dentz wrote:
> > On Mon, Apr 20, 2026 at 4:31 PM Uwe Kleine-König (The Capable Hub)
> > <u.kleine-koenig@baylibre.com> wrote:
> > > On Fri, Apr 17, 2026 at 03:10:47PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > > On all current Linux architectures sizeof(long) == sizeof(void *) and
> > > > this is used a lot through the kernel. For example it enables the usual
> > > > practice to store pointers in sdio_driver_id's .driver_data member.
> > > >
> > > > This works fine, but involves casting and thus isn't type-safe.
> 
> To be honest, with the involved void* this isn't really type-safe
> either, but at least the data keeps being a pointer which is really
> helpful on CHERI. FTR: The alternative would be to use uintptr_t instead
> of unsigned long, which also has proponents in the CHERI community and
> which is used in the current vendor patch stack.

FWIW, Linus categorically told that it has to be no uintptr_t in the Linux kernel.

-- 
With Best Regards,
Andy Shevchenko



