Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D149606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3ouhUev;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nP7mN4Hx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=; b=h3ouhUevRcGOHT+7i/B7tjg2q9
	upCYhVf8kzktY0N1H4e1gb+qhNAnb5ZFngaWf5JRGH+suanjSRjsbQV1rngJLpdVOjWD2kpZdiXS/
	HqyVtWsR+QaTfAOENwhWk3mQIKMRmh80nxfrb133ZG4FDE3lbhC9CdDpTgzBmXHoeddDXC/qZPu3h
	DX5QYXHPBYhym5qPI7V3ShaQhWWT4aHC//s+k5jMu1AjcR8VU7babap2NzoZQJPQE3BteLopuCte+
	HZDWn3hbITQBhzowumNdqiUdL6QQbBYwaE96gR93hkFphK4lQMTE1bevVXdKpIKZmycRgCUt1Ctaz
	5ksFmGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmFG-00000005xYF-0sAb;
	Tue, 24 Nov 2026 08:51:22 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmFB-00000005xWj-2cKf
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 08:51:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2688978f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 00:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510275; x=1796115075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=;
        b=nP7mN4HxRdpqHSxFUSnPkIYvLpTEP4x/kBVaSHR1gB92U1bIAoFwtn7QWbFE8Xoti4
         +XFhKGtQfV09aXCQ0NevzpXrEHGnpQIk0rBdDuIfdAvcOiK5JM8g1LBr0Y0JdyD3uFGf
         2lVy5vBieGDPqwU0GyQVKldnkjgjXDpYYvFRLYFFwMAXafWVzBYHwlmot19rY/l6Ik3m
         nkJsAf4NBK687zd7iYSyexrejGilhdKVF3P1hg7bFRBPvJy8WF9Wy+J5/LqbzB6602io
         ib+zvPdYQKjn9+9yd+aKEcy3tqzfVHx3+75XVyt0/lCDdz57fJCt5dcBqdW24WS83qAS
         hRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510275; x=1796115075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=;
        b=oCW+ujra9UiIKOxIY3LaGfW36Z+0vXl6j3PY7gv910jjrX/TqcKsz9ym1J9GBkbXNr
         H7glMu2rbkjJLINSHZbiKZ8KGHBsg5ozp/rHLaYSIaqu7n9xotIONCd+5D+uG8Z1z/XU
         irh8FEjO9zYKe5FJeCMlLuMKD8r6KZwjzhSA6bJ1hmGzMSggYHpow5Q9C27T/RMvJw+6
         rdJB4CGW1fuvWkCfRLjZpk8NcbSfSD5SaQ9uSdG2jWOvbZV9joJ2wxHbXuXrt2A3iSnC
         BZNL+FKbVi0FuuPsmLFAxvEU8Yfce4gYr3hsYyTcx+Q8JEo7Rkt+1lhJFO4438CbHsQf
         Bo1Q==
X-Gm-Message-State: APuU4Z/XFHy+CTgjkifyU0l31mgYuBkMVDYydgrLSEg1xYhwAlFkGYOG
	CjQRkbrLJgtNUKZR8eSUooEjx371kbhK7/4K3AvgvedtB9UMzqx+eJIJ7YbjJKJByNSIdg==
X-Gm-Gg: AZFdTZdnkcLkK6H/qjQhWpvAA8zB6jtd7+K/cNqr9g0OuFQ7V/0XrQqxmrD6PoxzlFL
	LPfljOk6PDSIspzPGbjfWPHgxHfCFbT3iNz8FVcvaG6mLU7G4HmG4K3NnJSoCcTvwlv5DGJi/jY
	wgugO8pJ/tWxRUyfQh/cYMXIHf8nbXqtZ9yMCPdjXF1nwLYd5md+m8gvGrvBnJP+UsDOl1jR18s
	TAaUDCe9YZW0dLURPJzZIhdtYmIzyKbSA+jnnSpALvNc9rUU7Vq9FYzN9TolsLA64xC5Q3pBg2x
	VUFdPobwOsz77fdEPAGITR6Mt42nOJYT5ro6Z3cqj/4xnWQifQzyFZoU2zT8Ov1Uq3ohn53R8rc
	kSTQboxA3U0b6fRRgBNIXPd6p8iW/tUg0sXWWNz8Du0UW/aNTt6dwNU3Eh+H+YHLM/PR3vpLDR3
	op6mMAYZy18BE6TxPjpJ0f7BftA5isfxLL4K3XqrrT0FReoKavUM/7jbtVtF1iPS2IXdFCOgKZk
	xbleGy6XkE0g3GWL84nFXmisTkN338KCT+GaIY+KMUpmgG3IIY3z42kxjmYKeMHQR+zV9OssMqW
	TiU7+5y8RdNHFXpcOiKlvlAZ
X-Received: by 2002:a05:6000:29d2:b0:4aa:1100:72a4 with SMTP id ffacd0b85a97d-4abb400af07mr18504917f8f.34.1795510274996;
        Tue, 24 Nov 2026 00:51:14 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm23692999f8f.17.2026.11.24.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:51:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] Input: goodix - sync the irq controller while starting firmware
Date: Tue, 24 Nov 2026 09:46:22 +0100
Message-ID: <20261124085058.128173-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_005117_724678_2B2C9E42 
X-CRM114-Status: GOOD (  16.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Lenovo Tab E7 (TB-7104F), which has a Goodix GT-912 touch screen,
the touch screen fails to come online after loading firmware, printing
the error "Error reading 1 bytes from 0x8041: -6".

Comparing the upstream code with the Android stock sources, the existing
call to goodix_int_sync should be moved between the upload of the firmware
and the watchdog restart. With this change the touchscreen is correctly
detected and working.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Relevant bit of the stock source driver at [1].

Credits for noticing the issue and finding its cause go to matemiller992
on the postmarketOS forums, I cannot provide tags as he wants to stay
anonymous.

Patch tested on the Lenovo Tab E7 (TB-7104F).

Changes in v2:
- Instead of adding a second call to goodix_int_sync, move the existing
  one;
- Simplify the access to the necessary arguments/parameters.

v1: [2]

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529
[2] https://lore.kernel.org/linux-mediatek/20261020122712.526797-1-l.scorcia@gmail.com/

 drivers/input/touchscreen/goodix_fwupload.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
index 888da7538c06..642a632d363c 100644
--- a/drivers/input/touchscreen/goodix_fwupload.c
+++ b/drivers/input/touchscreen/goodix_fwupload.c
@@ -153,8 +153,9 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
 	return 0;
 }
 
-static int goodix_start_firmware(struct i2c_client *client)
+static int goodix_start_firmware(struct goodix_ts_data *ts)
 {
+	struct i2c_client *client = ts->client;
 	int error;
 	u8 val;
 
@@ -168,6 +169,10 @@ static int goodix_start_firmware(struct i2c_client *client)
 	if (error)
 		return error;
 
+	error = goodix_int_sync(ts);
+	if (error)
+		return error;
+
 	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
 	if (error)
 		return error;
@@ -249,11 +254,7 @@ static int goodix_firmware_upload(struct goodix_ts_data *ts)
 	if (error)
 		return error;
 
-	error = goodix_start_firmware(ts->client);
-	if (error)
-		return error;
-
-	error = goodix_int_sync(ts);
+	error = goodix_start_firmware(ts);
 	if (error)
 		return error;
 
-- 
2.43.0


