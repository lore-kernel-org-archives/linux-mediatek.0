Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A65C98328
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=; b=pDWZJ2lY8XT9k2t9A3G2t05IBw
	5cOTTklLcip3DXp6JgKIxvTTfPpzdC8v/tp7+AcCMVdk/kGHzQW+a/8upOXVTeCenmkef6Eu+3CNH
	OZ8WoAjZaE7VqYEfxXEb8NIdc1omnF7/jcud6lVxtp8E19KJ1cRnov+AbgMJog+H0EibIdd0dSDkG
	Wi+nzvWYu3OyQnLFVggmperteYS7g5u6Yvi6IPN0LLkVlYCQ/uJH0P3ZjwxB5bXiuUfcFx4kaP6Hh
	7qG25bGNPR818VMaMOPcxreXneiO6P4XcNoL1Z467j/qCi9OU0jM/L6NoHw3euz8PLZPh3U0z3dpH
	1sM1R9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPC7-0000000FEyd-1hC5;
	Sat, 26 Sep 2026 09:59:47 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPC4-0000000FExe-3Ml2
	for linux-mediatek@lists.infradead.org;
	Sat, 26 Sep 2026 09:59:45 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-398a147688bso1200339a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 26 Sep 2026 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790416782; x=1791021582; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=;
        b=SSbT78aIxiKHlzqdGmZ+KoYP95RcVdyj2MvVnbR0Rib1SE7uMg+8jJ3+gokvy9P3jd
         1KckaG+Rqn/REa+q3w/1ucA9IzpMn23qmG/i3Ik7PXKmK+5wSJg1fzBLUUXa9PNeFjW0
         jU0OzM4M6AbpRjGF2YHt+9LtKWhSA1gAPpeSwpOYisvh9E9LvMoZV+XATVuC9fDiuQl1
         LiQNBS+acyNICn4S0YqzOMx79WY2UCGWD7XEd08moyYCvZLcOaSeFgJJlewg1VjfyEAQ
         r7HHVJI37hA2TCJvunihYomZ8a3ebhFmlXJlS0GUQ7SYMMoqT8E9pacCgtpc6RASUA5g
         eD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416782; x=1791021582;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=;
        b=tnzQ+rJ5bPlI++S1Fnt98URVNK23E66+udBpoIGjZlsdMMCge3RMZEjLf8bQg7UvV7
         tobQuvBkLgt2shE4mu8/LB8TgbHrTUsxVefVD5UqNX3ooXKO3tvE+hggIXIJyDdPpitI
         /DoUNDOWcAQMSwbq5cTZDANthSLjQut7YIKVAHaAMrv2uGmnsdVcF2XBTjjTZD95jlHp
         QpXX1eJFukJNcCS9mMfVX3Ahe558NKq0QoC5LU2rDmCXchBzAqajFgkEf62cHjxLOuXc
         MAbDAaVoKJzE70+fgXgLiB6pAWLcuUcKO10hyl6D+B0RxbP0k3LxYeg7OLbjx1/+00eJ
         8/kw==
X-Forwarded-Encrypted: i=1; AKwUvBzXw0o1DZ11eEy3cx0OvWL4K073ZJqcFolhQ8u5w7kUb1bVxmqwdeCmlx/ahM1RQg8guwlVIjf1wEqriraPqQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJVKjvGz0MAawGczruoaRP3xjBiIw7qCQ8N7RPxG3tpUeIOxKIH
	wQ72HuKuIZ/mV7SbkbXLKhQOfNr6nxKVAjEFLx7e3QSy/zNE9sBaoDsO
X-Gm-Gg: AYBFou2BHuIFxULFwS0hlDksZIDw3meRLugHRpHLUdYJgnE3sQfBaweYVW7ZE4Uelda
	Gok5DTc8cvW+6HUIFEB0VqpEHelamy0uY10dJIahgNlqMuU+K4sVab3ISZN6hz5RnzgeQw6eun/
	5eoHOOiEEE0ii/So0GP4NX5n5Nxf+cdpWIj8PJKT+Gt+o2bOfbH4zC6vOKEzBxC4pMqOjW1eFqc
	bJxhm2PPuxGxQE7oLV6qILCQ/fvTIENq7ERoFCLpsouvl4IaPuRproR7WNVqG2c1n4+rm4o3Cl4
	ADU/CLBMJWLFqRU64LHd41vB68/fX90RGEnWULaMihkaI47fQC3cBj/nghDZSg7hpO5kUeK5jmg
	ZsbsoEPLRQqssLbD/2hd9I+CeV8zaZiUwzC9IAOMY6g2A2Wk8zYfUZRY0AtUIPIPxrAYMg0Jw6Q
	Msg4PLYlxt8mQ2qB3bbapyXge15SADqhTOGLhgQoKPeakKwjBX2DLq66smoD5mqyPa1UY5xweIR
	U+OpG67AQ==
X-Received: by 2002:a17:90b:4a45:b0:39e:1633:d29e with SMTP id 98e67ed59e1d1-3a098d43634mr7056631a91.5.1790416782257;
        Sat, 26 Sep 2026 02:59:42 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f7:25d7::3c5:1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09766210bsm15033663a91.8.2026.09.26.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:59:41 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 17:59:28 +0800
Subject: [PATCH] pmdomain: mediatek: scpsys: add MT7629 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTuxVlPAqxAXbRlkEqlkppoaw
 t2tLt/i/w2UhEnh2mwg9GblZ6o4HRqIs093Qh6rwRrrTG8dhgsuuXW2R42rfhS7bjRxOrfRkYW
 arUITl/9yuFUHr4RBfIrzb/Tg9CqYqOTj4jWTwL5/AfKwaoGGAAAA
X-Change-ID: 20260926-b4-mt7629-scpsys-88d0cf37c6e2
To: Ulf Hansson <ulfh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_025944_842623_ACE8B152 
X-CRM114-Status: GOOD (  11.37  )
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

MT7629 currently uses the MT7622 domain table through the device tree
fallback compatible. Attempting to power on the WB domain triggers a
warning during boot, and powering off AUDSYS times out.

Add an MT7629-specific match entry to register only ETHSYS, HIF0 and
HIF1, matching the domains exposed by the vendor driver. These occupy
the first three entries in the MT7622 domain table.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index efc8f276ffce..2b5bd8d61cb5 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -1073,6 +1073,17 @@ static const struct scp_soc_data mt7623a_data = {
 	.bus_prot_reg_update = true,
 };
 
+static const struct scp_soc_data mt7629_data = {
+	/* Reuse the MT7622 entries from ETHSYS through HIF1. */
+	.domains = scp_domain_data_mt7622,
+	.num_domains = MT7622_POWER_DOMAIN_HIF1 + 1,
+	.regs = {
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+	},
+	.bus_prot_reg_update = true,
+};
+
 static const struct scp_soc_data mt8173_data = {
 	.domains = scp_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt8173),
@@ -1105,6 +1116,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt7623a-scpsys",
 		.data = &mt7623a_data,
+	}, {
+		.compatible = "mediatek,mt7629-scpsys",
+		.data = &mt7629_data,
 	}, {
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = &mt8173_data,

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-scpsys-88d0cf37c6e2

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


