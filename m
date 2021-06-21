Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446B4C4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 10:45:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1198D610CA
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 10:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1198D610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q7ERCYI1cXOrnVTODPP4GNOtqDW7cnqCABDQ3LeOK5I=; b=cJMf0OxKCsADwl
	ji4wa+KLTXFjVwjoMiSQ3O3ph3VFPzyk5wEaOsG/5J7XnkBQ2TY7scdrMhkC6jDxoONGmVkPr3T8T
	GE0ccCNSVZL9lR19HduheLrx9EbJ5wuv+WRCEbm9MZVzHbOMD2S6w3Qlsma1N3rr6ie1mOJTxgdIl
	h/3xuyY2bw00AWZxZjVtHCpkZmhnjqRBURAMlusKP523Oofe1hKSKs0/tw1bAjaMOM9be1Nf5NRRW
	M4iVshVp4K1G7qFLumGjKBbfLtggMXv6S2wCT0gpwU2UX9R45YXGKAwa7ZliEsHxKVr2GM8vYq6OQ
	of0MVLYlIiGC53w/WqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvHQg-0039Ae-Us; Mon, 21 Jun 2021 10:45:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvHQH-00396w-L7; Mon, 21 Jun 2021 10:45:00 +0000
X-UUID: 9c96b078e9104a3db7b740f402e2bb03-20210621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uZ4vaQIigUcEYjbcg19DZxibSwf37d+UJhuPcyVxBOE=; 
 b=u9t5CQx2mYMmLkBGLvSQqBzqOkaildgGDgV7inJ0UMDOj71dfuPeR9Mfol+O//RxA6PQzbjh94fvJaqgRMVSJ8PTc+vx5tUm+Rs3uE1WjfXr4f7zYlLAdoXtOcy8g+7qU2ZyGB//WackORfqPesyJDML20Wto1vOIfLYAROfNoY=;
X-UUID: 9c96b078e9104a3db7b740f402e2bb03-20210621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1933211818; Mon, 21 Jun 2021 03:44:55 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 03:40:08 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 18:40:06 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Jun 2021 18:40:05 +0800
From: <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <bbrezillon@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <xinping.qian@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>
Subject: [PATCH V3 0/3] Introduce an attribute to choose timing setting 
Date: Mon, 21 Jun 2021 18:39:42 +0800
Message-ID: <1624271985-23591-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_034457_741480_95BD248B 
X-CRM114-Status: UNSURE (   7.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From 5359d08e7af0c7981d08cb37555491d098f3e61a Mon Sep 17 00:00:00 2001
From: Kewei Xu <kewei.xu@mediatek.com>
Date: Mon, 21 Jun 2021 18:21:44 +0800
Subject: [PATCH V3 0/3] Introduce an attribute to choose timing setting

Main changes compared to V2:
--add back misdelete statement.

Kewei Xu (3):
  i2c: mediatek: Add OFFSET_EXT_CONF setting back
  dt-bindings: i2c: add attribute default-timing-adjust
  i2c: mediatek: Isolate speed setting via dts for special devices

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  2 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 86 ++++++++++++++++++++--
 2 files changed, 83 insertions(+), 5 deletions(-)

-- 
1.9.1
 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
