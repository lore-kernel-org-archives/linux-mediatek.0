Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527DAC43460
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:45:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07BE8613F1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07BE8613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kHAAWR0IbRu8CJxuJZwWfnIss5FLmBy9QgFy3MZYfbg=; b=bpTualb7a+xgNOF30FwkN/Rq7
	JcOI5p79vlI7DWbn+AX1M1hKOvAALQYzGr7pzee2qaOxuCJpW2aeujiYFt2+WytE/IF+7vUrPBPYo
	mbPtHwd9RSY73UWfdEWxhlki/e39KdRlaFZYSFPsJ2n6yfB6OQI2pPH+NdaTgaM8WiIkx3GM3/U2O
	9B55mQMG1LHC80ZKcdAtQW/DNvvaTEUPz4a2ucFMWPL7xXtpN0ikj2J/TsgRbuDdg81eU/Gkuy+BW
	Eas813BgOViufkR5jbfASdvEo3wk0Zjx+dNk8qAuuiV27JceXXx1xO2lsM3gs5xfUE/QdpkFSUAgc
	eAX1sdTHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKe0-001jTD-Bb; Wed, 05 May 2021 16:45:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUm-001fcR-3G; Wed, 05 May 2021 16:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TSBhLHsddC3ACVtgZ4oll+F1S42SZIu+Ay77uOH++Ik=; b=datMAzDP8kHZ1RKspb3jrk8Igu
 WuZGoFuw432b0Mx2qLhQmwupBf87czRS/2dlOqagB9ZWUmAozeaJnwLVimDxnVvbSxVLIfRGwKP39
 T9yQMUKZNZS8LphVlnLmgoNBxhrJ4Iq/+XaP0r0VPAD8YiKshVcEwMT9uncXGittB7OnBYwh+O9jI
 CShAliGFOMinRw0JEozxR0WAIy0Oip05sPmrINDhqEW19oDHOWbMaBIpIPlE2iRrmVy4MgtXJ0DAz
 qbnKmDJqTCl0fs5ckhsZBSi0SCetyJ+EqsZGwA0rdmNLsoliy5d0QkSD+wkEgONj8+YHLPGgzibDR
 u63lJy4g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUj-004x4G-Lv; Wed, 05 May 2021 16:35:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E674A6187E;
 Wed,  5 May 2021 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232529;
 bh=8yJkIxt9x7tQEgrOODyGrEM6YzQvSvK7Fau7oWoTmiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D6yFZrE84o9jtEu5oHgPB9dFewA50dmyoEFmwulKI+cNTrkxop5phc1FRy7mXEHJi
 hlUgW/NwBP4+BHJTmSFkFcUAePhfXfUqrcYu477c4LQqOAuAM++P3r/H4TMIXt+Asi
 yvaxLNc6Y9N11WoZ5PPp+JqgH6IzCuMZr9ZNuHykdo1UxWJ91yTubevXx2BSw9LXN1
 TEDKUmngsdRMd/nnS05h8Jd2ILxI2jNetozzHSIoxZ8vDlWTM8KkS7k81TaNY3lP4S
 PF44n0aB97SvoNnRL9Y2cD4ucAcQAWCM0GZDnsWPYGm6kPUtUP3u6M6dWUCmQKWOs8
 cwvIRwq6iRk4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sander Vanheule <sander@svanheule.net>,
 Georgi Vlaev <georgi.vlaev@konsulko.com>,
 Stijn Segers <foss@volatilesystems.org>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 052/104] mt76: mt7615: support loading EEPROM for
 MT7613BE
Date: Wed,  5 May 2021 12:33:21 -0400
Message-Id: <20210505163413.3461611-52-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093529_772297_3485E1F7 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

From: Sander Vanheule <sander@svanheule.net>

[ Upstream commit 858ebf446bee7d5077bd99488aae617908c3f4fe ]

EEPROM blobs for MT7613BE radios start with (little endian) 0x7663,
which is also the PCI device ID for this device. The EEPROM is required
for the radio to work at useful power levels, otherwise only the lowest
power level is available.

Suggested-by: Georgi Vlaev <georgi.vlaev@konsulko.com>
Tested-by: Stijn Segers <foss@volatilesystems.org>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index 3232ebd5eda6..a31fa2017f52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -86,6 +86,7 @@ static int mt7615_check_eeprom(struct mt76_dev *dev)
 	switch (val) {
 	case 0x7615:
 	case 0x7622:
+	case 0x7663:
 		return 0;
 	default:
 		return -EINVAL;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
