Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F49C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 13:50:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CCDF60C3D
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 13:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CCDF60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QQwlXMUrzqjXf0fYaF4SSBqPBqa2X31SMJuOQamrIqk=; b=Vz/X1/H9v11HYS
	I0Nmels1Gj2Tl+e55rMc9F2QMcTjlLN+lwgm9T/vo8kItU0LQW4qItnAnkF12R1Ahq90Un1z4u6Dj
	8Q1xXRBHqAoT9LlNQd9jxTJS6FnvMnv/XPq0h7TfYmML2md7hRkeDbgtK2xCApc2zoAqFn5nbea8S
	4aO0Dclmqf1xhMqIuwHCrZYA/zpEEg1qYXUCUWavZ7BCsCwSfLucYoGXKhYq59YkcdeBWuV/6ri/e
	K7GAPWhRYkUIce1FrRrvNQAx6MwHrOtLoSl1/F7ZEQz62HcR/hrJTEAgI54byBVq0R8565YRcoKgG
	nlsOU+53S8oZfjdRHKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luxpx-0016mA-7G; Sun, 20 Jun 2021 13:50:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luxpu-0016l9-Fh; Sun, 20 Jun 2021 13:50:08 +0000
X-UUID: f2f7d2cf10954cc89f06d39c41c0db37-20210620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1L2gvrDM3so3X9chXRNUrUSFV+aojO4kyTnwS8c2n5k=; 
 b=jQM3XUxGjVp5naSomHpOOfaRMS/iUiDkP5np9pfynM1kelRew92cpRoSuDktNf9chMAaFSk8ywsmpBZLKPWdE9dNelOafcB566zynQRzhreZeiLLVH9Qtl+0nVhiXSHlcneEDVXmwjQQYO5xGx+22PrndWCOk83RFMCvLBNK4iI=;
X-UUID: f2f7d2cf10954cc89f06d39c41c0db37-20210620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1272960207; Sun, 20 Jun 2021 06:50:01 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 06:49:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 21:49:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 20 Jun 2021 21:49:57 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <wim@linux-watchdog.org>,
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <seiya.wang@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: [v1,0/3] watchdog: mt8195: add wdt support
Date: Sun, 20 Jun 2021 21:49:51 +0800
Message-ID: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_065006_577048_7CB90CC0 
X-CRM114-Status: UNSURE (   6.54  )
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

christine.zhu (3):
  dt-binding: mt8195: update mtk-wdt document
  dt-binding: mt8195: add toprgu reset-controller head file
  watchdog: mt8195: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  2 +-
 drivers/watchdog/mtk_wdt.c                    |  5 ++++
 include/dt-bindings/reset/mt8195-resets.h     | 29 +++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
