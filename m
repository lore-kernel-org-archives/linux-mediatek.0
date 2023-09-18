Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E6CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uHsu3Eqwtl1M3GjX8oxxn7y+/iEMCg0M96+ml3ZcRks=; b=r3kxeOUfkgnMX7/n9inPXVFFRL
	wUDPKeKD3I/GMcz2WTmyxZp2OdBsRaaMiNQtKO6dzfyejnQWGq0x2qLGhpyGA51mcUKjndZqE6UTH
	DmSnIO/Xv7p0GXD8GaiBHj02z5O+WFqvs+PAIIF6xPvqKT8wsw5h7Etol2qrsoviNmIp+vRha3uJC
	KMcl7nVgXnMLRMeWHz3s7kyIEwsQDwKAl/fQ5mnnKaBAGfUUdtJ7SaUSVVZS7wo+lNN92cxd0vB28
	vQivk69HEYxL0kN9KKY0KAfg0rTnBr+i/+arV7P5ATIg4TPvPtvPqpcznalRIKJAdAUnr/ADopp54
	/EqDp61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi7De-00EVHu-1s;
	Mon, 18 Sep 2023 05:54:50 +0000
Received: from ssh247.corpemail.net ([210.51.61.247])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi7DZ-00EVEZ-2V;
	Mon, 18 Sep 2023 05:54:49 +0000
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id NEU00124;
        Mon, 18 Sep 2023 13:54:24 +0800
Received: from localhost.localdomain.com (10.200.104.41) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.32; Mon, 18 Sep 2023 13:54:23 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <linux@armlinux.org.uk>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>, chuguangqing
	<chuguangqing@inspur.com>
Subject: [PATCH] The Kconfig help text contains the phrase "the the" in the help text. Fix this.
Date: Mon, 18 Sep 2023 13:26:20 +0800
Message-ID: <20230918052620.243394-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.41]
tUid: 2023918135424e7e62442672a3dfd332ceec2984494d3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_225446_324561_B97254B1 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9557808e8..2321be76a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1563,7 +1563,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1701,7 +1701,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.39.3


