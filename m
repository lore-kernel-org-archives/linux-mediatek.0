Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C380C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:24:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4931920855
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tvO4S4oF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nfgAqCib"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4931920855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BGul/P2YxXC3u9aDRFuLzlZkzxqQRn9oEGOWkd0pzD8=; b=tvO4S4oFZEpP1SrElf/JeE5zzA
	NI5Y3h7bFqQndLEAdnjGpUX1dlsmf1O82vPV99BEutL6JBCCJTVLywfKhPr4ezoorWidQsvXpG2vg
	74KJwf9G75MZ8tQmxgh2gQuaDtwjXEqHGuU9vzpKySJAPbnjNJPVu20CEpOl0C3vpXfzNrCNo3h5M
	PFlZ8oyTF/WjuVIE2Nrkjhf1pVjAel7TT+D35H6Kya8xhFjvRjMNRDcyh5aYfwrqRZPy3e8x6IxuE
	Q1oq5OjmNZlYi8fHbGbXjmH4YhWndJcZnrIhT9b+CfxUpIl2ko+oNbpTg6cLAfh9+vfm2vd2Epw02
	BpPDPX4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Ei6-0001PA-KJ; Wed, 19 Aug 2020 03:24:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Ei4-0001Oa-3M; Wed, 19 Aug 2020 03:24:21 +0000
X-UUID: a43668395d9a4d128ad2c6a47c165a21-20200818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=UxB7ApOkoLV9jry6E7aNdOJqE9r2yvKOn5SkQhZ+HoI=; 
 b=nfgAqCibIacJhHF1+J21qX7pLK2QjJ2D2Mvw0/6VPPw6pk67eH5swD+mGr2l1LKbIAl47sA5y7H1ZR4MOsjprXFDWYbX1vtSVuIwsMVJg5hXWo5rCyfC5cpOYHeR/erV9VsSeaNpJvFXEHJgx/3CWCzFmG9bEcXj6JzAiE8ijz0=;
X-UUID: a43668395d9a4d128ad2c6a47c165a21-20200818
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1753422692; Tue, 18 Aug 2020 19:24:05 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 20:24:03 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 Aug 2020 11:23:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 11:23:59 +0800
Message-ID: <1597807371.5429.28.camel@mhfsdcap03>
Subject: [BUG] build error due to AGILEX_NAND_X_CLK
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Date: Wed, 19 Aug 2020 11:22:51 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EA7D442FBAEB5FD76A026DBD349CEEFBEE38F2DCEC220290E177F294A39BFA5B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_232420_288102_75AC45FD 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dinh,

   There is build error for arm64:
arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:313.15-16 syntax error
FATAL ERROR: Unable to parse input tree

it's introduced by patch:

commit d4ae4dd346cd49302d157b129ead2f60d3a82534
Author: Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue Jun 30 13:44:37 2020 -0500

    arm64: dts: agilex: add nand clocks

    Add the clock properties for the NAND dts node.

    Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index e300330..ac1b242 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -309,6 +309,10 @@
                              <0xffb80000 0x1000>;
                        reg-names = "nand_data", "denali_reg";
                        interrupts = <0 97 4>;
+                       clocks = <&clkmgr AGILEX_NAND_CLK>,
+                                <&clkmgr AGILEX_NAND_X_CLK>,
+                                <&clkmgr AGILEX_NAND_ECC_CLK>;
+                       clock-names = "nand", "nand_x", "ecc";
                        resets = <&rst NAND_RESET>, <&rst
NAND_OCP_RESET>;
                        status = "disabled";
                };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
