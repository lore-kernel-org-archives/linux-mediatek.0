Return-Path: <SRS0=aboO=IT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (unknown [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE8FC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Mar 2021 03:32:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31C961974
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Mar 2021 03:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31C961974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HfxAhXyYCsIBXtGvVjM9W66uRwYZk1Y8QENpAO4KehA=; b=Sv5wNj3I1dXmnEWYKUvs6zKf2O
	DSUEYvNUC/VN8P0uQFeWPUDVx+zUhoSvHfDKhWGHKnverAoIpKJe9Eg8HaUBA16CodKyuxPlruDYk
	jKTw9ubrXgPSPK/YdJjrQHtlSUzfZP9CpPXMeVVBKKtyzr6qzmYwPpNLb96lsZi+coYJPcUbt+T7t
	gv0jvlEkBlgFIhd60bZwdSrsDS++8uJHd1Ls7p2vsoOFiNryWZQlKU7klD6Cu571xaOnGvp6Hu/eo
	9PNHRXvgpWgVzUwSlqxAJVAEDnu7s3gznQ2pPNf0gQS5oJ7Bz42CX2sTb3t2ZPSjetZibXWgBB03u
	tIfjQKdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNop1-009YBO-Ly; Sun, 21 Mar 2021 03:32:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNoow-009YAr-7L; Sun, 21 Mar 2021 03:32:09 +0000
X-UUID: abd9972a83844f14912a6e8be71da389-20210320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6kF4TLpbGaCmO2x60E8haF2G5zCgzsKAb4l1mJBZOiw=; 
 b=Hu6YDGJdTG6iArMgHJ/I2O/RVLYVIDQLI6s5WzKxF3LWSuYBOU3c3tZ3czw/T4ldTRTcv1FkzTtp3IXg8AF/5uYHBlbUvmbj0gm7fEasduLdmKJMbfY3iwro3P8K3VCGmISnyDLBnyaQS0LCt61lfO8VUWcGvJGLbHeRaxhRmbk=;
X-UUID: abd9972a83844f14912a6e8be71da389-20210320
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1579386833; Sat, 20 Mar 2021 19:31:57 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Mar 2021 20:31:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 11:31:54 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 21 Mar 2021 11:31:53 +0800
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
Subject: [PATCH v2 0/1] Mediatek pinctrl patch
Date: Sun, 21 Mar 2021 11:31:49 +0800
Message-ID: <20210321033150.15380-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_033207_124145_2D93AB89 
X-CRM114-Status: UNSURE (   6.76  )
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

Changes in patch v2:
1)add mutex lock init in "pinctrl-moore.c".

Zhiyong Tao (1):
  pinctrl: add lock in mtk_rmw function.

 drivers/pinctrl/mediatek/pinctrl-moore.c         | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 ++
 4 files changed, 10 insertions(+)

--
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
