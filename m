Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DE5C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:36:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 347A7613BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 347A7613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ys04/IP5nNnLE/+X5oY2HaKlRF2wTx5Rlwxe7JuCfRo=; b=QObqM1kwGvTqBksElVf893Xj/h
	DNIt5+FXPBZsm5CycjQMUPrVb23tegYFw5kB56OJaTnqv4c8EzF6n4YM+FUOzLU08eP/txUmjMxHN
	ATNM6qixOUmIVArXoAtF+4kstMKsdkOhrW2e1WIvpgj7tb65BqEMkh9DMlQviV5fIsIM76e/qRo1C
	7Lirb4hjyI07Yi+jDAMMpm+X2v7bf3cdVtozElLicamyiPZb9s7Z1Gh1tOl7rGGVAumRDuEYKwFXJ
	cY2Up7EbYSdM0FLpoW4hw2IamBkfLRnJJHBuxAvV6NV75S+75sggUwVMZ/db8t0m2njqVqI13QU8h
	Kdj6/dTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQ8d-00Fhnq-TF; Thu, 22 Apr 2021 03:36:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQ8Y-00Fhmy-Cj; Thu, 22 Apr 2021 03:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=z47MR8bMQr80lEZXOvkZVFDPQLQQqnFjrEUXwaUmclE=; b=dfJfBnK7DH60R9WbeHbppIoSl0
 gpKJPgwM1jxprKarFNowgqt388OmByvSXdII3lY6/TS65vnxUqyi8/l94ecAmSn5pYt7TvqBsbzoE
 0B+PGngIv7mHsi4KqKcAYubHOx/u/YUZE50lNHg9wwosqmOI1zLjgCRetvJrgHNaVzlfUCOKsY+d0
 q9SU8JT76AJulXBqgmqrMe40fivWtSJ25ZFrO9KPRUrhrXejRLioen7BDQzzSSoQZWZvIGqhbU8km
 MiU0tz5i3+LOeqZ3bVvLezSqQJWm4t54QA50thhjyG3hau1I5wbQ4d+mSAHLHanHbKsPlJc+CUYin
 VODBAQtA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQ8V-00DL2J-Cv; Thu, 22 Apr 2021 03:36:16 +0000
X-UUID: 68d3a01115484e238c2533ec9d637026-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=z47MR8bMQr80lEZXOvkZVFDPQLQQqnFjrEUXwaUmclE=; 
 b=LdosCD6JbR9QfLi8W7YqWsot1xXpZAwa7gBwPvYa5tl3PinuK+atQLGbjJUBukL50T3N89LTLV3wQ4MXS2rezxtzsedRUsc0Yf4/aW3xmSdP0mhgnWIoAPFt7iz+CYnKo4+fGBhxrMpOuo9MDXbz5DQSVbrKMzVvvLf4s8/xoso=;
X-UUID: 68d3a01115484e238c2533ec9d637026-20210421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 857131717; Wed, 21 Apr 2021 20:36:09 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 20:36:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 11:36:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 11:36:05 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>, <sj.huang@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Subject: [PATCH v5 0/1] Mediatek pinctrl patch on mt8195 
Date: Thu, 22 Apr 2021 11:35:58 +0800
Message-ID: <20210422033559.29700-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_203615_463099_B9863561 
X-CRM114-Status: UNSURE (   8.52  )
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
1.add pinctrl rsel setting on MT8195.

Changes in patch v5:
1)document and driver patches are applied.
2)change '-EOPNOTSUPP' to '-ENOTSUPP'

Changes in patch v4:
1)fix pinctrl-mt8195.yaml warning error.
2)remove pinctrl device node patch which is based on "mt8195.dtsi".

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

Zhiyong Tao (1):
  pinctrl: add rsel setting on MT8195

 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  | 10 +++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 16 ++++++++++++++
 4 files changed, 62 insertions(+)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
