Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16015C3815B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 12:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD226206DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 12:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FFCOE8Uo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="diTzGR3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD226206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6nM8G76QnLLGF/9jm19ntlsIb7N8wgYzSsSyK69Jb8=; b=FFCOE8UomYHfwz
	41cL44kllX04xUe0ulpjFi7yc8lRZzeo83MCKbfYF5WA4eS0ozpcrGgRvONGtnNlb7mElB/OMOBr+
	Tyz32uLYPYQub51m8qnVvQA0NtoW8BWELksD4AqpXpmpQPnLterJNk1bAhc244RM65+NnbYBEjPPL
	Nwin0ZppmIHG4WEFDi4u8xMqL61ePrktZk7SzcLlp21oK53qslL5wA8eHsquhSNeOhn12X5L+pNuv
	b6lq+j3rBp9UAGZGKVyRCnjaywnwJRkoN9WwfJQ58d1nUjej2z5FJZ9e+IbxYZAprAIXOU04Ixcvj
	yI0cwvDD7c2xUj/iSDbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQVDO-0006LB-2E; Mon, 20 Apr 2020 12:07:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQVDK-0006Kc-OZ
 for linux-mediatek@lists.infradead.org; Mon, 20 Apr 2020 12:07:52 +0000
Received: from localhost.localdomain.com (unknown [151.48.159.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E2BB206DD;
 Mon, 20 Apr 2020 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587384470;
 bh=hg6wS/HV8kcXH5ugWtUCXLzLdrfCedTehl3Md/SXsXI=;
 h=From:To:Cc:Subject:Date:From;
 b=diTzGR3Q54WwTDRsM5hUHE/MP4FpjLDXsjAOwvF2V1GeY8Y9nOVV73Uv+XNRD1rpW
 /WbbhP6HzWVrCmXqhSSgSIE7sEsa15ejuIR4qbD0WIoVeaFUTX08zqdUjh5Z/ce6rh
 kFwxEXcBGsCs4nlDyURt6EoN1Ff7UiFvclYsFUjQ=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: fix mt7615_firmware_own for mt7663e
Date: Mon, 20 Apr 2020 14:07:45 +0200
Message-Id: <0ab0cba65fe838c658dd8e9b61cda618a37ecfca.1587384173.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_050750_824669_58D7B33E 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Check the firmware-own configuration has been applied polling
MT_CONN_HIF_ON_LPCTL register

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index d448bbeba1c1..7081bc4723ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1710,9 +1710,8 @@ static int mt7615_firmware_own(struct mt7615_dev *dev)
 
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_FW_OWN);
 
-	if (is_mt7622(&dev->mt76) &&
-	    !mt76_poll_msec(dev, MT_CFG_LPCR_HOST,
-			    MT_CFG_LPCR_HOST_FW_OWN,
+	if (!is_mt7615(&dev->mt76) &&
+	    !mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN,
 			    MT_CFG_LPCR_HOST_FW_OWN, 3000)) {
 		dev_err(dev->mt76.dev, "Timeout for firmware own\n");
 		return -EIO;
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
