Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D921C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 01:26:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AEE220791
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 01:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzeGeTwE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AtD0dyy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AEE220791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a5iSr8fEKn2kQIfzig8ll42ra0FWdXyV7Wym1vCoNRc=; b=hzeGeTwEzOWlwi0s/Fx8gZHqXS
	J1R29T0ELyaXNlouu9RLq6gJcuW4OudvOg6Tg2+hHog5o7N9JRG/sZVq1iBAd6p4rgHnkRigWSzfz
	SFvhbqw1vaH4GUla4vNWtUvoEhKJH7XgatRouvNzKps8g/wZWFbqsgq3jM6ynsY8+QEw0MomE8m/O
	7Psr8GJycfgABxHUCJprQuogyfqomOgwcAB3OAoV+sURFb8sSrAhMYnx4VAa/o3YdaTMwpLDXat6a
	QLFM8ol5ZCWvKCsXoqoV+Znjh+AZWzuUsOSWKnsNS+ANuzYSP4gNBbZ9iNn2Bm2hXQy/Hg2MIbWeZ
	c7i9C05A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvseq-0000Hb-Ud; Thu, 16 Jul 2020 01:25:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvseo-0000H2-6F
 for linux-mediatek@lists.infradead.org; Thu, 16 Jul 2020 01:25:55 +0000
X-UUID: b2c1eed223144572ab5fc5c17912b62e-20200715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AHUH8qzbFqlocfqW1CvW5nBDI2Z7B9Hx78qi/rQCMPE=; 
 b=AtD0dyy7ad6oLkHkMHWeKnCQBAHEm/rfO2/o5MtvcQScz5dCJor19kU30OOUdCj0AcSp038rPlKOTlWxcoE/PmaQwPtI2LEzIxaf68YQGlymfterDODnAPLZrvjTikvInO6P0KrGdrVwA8t/YT7grnycakBSCsBwtWgjWZF4cwA=;
X-UUID: b2c1eed223144572ab5fc5c17912b62e-20200715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 342173894; Wed, 15 Jul 2020 17:25:38 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jul 2020 18:15:34 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 09:15:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Jul 2020 09:15:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
Subject: [PATCH] linux-firmware: mediatek: update firmware v2 for MT7615E
Date: Thu, 16 Jul 2020 09:15:25 +0800
Message-ID: <cfee5e2b0064b8aa387e13901913a3a424dc1eec.1594624155.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: BC637E75C6416C81581545A12FF0BC8CD561464ECAD424B5361E4BFA766E953C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_212554_420611_69601835 
X-CRM114-Status: GOOD (  10.62  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-firmware@kernel.org,
 linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Shayne Chen <shayne.chen@mediatek.com>

Update to 20200629111339 version to aligh SDK. Mainly fix DFS false alarm.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 WHENCE                 |   2 +-
 mediatek/mt7615_n9.bin | Bin 457992 -> 457992 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/WHENCE b/WHENCE
index 086374d..40256bb 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4643,7 +4643,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
 Driver: mt7615e - MediaTek MT7615e Wireless MACs
 
 File: mediatek/mt7615_n9.bin
-Version: 20200131
+Version: 20200629
 File: mediatek/mt7615_cr4.bin
 Version: 20190114
 File: mediatek/mt7615_rom_patch.bin
diff --git a/mediatek/mt7615_n9.bin b/mediatek/mt7615_n9.bin
index f6ad748155672dd52fd7f41c452c320ad8ef8d7d..761ad9bbc8714eca880cb7fd24a3c0ea761bf839 100644
GIT binary patch
delta 51
zcmeD9CEf8$x}k-!g{g(Pg{6gc3){6noMuLrhK7d5#+K9X|6!BngL4`7>|tO40Onp0
AvH$=8

delta 51
ycmeD9CEf8$x}k-!g{g(Pg{6gc3){6noQB4Rh893*H2wY`HfcUMmtoHy1_l7-5fGpN

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
