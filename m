Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEB6C3F2CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 08:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B42246A3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 08:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ppYPwEXD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GWPQDj5H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B42246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSARqiEpHDDBGxHYqPSUUmYd0To4ieBoAWntCmPL/h0=; b=ppYPwEXDwaClqY
	BUlPXDg2TF5mzAg1iF8ipeAs9y9MzJuoTXBRr4FMS0UrRmLo4LAmdcl/uKib8aDE00Hu3u3zDuK0H
	jP5pfvle1euoxBZIhK1OZMr27AdduVgLXcU2cuWd3HZZ2OnNBT2AYUfAqWr6mr8oTkjhBv2c9Qeqz
	I3RL5DeIcDX7nPPycCZj8aGC/35J/CUjc5HSsytGjH8JuSCtyjgbtk2rAYnUutbv2zBwfpMXPIexO
	KLfp3hw/hJOFBl6p2IWa5KJ/5RwpbQGjfW15QXOdwKpXL/8JVOpwSBghqCNRCrGFAUE8j8xei9ld3
	SBKzQi23dbM8h95LC2uA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ao1-0004MP-TG; Fri, 28 Feb 2020 08:15:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7any-0004F4-7i; Fri, 28 Feb 2020 08:15:32 +0000
X-UUID: 19b6c62388f84518bbfcf31899f598a4-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Tbydff45iGovy+Y4pjIMl85obrLQehvyczoepJ8vfGk=; 
 b=GWPQDj5HSmo6isC2wgMpOGgJfprlDURFOfpym3tzrpwhlkTwU/HX29RvOI6v6A1B7CTXExsWpHNHfqDEIo1hCXk+fDRx6aETmGzTlwAzp3HdAVQm5dPY4wZVaTLTJ4huoh+frGPDRN4Plz1GhBu7AeM/pR0rDVgk3ySopodkI54=;
X-UUID: 19b6c62388f84518bbfcf31899f598a4-20200228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 959919619; Fri, 28 Feb 2020 00:15:20 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 00:16:01 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 28 Feb 2020 16:11:04 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 28 Feb 2020 16:15:31 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 1/6] dt-bindings: media: add pclk-sample dual edge property
Date: Fri, 28 Feb 2020 16:14:36 +0800
Message-ID: <20200228081441.88179-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200228081441.88179-1-jitao.shi@mediatek.com>
References: <20200228081441.88179-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C4EC0BAD58171A37724C1E29B2A853F904ADF8554BB626EB8C789C3FE532C6412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_001530_301439_C5B9C236 
X-CRM114-Status: UNSURE (   9.28  )
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
 srv_heupstream@mediatek.com, Rob Herring <robh@kernel.org>,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some chips's sample mode are rising, falling and dual edge (both
falling and rising edge).
Extern the pclk-sample property to support dual edge.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..da9ad24935db 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -118,8 +118,8 @@ Optional endpoint properties
 - data-enable-active: similar to HSYNC and VSYNC, specifies the data enable
   signal polarity.
 - field-even-active: field signal level during the even field data transmission.
-- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
-  signal.
+- pclk-sample: sample data on rising (1), falling (0) or both rising and
+  falling (2) edge of the pixel clock signal.
 - sync-on-green-active: active state of Sync-on-green (SoG) signal, 0/1 for
   LOW/HIGH respectively.
 - data-lanes: an array of physical data lane indexes. Position of an entry
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
