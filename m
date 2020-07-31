Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C86C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:49:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60FD120829
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xUfrUiIh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OnyvQOR3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60FD120829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yaZ+SX/Lt3FX4eFBVVtvzhGikATKtC0ZeWHuNbZpNmE=; b=xUfrUiIhTz1Sb5fQVeXZqxhpHE
	jUKLiMEd296mYO56C1DUKE1Dh1d+Fvbpeu/7qw2Hr1nyWdCO13F+nUrZTKhp37EG2GASTwToAbdvu
	L2lGOPnM2J7F/hkMJVRi8nh+JryG44XC6p1BjcrYZxPHiKkJLLj+fOiOO8iyxnZitugo5X7ICD0Mi
	3AoHwaMYyha/49kApiuIL1Vnbur9x20WpUfouA7ZrYIluLrABYpc5YYr0sR10nWH90hGgRoLOQXg+
	0tZsd52o2DMQqla0VtO/yKztK8M7DB3p5wG7RkvcNuBEtf+WSsViBzzW3vGzeR0NImdJGzsS6xsna
	TNIOhnoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1M2m-00088i-HG; Fri, 31 Jul 2020 03:49:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1M2k-000883-41; Fri, 31 Jul 2020 03:49:15 +0000
X-UUID: 97fee5cb916c4838bbeb7a9d0135e00d-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oh7I0V3mU+PQ8llIZifICHSnU6p1Nl4Cu1lEjZrbxTE=; 
 b=OnyvQOR3cbo3idYIKyAGUtrmMzPFeRRU04dYSL7oNpIeGP9FQLDAKfd3n06W9Z2vChOIiVElLFjvwG056JmnTGQJI8lExBz4WEF+WQ9tCuD95f4R27w2EFf9yX8B1QhqF9/vhKNp8sHchas3C0fjYmwrkAaBoedDpvgIQdB8PRA=;
X-UUID: 97fee5cb916c4838bbeb7a9d0135e00d-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 229581188; Thu, 30 Jul 2020 19:49:15 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 20:39:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 11:39:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 31 Jul 2020 11:39:06 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: acpi: fix 'return' with no value build warning
Date: Fri, 31 Jul 2020 11:39:03 +0800
Message-ID: <1596166744-2954-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_234914_363856_1D639EE8 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

*** BLURB HERE ***

Neal Liu (1):
  acpi: fix 'return' with no value build warning

 drivers/acpi/processor_idle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
