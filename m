Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17528C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 08:50:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9905461175
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 08:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9905461175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bupt.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8kuv5MsWkEk3PVXqtHzkQhCyMP2vAEBc5AaiMnumw+w=; b=ZCuEnzj9kxIqb7HRY2fqBSjLAv
	WEi670lc7maU5MNyggGbJbo0bqqBiYews9NMCIytm5oRaQhOXKQlg6c+eD/tGBBZ54P2Sfl4YuVtt
	5tl8UhOh7gHJkiHETH5YqCXc4A1op8/6iNCd8jPOK+6ROnsQVsAt80eyEf4qWTlNTq7baBwNnAto2
	D0SkOU8YWhUmawrfljEJvLf97DhzZ70XmuPr7FOwAyI5Geqrz21vm5UBNSJNvoYW06RNY2P1Sa+Sg
	X8cR8SyELdBYolFq7/KEZ1iXjd3MK657pOW7au94r/BK34qXk85rhXmMyncYAMd1QrqQmU7Iv4Qur
	/Yzci8GA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldUHe-00DTZk-0y; Mon, 03 May 2021 08:50:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUFa-00DTNT-Jp; Mon, 03 May 2021 08:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0zWv3S49X7hzfY69bw6c0b59A4puZQ9rBKFz61n1vnI=; b=GVuWV/N5oGdimnd10weCGlzcrM
 S3oyr1Rdi25PAwbV/5IPs9mGzwvVZsEQwbxokQapCbwIQD8p6zrwaxcOREPtTaIusLjbl3VUqghlq
 CKtzLDOhQ21fgLYYhJDe+yUmMU+tLe0qdz2FFTxtDdoabGt69va9+Gjm/3UVf2PxJ5+Psk1R/oQmJ
 izZD8US07PiaBCzWrEey8q+1G1xGT+AVuDZE8cIzowAmPtttfEZDDXHFfvWWL6nWFM/AZWQ3nxvUO
 h26319gHEXl6AWgbZd9M7KHkh3HEbtVN8QyVmKNrXIMy+zFobFiq4NrI2wTwm44JgraatXdKObNcO
 bN7l/vLQ==;
Received: from smtpbg551.qq.com ([183.3.226.173] helo=qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUFW-002vUs-8H; Mon, 03 May 2021 08:48:20 +0000
X-QQ-mid: bizesmtp48t1620031672tpjxzgjq
Received: from localhost.localdomain (unknown [59.64.129.75])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 03 May 2021 16:47:46 +0800 (CST)
X-QQ-SSF: 0140000000600020L000B00A0000000
X-QQ-FEAT: Oj0A4zlq//c/o9T6ZaumFUZ1HH9Cdc6+GzNq8zVbAcJIzPcTvb1QoHVfDZqB9
 6K8OWuQcqVnynDukpTTo7Kh+KVC61iTGP2sMhmSYYoXdfOVCOm9YyHn4TsJ7Fgdxx5PNvUw
 jyO1Hcy6rHuw8XVTwfUG7Zqkf6gUmlT3AS9cqbVkvz86UatoTu+BZzPt8UG8PiVSvZNJ2L0
 HzxM3zsqMaAyiS7Zi9NR+C+p9FIV6Uusjez8M3goLLm+KOmiS8RNdk6qwx2TPBANMF2iJUs
 GmZfIVTvtYHVlDNMvPbIVlHisQC0dteuXAOJZk6phlk1JNXdrn/4kADKhO0BP98xrEs4/gk
 +0ufcOivUeAeBvwzgAudjBIDLmJyg==
X-QQ-GoodBg: 2
From: Yan Xinyu <sdlyyxy@bupt.edu.cn>
To: kubakici@wp.pl, kvalo@codeaurora.org, davem@davemloft.net,
 matthias.bgg@gmail.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yan Xinyu <sdlyyxy@bupt.edu.cn>
Subject: [PATCH] mt7601u: Add support for Baidu Nuomi dongle
Date: Mon,  3 May 2021 16:47:35 +0800
Message-Id: <20210503084735.78974-1-sdlyyxy@bupt.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_014818_641524_1D260B8D 
X-CRM114-Status: UNSURE (   8.19  )
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

Add VID/PID for Baidu Nuomi USB WiFi dongle

Signed-off-by: Yan Xinyu <sdlyyxy@bupt.edu.cn>
---
 drivers/net/wireless/mediatek/mt7601u/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt7601u/usb.c b/drivers/net/wireless/mediatek/mt7601u/usb.c
index 6bcc4a13ae6c..cc772045d526 100644
--- a/drivers/net/wireless/mediatek/mt7601u/usb.c
+++ b/drivers/net/wireless/mediatek/mt7601u/usb.c
@@ -26,6 +26,7 @@ static const struct usb_device_id mt7601u_device_table[] = {
 	{ USB_DEVICE(0x2717, 0x4106) },
 	{ USB_DEVICE(0x2955, 0x0001) },
 	{ USB_DEVICE(0x2955, 0x1001) },
+	{ USB_DEVICE(0x2955, 0x1003) },
 	{ USB_DEVICE(0x2a5f, 0x1000) },
 	{ USB_DEVICE(0x7392, 0x7710) },
 	{ 0, }
-- 
2.25.1




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
