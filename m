Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3BAC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:57:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9562221FA
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3aL32Kq+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nkoqy+XQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9562221FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ti62H0MWUf2sCd681jvJdw8jhBRA4evNt8NMl/XtPoA=; b=3aL32Kq+c7aP9meWyyhxztZil
	4tkrXILrc+c5GglaJ8RLNcOvfXNq9X8EwZ2B/Q/OTTb1VWnrp3AOQKRDOL1F5eHxfZ9UYDr6PBUjf
	b/9Kdnuym5M8P1vDCVQC2EmtJv4F9ka5/kODcJlE8Cme4YEZzIU+TcPevrL3ZOxrySwHRM/R4VOVj
	D0QQ4dbVarlpUdO4bFfH2zgr6Ju/dR/EGc6Pb561dKtvcsKI6s7DxnH4tMpdPYLBTGQ6sPRQHrHc0
	VWGumMIPUS7Y2e+AMofmQpMvixaGCuXQUURJvlcpcYaQ2V213QHt/ci8Y3Vt1cRUDsR1VsKtKBEyl
	n3jOr2emg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayUs-0002hJ-Fj; Fri, 06 Nov 2020 09:57:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayTq-0002F5-7X; Fri, 06 Nov 2020 09:56:47 +0000
X-UUID: 3012c31663724dc88955e3436355c3ef-20201106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nZF0DdsIJwxWtcW9KIrcWb3w3fQkXokXC3HEVud4yEk=; 
 b=nkoqy+XQf4ZiCEDiql0f1zL2xvnaBwr+gSkITYsqhZpxXnh6ktFJVtTzKwRVjZyODQsj/CPFxl/rb5RlT1SZQtDBZV+7EYYy4l20G/s69aaG3X/kEL1DW0Inbt1IZoth8rRnIcEubq3IY0FROzaCP2OGQOtbGZ7jqZrlc/br7OE=;
X-UUID: 3012c31663724dc88955e3436355c3ef-20201106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1975537601; Fri, 06 Nov 2020 01:56:23 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 01:46:21 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 17:46:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 6 Nov 2020 17:46:18 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: mediatek,mtk-xhci: add str-clock-on
Date: Fri, 6 Nov 2020 17:46:04 +0800
Message-ID: <1604655965-22418-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_045626_516058_2DD33F3E 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Ainge Hsu <ainge.hsu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Option "mediatek,str-clock-on" means to keep clock on during system
suspend and resume. Some platform will flush register settings if clock has
been disabled when system is suspended. Set this option to avoid clock off.

Change-Id: Id841f58e9d7fb3656511072b3eb14d0d355e2dd5
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
Changes for v2:
  - Rename "mediatek,keep-clock-on" to "mediatek,str-clock-on" which implies
    this option related to STR functions.
  - After discussion with Chunfeng, resend dt-bindings descritption based on
    mediatek,mtk-xhci.txt instead of yaml format.

 .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
index 42d8814..fc93bcf 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
@@ -37,6 +37,9 @@ Required properties:
 
 Optional properties:
  - wakeup-source : enable USB remote wakeup;
+ - mediatek,str-clock-on: Keep clock on during system suspend and resume.
+	Some platform will flush register settings if clock has been disabled
+	when system is suspended.
  - mediatek,syscon-wakeup : phandle to syscon used to access the register
 	of the USB wakeup glue layer between xHCI and SPM; it depends on
 	"wakeup-source", and has two arguments:
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
