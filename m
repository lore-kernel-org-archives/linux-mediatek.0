Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018EC369A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jYFcFGHXBxZeHKjxM0Rl64MZs1TgSJ3fSsYsJr3R8A=; b=juqNI9IYRg2iH3Fr5hGEczDyeW
	55KgDb16YUhOGPDnE1q8UWvONtQ/4BE+5zJkaj0lGXSEiq+9aV+OQRV2TsjfCADmcVHHQHWJ0i1zg
	6TMIQjV9o3JTNyph2PJvU343ksK4k6l9C7rBCM0kRqDcEEv7ywMUshzv9vA/f9Y9X5sW/xBsy2Ynb
	bvlcuisVSHJ4al07aGc83Bhz7nXnJdf2nK0rMO7TyskH73vpZETrGiijZVYVG6Xs3ka15vHqydR8y
	dydRZ58+/2k9gjgV/Wau62cJ3a82+Ikc89v0ukYoNQOpmMtaHZ3FMJ6Yk5e4e3p5eVpwghDa09DbA
	7PkRdRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMkf-00000004NsD-3YGl;
	Wed, 25 Sep 2024 07:47:57 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMb4-00000004MGr-3kFe;
	Wed, 25 Sep 2024 07:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727249883; x=1758785883;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=FsOhK/LiJhTIlz6gkBzMHtsb7SO4o21EIbdA7S2Uuy0=;
  b=hZDDv2DlnLIKqcy0O9ReiJmeKic946gspLYVJ1cfaQyEl7WLbKc7/wx3
   D2Dd5d5hvGL6LB8C4YGmGvHW9X0LOWozSZaeDtYKIIUiRLtzXMQb2n0TE
   nsQzetuwwvN2UY6foF1KZUwe6rslHARuHhoZC+ShQnafWPlBJ3XIRjybk
   My5ms8fC/AT5rCMaTddX4BIumMSdnxShvWboHA6paIdaMD0c8fmU2HOWp
   a2jchWVK/r6t9Nv77OR8/aj2IfFEcVI8ADmW9jlw4GE1L+HpfXKeFh5oY
   NfIVhIboI3f5hPKC4rsasRN/GKsa49660ZwzcQ5VFd+iXiJ7rokc+7VDa
   g==;
X-CSE-ConnectionGUID: OpfbfioWTfurtFfDGXmzow==
X-CSE-MsgGUID: ffCn+y+eS/mUjx98p03xNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30170175"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="30170175"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 00:38:01 -0700
X-CSE-ConnectionGUID: u5wksEuyQeqKIJnd7TdxPw==
X-CSE-MsgGUID: soM3O1iYRzmfD+y6VzmREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="95009705"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 00:37:55 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ryan Roberts
 <ryan.roberts@arm.com>,  "David Hildenbrand" <david@redhat.com>,  Chris Li
 <chrisl@kernel.org>,  "Matthew Wilcox (Oracle)" <willy@infradead.org>,  Al
 Viro <viro@zeniv.linux.org.uk>,  "Dan Schatzberg"
 <schatzberg.dan@gmail.com>,  Kairui Song <kasong@tencent.com>,  Barry Song
 <baohua@kernel.org>,  Jens Axboe <axboe@kernel.dk>,
  <linux-kernel@vger.kernel.org>,  <linux-mm@kvack.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  <linux-block@vger.kernel.org>,
  Casper Li <casper.li@mediatek.com>,  "Chinwen Chang"
 <chinwen.chang@mediatek.com>,  Andrew Yang <andrew.yang@mediatek.com>,
  John Hsu <john.hsu@mediatek.com>,  <wsd_upstream@mediatek.com>
Subject: Re: [PATCH 0/2] Add BLK_FEAT_READ_SYNCHRONOUS and
 SWP_READ_SYNCHRONOUS_IO
In-Reply-To: <20240919112952.981-1-qun-wei.lin@mediatek.com> (Qun-Wei Lin's
	message of "Thu, 19 Sep 2024 19:29:50 +0800")
References: <20240919112952.981-1-qun-wei.lin@mediatek.com>
Date: Wed, 25 Sep 2024 15:34:22 +0800
Message-ID: <87frporxtt.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_003802_946320_7F4CDD7B 
X-CRM114-Status: GOOD (  10.58  )
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

Qun-Wei Lin <qun-wei.lin@mediatek.com> writes:

> This patchset introduces 2 new feature flags, BLK_FEAT_READ_SYNCHRONOUS and
> SWP_READ_SYNCHRONOUS_IO.
>
> These changes are motivated by the need to better accommodate certain swap
> devices that support synchronous read operations but asynchronous write
> operations.
>
> The existing BLK_FEAT_SYNCHRONOUS and SWP_SYNCHRONOUS_IO flags are not
> sufficient for these devices, as they enforce synchronous behavior for both
> read and write operations.

Which kind of device needs this?  Read fast, but write slow?

--
Best Regards,
Huang, Ying

