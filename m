Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C972D2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/PQS/8RbHWMjns+hXbfTHhQVRn54n1C6fHMniju3VI=; b=Y2GmcM7LJCFzWj1N7AQkzfmx7j
	nrQUYQpo3orxlxUmYhr5supzynyc7TQBiGNwKSXtckMsEm5n+yAlOboqfXEDmGB69PHaE3GtCC1um
	MmB4TCyIXPHdKDvTvOBN0lGUBg3G696H4gU+n6GmRfKUfxYVSt5gRQLpFuWbjt951MoaO8soKO2qV
	k4YkeAH28ZsqWyGQ+Bux5zFQRblZOlJjQEMMcqDtJ3PN10KLUqT9rX4yWXv3VFb1HpFmp/MSuQ674
	+iRqJE1fMRr2/0eN9ZwfBENlSP+vaZaRuxSPvQ5vQX2geu0d4KOdsGvbpIE4cWWECwxXvpGMCYmlh
	/8k0btuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1vQ-0000000Ea5T-0WJN;
	Thu, 10 Oct 2024 22:46:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0ff-0000000EP4K-0YHP;
	Thu, 10 Oct 2024 21:26:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so742156f8f.3;
        Thu, 10 Oct 2024 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595565; x=1729200365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/PQS/8RbHWMjns+hXbfTHhQVRn54n1C6fHMniju3VI=;
        b=hdxNhDmROuihr3J6sriLMR6SYxcpS3lpW8YDaymhRbRGbAmTmh70tJD7eiSTTpK4lP
         B4AYsU3DdVh8ad49vZLi0q0+tol3XQiZL/sNwVlBvyy8V7pjj8vmyfUmkIEPY6Xz7Omo
         u89I0spKhaslv2z1vGhkKjelJkf4gpgPUL2KjDkx3anOog7C6DMXRAWk7MqTyNRzANbA
         P/Jl8s3vcizIslPUD8MLZMpPCc0qW9PvmdQQH9ZU+N6vhmWfBi0E2Tcc0Skwqm+2mHte
         7locgivW5wupIfOecNfDgt9eg/g2KtFaWXvhUT+6Ui3Tq65+qeVLw9SX8ER933LkJew+
         a4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595565; x=1729200365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/PQS/8RbHWMjns+hXbfTHhQVRn54n1C6fHMniju3VI=;
        b=nRntByxercVxqJPr0g3lC4y/cIVVPF97qkI1zgJD5U2O3/N42kDdhWPZWUMTe+Pm/z
         7VTdQsWBQyegzYk9G6FUA/hlEnLogkPOETboGod+HPpVSVPGoDSoQjQx1ZieNbYSD9Mv
         kgEba1BU2sgZThSIqCrC4utpL8ZgaYIUMa1FB+f0/Wzd8FXwsp5Fj2T5F9c4hMcD4xcQ
         lUOgwozViwKXaes02ZMJN6Rrlwle2vQ6BDBDB9TOmO0gL4Hr84xMm9uDONxZdNelDAuT
         KaMkRq02JHMJAyFc/6jnETTmOYF/g91wS+ZD1sP8ijsesb/hXW89tjciLNKwegxZlxni
         R6bw==
X-Forwarded-Encrypted: i=1; AJvYcCUDlJYCG9649CyamfScw+5PMkYTPUWa0rque1AuLY1QdXwlJY1E91yngn6KLVfu7BLXsfEuOu/HIFPho18t5fE=@lists.infradead.org, AJvYcCVJ8LVHfVLez8UHWHQUiawK9iDRDQab5ABN7HA5ZCKyctOFIpvJfk2cmLCZstlwvKUGpNaSAqduPcKN4fv+f8MV@lists.infradead.org, AJvYcCXlw/JqK8qvmyH5Ng0jJKLMUEgc1pKRQUjVREHRLwsc223gHY2pxk28k9fGO/F+Tu6RWsWpA9XzQkDjqIDCteympw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF67lN52DTX0n1PHK0HSApjk3J3e1pgkQd4RxbA1IZgLDFZ7Pb
	mbhqhtEJIAdPt8dSjqcPfk3wq863M0rdLQADsE67TXaX5WZ/x3zk/P//4Trn
X-Google-Smtp-Source: AGHT+IHTagaYiTqDEo8/KQexjkWrhnQ6PMf/Wmq6Gqr6clYP1OUl5dQgDZmTtwi4XEpJMk2I20xVwA==
X-Received: by 2002:a5d:4acc:0:b0:37d:54a0:d0a1 with SMTP id ffacd0b85a97d-37d552cdd6dmr236882f8f.56.1728595565212;
        Thu, 10 Oct 2024 14:26:05 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:53 +0200
Subject: [PATCH 03/10] Input: sun4i-lradc-keys - switch to
 for_each_child_of_node_scoped
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1723;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=AF25XcLrg1gJJCZ0loQqPaYtp8vI7GzZlTAbicwO06E=;
 b=wi6sf2KQfPxfVmYIPTgXn9ICUj6hhr2iRzOEK7JHXtgg5cLEOvCV7676G+F2C2arErdMBYj3d
 bSCk+w+kbPfAlODbaQuyP1b/Crwa0KT5OQkJ8a44SmYDIBq6lvZCcZI
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_142607_209739_E58FF595 
X-CRM114-Status: GOOD (  12.55  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the scoped variant of the macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that
the child node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index f304cab0ebdb..f1e269605f05 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -202,7 +202,7 @@ static void sun4i_lradc_close(struct input_dev *dev)
 static int sun4i_lradc_load_dt_keymap(struct device *dev,
 				      struct sun4i_lradc_data *lradc)
 {
-	struct device_node *np, *pp;
+	struct device_node *np;
 	int i;
 	int error;
 
@@ -223,28 +223,25 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(np, pp) {
+	for_each_child_of_node_scoped(np, pp) {
 		struct sun4i_lradc_keymap *map = &lradc->chan0_map[i];
 		u32 channel;
 
 		error = of_property_read_u32(pp, "channel", &channel);
 		if (error || channel != 0) {
 			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
-			of_node_put(pp);
 			return -EINVAL;
 		}
 
 		error = of_property_read_u32(pp, "voltage", &map->voltage);
 		if (error) {
 			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
-			of_node_put(pp);
 			return -EINVAL;
 		}
 
 		error = of_property_read_u32(pp, "linux,code", &map->keycode);
 		if (error) {
 			dev_err(dev, "%pOFn: Inval linux,code prop\n", pp);
-			of_node_put(pp);
 			return -EINVAL;
 		}
 

-- 
2.43.0


