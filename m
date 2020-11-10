Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32DCC5517A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 02:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F58D205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 02:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/ZhbuW7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YJGyUeUK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F58D205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yed2zq+C65kiT7cIUSKTkNSq/4B9zLAZLjwc+i9ROl8=; b=o/ZhbuW7P23q6Bt+wNyS+XLOE
	anyEyVsHnOQ92DMQfvNULzv1vBPs7rAUQl4DHxZQxX6E2pYC+rgjA/2b7K88/k4NKerp76gl5zudr
	vOUnS3uFg+hSj+VYuhZ3bfDFbfFRpnY87xJhereV72dqZSZPmE/J15mAKPegWIUrJxp9WF8ogkTn7
	pDY0W61LWRUp+27IF3FHinPENt+h8kskT146QQSV7ADKhe8C6ypis27diH1k0GBdIfKoTdTbSI2px
	0JGzm4HsYeuoeLi6EZJy+lYlaE+aelVxkrbuiI6hfjEwdfzDgyWyKfiTcwbji4o7YR9JBle2FXPH9
	pcBC0tbPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcJRq-0000QY-3t; Tue, 10 Nov 2020 02:31:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcJRj-0000Ni-OD
 for linux-mediatek@lists.infradead.org; Tue, 10 Nov 2020 02:31:50 +0000
X-UUID: 588d78022eb0491983eac77adc3ca440-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bfB8uRS9X8aESx2umkW0vBndZoRP0giOPAWPrpwyHvE=; 
 b=YJGyUeUKJSPt35nB2iGoCIBWvVjMMxZjPju2FEmfwoMeA69bhoKMOyiXcmXwopMpFNOw+yHlO5kVqkywovX0p8y9Jaf/Oqe0fQKc7PvgxqTVlKzZFtiYtKgklQUYWoURUvKwDHGGk5BqozwwT0IjPFEnvy6G0dcNmbUuBulrpH4=;
X-UUID: 588d78022eb0491983eac77adc3ca440-20201109
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 406309141; Mon, 09 Nov 2020 18:31:45 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 18:31:44 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 10:31:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 10 Nov 2020 10:31:41 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH v3 2/2] dt-bindings: mediatek: mt6359: Add new property for
 mt6359
Date: Tue, 10 Nov 2020 10:31:32 +0800
Message-ID: <1604975492-6142-3-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604975492-6142-1-git-send-email-shane.chien@mediatek.com>
References: <1604975492-6142-1-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FACEFA9603373427B634BAE8CE32DDF62F07EE1ED3D97E0FBE505E2C7E028E6D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_213148_010858_62EFD04F 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

This patch add "LDO_VAUD18-supply" property to
control vaud18 regulator. It is labeled as required
due to mt6359 audio path always need to enable vaud18.

Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
---
 .../devicetree/bindings/sound/mt6359.yaml          |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
index a54f466..ef027c7 100644
--- a/Documentation/devicetree/bindings/sound/mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -17,6 +17,11 @@ description: |
   Must be a child node of PMIC wrapper.
 
 properties:
+  LDO_VAUD18-supply:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Regulator of LDO VAUD18 at 1.8V.
+
   mediatek,dmic-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
@@ -49,11 +54,15 @@ properties:
     description: |
       Specifies the type of mic type connected to adc2
 
+required:
+  - LDO_VAUD18-supply
+
 additionalProperties: false
 
 examples:
   - |
     mt6359codec: mt6359codec {
+      LDO_VAUD18-supply = <&mt6359p_vaud18_reg>;
       mediatek,dmic-mode = <0>;
       mediatek,mic-type-0 = <2>;
     };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
