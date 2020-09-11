Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B22C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:49:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 663DD2078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAmIjJMX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tVnjNEDk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 663DD2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5cB44G4GdDZBeOAXBb9XrvZgI5L89kytidwabIHkM0U=; b=MAmIjJMXkiK+h9LrA1G2PQ+iHC
	zCnfms0DEQTaSHiaHWrdX0Po5dtyZYTcp0bGHuJme833JUbaegen3FgGQV/rXegAZYUSOGCO82Mvz
	zwOhADLP+TXDttgBcRgkiR3fAIkfmj4AZe7d/hPcfbaj2SFYwGetbuucY6BXXcXYDYcGLBsFYyJwS
	EZE5cZZZP1g6ckDyyHgit7Xz6A/Mi104/Fy3rn8U4sbDFS3dBgjco6xgIPNxF8NvwCKFKAtDuMrSg
	od5Z8RqguRngTLSiYBM5xEYWu5kxFTa2aqA72JPUnaVa69b931yPtil6GTPWN5+92PKyVirtYeQUB
	EBPVmUew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGa44-00073v-Sq; Fri, 11 Sep 2020 03:49:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGa3y-00070u-27; Fri, 11 Sep 2020 03:49:27 +0000
X-UUID: c1dea8056bdd44a5947b7fd76dab6510-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Q3rQNOBjXLnDvyO+i0Tu0z7EKCOBPItUhlWyNSIm0QM=; 
 b=tVnjNEDkftjqmv4NYoZGvasEv0Io5dwKFMTUZNXEvzOgrHpZKxc+zTnk75pFsAPz6HP0J2e2MbB87EjVWnkhozj/AwA08wye2q/ApMXqUikmSjmqSyU+rYc60FgnSW5n8tk4rEt7dJARvDv6LF6i8K3Lsq4qj3N/8EP9K2VUqtY=;
X-UUID: c1dea8056bdd44a5947b7fd76dab6510-20200910
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 85866213; Thu, 10 Sep 2020 19:37:46 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 20:37:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 11:37:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 11:37:36 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 0/2] scsi: ufs-mediatek: Support performance mode for
 inline encryption engine
Date: Fri, 11 Sep 2020 11:37:33 +0800
Message-ID: <20200911033735.21751-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_234926_283509_FE7F66FE 
X-CRM114-Status: GOOD (  10.04  )
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

Changes since v1:
	- Remove unnecessary printf.

Stanley Chu (2):
  scsi: ufs-mediatek: Support performance mode for inline encryption
    engine
  dt-bindings: ufs-mediatek: Add mt8192-ufshci compatible string

 .../devicetree/bindings/ufs/ufs-mediatek.txt  |   4 +-
 drivers/scsi/ufs/ufs-mediatek.c               | 176 +++++++++++++++++-
 drivers/scsi/ufs/ufs-mediatek.h               |  22 +++
 3 files changed, 195 insertions(+), 7 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
