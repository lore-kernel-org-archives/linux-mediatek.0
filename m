Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B9FC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 03:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4329B6108C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 03:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4329B6108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B/RsvIGQNSVzvMsGJAmz9ce/Wy/8XZra/ZQiywCEyo8=; b=RCSsfQLMeOaABq
	VYQJDfEV5upbYZIdoCDg0gNEnXK14979F/h6MWWs4wAQt1tND0gpvSLeNYnTJqQZzvv4SlhkXgGot
	y+t2OP9s4RZEYk0FYYX8kFESE5mj2afTymRrZdyGF+K2i278EHWza1lBjpA7/W3j0Do7T2Mvu0V3c
	BmnrCnxW/fZbVXSWFZGj5TH0T0Obw5Knk3Al0dDDc5RI9Av5Gl7zQUS1tNZU4isgacQCeQTMHJTDz
	MNuz2SzsAcWQx0tMI0fKnr5xfkl3/22CHTFd006ELSY4+b4lJP1NVAfEmis728tZ3s4MbYrlYNb4Y
	XIwazCGJvv8bJiVwKIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqSNn-006Fye-LM; Tue, 08 Jun 2021 03:26:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqSNV-006Fva-Ny; Tue, 08 Jun 2021 03:26:13 +0000
X-UUID: 79b662e2ff34407e811566a528acfa33-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vqaSfWlmf2dcleKde0Uit4Vh7fYwVocaH/yGIuCxJ2Q=; 
 b=YyOCeIMAz9SAU0hzMOMGJ0Ak1eWQ4ieGplyPjUzZTBWWUWR63Y4vkQzgpChkztx8o6c1TLv0Gz46ahA6MGOwN/1rJQ6H5O8EDIjMxNA7Wg8pDV3VVvEmhf+y85x1Fj/cTGzQnMhbuynsM9dJJEQO2gW54ZllokQCoxMNcksh7Co=;
X-UUID: 79b662e2ff34407e811566a528acfa33-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1994034794; Mon, 07 Jun 2021 20:26:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 20:17:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 11:17:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 11:17:38 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <qiangming.xia@mediatek.com>, <kewei.xu@mediatek.com>
Subject: [PATCH 0/3] add i2c support for mt8195
Date: Tue, 8 Jun 2021 11:16:37 +0800
Message-ID: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_202609_826680_BB1D4A76 
X-CRM114-Status: UNSURE (   8.06  )
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

This series are based on 5.13-rc1 and we provide three i2c patches
to support mt8195 SoC.

Kewei.Xu (3):
  dt-bindings: i2c: update bindings for MT8195 SoC
  i2c: mediatek: Dump i2c/dma register when a timeout occurs
  i2c: mediatek: Reset the handshake signal between i2c and dma

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   1 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 111 ++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
