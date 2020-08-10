Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED4DC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 03:17:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A0D2065D
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 03:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="03euZ7uF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D5ndVrMO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A0D2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jkm5BU1WHfK2X0zk3bsaCsoqSISjLCZMOdIpyZ00D90=; b=03euZ7uF8+Uq+7ntZuT6bxhdn
	UGkd9L37p8mYgcmercFWgdkY2+oYIvREl4BA/cu+TLsLtQ2hi2lidQw6ils54RkkuEIk6DX92VeVa
	npE7HJ5DfeIXwq/bAsiQm63p6i4ygvwIdAn9wIKhS12koWofnRTmmFD15+q36cWvYr9MWZp4bb+bc
	yNNWOLrvqDgEamtYqwpSdYrw44s/uz03dXfxEWjjxgs1nCkRxqZuoL6PtmiMkvn66NfHsOQc0LS49
	vykHVyzw2KnKwdVRytfgt1JlCXbMcBuDbCI8GkAldREdx33f1OQAm2HFai1DTScGP3Bq9uSfvmVM8
	fpGTeForA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4yJ9-0001uj-Hj; Mon, 10 Aug 2020 03:17:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4yJ2-0001sw-7F; Mon, 10 Aug 2020 03:17:01 +0000
X-UUID: 64d669fc6fd04d07bb34657dcb263500-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n5K4ha85DkZyz2NR99rNXSJw2MdSeUvrAikKRNypFvs=; 
 b=D5ndVrMOxpEPRJwKxgh5O7/NBrLyZ8to7+BMcfLCOfceNKo/TovZ7lH7GX0m5aM6RGdmZqiWjur5W/d6lyDiwvK2R2VcjixtQnf5zawsQRT4wAn6/sx5AeaMCyJsmOv0+jRpbKJcuR4W6pP8mRtDXjkQ2Fk3p22JnX7XSAcSO6M=;
X-UUID: 64d669fc6fd04d07bb34657dcb263500-20200809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 77355333; Sun, 09 Aug 2020 19:17:08 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Aug 2020 20:06:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 11:06:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 11:06:49 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: mediatek: mt6359: add codec document
Date: Mon, 10 Aug 2020 11:05:54 +0800
Message-ID: <1597028754-7732-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_231700_479495_4BB3E7DE 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds MediaTek MT6359 codec document.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../devicetree/bindings/sound/mt6359.yaml          | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
new file mode 100644
index 0000000..cd59dbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6359.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6359 Codec Device Tree Bindings
+
+maintainers:
+  - Eason Yen <eason.yen@mediatek.com>
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Shane Chien <shane.chien@mediatek.com>
+
+description: |
+  The communication between MT6359 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+  compatible:
+    const: mediatek,mt6359-sound
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 0 means two wires, 1 means one wire. Default value is 0.
+    enum:
+      - 0 # one wire
+      - 1 # two wires
+
+  mediatek,mic-type-0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies the type of mic type connected to adc0
+
+    enum:
+      - 0 # IDLE - mic in turn-off status
+      - 1 # ACC - analog mic with alternating coupling
+      - 2 # DMIC - digital mic
+      - 3 # DCC - analog mic with direct couping
+      - 4 # DCC_ECM_DIFF - analog electret condenser mic with differential mode
+      - 5 # DCC_ECM_SINGLE - analog electret condenser mic with single mode
+
+  mediatek,mic-type-1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies the type of mic type connected to adc1
+
+  mediatek,mic-type-2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies the type of mic type connected to adc2
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    mt6359codec: mt6359codec {
+      compatible = "mediatek,mt6359-sound";
+      mediatek,dmic-mode = <0>;
+      mediatek,mic-type-0 = <2>;
+    };
+
+...
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
