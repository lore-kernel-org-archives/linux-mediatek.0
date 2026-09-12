Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF99CC88E59
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvuDncWOkSsmkppP6t2MIEp4IZ7VJYDyNUejDUwbID4=; b=OxRRgzYMr0IiY6KAQiB6b54Y6b
	tgEU342XqU/OIyRHxHVgF8C3hFSshzobaMu3A4RUzZPS1hJ/IAL9p91Ua5viujxROttVy03Nrgngj
	7QnVTe46aeo+/86GNgnJDRI8+RINrOqdvQq8d29mWkz0psZqCF2TSUX5cAUiOjeH0VM/Tj+HJ3IUB
	wTYWC/+fySTLVb2KaCMvR+ipN0OuTDB49RiBiUhfU/xw7cT89OTSt/kx1llZgEn7QUk/HWCmkdTet
	TsBTbfRC47MwZtofAbpJIrvx6799LhwURjVl+oKO+S5IEB4skia4iI+VHxSLCg5Z1JKti+m0YIKGp
	NAbuTn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Oxl-00000000wy4-34rL;
	Sat, 12 Sep 2026 14:44:17 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Oxj-00000000wxl-3eSm
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 14:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789224256; x=1820760256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TvuDncWOkSsmkppP6t2MIEp4IZ7VJYDyNUejDUwbID4=;
  b=WoS8bk26IL80nKGfgfAKDSzDbAQOV3ExwpQhnNHF3Z0/GbiEp80hnS25
   flI4NcuVXjjmATzdm6hk8i+fE0oolUlYHs9UvGeOtBNyzOn1ERexGT2ju
   rLsrbU4c2i3VUTM7cPsLNT65rpkxdbcsgRUxcfOXtX2nPPV/KHDyrfv+y
   AicXJZD4wdaXRpdZZr1U8GRAiMSIu8M/3JMC12Gw0kEW5ihRkJvRi3xbE
   /4fIDs6rdUiM5kyEGc7sJ2+mqorAzZCRu2L4i+PoTleQeIHZ0u7OUgAC3
   HLfKS25Q0PuP1z4PbqYR2nIutKiVaMTu5ynQHNHSuhijOWs9unE3ONrAE
   w==;
X-CSE-ConnectionGUID: ipQS2E56REmun8tqpzxlww==
X-CSE-MsgGUID: pQBzS4zvSlehmlqQq8bNhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="92168857"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="92168857"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 07:44:14 -0700
X-CSE-ConnectionGUID: yhdQpnzmSx6eKRe1yH4mqQ==
X-CSE-MsgGUID: w68aqB7jRnOIlsUTeBA3zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="268502127"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 07:44:13 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7921: skip unknown CLC firmware records
Date: Sat, 12 Sep 2026 22:44:05 +0800
Message-ID: <20260912144405.573391-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816174841.1918-1-acharyalaxman8848@gmail.com>
References: <20260816174841.1918-1-acharyalaxman8848@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_074415_951360_59453F63 
X-CRM114-Status: UNSURE (   3.60  )
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

Felix, can this go in for 7.3? 9417c5818a01 was queued for 7.2,
6.18, 6.12, 6.6 and 6.1 stable today without it; I have asked Greg
to drop it there until this lands.

