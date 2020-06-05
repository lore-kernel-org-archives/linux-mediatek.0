Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3736C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 10:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E2520772
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 10:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QjuKmtbN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="imIUKZaE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E2520772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3uZ/G5ziby6YdU92IvK5txbzYdflM5Dny16zIrbGrk=; b=QjuKmtbNBDvLar
	p2flUDPEKzYyEZo4QbkcJD/zjOyOfYxhe195KugVqh3x+GHBp64a5aYAurvu8nsvnh8ZnkdyoYmBj
	+QrPDqtq6Bn3ofDDad4H6/F7m0+O3kBoW75zTFMifRBWxWUQv0mRgM7jriyr3sEXRs1z0DGTszc4Q
	dtamimqC3Fcz6k7bXBywD0o46XeRiT0vQv67QtMsUkVWpNV6Q74zQDDRSUbgOUm7CQT6YpMcVgFI2
	WmbDsmLbnGqSQd5cPsy3JIrnowbZ6uqfYv1dY1az3zPdxG6UrI3WWr7cIe/noR2eRTeUr5v6aAuE/
	v8lHvnHR4NSs5X2VxMhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh9rg-00027p-2I; Fri, 05 Jun 2020 10:46:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh9rQ-0001mn-I8; Fri, 05 Jun 2020 10:46:05 +0000
X-UUID: f69a7b185c6c48cf877363af0c3e8359-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aftpXunH1eDQjPXFO8QI2IEzKcVO0kd6k1ZnXlRllyc=; 
 b=imIUKZaEboJB+oYJioFi8Jf7gpXIPl8fkBtXskcquOfpS1GrHlHu5Tm/rk4clIdBrfK0XgRD8I8Ll4/kG6CaK053VqtXv+HpFhexz8/jQWaVWOa85syyuFQDnqMocVEckNyTK9NG1UecQHmimBO6gC5yuX7XwiOqxGtQLST99O0=;
X-UUID: f69a7b185c6c48cf877363af0c3e8359-20200605
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 986301331; Fri, 05 Jun 2020 02:45:51 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 03:35:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 18:35:51 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 18:35:49 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>, <hariprasad.kelam@gmail.com>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: mediatek: mt6358: add dmic-mode
 property
Date: Fri, 5 Jun 2020 18:33:42 +0800
Message-ID: <1591353222-18576-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6D503AACFAC6336B1F99D24FEE7774998F44BBDEEE0678BB989AFCEBCD95E0C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_034604_622339_9A344415 
X-CRM114-Status: UNSURE (   6.16  )
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
Cc: alsa-devel@alsa-project.org, howie.huang@mediatek.com,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds dmic-mode property and updates example.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 Documentation/devicetree/bindings/sound/mt6358.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt6358.txt b/Documentation/devicetree/bindings/sound/mt6358.txt
index 5465730..59a73ff 100644
--- a/Documentation/devicetree/bindings/sound/mt6358.txt
+++ b/Documentation/devicetree/bindings/sound/mt6358.txt
@@ -10,9 +10,15 @@ Required properties:
 - compatible : "mediatek,mt6358-sound".
 - Avdd-supply : power source of AVDD
 
+Optional properties:
+- mediatek,dmic-mode : Indicates how many data pins are used to transmit two
+	channels of PDM signal. 0 means two wires, 1 means one wire. Default
+	value is 0.
+
 Example:
 
 mt6358_snd {
 	compatible = "mediatek,mt6358-sound";
 	Avdd-supply = <&mt6358_vaud28_reg>;
+	mediatek,dmic-mode = <0>;
 };
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
