Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31437E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpVhxS7jqXsBo8scTDy0x+y6eI+LhzVWJoven7CoWuY=; b=e5RBDTmrypppMEDFou6RJR93P0
	eIAIf07udXl35eLffiAJdzKmIjE+Q/5di66j8Gy3Ckuj9Fn+EYY7xjONJOK8PSe6D+32SeggbD+7r
	94zqfLbC1DuDBwWAIQcHK9LRFguTN99uEf1A0oPf2nB5h9BeWSFzSDkFZTLJvJV4gcpErA1Z9b8Ry
	aBMNX4RDXlBIimb5IKcZfEUxLpI5MjsNMTrEyAzLuegxXvZo/Pe3Wi3ciDH8QcOZKdeVUmq74Fzle
	MqmrtBo/sI8SATIqUQrB51OiFTZBqe+KnY5knX7uv0UfeXsT2O5r9rnnEhgLgBwYAaOQgz4kFy1Tx
	FpNmPmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOM-0000000DOh5-1aN7;
	Wed, 11 Dec 2024 01:19:54 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOK-0000000DOfx-1EIZ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:19:53 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e1d6c7738so7359a34.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733879991; x=1734484791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpVhxS7jqXsBo8scTDy0x+y6eI+LhzVWJoven7CoWuY=;
        b=EtVIc52vYeBdU9kUlQ2hfjrRHDV0IFom4AAaWiW0ViKnZ1KxvmRaIGF9+KcVIoaHUf
         F7LyaM0Zl+npNKBCx8Ktu7lXYCuu/wNCCi0uEpUuv28PZ6o7TYzSPQJGkVCwn8lviMVv
         Y37Xz8xaNsEQVcV7BS6hreozJHXK7kg5GNTeBmkgSYfhcS2U/+ZYZQNPkner2cKlxUtN
         qOXUoEvEXv2gf2XelEE3NsqhKA3J6PJwgkIcg7esI2MdGoSDtI/CIQuaB/vUnSzDrZDh
         iWZBlLGoM5VRPrKiF9I+cYlkyxV49u/19Hl/gep98Da826dwZAvcRvjdBdQMgAqItfuU
         N0oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqRvlfUvNQqHmFMaS6UoKzSph/HLxwC/9LN8+OND2qtDBTtwcfOYobWsTwiM0S5pNGxRwgzrZ1xOapDLnA0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC4BLtYbQ6eCuyZSkP2kkU+P0e4iOIZYUOIJehhP51Jjr1+9kN
	Vj6PFV9/mxhcCWgbkyy9nCgBVINIBPv/xZ0XJDvhRhI2lJ/z1voJ
X-Gm-Gg: ASbGnctB3VKb2DZd2JaMOJOC9zDaJODyFPt28AP+JzQCsyvl2z9Op5BFDzIsoHLi+iQ
	zj4snTZc7pcAEgjJ7ErDLY9NZ6kxdrdsvZNp87kNmMsZV3XQRtqInMhdCdloqZimULbg/TjFSEp
	sL7y/tjazKdCemJDXfmwXuo2cJqsDqSdNBooD77gJpF0zHhIt4EQ4ypm1M10m20hRTGFMc+vW71
	m1M83imDNPlG4Ynf1zPOeYtmdYYLdm984MP11nuDKWkBy32qIrykhvdUwIFL5pgOzbB6y0=
X-Google-Smtp-Source: AGHT+IF5I9BChu/+PnBYCjP290N4JLBxE7ykFbbUyl855H1vZYnMKRE0FkIgujm7qjIVOEwqqEU5Sw==
X-Received: by 2002:a05:6870:a104:b0:29e:255e:9540 with SMTP id 586e51a60fabf-2a012f9fd92mr745313fac.35.1733879991082;
        Tue, 10 Dec 2024 17:19:51 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:19:49 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Eric-SY Chang <eric-sy.chang@mediatek.com>
Subject: [PATCH 04/17] wifi: mt76: mt7925: Fix incorrect band_idx setting when enabling sniffer mode
Date: Tue, 10 Dec 2024 17:19:13 -0800
Message-Id: <20241211011926.5002-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_171952_332848_C514BA2C 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Eric-SY Chang <eric-sy.chang@mediatek.com>

In the current sniffer mode, the band_idx must be set to 0.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Eric-SY Chang <eric-sy.chang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 7189d4f6dd4c..83f237d49c26 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1976,8 +1976,6 @@ int mt7925_get_txpwr_info(struct mt792x_dev *dev, u8 band_idx, struct mt7925_txp
 int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			   bool enable)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-
 	struct {
 		struct {
 			u8 band_idx;
@@ -1991,7 +1989,7 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		} __packed enable;
 	} __packed req = {
 		.hdr = {
-			.band_idx = mvif->bss_conf.mt76.band_idx,
+			.band_idx = 0,
 		},
 		.enable = {
 			.tag = cpu_to_le16(UNI_SNIFFER_ENABLE),
-- 
2.25.1


