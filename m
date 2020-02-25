Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C90C35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:48:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FBD20CC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8rs1bOV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Zcb+sFn7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FBD20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGQxmG/F9wEf42pEykn0OM7qwMh13/CNPOd3hXgPO0g=; b=I8rs1bOVJ5dZrt
	d7YhnVK7n3Tr7zWdCmJQMoUsZCOPSCFKbTdNyJEn1WLSCIfRcsIq6lvnWQzRqYsh2Ts9B0PxuFd6D
	4ypU8LrPyOMYtUuQYKMm0vt75kS3uWqOcTeXJxTUuj5yX/f57x3AydOc5NrBr70ewe5L9+vCOe0bG
	uCEVnb8X7GC3rYSjsoQRsdlzaeat2OqKoKqt83zasJ4aqkRv5Hi/0unDAlm3fcrCxVWhI/qbSqkIp
	uDoYSy9LWkHF2jTa26LajgsQcL/IJihqrlzlstBiQ5ObxFAj8hZNRy7MddzFDHtBbH2ndP3BVfX3J
	sINSSQRzbYbBb6K4kdPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6YhJ-0008JW-S4; Tue, 25 Feb 2020 11:48:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Ygo-0007p5-7D; Tue, 25 Feb 2020 11:47:52 +0000
X-UUID: fbc1384b253045b8848c7f4d684da099-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=39ui2Wv99GeSAlafK/9HYk45gaD1Wuxeozd4Opspg4c=; 
 b=Zcb+sFn7eztRNcILpfmwWXSazfCYE4Hus6AKWm1782CYimlDTwsEc2saoZP7Jqes3qFaTEgEfAU3xl2EBO083brcXHJ0lkF4vZAGYvgyxdiaIyJQK6hR33fQyL6CbUQJQ10w6XvhMZBgRLGCnip+/S1d4+M68aA+al0T+cCuepI=;
X-UUID: fbc1384b253045b8848c7f4d684da099-20200225
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1424336683; Tue, 25 Feb 2020 03:47:43 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 03:48:18 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 19:43:44 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 25 Feb 2020 19:46:19 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/4] dt-binds: display: mediatek: get mipitx calibration
 data from nvmem
Date: Tue, 25 Feb 2020 19:47:28 +0800
Message-ID: <20200225114730.124939-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200225114730.124939-1-jitao.shi@mediatek.com>
References: <20200225114730.124939-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CE2C1B199D80B5DA7756133ED194042CE19C7AAF0C02D93751A82EB184EDC9BD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_034750_401388_59DA6B6D 
X-CRM114-Status: UNSURE (   9.24  )
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

Add properties to get get mipitx calibration data.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index 780201ddcd5c..7f12eb729791 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -34,6 +34,9 @@ Required properties:
 - #phy-cells: must be <0>.
 
 Optional properties:
+- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
+               unspecified default values shall be used.
+- nvmem-cell-names: Should be "calibration-data"
 - mipitx-current-drive: adjust driving current, should be 1 ~ 0xF
 
 Example:
@@ -45,6 +48,8 @@ mipi_tx0: mipi-dphy@10215000 {
 	clock-output-names = "mipi_tx0_pll";
 	#clock-cells = <0>;
 	#phy-cells = <0>;
+	nvmem-cells= <&mipi_tx_calibration>;
+	nvmem-cell-names = "calibration-data";
 	mipitx-current-drive = <0x8>;
 };
 
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
