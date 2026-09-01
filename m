Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC8EC61DD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7lOUejC2tGwB1iXyXMM/XGwV6CJY9bP3bO8Wn1ZS88=; b=ek7ZkIOtRA+39gNjOHtdo+Tryw
	vKzyQ1j+UR2T+GCZSaEZfIH+VSEeFXZXCWb2ApwovoCD7B8QtBSrXheFAQgOKGYVQf26JswpLA4fV
	wMToM5UQ2xP3wU99AB5DZrOmEhlwE4OFqh/IOzDmHdITz++wDXEj92QSUXjDD0AmBdovBh7sIByGc
	hN3xUqKcsbgBCUU55NC8U73HVPgg1RYP6h0/ma1VQnTi0Ohq3UHzAFHuKXmSHwJ+OtD/EYkckpd5V
	4+3N9ztM2zUMIpH26LlveDedDOVmT2PiAWyPnlGm4qWPKMh149zFl9lA0ifc+t2QuuFdtOoSoApzN
	mA5bTI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PTA-0000000CKwf-2NKV;
	Tue, 01 Sep 2026 14:28:12 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PT6-0000000CKw1-3ryW
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 14:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788272889; x=1819808889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i7lOUejC2tGwB1iXyXMM/XGwV6CJY9bP3bO8Wn1ZS88=;
  b=bFVCJCFtNWxI4M6O4BpfCvov5weTghQVcR+Y/KBAKuP03BsX695c8POg
   WLUQo3otMNAnnS5m11EidbNtsrujmFKKjU1ObaUpXsulBVJg+V1W0KC+E
   NvyvaH+fwYHT0ld/SmR+k20dHpyHUGr8bRaP+u+FiLxQdStwcAiYqOpQL
   zE7kF1xdeVpHF54sOH0J40wGjxNWLKbjtgSrgYdFbL9+IGPKlYIvZ/vbW
   yHdJQVpftWkjC9AjokEm/vekmI6f6Xbs56EVjmwaML8jVE09N0rEsIv5m
   LvpUphwD7iqSVu5IkEN9TsU52X7yV4XQld0RulVAOZZi16/qhM+ZirROC
   g==;
X-CSE-ConnectionGUID: DZgnCYCVS1aWD6YWLbXEjw==
X-CSE-MsgGUID: HYlgud+mRCKItO6LE89MWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92571268"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="92571268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 07:28:08 -0700
X-CSE-ConnectionGUID: gzPAOPuqTl+Tq84be+jC9g==
X-CSE-MsgGUID: 72cqK8kGQp6DIKZNbhkLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269685089"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 07:28:06 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7921: skip unknown CLC firmware records
Date: Tue,  1 Sep 2026 22:27:57 +0800
Message-ID: <20260901142757.422688-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816174841.1918-1-acharyalaxman8848@gmail.com>
References: <20260816174841.1918-1-acharyalaxman8848@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_072808_998840_48BE5DC1 
X-CRM114-Status: UNSURE (   6.35  )
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

On Sun, 16 Aug 2026 23:33:40 +0545, Laxman Acharya Padhya wrote:
> Treat an out-of-range CLC index as newer firmware rather than a
> malformed image. linux-firmware 20260810 ships MT7922 records with
> idx 3, and rejecting them made mt7921e fail to probe.
[...]
> Fixes: 9417c5818a01 ("wifi: mt76: mt7921: validate CLC firmware records")

Reviewed-by: Junjie Cao <junjie.cao@intel.com>

This wants Cc: stable, and it must not reach stable after 9417c5818a01
does. That commit carries Fixes: 23bdc5d8cadf (2022) and is in v7.3-rc1,
so the Fixes-tag scan can pick it for every series with a three-entry
phy->clc[]; there this firmware then fails probe. Those trees today read
the idx 3 record past the array instead (UBSAN at mcu.c:474 on 7.1.12,
https://bugzilla.redhat.com/show_bug.cgi?id=2515420).

Greg: if 9417c5818a01 gets queued, please take the two together.

My Sep 1 patch duplicates this; withdrawn.

