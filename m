Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA1BC5DF9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hQSl+XtklSbRLYOghyQhip4h8J9A/gGyo+0gJ8GivQ=; b=DyBU5ppH2StcO+yGyLrd6Rprmp
	Xy8S8jOuyCgHHs/DtVIJizBP7ZUv/ViwTuw+ph67hZPIlekxuI7l3VnTY7YA+FXtxif6el0cI8vMo
	nm80VL0n/wusdOeuy5peN3MN39iTaWHOiUqdxrEdWltc43wFutNVzP45mTIwEyDtS4b0ryRlh9Sqs
	sOIY1CeL6Sxv306aJB/4mvMIHG8o+wQCWk/xhU9QdCocF5zkImt6Ew1qBWYK3N2Uz5Lxzo0Us6rS0
	rw0/2KHaKrX0P/IN7UzP+gvQpiCO8TZoc3bXXrDAjvzzGrexIY6O7ujM/27epRm5m0Q5Lbg7sXIcM
	C4U+vXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajY-0000000HKXn-0tBR;
	Mon, 24 Aug 2026 19:53:28 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajV-0000000HKWJ-3HK5
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:26 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-451d8064238so3724610fac.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601205; x=1788206005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hQSl+XtklSbRLYOghyQhip4h8J9A/gGyo+0gJ8GivQ=;
        b=SasUZLdZNwkPtkoD1BIl2DpPqesugfFjAUaVU4C2DN0bKYPdDKN9XPWKZsdQczKBjX
         OCw18lDInQPsAFBcvePKAfMUkmz5RALpidrJQ2EjsC/NutNFr9oaKZQa0IQew/Vr6HLd
         38PN/NTwX/mCUjNteBiMc5XkXq7FEYruzHyAaOcCr+Z9eTG+j1HSy50NuCXX9LSCcVNX
         hlZKol3rKaJMadDr38QyQcJtq48ISFYfQDshSxVK7z6ENCcGdC9WhPenuim6ch4abZdw
         Xa6tMM+pbQ8hCbdlnCxL3lXr5/+jMKRI4k0mv58uR40MYgUWHHtty/X0PICv55uRHI69
         XahA==
X-Forwarded-Encrypted: i=1; AHgh+RqXf6l7F0k+5DOHYMlpfE0EvShP7vhcZRD4Wb4BRl0SQ0+kbQ5AW+41+ed42gGTE4p9QZXvt6UByFSSxAGYOA==@lists.infradead.org
X-Gm-Message-State: AFuF++mVO56yCYCNgqNMoeK1yogBou9u8KPPqLC0XjiSqcfTxpMYEsHq
	kO2GAHvHTza2ji/wdf58xI53x+7J/iNyfQYU3KQzck4vDjqH35YFPPlA
X-Gm-Gg: AR+sD11vxzZ8BWuGgFFc04P8WzTZiX72PiSJ6Xoyun5m+bQ2WKlzd2M3AiSuS2GH+mK
	aETG1hhvEtG0337dOEkw/aQg9OI9Y3GYelFL1PYu9fKcJc8LiDzV9ebo9NG23CamUhw3536AuDq
	kJWfmCRCKeMuJrEC2f4KWlXSaO14guoQvXwhcVd2AiJdsG5iVUEE2AxhiY9GEbOyeHTbu4Lz60j
	MUSo/haW40z9SPbz1aMtUUHHy0nVpGMXGedTinnf/XmKUG81aB9hZ+QStSaSNwVk3PvDRjUpX2e
	aCFrgZDtSdNZzf7UQbxuj+bxPSB6OF+W3DOCUxiSOFz1dV7t2zgXJLZP45nfWuK6rbHcHi5+0wk
	0P1CzBG89DrIJKUP6ZzFf5Ljf1LUMNbXRNjP59WNNa1YHhwKC8WqWAf46rwsViXfFmCQ9FRBguC
	CRlZ2JuAWEXK90wnA8PyTutIt3UtmJZUwMCEERObxq5HhxisqMlPbKWowsO8OnhVtibYXdCDvKt
	P7g+oCn+xfNJmcbwQB4I7/nhBe6mp5VE0yceWPAYOc8SEf4OzUEuPE=
X-Received: by 2002:a05:6870:6c12:b0:456:5461:11d9 with SMTP id 586e51a60fabf-46351688519mr31177819fac.12.1787601204701;
        Mon, 24 Aug 2026 12:53:24 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:24 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 09/15] wifi: mt76: mt7925: replace NAN DW end event with DW start
Date: Mon, 24 Aug 2026 14:52:21 -0500
Message-ID: <20260824195227.12589-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125325_821565_5A2B5142 
X-CRM114-Status: GOOD (  10.69  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

Handle the NAN DW start event instead of the DW end event for DW
notification. Queuing NDP action frames at the beginning of the DW
window, rather than after it ends, improves NDP handshake reliability.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/nan.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/nan.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 527cdb3a4ed7..fc105e48eaca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -422,7 +422,7 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		case NAN_UNI_EVENT_ID_DE_EVENT_IND:
 			mt7925_nan_mcu_handle_de_event(dev, tlv);
 			break;
-		case NAN_UNI_EVENT_REPORT_DW_END:
+		case NAN_UNI_EVENT_REPORT_DW_START:
 			mt7925_nan_handle_dw_ind(dev, tlv);
 			break;
 		default:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 8ddb0a6d73b5..b03b909a98d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -92,6 +92,7 @@ enum nan_uni_cmd_tag {
 
 enum nan_uni_event_tag {
 	NAN_UNI_EVENT_ID_DE_EVENT_IND		= 19,
+	NAN_UNI_EVENT_REPORT_DW_START		= 59,
 	NAN_UNI_EVENT_REPORT_DW_END		= 60,
 };
 
-- 
2.43.0


