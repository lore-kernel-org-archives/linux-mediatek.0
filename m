Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1D8C282DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 15:00:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D2620721
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 15:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OWMAZFNK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyIoNDR0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D2620721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1y53NdGp5/LYn2Ku5uIG8fxFkDuDUtXzdfgRifU1ff4=; b=OWMAZFNKSjzfZe
	1DxLysQ/lKQobdVXx/5yh0gA4Sy90oBvmkIk9KqRFghzQj/aQhEYpr24CLY32FiGo4p5Eval03ZRe
	Yld1AQWcCC986ODNKUOXfdL3hIDXRRXiA7vnpQoVo9XLqj2ioycTWXLQoLwbRmD97gn4huiHMMgye
	ZfY6pqWZZqkjG+j3/u/Pc2HpLXgGtiTf6edlzfwWxQnAQBzDnELrXyFcnYT4MWm9oZbfvQBjPz2fJ
	2OfhhlaAwtWZrxUPB3sggVq6Tuh+Uo9nEre3FoGXw3+r8RWfs5XleBVelZKcACErXT4HPGVTmmDgP
	Zid8PK9Nkl13gOTeLlNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipvlm-0002UO-U1; Fri, 10 Jan 2020 15:00:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipvld-0001Vw-LD; Fri, 10 Jan 2020 15:00:07 +0000
Received: from ziggy.de (unknown [95.169.227.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66F8620721;
 Fri, 10 Jan 2020 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578668404;
 bh=uEFWL8Sp0xQJUtMRMWMVwcDeHzR9cLPTg7JzfnCCzmc=;
 h=From:To:Cc:Subject:Date:From;
 b=lyIoNDR04h6TwzT8PpJpApOSLC6PKjoSIeo/vkcNB0+YtRsOnbLqZiVEwDAclxzJO
 DSQnte96xky5o4rWq10SZZohQx3tFDPBM2LV2QSlZcTaWMKabCkMEM6PLRWqIcEWPI
 dUu5Zl1X6molO3iwqX6F97nF1GlQguu1zdwbnpts=
From: matthias.bgg@kernel.org
To: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] dt-bindings: mfd: mediatek: Add MT6397 Pin Controller
Date: Fri, 10 Jan 2020 15:59:51 +0100
Message-Id: <20200110145952.9720-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_070005_723885_871C1E26 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>

The MT6397 mfd includes a pin controller. Add binding
a description for it.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 Documentation/devicetree/bindings/mfd/mt6397.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index a9b105ac00a8..ce22fca9d48b 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -54,6 +54,11 @@ Optional subnodes:
 		- compatible: "mediatek,mt6323-pwrc"
 	For details, see ../power/reset/mt6323-poweroff.txt
 
+- pin-controller
+	Required properties:
+		- compatible: "mediatek,mt6397-pinctrl"
+	For details, see ../pinctrl/pinctrl-mt65xx.txt
+
 Example:
 	pwrap: pwrap@1000f000 {
 		compatible = "mediatek,mt8135-pwrap";
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
