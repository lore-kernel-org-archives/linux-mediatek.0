Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA2BC61DD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/aNeRp1M8+W5dq4jHs4weTa/XmaDxsrVyBRxencbn0=; b=3Ex87CrZAtJYq/IYxtn4JJOvl2
	CyYpOVJ3lOfDCs+xGo0X8sFTf1bEqgptzNEHiFNTqzhtE+SYkjuUkYpvO/Y5l61hEMw9C8yQu/MzK
	9Dgcz/fOSy+goy9HRsK5OC0Eh5O1Caun9Mk350Wg7NK1eFb7elo81xgKS93pNJwP2SSErfcNBUdS0
	cqGX4K28wNSUmA9ZU90ZyfZ2tIu87QtXVhHVMJM8gE5v5z1/6G572h9vdjdhSf0GhOaMTeEd1Vmxr
	dbnxrfyTHq307v+vpwvsftIuc148HWnuGZC8j00Oq8fIIeHCmMX7LX7S432WB6IlGo/tvPR3Z5jls
	0HGACWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PQr-0000000CKhd-0lYm;
	Tue, 01 Sep 2026 14:25:49 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PQo-0000000CKh6-0boC
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 14:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788272746; x=1819808746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q/aNeRp1M8+W5dq4jHs4weTa/XmaDxsrVyBRxencbn0=;
  b=Gd6jfIM7Wzmw1mBtyG8pXjYVzQfE87Sq5Q/ytTtFeqB61oXur1ML5n/b
   AbTU11M1xIrNDa+WZAqlZrNXKJixNs9RitUpubzZZlN5Rp6HfM25SWUB0
   4DRw9B6WaPdBdpmJIs/SOSjnEGKvFi4xdbrdw9w9b4qTJep/oLuPRM/C8
   RFK4l7WFxGyQYBLFUNHRGV1+7XzGmTsK1uIiiNdfsBGJBBXi7JWJbmwl2
   fVrQwoRzcp+dCzlprUat26qYyPzSqSMUPTOtodeO3nT7Jnf3Sooh10oq0
   NXAgIJ0pRq+WBC5rDLZvy1o0J3wbnm0UA4m4kh+DokgIlFPYGIWa/oLHt
   w==;
X-CSE-ConnectionGUID: 5OTr7hzoRFaiOtN35ybwRw==
X-CSE-MsgGUID: gop3sVhuQX2lWPV+29d0xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88555115"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88555115"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 07:25:45 -0700
X-CSE-ConnectionGUID: tGXYaYE4RqORCSUALmw9AA==
X-CSE-MsgGUID: QwKAUf1dT6aKM+56SK+k6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="292621116"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 07:25:42 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	stable@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7921: skip CLC records the driver does not know
Date: Tue,  1 Sep 2026 22:25:33 +0800
Message-ID: <20260901142533.422664-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901011840.416787-1-junjie.cao@intel.com>
References: <20260901011840.416787-1-junjie.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_072546_252759_19879B61 
X-CRM114-Status: UNSURE (   5.30  )
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

Laxman posted the same change on Aug 16, with a Tested-by from Mikhail:
https://lore.kernel.org/linux-wireless/20260816174841.1918-1-acharyalaxman8848@gmail.com/

Drop this one; the stable ordering note is repeated on that thread.

