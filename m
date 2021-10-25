Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEFAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 14:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC92F60FE8
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 14:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC92F60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Mime-Version:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IC2X4FCGNuuzzenkzoSuQr5NsZThQSrpq52WjdxriEU=; b=fgFy9Gt5qnjhM8
	4t4oPpiESaGe94kUqtVMApRBMobyK/St3augaSapW2BZFnzyiWlAR19s53ouub5/WIyFge8Rewops
	7qg5IO6XM3ICVn3uLDtX26VzDtu1l2n0iTJPHWBuxjbTdhbf+dG5k6YiKOr+Qv4P3FpPqI9qcLTdX
	U0EfVSF4ldP1/dwej19xA7/uu+pCM6Yl2kzvjtw17j2rtifZxJ7MbtTS9u0RTW0gvIiliq0O1ZF4W
	di1+bez+Dd2hNFrwoUNxnESdPMqAE/BIVtLcfy89/iId1Cb6ptHNfZtyTrNZ+fUuEkRw+uvpLPaBc
	WGsQvBhaivQpb5SpSJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0lb-00GeQg-Gf; Mon, 25 Oct 2021 14:15:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0lO-00GeO6-Ey; Mon, 25 Oct 2021 14:15:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so91945pjb.3; 
 Mon, 25 Oct 2021 07:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:mime-version:message-id
 :content-transfer-encoding;
 bh=9hCiSuKXcp2D7o6Qu19ST9AmieybZKRVyRvFWZu40LA=;
 b=MqGtqJQnsi9gyhkPK5fBlWqXleCsNgWuvb2D4ioBmngQmihCLjKa/o0NYXBWJ4lrVd
 7onCY8oQC0OuMK8+Jw6ClSmDNC2QXq0XYFWCNYjz2MrQPYL/LugoxyX9et4TIKz6cUtD
 tdD38yKiLkwDWQobRzb48wRu97oO3Nnu9clJ/cEQDPHucXo6nCsU0aAv3MICaNuG/75e
 9TYVHutYl92kdj6ns+KVaQ1UUOB1x0BwU74qaSxk/2LQkKGicx8YV3CU97wibnB/Wprp
 Yo2Jstst21ajhPHOJeEFGEc7Ch3ViEtQNy0diGWCrdmZijg/s9Q/LvdKnjBxnxXOaZYD
 SZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:mime-version:message-id
 :content-transfer-encoding;
 bh=9hCiSuKXcp2D7o6Qu19ST9AmieybZKRVyRvFWZu40LA=;
 b=pqGPSyMkdHDuf62fyh669iRbcIZS52SseOQsznBRVtE16dLrBsPUmZ6zyjQLrvVnR1
 ny88c3BXNqOeKvSREgHpCyD5nFxc+mHDe5lkBZ9GcFUlc5f0e4g8Fu+YKhtnZvpiZtkj
 OzAgzIE5oqTxUY7cbdoyrY4cJQLNHZMZxHR48i/uz2hK/hGniZFR+aF/zYY7EkOLzEDE
 F9JE9NKhwbuSt/Vah4gSd+jG2pXpWP47ju2raDEkSs/+2iyFDOWYNAD2Vkymu5RM8psf
 F+sUx/VckR3yZzeXVG0OZ3mdEs4Y9zPP7elx6QDngIXcusxfZImPHihZ2/nLO0DKtTZE
 01VA==
X-Gm-Message-State: AOAM531b2vZvKdKH8C0q4RDKM88DmgkFjxIXDEUYvvofIgzw/stK1fMy
 bkF8zk9/XlzGPtiGyzvNtEQqnrr8AcNICG7Bt7s=
X-Google-Smtp-Source: ABdhPJxWC4lpBxoxzF075p4NiWg2qpRex51GN4GZDYhGs0xep47PxL7NYprA+fNAcUlWSqAKAzEe8A==
X-Received: by 2002:a17:90b:3a84:: with SMTP id
 om4mr980599pjb.91.1635171344637; 
 Mon, 25 Oct 2021 07:15:44 -0700 (PDT)
Received: from DESKTOP-O1J7GSD (211-21-92-117.hinet-ip.hinet.net.
 [211.21.92.117])
 by smtp.gmail.com with ESMTPSA id gf23sm19327969pjb.26.2021.10.25.07.15.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:15:44 -0700 (PDT)
Date: Mon, 25 Oct 2021 22:15:44 +0800
From: "zhaojh329@gmail.com" <zhaojh329@gmail.com>
To: sr <sr@denx.de>
Cc: matthias.bgg <matthias.bgg@gmail.com>, 
 linux-i2c <linux-i2c@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] i2c: mt76xx: add I2C_FUNC_NOSTART and I2C_M_REV_DIR_ADDR
X-Priority: 3
X-GUID: 4EA9CB28-28D4-4154-9F06-9BE2F7ABDEEB
X-Has-Attach: no
X-Mailer: Foxmail 7.2.21.453[cn]
Mime-Version: 1.0
Message-ID: <202110252215432797064@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_071546_526408_3729A36E 
X-CRM114-Status: GOOD (  13.49  )
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

This patch adds I2C_FUNC_NOSTART and I2C_M_REV_DIR_ADDR support for
MediaTek MT7621/7628/7688. This is useful for some I2C slave chips,
such as 'drivers/input/joystick/as5011.c'.

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Reviewed-by: Stefan Roese <sr@denx.de>
---
Changes v1 -> v2:
- Fix code style
---
 drivers/i2c/busses/i2c-mt7621.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 45fe4a7fe0c0..a7acab78ef9d 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -150,6 +150,9 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	for (i = 0; i < num; i++) {
 		pmsg = &msgs[i];
 
+		if (pmsg->flags & I2C_M_NOSTART)
+			goto nostart;
+
 		/* wait hardware idle */
 		ret = mtk_i2c_wait_idle(i2c);
 		if (ret)
@@ -174,6 +177,8 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
+			if (pmsg->flags & I2C_M_REV_DIR_ADDR)
+				addr ^= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
 			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
 			if (ret)
@@ -187,6 +192,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				goto err_ack;
 		}
 
+nostart:
 		/* transfer data */
 		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
 			page_len = (len >= 8) ? 8 : len;
@@ -242,7 +248,8 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 static u32 mtk_i2c_func(struct i2c_adapter *a)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_10BIT_ADDR |
+		I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_NOSTART;
 }
 
 static const struct i2c_algorithm mtk_i2c_algo = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
