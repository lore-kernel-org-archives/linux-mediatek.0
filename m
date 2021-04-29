Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D53C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 03:47:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B10DB6103E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 03:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B10DB6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4m4HMpAfW/01rg986ok7wPYjfDUV/ptkpw31NTBd+Is=; b=GxedYMxXqSStwVcX+S01v2hYJG
	BmbfSEqNz0AbUlQrO3hmbEVomTGmlho3KVqQO5RsSRpw8Y5uQp27jXhk6cQnmfTtPFYO0IaU0UCqs
	QV478xytYZ23ttYUz8YyISRUPE4/73oAJ1NhnhD7gJuNRQQQwArWZhmU4ASeR+6GuuMxbGaFk7PSw
	G/jDgRcFt9la9tmJLZ6RnZ5i6oH/XIXNiBPQKw/nBuOUtJGxeQTD5cwJNpX63gGElLRAn0eEQFN3w
	aSZutaVkFhT8P0DTkaVRM0e3ktKyhDcAJUgtLzMz5sVB748jq0qZki+CnMfHDzHv20bY/nQFyGhp0
	anUuxMVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbxdI-004ni2-F4; Thu, 29 Apr 2021 03:46:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbxcn-004nfN-06; Thu, 29 Apr 2021 03:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1wwtodXYjucbS9xVNCe50A+efwkbumB3XvjtLdttizI=; b=a0QPEos4/Rild9/FzBwrSPNyC+
 XALrIcx8NkGhA0HGX/CQH+25XLu12JF0NnYK7MSSGOTfhQ6WvWNKdBjtPIMeV3OEB+XSzKlwJS8Pi
 m2TovWd66OiLQBV4cx5+W7zF7bSezdeuHqW1NGW1zPvjc/rxyiN7U1yLdJ71rnDsuBaWqVZDcmeCM
 SIrowfWylODjgsLG5WK1ffA5shEjsm6ec5PTaPXxad3TmAasAH0eqC6KlW/GYZOaKtFbtjMXhS/51
 MDJpVFJYsNG/dgLAwVMEVtNluNMetBq7xVajGKTnEaSK/q8IW0t66iBbdSanLG67XfWBFKxFVq/lP
 g58ZdYVg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbxci-000LTC-4I; Thu, 29 Apr 2021 03:45:59 +0000
X-UUID: e2a23f26738f4255a1de9827a1caa31d-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1wwtodXYjucbS9xVNCe50A+efwkbumB3XvjtLdttizI=; 
 b=T0WQdKHS1H7xLT3pmBxeflVVLeX94BYnIorECcu89UWPbS/9+U38cjdV7rQKDtHlKvkh3COWXB3+gED7gBaKT6hSoRF6he1lS/a5hrpJEQdwrQ4tEXBgdLUazVOUgvvCKjuleNDX4ujkZKTyl3v39fECq/Ph9nqZGIfCN2eHu9c=;
X-UUID: e2a23f26738f4255a1de9827a1caa31d-20210428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 529739463; Wed, 28 Apr 2021 20:45:53 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 20:45:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 11:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Apr 2021 11:45:50 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v3,PATCH 0/3] mt8183 dpi supports dual edge
Date: Thu, 29 Apr 2021 11:45:45 +0800
Message-ID: <20210429034548.28030-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_204557_599926_70615F53 
X-CRM114-Status: UNSURE (   5.93  )
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

v3:
Modify clock rate for dual edge setting.
Add more bridge function.

v2:
Modify unused code

v1:
DPI can sample on falling, rising or both edge.
When DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Rex-BC Chen (3):
  drm/mediatek: dpi dual edge sample mode support
  drm/mediatek: config mt8183 driver data to support dual edge sample
  drm/mediatek: dpi: add bus format negotiation

 drivers/gpu/drm/mediatek/mtk_dpi.c | 107 +++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 6 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
