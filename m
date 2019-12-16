Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0D7C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 08:39:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80579206A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 08:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taWNtr3s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DoUu7D77"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80579206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oT5QP8anyh5s1mOsb0TtHRZmm7+tcIK6ucIe6IsZCLQ=; b=taWNtr3sRKwctx
	6x11xeSef+vjVPgIi6xvr81UNMQ7sJDkxoJ72/OVsd+57BrHTZJx56vxEjon/PVx/tM3Ky2ucW2SW
	LbVNzokkICA1773p2WJ1ydISpoyD/FS3YlKN+pfjq1bjIxfBjWxIC37NM+zk3Rl1uGnZj1NEuZjf1
	r0XD2Wa8vLItwmsIcQMZ3hY+mp5yn7CJeA+b1uKz8wG1d62roQZ5dd0PjfSqWEUr5RQ2JhuiDsDg5
	P7lLC5OTLWNzcXQktDpcYwLh9ZMTlM3rKqQ4QwdOX5QilBw1OWeNVFOwG2SPq6Qx72HvOkYi7t/0O
	R9cJdICjRiwHflhqc4VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iglup-0008M5-Ue; Mon, 16 Dec 2019 08:39:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iglun-0008L2-3B
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 08:39:42 +0000
X-UUID: 3d89addaba7249e8a75ca1bd4771eb7a-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uG/aJuarO3hgV1jRiJvimGDQyEGjg4zprETLw6mHtxc=; 
 b=DoUu7D77r/sG+/NXQhk0raeS8n+h9qBzFOa+dDFaL2KEsyq9dqVE56MDt4pQHDErZl8WNO4XS6f4HtSRffJIS00dfcbtsgQz7mMBmwd5UzLzh7o7rwYMXq/Ae5AO6dGKhHpHuFQiNoHgAFTRjvdOxdMIPZ6mylPu//MnYcYFXec=;
X-UUID: 3d89addaba7249e8a75ca1bd4771eb7a-20191216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1375053874; Mon, 16 Dec 2019 00:39:38 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 00:29:52 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Dec 2019 16:28:39 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Dec 2019 16:29:16 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] dt-binds: display: mediatek: add property to control mipi
 tx drive current
Date: Mon, 16 Dec 2019 16:29:34 +0800
Message-ID: <20191216082937.119164-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216082937.119164-1-jitao.shi@mediatek.com>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B23DFF23995B9CDFCB207E15F6E7F0C50AA063A049411E85C7C953E59BA85AA32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_003941_144024_292EAC60 
X-CRM114-Status: UNSURE (   5.54  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a property to control mipi tx drive current:
"mipitx-current-drive"

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index a19a6cc375ed..780201ddcd5c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -33,6 +33,9 @@ Required properties:
 - #clock-cells: must be <0>;
 - #phy-cells: must be <0>.
 
+Optional properties:
+- mipitx-current-drive: adjust driving current, should be 1 ~ 0xF
+
 Example:
 
 mipi_tx0: mipi-dphy@10215000 {
@@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
 	clock-output-names = "mipi_tx0_pll";
 	#clock-cells = <0>;
 	#phy-cells = <0>;
+	mipitx-current-drive = <0x8>;
 };
 
 dsi0: dsi@1401b000 {
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
