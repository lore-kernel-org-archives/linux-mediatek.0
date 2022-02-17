Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJhlAsPZYYKqT0zaFjjb4ER/ydMW7upo5zSB/oH6/3k=; b=i+C7vPEWEOd66G
	K9OJsj5Eyb1RKuVjoUcdanXdUHmAEQApii6dHOZ8sdOCjdx3X2ZTitzOKIP+32CzO3Iwv7sWbkTdP
	CZyq/cejTGOsttlSLXiMi1K4ajFCGj2uEdMzUx15M/C3X63eaKC0pEvPQqhFgJ9Ac/wtJycNb2jvk
	vNODQ28VPVNnqBrU8Q1f6aht4Rivdm56sxZFDPwce9qBONjIgQREX0AAXgKwpbMy03o+nM4T3bTCu
	lIZ94Vzg8KyTVNrhjhSbF/JB+cVLcCzYMhXK0BNq2VA5WvLBPXe4cC20eqVl1FtxJSr6xm5TvQpd7
	v0X1NUEC2Iz+stKhKn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKfoW-00AQhV-Lq; Thu, 17 Feb 2022 12:23:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKfoG-00AQbr-I2; Thu, 17 Feb 2022 12:22:58 +0000
X-UUID: cd1f41a76ef140d8bdbeb5fbc56dd1cf-20220217
X-UUID: cd1f41a76ef140d8bdbeb5fbc56dd1cf-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 801386139; Thu, 17 Feb 2022 05:22:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 04:22:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 20:22:49 +0800
Received: from localhost.localdomain (10.17.3.14) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 20:22:48 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>, <ryan-jh.yu@mediatek.com>,
 <david-yh.chiu@mediatek.com>
Subject: [PATCH v10,0/1] Introducing an attribute to select the time setting
Date: Thu, 17 Feb 2022 20:22:42 +0800
Message-ID: <1645100563-59441-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_042256_626668_EE48E695 
X-CRM114-Status: UNSURE (   8.70  )
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

v10:
Remove the Change-Id tag in v9.

v9:
1. Remove received patch
2. Update ac-timing calculation algorithm to make i2c ac-timing meet
specification and function normal.

v8:
Remove received patch

v7:
Resubmit the patch based on version 5.15-rc1

v6:
1. Add the judgment condition, clear the handshake signal between dma and
i2c when multiple msgs are transmitted.

v5:
1. Replace the previous variable name "default_timing_adjust" with
   "use-default-timing"
2. Added waiting for dma reset mechanism
3. Remove received patch(dt-bindings: i2c: update bindings for MT8195 SOC)

v4:
1. Remove the repeated assignment of the inter_clk_div parameter
2. Modify the wrong assignment of OFFSET_MULTI_DMA
3. Unify the log print format of the i2c_dump_register() and drop the extra
   outer parentheses
4. Place the fixes at the very least
5. Add fixed tags commit 25708278f810 ("i2c: mediatek: Add i2c support for
   MediaTek MT8183")
6. Add "i2c: mediatek: modify bus speed calculation formula"
7. Fix single line characters exceeding 80 characters
8. Combine two different series of patches.

v3:
1. Fix code errors caused by v2 modification

v2:
1. Add "dt-bindings: i2c: add attribute default-timing-adjust"
2. Split the fix into sepatate patch.

Kewei Xu (1):
  i2c: mediatek: modify bus speed calculation formula

 drivers/i2c/busses/i2c-mt65xx.c | 51 +++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

--
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
