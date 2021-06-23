Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A76C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 09:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECBDF611CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 09:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECBDF611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FGSIK0PzmeZWwNa5TWYvRvbpdlabxU8TzjG7zbBnnR8=; b=0VRhC9pIvUNlbr
	KX3+ZeGvG0jLcwDCyovaV+fFNBJH6MOOv+rk7R4cbmMRdcuMCenmDdSdvnlRPp452qAEGFAiG/AOd
	NhTMEeyjWweX4PD0c0aBwHbkh4qTz+4FIlscsGCtCIEDAVCSQiPfI7/v+pPijaN/ht0EYIbMXlKtq
	+vX37s+HfZpd9oEbTSxvlSY/TQQJNVQPgdcQh9JmKS76rE7t3jdJYYEljjC3NHCzbgmq/+OdDs+II
	svLoRm1klHxksPzMON6Ias6nIZXs1AOZ8n+LriZ7D4DzgOKp57ktAhGKWEa7rDZGXr1IbYu6o3loZ
	wwYDKG7aHWDQI7H5lGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvzDr-00A5Hn-7i; Wed, 23 Jun 2021 09:31:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvzDR-00A52r-Ts; Wed, 23 Jun 2021 09:30:39 +0000
X-UUID: e83d6bbd127d4bcc8a335071dc3eba63-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=R+tgVA5VV4Kpg0vnvDHumBC3UCdF5eXGQ5cekzBrkB8=; 
 b=oX8hv4W08UICZXRn2/5i4dgz9kDVn00OaSPtoXtxIEsRfVwUbPOiVHCLMYYtW2uDc+4Q7qh9NJjE77zs0AmQFpCUubMxmxKoZPG+0xD2IcJm8y0hNsG3bEHDLxIGQYmgfDLgfY1aDmqBL01IvqF+D+PI2L/AEuKK4I0ThssEFuc=;
X-UUID: e83d6bbd127d4bcc8a335071dc3eba63-20210623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1259305288; Wed, 23 Jun 2021 02:30:35 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 02:30:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 17:30:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 17:30:26 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v5, 0/3] support gce on mt8192 platform
Date: Wed, 23 Jun 2021 17:30:20 +0800
Message-ID: <1624440623-4585-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_023038_031187_68F6B802 
X-CRM114-Status: GOOD (  12.15  )
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

Change since v3:
-rebase on linux 5.13-rc1

Change since v3:
-fix review comment in v2

Change since v2:
- add controy_by_sw for mt8192

Change since v1:
- move out shift jump patch
- remove useless patch


Yongqiang Niu (3):
  dt-binding: gce: add gce header file for mt8192
  arm64: dts: mt8192: add gce node
  mailbox: cmdq: add mt8192 support

 .../devicetree/bindings/mailbox/mtk-gce.txt        |   7 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  10 +
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  10 +
 include/dt-bindings/gce/mt8192-gce.h               | 335 +++++++++++++++++++++
 4 files changed, 359 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8192-gce.h

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
