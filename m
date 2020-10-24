Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B3EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 06:51:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A0E20829
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 06:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mEAvq+pg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="djoDf9K8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A0E20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mWe94/tva7t03P12Gcrgu2aUH06LNnrEYHMUP7mDpEU=; b=mEAvq+pgW6Fq6kntH1irmG1hT
	bikCN0nODfpw3nY1BqEtno6vrJoEDFhU2qIhEwXB29LiDZrYzCg1WY1ec7jXm8AhSuQH2HktnHUg+
	9CL5T62vB9zJqOR4ssmkdpMjZqy9FIIJNdOzLF5qEXZVmVIdYZcs0poE+K+vX+0YzQCtsF6d71axn
	74zqpnP06fgjqy0TWzyBGi9ReFmtt8Q2/h3wkz0dycmdqrjJkdmBAFqYxloGgiPzWh7+EsBcE/+Bu
	9/ZFY5JOKZWFN6JEijCPSLMv0+AWA+W0YsO0FzKCR1s9kteqtkKwXOoVISyKkDDL299KKKf6vK9Z4
	yq2Sa3Tbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWDOx-0005Rh-Ka; Sat, 24 Oct 2020 06:51:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWDOt-0005Qh-Ct; Sat, 24 Oct 2020 06:51:40 +0000
X-UUID: 9d96956bf17c47a3b70ad6de07cfb814-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z8uG4a3bYliZ7FsgCx8o/eOtrJLS0cww4SngmK83wEA=; 
 b=djoDf9K8nRyrU9Vt5oEHrHdVZaNaEyHIqQOLdV+uXwkOVhmnqmSXE3r3MAw8RyJu2L3e6qpe/1rh0n0/QY6MRwn63hIeq643gV+gCH5u/vWL2tDHN2qgeHf9a+VfFxDCDxMq2hLjwbGPqkiYrPpxUXdNHhnj9SpEsVFKK5vF6u4=;
X-UUID: 9d96956bf17c47a3b70ad6de07cfb814-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 59809210; Fri, 23 Oct 2020 22:51:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 23:41:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 14:41:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 14:41:29 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <tiwai@suse.com>, <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt8192: add ul-delay-ms property
Date: Sat, 24 Oct 2020 14:41:26 +0800
Message-ID: <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_025139_642519_41271C0F 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We can choose to drop any length of data from the beginning according
accroding 'ul-delay-ms'.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 Documentation/devicetree/bindings/sound/mt6359.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
index a54f466f769d4..fd2d02c97fe7c 100644
--- a/Documentation/devicetree/bindings/sound/mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -49,6 +49,11 @@ properties:
     description: |
       Specifies the type of mic type connected to adc2
 
+  mediatek,ul-delay-ms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Skip first time data at the beginning of DMIC recording
+
 additionalProperties: false
 
 examples:
@@ -56,6 +61,7 @@ examples:
     mt6359codec: mt6359codec {
       mediatek,dmic-mode = <0>;
       mediatek,mic-type-0 = <2>;
+      mediatek,ul-delay-ms = <50>;
     };
 
 ...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
