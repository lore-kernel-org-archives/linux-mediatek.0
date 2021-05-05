Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C406EC43460
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:34:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875D261582
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 875D261582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VZQtlYB7bvPoZQNSwjF8GRxarxGfAgCYpGa6EFS7lhA=; b=nPheNl42yC9FqOqZ0lClAYXk3
	Vaa/mZ/Us6AGQlJugcVzk38kVfleWvag/HZK2LnCveiUCyxjTmsQeVjRt1wBEIqJAApEXqWjEyZ7a
	ZeDAFQYcJlRlXKHYMPi6mXTot4GQmtc8AroFaBRRCO4DyJPJE8BcxQeYMNzztD8Kc5Rr85J5IDQZQ
	xzeEZwZ76Q6ElO8UD2QnM34q8w7Edou74Q3cp2PWc+0/nFvfULyf/3N90jAnngcK4IuNtA2WZ8MUW
	GYFpToxRDq3lUOPExMTjbbYoKZ38k9py61qotvNkWGfoNE4o+eYTBKbb/b1LCWSLWJBx+mczkzzlQ
	KEYX2Vi8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKTL-001euu-Od; Wed, 05 May 2021 16:34:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKS7-001eWF-1T; Wed, 05 May 2021 16:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6h/0IIHMp/A0Lfcfm84/3EEGtVVjO5IBr+IajmWor+I=; b=Ig3ZyCUJmoz0vVdW8j3nIp+JSC
 avFWjPpoymUO6mm5esQz5eG0clh0KM4d5DZuPUa2mjRBMepX22A2ECY3/KSn5mjUwYaaaO6nSG3Me
 aee2AvVGWIx67GTa45zDaYkNrNun9hm8Zhg2doERO1NPFlbXM+n8P9v+hu7mEqMw4QX3O3jvm7A+0
 F6KZNdGV/MgyEFzeG1W0Y8uhcQn/5NnSeFpy+7v4FjfZyokzqxzEZe0KSsRvZsUO5gnpSGKKJuCeo
 965+uTZSByv0Qbe+ehXuQcofJKjOh/1It7lerEU49aAUdf/85H3Eqr67nVtrgJSXOHQnXGg9Sz6u8
 TJX5RQMg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKS4-004wNt-Ii; Wed, 05 May 2021 16:32:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11F4E61411;
 Wed,  5 May 2021 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232364;
 bh=4vldGFku7LwfIJmSZA2/UFDmjoW0JxY2jQPXpMy7jIM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HkwUGybAl+27ZYg3NjrD64Rkd0pY/Q2CyVCOmY3sUx3TXpp3elGcl0BACkP8OUa8W
 EKXC/xdIA4jV7A88J0lrYF9iTn+WB2jbEVMDOl3arm9CiJtVYzq4ExV4DX+Tc37huG
 yQCJIrIiPYV7RStYrxoofVwzNdwpwgdVNPhAi5oT5nD8sU7PXgatYWNZaHn1gTJcRY
 mf/YWUwhd+xxiVNE1s8M1LcjRDk8tHwZmaMHa/7zn1+L6INyDesUfrAt7Cdrw4sKVd
 EizrUTn/E4XRkErKdYYAlnKctfMGLpo1Cm7py2EacoJBlbwhxOvt4dYkIFGZkllYqc
 koOfDvhjmFGvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sander Vanheule <sander@svanheule.net>,
 Georgi Vlaev <georgi.vlaev@konsulko.com>,
 Stijn Segers <foss@volatilesystems.org>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 057/116] mt76: mt7615: support loading EEPROM for
 MT7613BE
Date: Wed,  5 May 2021 12:30:25 -0400
Message-Id: <20210505163125.3460440-57-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093244_654479_ADDCE21F 
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
index 2eab23898c77..6dbaaf95ee38 100644
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
