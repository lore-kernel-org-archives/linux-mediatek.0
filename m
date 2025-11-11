Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04405CCFA1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfBwH3pvPFzi+4ug5es45AykFcVvN2fmPoAZ0zn4NHc=; b=krvaIoS5b6cG+zECzlCFreflLb
	gSD2OoaCmDxYv2MtZf3bNtGFZHEzZ728DoIYdU+nL6NNSAopTdqiNq5ltLwG8XsJs3vBFrAX1Dqzm
	FWptZv1d3mOhynPWJtss3duX9qz60kd6LLyLtelWR/0gKjrP+PaLhf1llu9KlV/IHk21+bcDrEHzU
	swOJSQrAh2LBGzkQfvSEKBEutoOcobzn005NrHE+nvd/Q4sZs5zhpQyxprH1F2M2hMzuQ0NYZZivi
	N5iwWZ40G0D1rY8DRaVUfpy/b9Rit2dQYst9nUZTfLx06QyAn7yENc/wwb3NxRKi2F/mz33ABnCl6
	KdfvZ49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIofK-00000007G0F-0rjo;
	Tue, 11 Nov 2025 13:44:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIofH-00000007FzV-1FJW
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Nov 2025 13:44:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-341988c720aso3527909a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Nov 2025 05:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762868646; x=1763473446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfBwH3pvPFzi+4ug5es45AykFcVvN2fmPoAZ0zn4NHc=;
        b=W2wSqZXbRlYQ1IB4byngPYtylzw/zxB0eazH5BDrV05yBScjhKIeOnIRGFUiJ9sN1+
         mmQGcDpl+VP7V8WHUQk6BvRrN8Gd3tYaPsv19FwIAEGZOYU4rL2SYM10oam6pnnYOgVQ
         2ohywEEzVAX5+Q4m2P6GElkSC5ZzuWzfFJheFtJJ4E+eJUGvvPvuqlMb+qgzxozDFBz0
         1Ppf4J0bIr+OVjL+DRh7BjN2v+7gMljsdk+n6Tkc00Y7gdtyLN1z6fki9ItOTti6gS7z
         4cHo8/dIRrz8204iwXcJy90L1Y8WlrU0t+cxTo/Hoz0B/p/npIy08UHJxEHxXIqURfRb
         x76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762868646; x=1763473446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfBwH3pvPFzi+4ug5es45AykFcVvN2fmPoAZ0zn4NHc=;
        b=Ckp/HUEFlL2oqWzh3FIRSBfCNZiveTISa6zrH1fTHQySZSgbVHTzoCpzACAYP1SGH8
         5uQy9IhoRy3lH62Z8SBTPoXta9UW4ff8Io2yZVPf09f8VcdlBSGvIA47mWpEXRBF6ztu
         ihFWt1jXdsu3WOSnR/3n0P+odKzrfpch/4h1ftqNqKUYC4Tn4jhypX+p6K7eixIS451I
         iexK9Qw5pTbYm4OIRdQYOhQd/Y3cV7sxg8kOJchsy8pxstTwF0VA9avlDQ7RCqgTsp/B
         Ve2vgyyEgR2Us1x6yWPaQKHFY9JnWdwjzDHmrl1ReIdxDYT1dDaJQEpERdr6sG2BFXYy
         iYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Fm6IzEmsiMnKeIK6xTnQ/FAPlFiJeo6Wfoa0nWkhp7f8VGfGP9FnN5RQD5I+EgySjkcNn1cMxT2NAzjyOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8RSnTmSu1efo2x4tTKNoVLe5I+Kc5UQ4igyWTmE5FamptVRr8
	H4Ei/50EVH5uygjkn6Fj22UKW15WAXRiKcf9qIKuWHuh5jmaE9VHyfi4
X-Gm-Gg: ASbGncu5ucSlgidjpI8MUlIDwxsFpTR4e019RjFwMQeEx2h/rC8qS/rK4kkaV94gsn0
	8N13RS/3P8kmh01FdxD9AEaIgACuBzSeKP7fzJITc3ac2JR6jTkbAirzR5xhZI7eex6gZrmezVk
	dkXnJJw1UJBdQ9r7f19t36TUXMB/7D1XAe+wpy5A5pF6fQ9Msjy6a44ATIc+XrGnWw/uWeTKxX6
	/2aRu5Ya43vdCKRyo9HmDjzX0DF74dlcKaqd2shC+F0CYHAVI66xU2fY5WHHcOGQz5IP9t6/hXA
	WPrPBgf0Lql0VncppL+wOmkwDUDuSSQqRmAxFeJIt/8Nh9bbrDDJcOrNINnyWHkphRrU5J2vmCV
	XLzUuEUZfm8rLrpH9aY5lpkAGatvPb8Rbtw9HeDRPapZf/qaNrYsLFFwa1a+PYaLBo7JT+GIfNo
	dGiApvQV4LXJsldLwdR8GN/749m6hW75znZ1NOmWNlsRSbPDPe
X-Google-Smtp-Source: AGHT+IG5CX9IF+l5v2AZ8QaoKkuwIwFpaZ4ilXq5bNALaqBbutW7Q6S6AYvpVVhd99d5MyMbMhdjcw==
X-Received: by 2002:a17:90b:2fcd:b0:340:c4dc:4b8b with SMTP id 98e67ed59e1d1-3436cb284a8mr14778918a91.10.1762868646199;
        Tue, 11 Nov 2025 05:44:06 -0800 (PST)
Received: from localhost.localdomain (36-231-142-150.dynamic-ip.hinet.net. [36.231.142.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343614818f5sm12684855a91.15.2025.11.11.05.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 05:44:05 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Nick Huang <sef1548@gmail.com>
Subject: [PATCH] mt76: connac: remove unused reserved field in gtk rekey TLV struct
Date: Tue, 11 Nov 2025 21:44:00 +0800
Message-ID: <20251111134400.5258-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_054407_358066_94896DBD 
X-CRM114-Status: UNSURE (   8.37  )
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

The 'reserverd' field in struct mt76_connac_gtk_rekey_tlv was unused
and misspelled. Removing it cleans up the structure definition and
improves code readability.

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 27daf4195..28cf46a5f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1681,7 +1681,6 @@ struct mt76_connac_gtk_rekey_tlv {
 	__le32 group_cipher;
 	__le32 key_mgmt; /* NONE-PSK-IEEE802.1X */
 	__le32 mgmt_group_cipher;
-	u8 reserverd[4];
 } __packed;
 
 #define MT76_CONNAC_WOW_MASK_MAX_LEN			16
-- 
2.48.1


