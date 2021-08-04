Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5697C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 13:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F7360EE5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 13:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6F7360EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8xa1G4pvxCYA8RprDqC8M4Y8kDVk27xX2QfLyj9DEWQ=; b=tSFfWIA2Pfs9zl
	CDvPekg4zNqiHsnA4immM0pBP1bXEOJP0mh6Xj0YpanEKaIoVUZz9YxTP5Es0ZlINI3f8RlYNRHin
	/Ioh1/3mqetQlPx4L1K09qtIspdVt6UKt6Q5Q3RhAdErA5Jow8Sfsj9olqxzE5GKup0T4KlvaFIOd
	1z9j7n6uU7LWJ/ayL5rCrxYZDHe2X3FwqBxT+JjVOuXZ2UzHWPlsgrhQsI4dTRNLpJU9f4MYIMMnM
	0B6/I7F8qVSq/9hzLGtCTW89Kv+HTlRAMDnISB3jVNoERNnYdB8SSuo4OdaZMWuMIedUm/r7spf7T
	d5TidiBeqUHcKQgnE5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHLJ-006D9v-4H; Wed, 04 Aug 2021 13:53:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHL7-006D7a-5P; Wed, 04 Aug 2021 13:53:46 +0000
X-UUID: 874801991ff74954a93e0412f599dfa3-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RKTH7UPG2X0GdgsTLo6Aj1wqRSXIbOVH2hhGdIjlHLw=; 
 b=SZfaahHXQEtgkUgqT8ZkPxDUWADCCKPyOIxADXdpUsyYFtOtCy/a8xHDhFc3YKWf4fAqm8uy8O4/ef9/rz6YTof2xmKe8V0F2r3ZnjCf9bvDdoTkltVhUs7oCJIKhfiivMYNaNgG45pEUuGsM/CDmgyeuRszFNvObdSJoE5iAXk=;
X-UUID: 874801991ff74954a93e0412f599dfa3-20210804
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 906275437; Wed, 04 Aug 2021 06:53:36 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 06:53:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 21:53:33 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Aug 2021 21:53:27 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Mason
 Zhang" <Mason.Zhang@mediatek.com>
Subject: [PATCH v3 0/2] spi cs_timing restructure
Date: Wed, 4 Aug 2021 21:36:31 +0800
Message-ID: <20210804133630.18519-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_065345_256393_9783B917 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,
This patchset has restructure spi cs_timing, as we know spi core has
removed spi_set_cs_timing() API, it is a correct decision because it
asked spi devices to call it in one more time.
so we need find another way to support user set cs_timing. Actually,
spi_device set spi_delay for cs_timing is enough, and about how to
set cs_timing, just put it one the master driver.
We have test this patch in mediatek platform, it can compeletly meets
our needs.

Changed in v2:
  - fix tegra spi build err

Changed in v3:
  - merged patch2/3/4 for build pass

Mason Zhang (2):
  spi: move cs spi_delay to spi_device
  spi: modify set_cs_timing parameter

 drivers/spi/spi-mt65xx.c   | 107 +++++++++++++++++++++----------------
 drivers/spi/spi-tegra114.c |   8 +--
 drivers/spi/spi.c          |   6 +--
 include/linux/spi/spi.h    |  23 ++++----
 4 files changed, 78 insertions(+), 66 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
