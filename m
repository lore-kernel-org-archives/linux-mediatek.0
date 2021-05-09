Return-Path: <SRS0=dq3f=KE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE98C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7DE6610F8
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7DE6610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+uiMCo/yZWTFCkE6oywTtdkY5s0WUq2lBFyPhWunTpg=; b=eU0sR2da1qxV5liwXhukXKUlF
	dZ3WQY8mmC7c7HaQAjZnEb1GB/dEON4CAG9asd1H0XORzY2xjgwQUqz2jiUkb9LFKuqDrjubrdFDr
	TYlgccl8bMmoWjV8sKn1VztcmIstIm0zXe90KDjoE7hB56J5/n9RZrdcB9ImRVo9f/6JVeIXSQfMT
	RDLF8RdIGP2YSXu9wGw8GiEa1W3Vb59vPfCRATBX3pGvMzSYqLT4Ssn95vJv5yJboklFbPgmcsgYb
	spEZ965HH4d2Cw3qbjm/aylyGDZqg6usJYlbxNOf3tJI4LeCMfcUWeCqkunHbJ5L4KNH5ey1krkiq
	jPl+Owyyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfqp3-00CJZT-Ja; Sun, 09 May 2021 21:18:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqnh-00CJSf-To
 for linux-mediatek@desiato.infradead.org; Sun, 09 May 2021 21:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GoS9jwXb+6bjil0Yu+wJqoJdtpEzMCfqz3u/IhZ26jE=; b=M3MqBc8Pm83LjyJmbylJIMswrT
 jspj0kdiWvYW0OJ0C620axxCBI3x+PtB9u3I2lKvzI7J+gh/la3kfWGruXjIRXE2f6nDkRwHFCqSh
 xmrFgnFpKp3r0fLFlVn7kUKtJAdOF/vKwqIjV0xrbDFBgJ4fv5nnw6BqSasQNj3a5eIvGOQbujYEK
 N4lRLAclS6qBS7Hs/5g7EYmvWK9KBN99nnZxmn4J6L+00N7xwFaFlIdlwtgkl4z8gK/EoedsaEmLc
 liedIAPO83dhNXqDnRSJaEa1herB8CKoCzkJ2CYyUPv1T6ygyKWBJclN5wAYOQuAc0GodQRPwbYBL
 anwba2Ww==;
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqne-0087WK-AV
 for linux-mediatek@lists.infradead.org; Sun, 09 May 2021 21:17:20 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 6C0FC1E00597;
 Mon, 10 May 2021 00:17:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620595030; bh=HJPhtOkkEkTSWC3HD4086A1WQ21l3+OCYoakmAf6iAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=et9XNSMjHgvv9aay7p2ZzWW9OREmJBN0wXu1aV8IsemWlE5Bu7BMIJJrYMarNLzQL
 yfQdGWk5RRjXEPpmsxXCUALcQ/3CyV7KhVLWhygEz2QLSO05NAerfhhIJ+q1zCrLfS
 b8tSzcoW1FN1JFJ9BnJ72HPkM9q/EXgoMI8t0BPY=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 5D0361E00594;
 Mon, 10 May 2021 00:17:10 +0300 (EEST)
Received: from localhost.localdomain (unknown [196.196.216.231])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 9E7F91BE009C;
 Mon, 10 May 2021 00:17:09 +0300 (EEST)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/3] watchdog: mtk_wdt: add support for mt6577
Date: Mon, 10 May 2021 00:17:02 +0300
Message-Id: <20210509211702.549-4-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210509211702.549-1-arzamas-16@mail.ee>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210509211702.549-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +dBm1NUOBk3XhyvUXxmqCAcypixLVOnh/+Smsm5UmWeDUSOFd04TURmxg253S2K6vT4X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210509_141718_723449_6DFB1D52 
X-CRM114-Status: GOOD (  10.99  )
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

This patch adds support for watchdog used by mt6577 and related SoCs such
as mt6575 and mt8317. These watchdogs are known for having shifted WDT_MODE
and SWSYSRST registers and using different SWSYSRST_KEY value.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 9d3091b12c06..830113843ce9 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -54,6 +54,10 @@
 #define MT2712_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
 #define MT2712_SWSYSRST_KEY		0x88
 
+#define MT6577_WDT_MODE_KEY_SHIFT	8		// unlock_key [15:8]
+#define MT6577_SWSYSRST_KEY_SHIFT	8		// unlock_key [15:8]
+#define MT6577_SWSYSRST_KEY		0x15
+
 #define MT6589_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
 #define MT6589_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
 #define MT6589_SWSYSRST_KEY		0x88
@@ -94,6 +98,13 @@ static const struct mtk_wdt_data mt2712_data = {
 	.wdt_swsys_rst_key =		MT2712_SWSYSRST_KEY,
 };
 
+static const struct mtk_wdt_data mt6577_data = {
+	.toprgu_sw_rst_num =		-1,
+	.wdt_mode_key_shift =		MT6577_WDT_MODE_KEY_SHIFT,
+	.wdt_swsys_rst_key_shift =	MT6577_SWSYSRST_KEY_SHIFT,
+	.wdt_swsys_rst_key =		MT6577_SWSYSRST_KEY,
+};
+
 static const struct mtk_wdt_data mt6589_data = {
 	.toprgu_sw_rst_num =		-1,
 	.wdt_mode_key_shift =		MT6589_WDT_MODE_KEY_SHIFT,
@@ -376,6 +387,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
+	{ .compatible = "mediatek,mt6577-wdt", .data = &mt6577_data },
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
