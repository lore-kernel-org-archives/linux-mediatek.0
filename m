Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32792C07E9A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 02:16:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB39A61042
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 02:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB39A61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dd9Xo6fDdsQdawBXjt/xGn4CwKXJK/YwORXf2GbAo6k=; b=YRYZPMyrtqoLse
	jKmo3GptxHpcNoy4QPZia7r1rJV9TrFri9GRP/yoOdDUdiedkt06j8z9+M20Y8uf7b8dvXUy+1d0p
	rurtE7zRmxs8E/05RGBNt+WT8Diz5p4VXbqITNEjFlj0vtJEuL/SEXIKitjzvbXnyElfbU5/adTAh
	f7J5O6jKjrV/nz+0Jt4OUjus5Pjfgj8V3TK3DOHDuxpQn8UAmO2fjmz3ynx2wAmNoYwH8OjtLoXQF
	Q9y57AFehYvoJ5c+76OjyUeXOqFCBX5Md0S01+ypxDVICIvBGQ1srIoPI9ropVVLHe0IntAPEgp2l
	LUKAhda67PNIo5lXYPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m37yF-008vFf-8l; Tue, 13 Jul 2021 02:16:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m37xu-008vDA-Ha; Tue, 13 Jul 2021 02:16:08 +0000
X-UUID: b1f5975c068446a7b300572c6cd9ac16-20210712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nePNuRmkafqUgvH69zBY6Mbz5rYMtHsnhHdANfeyvak=; 
 b=bdtMPGwjg77wSsb4nrU29E5w0boSZvOMuDemrBv+W79PA6QXyBmYlca3lO+1otmg6NjK4tUGs6+RPqwPXy+Yc4PuFfgCasRH4DdUYgvUmb1ndQIpx5dr0Z9Or4iyd1w0mwmB+e+ytd+IkyHYcUC8wDSco6+rbNCQbuRCysWXF8w=;
X-UUID: b1f5975c068446a7b300572c6cd9ac16-20210712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yt.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1176227622; Mon, 12 Jul 2021 19:16:05 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 19:06:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 10:05:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Jul 2021 10:05:55 +0800
From: YT Lee <yt.lee@mediatek.com>
To: <yt.lee@mediatek.com>, <roger.lu@mediatek.com>, <matthias.bgg@gmail.com>, 
 <eballetbo@gmail.com>, <khilman@kernel.org>, <robh+dt@kernel.org>,
 <drinkcat@google.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>
CC: <srv_heupstream@mediatek.com>, <fan.chen@mediatek.com>,
 <xiaoqing.liu@mediatek.com>, <charles.yang@mediatek.com>,
 <angus.lin@mediatek.com>, <mark.rutland@arm.com>, <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <linux@roeck-us.net>,
 <louis.yu@mediatek.com>
Subject: [PATCH 0/2] soc: mediatek: SVS: add mt8195 SVS GPU driver
Date: Tue, 13 Jul 2021 10:05:50 +0800
Message-ID: <20210713020552.18667-1-yt.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_191606_631577_CB921C59 
X-CRM114-Status: UNSURE (   8.05  )
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

this patch series is based on Linux kernel 5.13-rc1,
it adds SVS GPU support on mt8195 and depends on
"soc: mediatek: SVS: introduce MTK SVS"[1]

[1]http://lists.infradead.org/pipermail/linux-mediatek/2021-July/026270.html

YT Lee (2):
  dt-bindings: soc: mediatek: add mt8195 svs dt-bindings
  soc: mediatek: SVS: add mt8195 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   1 +
 drivers/soc/mediatek/mtk-svs.c                | 228 +++++++++++++++++-
 2 files changed, 217 insertions(+), 12 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
