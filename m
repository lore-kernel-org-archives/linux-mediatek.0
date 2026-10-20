Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B675606A324
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SArtuGdp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JgrnOtOV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=datZWh14WO+4vzm/A7OIElTb2FmU2wSjN+th3EqRvGM=; b=SArtuGdps2Grra0gLBYbu/QCIX
	81TmRE9Wc4eP+tcn7PRHRGUepxm79L0V7Dx0vQ8s+gD5x0X4Nn3NYE1mTb5Pwn8e8KnM05aIu8Cgq
	XPf43bLRrUqit58eGktMTCyC8Q3noei4pjAKAmgjV9daD1JsHY1HJuVxIY/CwaGwZrh+ir9M9qcXL
	FH4Fg2ZH0Gdfn/xHnAfVrOCYu29mtuKQ3vljZbFfHycPIR8tjfZkjRrcGqBy02ZqX5sTiO626+Avp
	FAbqKfsNIbzyt16xKNBviqJgG53PaL0Z+slRqSSFKJ/zeMsZJ0IsfGuGG4be0E+YoYYPG8E7Gdud7
	UYyNGHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8wK-00000009f3H-3J9G;
	Tue, 20 Oct 2026 12:27:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8wH-00000009f2C-3dMn
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 12:27:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2032974f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499251; x=1793104051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=datZWh14WO+4vzm/A7OIElTb2FmU2wSjN+th3EqRvGM=;
        b=JgrnOtOVDbmutNxB9gRP+0B44O4ewiC/UWCG+xOwzLWOA3EVjl3wTMGZlfQIB/YzIh
         /pVBNQlX4uvbJQBLTmhjb7b0N7/dI7VwQ/+g+oGHuRbu4eahhkKbRWcgCq2dh5mR6/Yk
         JwN53dE8IDLohKx8JmRxht/Qzg8tFm2b7dFX/Jl2kOoM79oCK0zerIdfyAGYOQYanRXE
         hkoXHGbbglNbp2QKsK1BnbUEic/ppTrKIy2gkqGxq85WyFDsE7lwfbRkMrP6KLslIiOA
         prY4GJfqEz40Yuxc0cjOrtacg7HuWORn5QxH3mVAfkqz9UFp5+kZlP8UQSdlb2x6Gvi2
         zTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499251; x=1793104051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=datZWh14WO+4vzm/A7OIElTb2FmU2wSjN+th3EqRvGM=;
        b=iTTR8g3XAK3rE02yAASJLEqADScN8DjrqA9oXt6by5eI6deHnbHMrV3bvUtHpoL/td
         YOFBGh1NZmtB7Hp2IHZKai0SWkhZoMAL04s0Nl1BybSORQ8cb5kvQnmInSFZEMkuj8D5
         Zu57lJiZdE1T/OXYM+d3/79fLgAHKUdGDr95lkb51A+TPEa0AyTM46l+XdWGQ0oaCINE
         sDNY0qhsiTDHBokmfDkSNSQc3yz5XwMWpAiPMJPgfaTHv0zK8znCDbnX0jWwuSR5Qvty
         QKI8faxKBFv+olAqHRTG/6N3TeSxoYMkRTo8IosJGDEEs4Yzd6PJ8/pNA0Zc7hORI9zy
         o7aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxADJGNivTfeWfL1KauYhueR5sg+r7wJdjsPVGIRd81d59utJAgXVvGHXyx6J0URvfxlaKwnnbBLjmNELPL+A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKh8Zitm9/w+HUufBDMHL0DxD5EYFQ0cJfPKtEffmTeQw7sk1FR
	DX8BK+1yq96YoeoGrGGAhZ4jGBy1NX791GjmQSlHLCBaEhCzQDrkmAGR
X-Gm-Gg: AYBFou1XhIkESmzJMpU2fIi+m8ti+bv93NGu4l0jy/KkVyH1+PAkAnmq5/QnfmhuuA0
	fYQMpBlpe6W9lti9ysGwrdVBZgFl65Xis//z6d3NRcY88++uKwBIIIU8Kau8b1CODFkmLXj6dRd
	XsoNnaOy1gqh9cbD0/JluP2t1+2siGNvORFhSW+6PXUH7tUNqImbNYdCKQhtVu1VmLpia8jQu/b
	fo7YWVX2lJkUeuS3Nkq66je5kDjGoSB9bKr5i4UDTNQm3opECu9rbQvXagWI64ux32VD0HeHUEj
	2nJDpwQtRxop0LHuyHUBJDAkGxS1riEEaxQXRnGuV0dm7qB7nCrR6qjRezWyhJw59irs/kgqGnu
	fo+V0TVV3VXuL1kZ5iAJJkC0axxPLu7oKR+e2mSIhx0DKqPciHOxcy8W8RX2IctdNQQB4/OcQil
	/FtiXg1ufPu9YjdtQyjQZ6L2iyQEem2Qj3grJamCKSIPmSQQxMX1AgBA1vsG4cyzJakg==
X-Received: by 2002:a05:600c:1d0a:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1f4172b01mr47842795e9.7.1792499251128;
        Tue, 20 Oct 2026 05:27:31 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817f8dsm5617092f8f.23.2026.10.20.05.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:27:30 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-input@vger.kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Input: goodix - sync the irq controller while starting firmware
Date: Tue, 20 Oct 2026 14:26:48 +0200
Message-ID: <20261020122712.526797-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_052733_933160_14959E98 
X-CRM114-Status: GOOD (  13.02  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Lenovo Tab E7 TB-7104F which has a Goodix GT-912F touch screen,
the touch screen fails to come online after loading firmware, producing
the error "Error reading 1 bytes from 0x8041: -6".

Comparing the upstream code with the Android stock sources a call to
goodix_int_sync is required between the upload of the firmware and the
watchdog restart. With this change the touchscreen is correctly detected
and working.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Relevant bit of the stock source driver at [1].

Credits for noticing the issue and finding its cause go to matemiller992
on the postmarketOS forums, I cannot provide tags as he wants to stay
anonymous.

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529

 drivers/input/touchscreen/goodix_fwupload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
index 5ae9a109ba0d..01e7705ef515 100644
--- a/drivers/input/touchscreen/goodix_fwupload.c
+++ b/drivers/input/touchscreen/goodix_fwupload.c
@@ -155,6 +155,7 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
 
 static int goodix_start_firmware(struct i2c_client *client)
 {
+	struct goodix_ts_data *ts = i2c_get_clientdata(client);
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
-- 
2.43.0


