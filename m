Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA2AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 08:43:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EDA61439
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 08:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EDA61439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSXj/6FqXfR1CY0jvMp+vCxJ0ntwgm8VWJ/lxe9V6h4=; b=rQFc1eUyegfFAs1ZevttlB8AkF
	Q33XEpytETQLhx/s9eFcUa2Km7twHR5SpM0ec8ugRpAafU6HV6Yfmd2aE+P7JLOuRS6GgGrURPRNh
	JhQjUjYyOhSrsZr+wD52khSTWz24cT9gi4xKwznTNTQaZUY6/Ura/sDb8aMdppw+OcCeuVzonBod6
	JRG67WQuKovsrhmkjAi+FZDM9zxh2b6UgsqaoaDwX/4i/nBCZ4bAxygalHyAIqY982AsYlgScrU3w
	UWW7MvgCV6IuwwBmNx7+JYD6Xmnq83QvNcq+KLLr+xLg88nJvRoP+laj8m8iohsc8mRLQT6LdoEWt
	B0U/R+tQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8SN-00Dzqr-Gs; Wed, 21 Apr 2021 08:43:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8SK-00Dzq2-8I
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 08:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=NIlPppNuWAatVaMkUW6jnIcxPKc+2Rj6bpetJT72OvM=; b=IsLPmPU85xxggg2AMr/sM3xJHc
 7UGQv67bQsuDBiSJLCw3RU/Gx2ejvIDWW6BpSCrVt8gGrdoDQfcLshTiTj58p6BVevI/IR2Lp59Gh
 79SFsfPkQfw1lwnZ3yrUmyRZiOOXTZ+HE6afCvl7N7Tt+lcsrvyUJnxDi4ifitEwDu5KA7SftytCV
 +7N/cS6lijeH/UY9ZVt9TABs1AdIrwhGGmEFkLKmeICoM8pxJS86XBrAR6ce/vC88h97bW6UNhUzm
 elnPCOk2oWg5isL5LjWIl3TcJD2w3EqBx2gRaBnx6GFRDfj5ZaArkI7cmDPO/ztwSyybEaMmRqxCV
 6K0m3Gxg==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8SF-00CiXj-1b
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 08:43:30 +0000
X-UUID: a8c18999146c4a8e806d3200d62bed4a-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NIlPppNuWAatVaMkUW6jnIcxPKc+2Rj6bpetJT72OvM=; 
 b=khX9O9twzAFsKqq45fQB/JkWNugTa8ggKrdti5a0CMS2yNylG/BW6Hcap8oYWgvujdcjNePr4NYpTPjZWgV5/ehr5Kg4ZTf7Wer8l16D7yZO74Ppv0+Vf/CwIalvD7DR9hnkUWFTxZpPAt7oYWh17Vbeo3Ir2CqE0G3Kt5sDdFo=;
X-UUID: a8c18999146c4a8e806d3200d62bed4a-20210421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 356139230; Wed, 21 Apr 2021 01:43:19 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 01:40:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 16:40:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 21 Apr 2021 16:40:18 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7915: do not read rf value from efuse in flash mode
Date: Wed, 21 Apr 2021 16:39:45 +0800
Message-ID: <20210421083945.10337-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9CB6740FDC6112994172C00188E65583B1497F58073ABDC406148BBFC99349012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_014327_112469_77D3CD56 
X-CRM114-Status: GOOD (  11.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Do not read rf value from efuse when driver is configured to
use flash mode.

Tested-by: Bruce Chuang <bruce-ss.chuang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 738ecf8..e004e51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -8,7 +8,7 @@ static u32 mt7915_eeprom_read(struct mt7915_dev *dev, u32 offset)
 {
 	u8 *data = dev->mt76.eeprom.data;
 
-	if (data[offset] == 0xff)
+	if (data[offset] == 0xff && !dev->flash_mode)
 		mt7915_mcu_get_eeprom(dev, offset);
 
 	return data[offset];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
