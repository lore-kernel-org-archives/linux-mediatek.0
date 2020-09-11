Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32947C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:50:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57232078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJp4J3no";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FY0/q0hf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57232078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N+jx2fUDFNJC2+Bhc1Y7vwxHqTEkibgP29cwVHYGOHk=; b=hJp4J3nokgZlV3da30StTB37Qb
	e5zw/1/5T8XjBY53/3sZe2RZNQ5RDT0l7p2niBjgJK/4U77HuplBNKg1FK1vRRf0VYW6JILG6+veb
	MSai+RrHGPdhgzhWVwilz35S4FkxVkyVbBKyxa0zYh+wlqps13TmcxYUoHcKjN8XGn03lb8HHXi0I
	tWzbkHRfOu1ZKSCgE4W3F79FDjhmbodbEl9K0luohFRDtBKPUzm7G1J36FWLzDp/dO18TYcHUR88v
	c40M1/OVlnTDyrcOBfMaI/0by+IT+1teVkzpfVI1GLXKeXWM/Wqki3X1X37RO+VCSFCgYZp8jSAOU
	HPPPStJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGa4O-0007CC-8F; Fri, 11 Sep 2020 03:49:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGa4H-00078a-9C; Fri, 11 Sep 2020 03:49:46 +0000
X-UUID: bd93f344fb5140dcafe1a1ebbaf8b7e1-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QmwsEWaxnOAFLlTyKo3ep0gcRa5p3BgYqpCcV32oTwI=; 
 b=FY0/q0hfYGHPVT+qxJj3J8+82uDg1QSHCnbojPftesPvPJxU/rrp2i9kSeCRge2esHJMUMzM+nnkHiz9MID0CyZC80HnRMKZM7Gy/QlEKZ1mtUWJTU6ObUoJ3BrJseJMbJ5xn3JTq5exUXNkERX5u0wD9mg318ZCG3oANfnAoLA=;
X-UUID: bd93f344fb5140dcafe1a1ebbaf8b7e1-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1834484461; Thu, 10 Sep 2020 19:34:59 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 20:24:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 11:24:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 11:24:49 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 0/2] scsi: ufs-mediatek: Support performance mode for inline
 encryption engine
Date: Fri, 11 Sep 2020 11:24:47 +0800
Message-ID: <20200911032449.21577-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_234945_481474_AB9F4C9A 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, HenryC.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 arvin.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin, Rob, Avri,

This series adds high-performance mode support for MediaTek UFS inline encryption engine.
This feature is only required in specific platforms, i.e., MT8192 series.

Please help consider this patch set in kernel v5.10.

Thanks.

Stanley Chu (2):
  scsi: ufs-mediatek: Support performance mode for inline encryption
    engine
  dt-bindings: ufs-mediatek: Add mt8192-ufshci compatible string

 .../devicetree/bindings/ufs/ufs-mediatek.txt  |   4 +-
 drivers/scsi/ufs/ufs-mediatek.c               | 178 +++++++++++++++++-
 drivers/scsi/ufs/ufs-mediatek.h               |  22 +++
 3 files changed, 197 insertions(+), 7 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
