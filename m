Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E16C35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE7F21744
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RATWHYF7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="teZkIihn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE7F21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYMJYa1q7Zn323B71ARfrqxgbmYzuNlCeU5hla2I2nI=; b=RATWHYF7YiwnY6
	/Pcr0md7/B33/9vY7mmkZLBhcTJPdRfbNEuWbIYah6idR9aCIZMnpuwCiDqs0vbHUwnSu8dzvOkLh
	Pdre1yNoybB9J6Sd99dC7UHgpsmTiu45/HQ7UZ3qsKZe4MOiXj3rPzizwAQ/XaQtRYyJgXz7v+/x8
	ZUyqcwelGR2OpBVzqX1pnyyCf2ANYYUjU3v0okxWh3IHeo0WIB3OQs/mZWZYviuh2+8jDP+u1ZRao
	NjY7bXdgFvL1tc7xEuR5vad0dimyQHrwG8dAEa1O6L+qodoW1nELDLNVTPJFMLX8eDwGI+p5AlZop
	vn4crH84ZJg5vjbSwf5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Wt7-0005xq-LK; Tue, 25 Feb 2020 09:52:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Wry-0004xN-IX; Tue, 25 Feb 2020 09:51:16 +0000
X-UUID: 7481c948982744e5920c8fee712958d9-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+9UHoIzAdnK80c9BwL+nHRfyx1ClCc92Z6SatpYKDaQ=; 
 b=teZkIihnvPFB9jPlSPdL3kEank0tpg+L3SYNHhbJ6HWme6ps1I8sufj3HqU3bUk8AsbHLL78YqrIlb9vGh4fTj+l+P8yd1FcT0dZvSg3ka7s1R6UUwIBgHW/soQixexPqjEBQ93ZjSgfPrH9TqlKdsvmaw1RoyiYAURgz07ysFQ=;
X-UUID: 7481c948982744e5920c8fee712958d9-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 379302652; Tue, 25 Feb 2020 01:51:11 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 01:41:44 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 17:39:45 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 25 Feb 2020 17:39:45 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/7] dt-bindings: media: add pclk-sample dual edge property
Date: Tue, 25 Feb 2020 17:40:51 +0800
Message-ID: <20200225094057.120144-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200225094057.120144-1-jitao.shi@mediatek.com>
References: <20200225094057.120144-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CDB7FC69F9E163707809811DAF93E1FF2E6374A0B1821E44F670BB6E4DC42DE72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_015114_631717_9EE11857 
X-CRM114-Status: UNSURE (   9.89  )
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

Some chips's sample mode are rising, falling and dual edge (both
falling and rising edge).
Extern the pclk-sample property to support dual edge.

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
