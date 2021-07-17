Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE8FC636CD
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 10:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC8A613F3
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 10:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC8A613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kTe/XpuygImHs0BL4xWPIQ6W73YhzhEWK6raFPHAb9o=; b=cneahr98/n1A5g
	QI5t7o/51hyVHQnPgp2Aq6a//ic2BDFUBfCfp9flw4pVcjdrYBGLVADNHXRUFN2ue8vtaHmzOjMX5
	CS1uyHEK4Xi0FOr6qBF1TfO6bc2eHe2YR0ZANoA3y4T4VdmwHo+jMyD8S/ARVS3NhnkjOYoH9I/gV
	gkcDoYLQ2smrX2z+HE8A/CyTo8BaN2WjtsjaIsI4pS0oJkpzsE4jXIQap/otTEp40JjIxzYXHyBJ6
	JERitRtdTYFxbnKjgGVjaK9SMYRPiaScpSr8zDv0sXxDP/d3eM/chu5XIOURx095nm5+NR5lYG4DY
	xN9vv4oznS21q4Ocm9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4hP3-006SiJ-6Y; Sat, 17 Jul 2021 10:18:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4hOd-006Scl-3h; Sat, 17 Jul 2021 10:18:12 +0000
X-UUID: e1d80fb1759943be9bdd89ce81dcbb66-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bejC0oJo6M0QGl8NWqbW6+BcfSDjCX39cXVXXt1ET+I=; 
 b=rvD1ieUclq1m9Tf6P2rzd8mjnZbQCUZXrXOfcYR/FfnM8iUySs/b+ifrUTlZQFjngOyJSCKfa23xk54HH3RfWtueY+U7vHXs3LPbkkNYtnzY5OWNqjkTcIyGFTB11jFpm5toL5INrz/VEoyk1RbmaIAA9ph2Jw/1G3wv4S9N+eQ=;
X-UUID: e1d80fb1759943be9bdd89ce81dcbb66-20210717
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1216915002; Sat, 17 Jul 2021 03:18:05 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 03:18:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 18:18:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 18:18:02 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
 <liguo.zhang@mediatek.com>
Subject: [PATCH V4 0/8] Introduce an attribute to choose timing setting
Date: Sat, 17 Jul 2021 18:17:51 +0800
Message-ID: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_031811_226621_49E28A79 
X-CRM114-Status: UNSURE (   8.30  )
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

v4:
1. Remove the repeated assignment of the inter_clk_div parameter
2. Modify the wrong assignment of OFFSET_MULTI_DMA
3. Unify the log print format of the i2c_dump_register() and drop the extra outer parentheses
4. Place the fixes at the very least
5. Add fixed tags 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")
6. Add "i2c: mediatek: modify bus speed calculation formula"
7. Fix single line characters exceeding 80 characters
8. Combine two different series of patches.

v3:
1. Fix code errors caused by v2 modification

v2:
1. Add "dt-bindings: i2c: add attribute default-timing-adjust"
2. Split the fix into sepatate patch.

Kewei Xu (8):
  i2c: mediatek: fixing the incorrect register offset
  dt-bindings: i2c: update bindings for MT8195 SoC
  i2c: mediatek: Reset the handshake signal between i2c and dma
  i2c: mediatek: Dump i2c/dma register when a timeout occurs
  dt-bindings: i2c: add attribute default-timing-adjust
  i2c: mediatek: Add OFFSET_EXT_CONF setting back
  i2c: mediatek: Isolate speed setting via dts for special devices
  i2c: mediatek: modify bus speed calculation formula

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |   3 +
 drivers/i2c/busses/i2c-mt65xx.c               | 194 ++++++++++++++++--
 2 files changed, 180 insertions(+), 17 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
