Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F85BD68BE2
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Nov 2024 05:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1VW7Eea+1GT6H8MpnapiTmJLeEwFPnQEnPcJgx9UmgI=; b=Js8+JyUYkqzK94RtKujerHALhi
	RB6sDC4X0gQgtklNRtsMlpk1i8QnTKwm39G7CBbs9VvmvWlITNwU7B3S0ic+M1Rl7teHNINZKBpnG
	54qFYJqwJOatV1GQvQ38Sy6+WunTAAoleYB7qVYWvIGd3AhdfS6eIFUtzKu/Nt52E1UkHkAJLTjEa
	5DFruhrjOSAOvpDmnwBxbqTHKwyKWQlPU1vHVLcGnSxMWHTZ/qCT/bDgYS84mPob8SQHjmAe+Tns/
	XU9xxLVtrCCYmj65DbvgV06PRfTL6QkZTCHLZYOjYadly0KtJUZCPJEYfyxtz21nwWhQR/slXR6O+
	E11gx4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCXnZ-00000006qGR-3XEd;
	Sun, 17 Nov 2024 05:26:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCXmd-00000006qBR-2PlX
	for linux-mediatek@lists.infradead.org;
	Sun, 17 Nov 2024 05:25:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e681bc315so2192764b3a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 16 Nov 2024 21:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731821114; x=1732425914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VW7Eea+1GT6H8MpnapiTmJLeEwFPnQEnPcJgx9UmgI=;
        b=0/r1pXph5UIw5IsqIJRsgat8a9WZ8PX5FaI4STqOS4+sYDqfaowK9FVDRUXBH8KcYR
         Iv+mq86RZ4jWHQRBlU9UMDMjYvm2BbUPU9raaj/F5nNyiQ2YFg+yJvoSYCCJJ6+dRtpA
         xhW0Mcc0ZmGpwe3vLXe7vZ+NDy87EK/kzAVPubXivoOyHum0g6HAMy/RJ44Yj58sgfhb
         BDp81WrLo5BwItNcFEZ+oVSBP5EpsveFaN4VthWoElx5rIpCGqJVNsAdZq2ia5asnbek
         vSOd0TzHDUxCMsZRpJVTY8DG9UwF9YT8UXqzyZbP8lxsOK9HPhs7GW/aG8NCWFwfuZuM
         NoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731821114; x=1732425914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VW7Eea+1GT6H8MpnapiTmJLeEwFPnQEnPcJgx9UmgI=;
        b=H4o5Tz9bmr3RhKK+18xAztXQL+ehN5kvXA94mDnBAbRgdiVarN0zzUPuPtSIu+70hz
         BM76rYFQW9ncVVsek4ytdAYJPj42Iu3K2XqKyLAFmiMC8J3D3wdaxWQDQE8i1GPlFwdx
         0G/EVu3wQ0sV91Ij5Ww+sTPpmUApu3PAVdTXdteCygHyBhzyNPtnY2cRCHyFQXoCWjEg
         JaePYvywiQnCAFog7O+wqT248widpSTIEtM0L7gdXxqn6TxyoGrJXlDtzlA9c79ntkIH
         Pess6JAuobFZQNcOjc5e6XB9mbODVTOD8e2omTT4lkkHQ7syA/PaMt8a1AaHR8VHVjwq
         y/CA==
X-Forwarded-Encrypted: i=1; AJvYcCWJt1REwC/0u2lm3R8gtNXgjViX01XnpliVNUV9DKS4ywtCP4N20JxMLltlfmf7XCPmofYSLq3nuJHSA0M3dQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK39otsICUrbsLjBCC8NrG5UOUuLb6Oc9qUHRhyBcZ5idi9j0s
	FGdu+sUTMCeCWhamLlaxbSaEcoE0eXOVzgTviKWmgivASppqiQ+i/OPESZHb
X-Google-Smtp-Source: AGHT+IGIKhBFzH/0EKB/6b5lM8SAr8TWxF0Njpp5ye0c++OJX5e0IdyZKNZw2hCNJzCUyGgKB+BcJg==
X-Received: by 2002:a05:6a00:10cd:b0:724:7843:4cf3 with SMTP id d2e1a72fcca58-7247843508dmr13674357b3a.0.1731821113905;
        Sat, 16 Nov 2024 21:25:13 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:96f6:cb09:e09e:fe02])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771e1a69sm3956170b3a.141.2024.11.16.21.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 21:25:13 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Johan Hovold <johan@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] gnss: mtk: Simplify return variables in mtk_set_active and mtk_set_standby
Date: Sun, 17 Nov 2024 14:25:01 +0900
Message-ID: <20241117052501.1138926-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_212515_647885_226BCC0A 
X-CRM114-Status: UNSURE (   9.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simply return directly instead of assign the return value.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/gnss/mtk.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
index c62b1211f4fe4e..be20f6d6470736 100644
--- a/drivers/gnss/mtk.c
+++ b/drivers/gnss/mtk.c
@@ -24,25 +24,15 @@ struct mtk_data {
 static int mtk_set_active(struct gnss_serial *gserial)
 {
 	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
-	int ret;
 
-	ret = regulator_enable(data->vcc);
-	if (ret)
-		return ret;
-
-	return 0;
+	return regulator_enable(data->vcc);
 }
 
 static int mtk_set_standby(struct gnss_serial *gserial)
 {
 	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
-	int ret;
 
-	ret = regulator_disable(data->vcc);
-	if (ret)
-		return ret;
-
-	return 0;
+	return regulator_disable(data->vcc);
 }
 
 static int mtk_set_power(struct gnss_serial *gserial,
-- 
2.45.2


