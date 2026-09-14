Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9313DC88E5C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 01:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAHp48baWR5R1QOKt1jjC4cltuY1LKBmTsnd+LBiivM=; b=qa8vdY5TdgMBETjd/F8k5e2p4C
	A3HJtAUhqDw3hfw30r5oJbs/W4X5DH4id6YQY3AC4yZd5Gu/QZd5Gb/Yiu24PG2yLm6GRvTS3i+kQ
	UGQAslV8ZvGLGOZBUojVW+bA95eXzqYLn+OUOh62EvEYDTKMODEzLBDpcKluPknoVQM5F052a9+oy
	yxo2wSF+srUh1+cCBdOH0NF+j2N7GhRhii8tlAWLPcdV8imCgizanmkJPy34r+BhMms1+yh8okD60
	tZp5nCM9UUoAmLn7/F9fxTofFXZ+mBgFmBfsHrDueM+SCInX3gqTZMOYGLr+yL4RF7rLpA688xA72
	jf/5+Tzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vmv-000000029zy-0RzD;
	Mon, 14 Sep 2026 01:47:17 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vms-000000029zb-37Ul;
	Mon, 14 Sep 2026 01:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789350435; x=1820886435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xAHp48baWR5R1QOKt1jjC4cltuY1LKBmTsnd+LBiivM=;
  b=PZ58V6b5L4HDlfSwK2AH0/alu5D7cUk3q/qW0ZYr0/k1FAHknzypNS8r
   w3E96ZpjBLqD0x18r+Oj2QQz0DH/YmgRYaMr2KRYC5QO8J7a9ETeN6jXX
   7LDhTKnGqoBD/2rp/jY91c/+5Fe1buX1W/emvDgIZqRridivHZmFEGeD1
   0HqF769vb0hJ0ZXW2uGYZ5JjgLXVVht2u285qrNjpgUoI84N0I+Dm0QVI
   InQZoi3NUdNn/sbzpldWtRuXShDtqebQdRc/i++4TCJ8NjOf28vIpZqyU
   KWW1XSE4C+JC4upGewFY5oVIEdGBoUDCMAtIVrzxxC5KDJ1Kushyfm3wN
   A==;
X-CSE-ConnectionGUID: ObCtT5eoSmyLO0Kc9yUvPA==
X-CSE-MsgGUID: uHo/73lgQhK6lHfvOxBRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100034280"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100034280"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 18:47:11 -0700
X-CSE-ConnectionGUID: SAuVXkO7S0iffVrMqkiS6Q==
X-CSE-MsgGUID: 7HdWhPrXTDef5ckQBTqegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="913231"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 18:47:06 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit
Date: Mon, 14 Sep 2026 09:46:57 +0800
Message-ID: <20260914014657.633599-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
References: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_184714_856582_4630F5D3 
X-CRM114-Status: UNSURE (   5.36  )
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

On Thu, 10 Sep 2026 09:23:00 +0800, Junjie Cao wrote:
> No MT7922 here; the Zenbook reporter has offered to test.

Tested on the Zenbook 14 UM3406HA, 7.2.4 plus this patch: channel
42 tmac 3 -> 27 on OFDM/HT/VHT/HE, iw 0.00 -> 14.00 dBm, matching
MD11 = 0x1b in its MTDS.
https://bugzilla.redhat.com/show_bug.cgi?id=2515420#c20

Tested-by: Fabien LAGARDE <fabienlagarde16@gmail.com>

