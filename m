Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22944C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 06:35:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB4564F86
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 06:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BB4564F86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ZKrxIVJNf/VeCDjFLm4bkwt3rgCV0uTUPpRTnMrGGE=; b=JmuFXTsyp5SPdjTICsqxXq2Tkm
	Q10yL5z9WDOoSqJCGLBx1ud7hy0uHW9MrSjhglhnya8F7ECMJpqKs9v6/zuzmZ3SpKdh6831Oz3mW
	+8sUGa+1eDHKuiTedErqwCmLk6rAnvbtxAGTcUKv9enu2ZtN9imdBvnYFRf5i8PlycBTlJV2+i82w
	ggcc6huPbQU5wSTmAG0OTUh4+cQlh2AeNENyPIBqAOl1lyznu5RultK4OApZARuKXBptez7k1o0t3
	xa16BeOt7dwPPIvTy8D83dRT0smuZpjJciaL14FHGvFmuoDEATrcpjf4yvogYzIdL7VGIV+wMB5HS
	Vwao8QIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKbOV-00Ajrk-Fh; Fri, 12 Mar 2021 06:35:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKbOJ-00Ajmi-Ca; Fri, 12 Mar 2021 06:35:23 +0000
X-UUID: 04d89ee1eaff44ed917a2e013facb6cf-20210311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PfFZxJRlOZXlS2uPFGliGZm/Mqjp+Lcu7p5/SzoEdmw=; 
 b=nYx9eXeDIny/UmQfo1WDvME3MsfnWtp3t2BRAt8OEdti+joMU6CRMdE+sX5iefv8FInNNWctZh6zI0/tEsKWcEk7AD/3ouz3ii+zgYzzr5mCE3KiQWuzp+b81a6pJsdNqd8HT2jHghCJMxHJMnd7ZELHdgmtGvEmvchFp0uEHPY=;
X-UUID: 04d89ee1eaff44ed917a2e013facb6cf-20210311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1406739848; Thu, 11 Mar 2021 22:35:08 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 22:35:06 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 14:35:05 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 14:35:04 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 0/1] Mediatek pinctrl patch 
Date: Fri, 12 Mar 2021 14:35:01 +0800
Message-ID: <20210312063502.3685-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_063520_267158_06385464 
X-CRM114-Status: UNSURE (   6.84  )
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

This series includes 1 patches:
1.add lock in mtk_rmw function.

Zhiyong Tao (1):
  pinctrl: add lock in mtk_rmw function.

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 ++
 3 files changed, 8 insertions(+)

--
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
