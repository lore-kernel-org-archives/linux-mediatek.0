Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB57E9A04F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B891xQfqJbMXoe3QxqQiLDv6Y0EESVbArn0hKUogRb4=; b=K2Z+qOb0sW2Q8WH8y5zdUGLZ5w
	5SKPtCoc436P8TEJCNywe5lN2473s/6ajp9XgJ3a6iLHj+Rp1vSr883OoJ09gz2qdIAY2PA0mAX8h
	uvGcjnbcstcqFsczFMqSatFMYP4RvfR4Mx12F0GG2i+Zuo5uHUvx1LOEEUzlamnw0grzWTjgFf9Xn
	GoDX5qQR7G43Fg+UnKN3u/cbszug0b3bT0j6/O7p2YGj17ELcteaiMsNWv8BI3QPrNsbC0ueAhpJI
	j6t154jU7YSc0HiHgaDNq5S4evBX3Xt+ut/iH3iVJlonMeYATICmAp0HenyH6PgYFSzzirY8JtyB+
	JXudi9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5l-0000000AehS-01lJ;
	Thu, 19 Feb 2026 00:40:29 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5g-0000000Aef6-3FEU
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:27 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40ee196dd78so272725fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461624; x=1772066424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B891xQfqJbMXoe3QxqQiLDv6Y0EESVbArn0hKUogRb4=;
        b=bU9mnEzAW3L8W5LuYHd641lpkVed8zUjzE3NmvN3xjDqyG+2rNGZdFnKzeIa4z4PQj
         QE3dtTebhlnvaXB9Gl/GdE1yNaWwoeZbTPgm9d1u/Bw37LGaSf4b97xIm6QnH3LqcjTA
         mAeg0yXXUbBd9CND0hbcgzsACnntfYouuoNy2D3IK6UT7wHpSmT5AWEZsmO7tkuCw3C4
         vye/MFudh56Jqc6cjY0MNRMyDYeHj2y2yg+L7MZeAmRbgmji59DTJvq5Tp0NjKNxPWa4
         I7aAT2lMvUjDqgDod0jgOIsB9uFn0cLIrN/Xivaveg8ggYv82syV+dWgqu4nGtrZv10V
         UqTA==
X-Forwarded-Encrypted: i=1; AJvYcCULPAWpoYcoxsRehR0ATmC/pub6Cxh5ia0DfZvZFYy6tYL/8d4b/um9Rseiegq0Kiw8ussdWAxg+tu08pu/VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvm+C1HKUlzH7SzVZgHzrGZ5tNl8+uhYWUH9zdIKLFHpx9sHos
	xZrzeek0CnT9VhYgtFTs/nrL6nE1oOLd7PlGKR+iFEklGPCO4dotPm2tkjtYSg==
X-Gm-Gg: AZuq6aJqVSW5qAtQ1xC4uDOOIRJrCcadjrzrIMxivS9miZV61bA8+Cj2ZIqoyHSPxrf
	WLOLt+t7Ks/OpiJ6ia7Bwq6A+cxQ+1aucp8353JndiLvReMtLWxc1H2YztD+gmDav5oJVLTdi1r
	Mbw27QmBerhtvlO/Egi/6x3HiiSOiYRCxExF2CG7r6K1NEJfO6H4VK7oCawT8rmjkOkEQ9ibhrc
	iHsdNeaw+NhfK99lSe/ryA3jxPVwejiaTmbsRmvZYXOlj8RAgG+dZzLuW1UDxnntprJecq52Ila
	khpoT0rl0v5od+I1TJzmikvoEBbnOLXktRtl8EucOq5VXbZEPqZTVvqeGB3rsLriiDx+feQ+TSL
	sCnkN+SJ3Y3jz/Ucz1eVUg1v8yemDhNF4nx7UmCM08RBcwIwo37JXZiK/MyxreN7zVMP7NOfFqi
	FI3A5BqrNCMSdYTOT8lDN6hVbmvJC5QPrmBZkv752HQTjsCOg=
X-Received: by 2002:a05:6871:825:b0:414:64dd:a2f3 with SMTP id 586e51a60fabf-4154591b202mr57947fac.29.1771461623726;
        Wed, 18 Feb 2026 16:40:23 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:23 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 07/11] wifi: mt76: mt792x: ensure MCU ready before ROM patch download
Date: Wed, 18 Feb 2026 18:40:03 -0600
Message-ID: <20260219004007.19733-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164026_246993_8DA3C784 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Sean Wang <sean.wang@mediatek.com>

Restart the MCU and poll FW state to ensure correct MCU status
before downloading the ROM patch.

This is a prerequisite for enabling MT7902 PCIe and has been
validated on MT7921 and MT7925 since they share the common code path.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 2142fcc4ae27..152cfcca2f90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -926,6 +926,13 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
 {
 	int ret;
 
+	mt76_connac_mcu_restart(&dev->mt76);
+
+	if (!mt76_poll_msec(dev, MT_CONN_ON_MISC, MT_TOP_MISC_FW_STATE,
+			    MT_TOP_MISC2_FW_PWR_ON, 1000))
+		dev_warn(dev->mt76.dev,
+			 "MCU is not ready for firmware download\n");
+
 	ret = mt76_connac2_load_patch(&dev->mt76, mt792x_patch_name(dev));
 	if (ret)
 		return ret;
-- 
2.43.0


