Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB609C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:19:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCF022571
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCF022571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ZGIL5i/S8WVRTXeybNUhyhezRVWlvlhROzl+qwpDJY=; b=N5DrWmf2giPhOYpwrsyLkMKcT
	nulohLK8JnQyXjGJQs+39Zo0f/JalYgJcnOgq0XlqZrPyXNXFA/aVbfRnX4STCQ5gDxB+F4sHNyYf
	zcJVcmOKoU4OlLOv0iwtuDmkWhHlxtU53w460eMVf1R5zp++5YASPQ9YGcbefKwAwljhhei2Se/E4
	4Blz4UdeXka025OO5BUnMiOviGQECayzbfmIHkLmGmYRt5krH9DeryvCprdNoQT7ar9namkox9t4+
	5W7wBNkuCW0HMqumHqEorQiptWs7fLlWKQjiWjtDGjl7ZCzo9s41Oibhk/A/bx75d1gaWum0/9EnN
	6Ng8Pp6OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksJyC-0007wZ-2p; Thu, 24 Dec 2020 06:19:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksJxp-0007hq-UB; Thu, 24 Dec 2020 06:19:07 +0000
X-UUID: 1f80604e94ff4a09a34e4b36f6303af1-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=smHMH2BApkXoZowI6ydV0cxyKu1fTE9/+55Uqf3KP2E=; 
 b=OB45HcLyjplf2ov+iIniMZuV4/r3a6AHvjZnUqVe55WBOU+h0gCVllKkNPdPNVq+OQq5yxcjzvK3i3J7yWzkvBro7QpgIGeEt+S9SHeR1A+Y8eFE34Rfty8DNK4+SCSQ0TtPwAGXWHcqrnQinNoqd6yDBo3gHnU0lpF+yY/17pE=;
X-UUID: 1f80604e94ff4a09a34e4b36f6303af1-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1196770362; Wed, 23 Dec 2020 22:19:01 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 22:09:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 14:08:56 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Dec 2020 14:08:57 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH V6 04/13] arm64: dts: mt8183: add dvfsrc related nodes
Date: Thu, 24 Dec 2020 14:08:45 +0800
Message-ID: <1608790134-27425-5-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 48C396B286C0F85325794947337D5B983FCED17FCD22B454A82C3AF71459CAA92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_011906_202602_467ED77A 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable dvfsrc on mt8183 platform.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9cfd961..06ef8e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -328,6 +328,11 @@
 			#clock-cells = <1>;
 		};
 
+		ddr_emi: dvfsrc@10012000 {
+			compatible = "mediatek,mt8183-dvfsrc";
+			reg = <0 0x10012000 0 0x1000>;
+		};
+
 		pwrap: pwrap@1000d000 {
 			compatible = "mediatek,mt8183-pwrap";
 			reg = <0 0x1000d000 0 0x1000>;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
