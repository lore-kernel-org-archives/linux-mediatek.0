Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46CDC28B30
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dhyguxhy3QF6ssQ6N4HmtB46ru/Kl2lPpRXSHmaJ/rA=; b=smr4rdYV+kR+zvEKYzYFEuWa53
	9YP99fytLm16RoE+3UxTCiMDdPDxjaceDdskfJ4wJt8CTcQ2ZYm9hdwicnWNbj2JXx+F3A7SaeMI5
	wT9jI3aZ9rR8daVLo5i8jaInM+HmZKPFr0X8ITOwRvJLT0IqwXnIPK91FQ1Hx83NpP7kRFRP6IqST
	1iCEwGUgiAmQPexbyIiooktplxsF9weq/tpPnoobB3KWL2fjFqQe3O5eilC4GOz0tH90p+TGN1pq5
	UooLNHJy3o/RvdqMoy2NpIUoquQoNO83YBcVym4YlU+jDl5pIRo1AIIK47BARDso4qVBTvTfH/0BD
	iTbzXEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvMOZ-0000000D9pB-01AH;
	Thu, 20 Mar 2025 20:21:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvMMp-0000000D9kH-3Yxm;
	Thu, 20 Mar 2025 20:19:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-394780e98easo784202f8f.1;
        Thu, 20 Mar 2025 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742501989; x=1743106789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhyguxhy3QF6ssQ6N4HmtB46ru/Kl2lPpRXSHmaJ/rA=;
        b=hkDeTnfaaAG6Y9Bg5Aw1wk0b/P83DsZ0cV6/iCl/vLUQjZ6udi5IIl7Q5H+YFcSDL9
         H2KyzxNp9oknc1BwF+Zis1P0cnl4aSJGSOAEi2gb4tUtMJpP45JnV/8XMkQy0+H4nflg
         0E1l45sfdWbzOEMcCOHXxzZ3f62D3HQSjOrXj7je0ZoYzu3WFxY2V78arFsIjVEFAY+m
         PQBjFtu2dniAPgAUxLOEljFx7rbsWzwFfTcMD27ZpmAWB0INLbLoPocprTlK+0Nri/YG
         1W8+frDZH6riPVhZI5n1PTzjhuhH7k/yhhEIRdQnrHqMqZn+CR2qhPym4GyI54Z45ZPc
         C8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742501989; x=1743106789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dhyguxhy3QF6ssQ6N4HmtB46ru/Kl2lPpRXSHmaJ/rA=;
        b=cYYbXOEsSShEZPrYC+nYw/dxn/EHGI9B4CVFpe9aN4KkQsmXCEE3fM01QSF4gX5P4p
         qvgRlQ9QpVN/tOpvqjMqa9cCk4efRIhAEmpdelNS9qq4LkMEE/zfLQW7ng+yJLWkv78a
         CrgOeIpF0A/Lw2EsvaV0NLeHcSx4H068Udp1eJDKVXYiDIfBcbIyPxgy1l9YUOKNohlF
         m+po9ueOaT+HG4CFy28XXKD9aCgcVIWAEIPkWwqSCEKo0HQ1et2GqQU1ykXuqLWhOrMF
         2Uv5zHXZwbM+Swzlk1kKE2dOGfyA34YVAyicoj37Za1KkR2PgAVhnJ1GBFmHb3hrVtj7
         lSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU785joEcqPWzK0fV+jNX3Yy54SmPhDRzfjUGUPQyt3sUNGDafu5vtJ8qcUb/fEBF9PHl5fBS+V6P7ixbXOzIP2@lists.infradead.org, AJvYcCV+kcvnhoriX6bPAMaT017JPqcVP4Rkh1HzTBs5n2TvncMJVydPD8T9YhsTowZr0JFtrn/airDpg2KHC2htlso=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMsZvRPdM4TtvSoUVK1CCOYhPJZsUw3QOKOlpHpzLeAr7Mok28
	rdAGxJ9xI2ae4jEAXqh7AJF9H2WvAnMJRZ9nAaR/aMYjQY/xv7Gi
X-Gm-Gg: ASbGncuRHKzMJn9PXN2RmpAUlobdpCsrysFRu6PQgNPHRv3aLPuqcQWhkdFbSKH28fm
	HFX0DCGtlos6ZfCeY1sZL+BtM53Jrwgvc+AHRsAkzAI1ClyAy6DUROaxCuYjqYuBtSzNkvCCLqV
	SsMBeQsvVFBeQCRFfaA0+MwzWWe5advZtCY7ZZxWH9JhYGnTTuuwaVnQ0oW4wp5MNgwVkAcX+72
	g9a7hFBYBe2B6uh/VXsaUm8rH0FiRuI07p69q5rronyGbe8f8nuFnkBERJKVR6CGIaeN4SOHgri
	SF1kYaGQ/YEo7Qe5tU8Gb7TU25xWLEjkOTOBmrMsnxppAQ==
X-Google-Smtp-Source: AGHT+IE/btzueE8JU/eAqEkp1q9M1cbr7FO2mpWZMkpMLSmIZhDdqe7dSjJh7OehvrSNgBvLJbC84A==
X-Received: by 2002:a05:6000:1566:b0:38f:451b:653c with SMTP id ffacd0b85a97d-3997f8edadamr632159f8f.7.1742501989262;
        Thu, 20 Mar 2025 13:19:49 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:a534:f4c9:f77d:6a2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm6948465e9.40.2025.03.20.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 13:19:48 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Qasim Ijaz <qasdev00@gmail.com>
Subject: [PATCH] wifi: mt76: mt7996: prevent uninit return in mt7996_mac_sta_add_links
Date: Thu, 20 Mar 2025 20:19:14 +0000
Message-Id: <20250320201914.48159-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_131951_888190_83117344 
X-CRM114-Status: UNSURE (   9.41  )
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

If link_conf_dereference_protected() or mt7996_vif_link() 
or link_sta_dereference_protected() fail the code jumps to
the error_unlink label and returns ret which is uninitialised.

Fix this by setting err before jumping to error_unlink.

Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support")
Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 91c64e3a0860..78f7f1fc867e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			continue;
 
 		link_conf = link_conf_dereference_protected(vif, link_id);
-		if (!link_conf)
+		if (!link_conf) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		link = mt7996_vif_link(dev, vif, link_id);
-		if (!link)
+		if (!link) {
+			err = -EINVAL;
 			goto error_unlink;
+		}
 
 		link_sta = link_sta_dereference_protected(sta, link_id);
-		if (!link_sta)
+		if (!link_sta) {
+			err = -EINVAL
 			goto error_unlink;
+		}
 
 		err = mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
 					       link_id);
-- 
2.39.5


