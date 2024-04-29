Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB81FC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qca9Cx0dLXV3WOQpiDsu1gOhJEwD+qsHOWl+MP2hUmo=; b=xKsh+ORqDP/yVpyQ0hLURsLTqj
	fPetVJx78ra3C7LYArzHkl3h9HtMCfAXWO8CHt6h94odn+FR/8jIx1H7KuJAT6yHhzFlaPd7YXm90
	i+rbZkkewtVXxOrfh8VjgET64zWt0GT4y32SOcO5YpTZZZS9CmFDwEagBtbq8ziu02oDg5KC4/3bj
	HiQKtCpV/iUZH0F2wWNv3jmZYsE4ozRUmDS5K/K9BNI47dMkRBdidH1KfdtPWztQ8XXrP/g/PeXoN
	navZTqMb0AMZL8Y+KKu20TJqZ8YY80GzFDpV6wLNdiUMPRj1dZDpCwr0SUn33KSXj1mCTv7s5p+Qg
	69tYMOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OA1-00000002FQF-0EAq;
	Mon, 29 Apr 2024 10:23:01 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1O9y-00000002FPh-197s
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 10:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386178; x=1745922178;
  h=from:date:to:cc:subject:message-id:mime-version;
  bh=gq2L+qagD+ctbJ1g03h2JM87K7EUppTIEWwY830mVMo=;
  b=JwORV+FM8nckhGKRrp9F0wmfiZsYoZVO+MG85KEN4wWvg2OSwkmGda3I
   3Pt6358NSovhgMvwXjMuzvZ86HRNiJgy+jukRSSqpsUSzyQuwJgZTpYVi
   zoN7x43Irqpwp/qLxzPLmpR/V97q3Yzl2lLD/WYeUpOn4cV8W7kz1Z7nb
   bDUPyXLAMaoS6cK8aZTIgpcjjCfbSEob3HqU6jrRkalY7cnnsaw/YN+p4
   CUe8dUKo9Uv3c52CI+Ux/Nfyxl/ScNv61VGdF8KOEHVinpzb10rwwRZn0
   NKuI0GvCL9ARLTKPIL5K5+SbRDBQgbZAJeQQwlcmCqn9Ub7hnyhQ95rAn
   A==;
X-CSE-ConnectionGUID: axZCxBKeS8eYGX3FcobXXA==
X-CSE-MsgGUID: nF29HHFWTK+n5hTpIoIu4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13827732"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13827732"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:22:57 -0700
X-CSE-ConnectionGUID: lnQIrUnfT9GJEjU2pXHkRw==
X-CSE-MsgGUID: IrMbYg+TRdeC7MOd8b+6RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26474871"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.45])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:22:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Apr 2024 13:22:50 +0300 (EEST)
To: Ryder Lee <ryder.lee@mediatek.com>, 
    Jianjun Wang <jianjun.wang@mediatek.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    linux-pci@vger.kernel.org
cc: LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
Subject: pcie-mediatek slot calculation correct?
Message-ID: <9ea20705-8536-738b-4f1f-60feb2c092fa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_032258_421741_1AE9388F 
X-CRM114-Status: UNSURE (   4.13  )
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

Hi all,

I was doing Conf Type 0/1 helper generalization when I ran into this code 
in drivers/pci/controller/pcie-mediatek.c:

	u32 func = PCI_FUNC(port->slot);
	u32 slot = PCI_SLOT(port->slot << 3);

With that code, function is effectively duplicated into slot, is this 
correct behavior?

...Adjustments made in the history of this code fragment didn't exactly 
inspire confidence on the correctness of this code. :-/


-- 
 i.


