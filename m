Return-Path: <SRS0=Ks85=53=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F636C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 07:44:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0D4212CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 07:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TB7emj/p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sB43eeK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C0D4212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lUuCRMrMTpYy/Le1RxtI2OpH426nzG3HMbN/Nq+V2sA=; b=TB7emj/pyC+6C7
	CORn9hxeWLJVQk8TEnw/ZHzOXG/M740Pc/CCrdsRLf0wijvunSYflAFqpeIIcdyJjDexkgUahw53V
	0dz8C/OUNiFMIDCuOwYS+4XfFkycB7lgedzNwRfpypd5fBSQ3lJwGF4gujZaDwNZMJ2wX8De072lk
	x7+vfh62KEja03iYmRUea6uCwc7lQQX3e5OW1tB9JFATvlZsOoonPeeYbdVr5C6lzK+Qa+Jmb+jQ8
	jenRd3LOd+8uS0WSw5/KPQPUK5/IroYmPm7CGJrGZc2nP296uvVZYn3XfF9swakObufQxD4BEbr7j
	lWAeAqpDiBPatt70Z1lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNAoj-00088q-9u; Sat, 11 Apr 2020 07:44:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNAog-00086o-Mv; Sat, 11 Apr 2020 07:44:40 +0000
X-UUID: 97aede480d234d949d204cdf5a5dee0d-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VL/uIEJeOh4V+RzzjIL7SOp5c2Ln6Wq9deMdt7EQdfo=; 
 b=sB43eeK+G0tuhcF5a8a8QM2WBi7iA64YFUJIh4BzIoMkbbmUOFQjSZGk1D+L9+nzcpb+ZJsxGQ/xn5eT1lZFR1l7CBt9m8aH+JWKiUKJrJGwxES+AsV4Sn1YM5T+KNienUyLoerC2V9Ra8a94rqQU+3ZsHN0n4jzMtmkA2ZT9s0=;
X-UUID: 97aede480d234d949d204cdf5a5dee0d-20200410
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 701978347; Fri, 10 Apr 2020 23:44:33 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 00:44:31 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Apr 2020 15:44:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 11 Apr 2020 15:44:22 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/4] Config mipi tx current and impedance
Date: Sat, 11 Apr 2020 15:44:04 +0800
Message-ID: <20200411074408.38090-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F06F78ACE077B8F53AD26555B0EACD516F8A1379DB458BC6BF1268D245B0AFD52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_004438_759273_752AA50D 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v5:
 - remove memset()
 - add return to remove "else"

Changes since v4:
 - add Reviewed-by:
 - move the get the calibration data code to probe.

Changes since v3:
 - refine drive-strength-microamp as from 3000 to 6000.

Changes since v2:
 - fix the title of commit message.
 - rename mipitx-current-drive to drive-strength-microamp

Changes since v1:
 - fix coding style.
 - change mtk_mipi_tx_config_calibration_data() to void

Jitao Shi (4):
  dt-bindings: display: mediatek: add property to control mipi tx drive
    current
  dt-bindings: display: mediatek: get mipitx calibration data from nvmem
  drm/mediatek: add the mipitx driving control
  drm/mediatek: config mipitx impedance with calibration data

 .../display/mediatek/mediatek,dsi.txt         | 10 ++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 54 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  4 ++
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 28 ++++++++++
 4 files changed, 96 insertions(+)

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
