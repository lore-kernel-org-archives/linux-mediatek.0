Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786BAC5DF61
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 09:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47738214D8
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 09:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2n0DYjP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="tFeI+bI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47738214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tor6Zoi7uTGX8DCnmtrDeUIjCEmApREPPy1CcUoYrYc=; b=u2n0DYjP3YGUIQ
	qUbeyqnqT+JGjCRCjiRAS5EpRhx4GsOYunIu7qlo7jaycjV6bfUEwmTYHj+FaUaY/XYXI6OoK0keB
	eMdwFYq/RMXWdI7ju7aREp7xyZls1K/Dd8l8Lk4JMq51G2lnPz/EZF/mG54ritYLVPWiZG7KXAHfp
	jNkQYnvCuAvHyjN/v1PnhGFurPGTn1FyxN5GE9jMo1W91QVD1HqLMug2gJUI5SP6Id3UxBUk2eZBu
	u8Dvug+wiWEJM1DtMwuknfTeKyFzHvlmqSZ2qtdFsR/dPIJ2Gp3BLu0fTbQNT1LiPVPCNalj0Kk0N
	AZ3IAt88VSazYQ99sQqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSeMq-0008Lh-NP; Thu, 07 Nov 2019 09:46:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSeMo-0008Km-Hr
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 09:46:15 +0000
Received: by mail-wr1-x443.google.com with SMTP id j15so2229585wrw.5
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Nov 2019 01:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EYdHQ/UO27K++cZW9zQuGji5xNvlsvTd2fpe7ujHCIY=;
 b=tFeI+bI82f7A9CpRrm9gCaaLcV7L2rzG0cOBj47LsplQyzscDWZ3uSLmVVhWH5Ll/l
 RJcMzMHrmLR+NhhG5jy+j6QjSH5iqcUjFJr+m34ITo3AtN4W/0mMXab9iywV2TSwnVJm
 4fi8CMpuw3leDD1mdEP8zY6PvqvgXP9UAYbQ1VKb+5KwJtbHQe+ShVBdOHZtjg2EU984
 YoTOK6R2M/Jfjqzg1PULRDczEaDkzOe/PyLGA3BXMTShRJybE++WeCLiXu0jHXYyfiF9
 Dnt9h7jgQzXBV6HK1JsB6bcryzs8ANOWZJCdw73JfF2yrIR5ulTaBfuWTTq1MidZQcjR
 RQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EYdHQ/UO27K++cZW9zQuGji5xNvlsvTd2fpe7ujHCIY=;
 b=iAuxuUvKB126e2fwZK4DEsmRzzReMCzFLPRi8aonGJi4eadE8tHAH++J0jSX7HmU0q
 apBNr6dXr+yD0s5YroV4yU2xkfhwBILnUGHjt3PVx4brqU4L6FuBU3ImIcPUL56yoFZ5
 cIN2xxCJIp7mGT599cfI8B+ganWyPlg/0ygyLRWviJcxbiZJ0unQfYWVVv3CfXkQsZbj
 8cadZIOtYkbfR/xszJUHcHeL4yCruZd/veXsWZ+mFwfqojTh6dED6vkOTABiBSIkHLV/
 N3bgioF9fYeItoV+yLIkPhNy4VCIPTvEz5zu5/N1Y3wPu1RcCCIS6PV+VTIEtu4gz3Pa
 UpVQ==
X-Gm-Message-State: APjAAAUbr0QS1EbAiAHVvD5se9l0rinp67xQgsqPbvE3bxaNelRACObe
 mxY9w/KEaxKb7X6BQsg+pSzQOQ==
X-Google-Smtp-Source: APXvYqx6uFZ7ophY/dHYBLgpfGDu/hW16RYAXW1k4gUoFsC70OQxNUBqA9m6WSaXBdxp1jtieD8bSg==
X-Received: by 2002:a5d:4808:: with SMTP id l8mr1912912wrq.118.1573119972703; 
 Thu, 07 Nov 2019 01:46:12 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id j14sm1917896wrj.35.2019.11.07.01.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 01:46:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] bluetooth: btmtksdio: add MODULE_DEVICE_TABLE()
Date: Thu,  7 Nov 2019 10:46:10 +0100
Message-Id: <20191107094610.22132-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_014614_640773_DB43E4E3 
X-CRM114-Status: UNSURE (   8.22  )
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
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds the missing MODULE_DEVICE_TABLE() for SDIO IDs. While certain
platforms using this driver indeed have HW issues causing problems if
the module is loaded too early - this should be handled from user-space
by blacklisting it or delaying the loading.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/bluetooth/btmtksdio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 813338288453..519788c442ca 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -57,6 +57,7 @@ static const struct sdio_device_id btmtksdio_table[] = {
 	 .driver_data = (kernel_ulong_t)&mt7668_data },
 	{ }	/* Terminating entry */
 };
+MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
 
 #define MTK_REG_CHLPCR		0x4	/* W1S */
 #define C_INT_EN_SET		BIT(0)
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
