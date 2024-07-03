Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E043AC3271E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwqorZoTFFCKliGP8pRCTs9efMb53TYnGt4MRvbI/og=; b=dXcXeVtgowDYJtj/GFo9X3sqcM
	MHz6SFXpGtUDkRy0g5LudKC9J+BotL+VIP+GSftWOqzhviXy9dzEuj1PRNX2Qtvcj9CaC/EeeYkjq
	euGfzLqh/OQi2rmzvPEFzV4Epf8TDamgXHgzdbNxsakr84YVJKMuHlCmUlM7VtuMPa0g2SMMqMQlT
	PTezQA1VDz1mA/fb7K5rquyJOOiRdj3UlcZOWj1FPLqcsN9XPwLRRH0s6PSWsxA38g2dS3EoXKlhT
	qE0teCogcazOMV/6ZlMUPXBZX0drQXctAhxyK5uctvNQwvAYULj0pDvSo7w132rb++1y28SBAja3U
	cgMqgltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lQ-0000000BXQV-2T0j;
	Wed, 03 Jul 2024 21:43:44 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lM-0000000BXMw-0VUq
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:41 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24c5ec50da1so3627fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043019; x=1720647819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwqorZoTFFCKliGP8pRCTs9efMb53TYnGt4MRvbI/og=;
        b=co/nzcxEURrQV9oRjyDaVV56iGK5LvAF5/Ru8lg7HjMeE7PPcWp1HRyYElb3hT9y7Z
         3My5Y/NBKAAYaOHaVZdp8LF22UHDcZROORNVair0M3veKVcnUUF0S47wEf+lGLbNgzhp
         FvAYkGRA6gYEWU1NXkCKh095R+GvvXc8Cbd76utFZAaUG8QIvaKxZQBcVmDUKkJf9ftS
         hubweCdVHz4jbW36GPi/clOAJB3KTxmlckanXOKL9CcgD3OKqDc6JarYPvE204vLnx+S
         rqSvKCeawHyaNq0kc7FTgjSo9gGq7Vpo7JoW/um/Rwxr/5hmvaMzZ9BWQY6JJrLnG7nB
         6rnA==
X-Forwarded-Encrypted: i=1; AJvYcCVE6+8geO0Mizd1ixeyJUPizzdIKOOS0xSlwyTGEpeGsN5uIC7FLpEK+mw6yTMVsWiOTPsc6rUSyoc8J+bJjkuXYQ0a+DWOtmhAj2HB4Rd6RMFM
X-Gm-Message-State: AOJu0YyKdQ9hv/5NS+P9cR9P8aZmzZCG2il9BSh8QolbGym7VAl6iepf
	RurVlRIKE+s+ZyJsZ4vZ17tqgHTpd1/GNmgfBVYexomy2oXbJq75
X-Google-Smtp-Source: AGHT+IHo1AAWxD+r1FVufqOGwJZIiBIJ5Fr19n7yL5Sc8XkDMXkfUza+KBsv5oIqzuNNAzCLC0jxKg==
X-Received: by 2002:a9d:6b12:0:b0:701:f9f0:73d8 with SMTP id 46e09a7af769-7020772bb17mr13165401a34.2.1720043018979;
        Wed, 03 Jul 2024 14:43:38 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:37 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 25/29] wifi: mt76: mt7925: update mt7925_mcu_add_bss_info for MLO
Date: Wed,  3 Jul 2024 14:42:30 -0700
Message-Id: <efa7e5623bd8adbf6d3bab293fcc292f11a2b8c2.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144340_380534_673E5A0F 
X-CRM114-Status: UNSURE (   9.28  )
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

Update mt7925_mcu_bss_mld_tlv for the MLO-enabled firmware

The change remains compatible with the non-MLO mode and the
older firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 8e36fb211dcc..218efe543dbb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2525,7 +2525,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		mt7925_mcu_bss_color_tlv(skb, link_conf, enable);
 	}
 
-	mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, link_conf, ctx);
+	if (enable)
+		mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, link_conf, ctx);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
-- 
2.25.1


