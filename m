Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4502FC02183
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 02:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA4T2KfU8+8ccT6HhlEqhwR53p9U01ROTAG7I7Ipyeg=; b=RfqhBJHyvwGHzNuWFhsKt303cT
	TpP+aJHPxiV0ptCkYcYSuhikb6Hlyg8JOmL6EC/K9eV1RwC+w9LFijMzX1R3FnzXCDOo+FNppzRZe
	03SORV20Agb4FChfju0kLTiFmdw7msUtRpWNsc2K9q1aTMk+2zn4f79+sTkCNp9QJPgfiad1FBow3
	48SdBVYXHEIpv6701wZQoxY1C+Zo5Oa9LDyy5S9eWC/SvC8Os/surheORSMi1g2vSzgRG+dSXW3RJ
	Qcjo3u2TsuOzaIVnlZJ4bi3TdU6Inm0SVaV6ROVisemi1jd9DCH1phSgWkLMpuji1T9duwKshGHBM
	z8EP2NeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWLh-00000007D37-1MMC;
	Tue, 14 Jan 2025 02:08:09 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWKy-00000007Cye-1j5N
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 02:07:25 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71e2bb84fe3so2688571a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 18:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736820443; x=1737425243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA4T2KfU8+8ccT6HhlEqhwR53p9U01ROTAG7I7Ipyeg=;
        b=CY9QeC8Bm9yYo9niq7HHiLMteYdtxagxWAww6OM/9AGRkaJQjWDXfAgzhl+4So6h63
         MeSqzC1iPtUAi3iHa2L6T5ADBN2kMHiMLCKuW+3OjZu3kvAAFMV8FBeAWoXSUrq26K8b
         mo5JMPL94WEg2UievRX9GaOX9oAULmR+gceisEja7EYJP0bOHwfe2iebqjLmM5rnCxh8
         CnePghQNF3O1V5ltnCKGqP/OBjnzSMnZw0aUSjX9skFrm0mbUJzxHlDvSgZ9+EUv1X1+
         RpElDNuJ+lpfbmIUfhEnThIZYUbq+lZwhnyAerl5Y24YdoKCF/zO5f2tXC5BtDZBjCVC
         W6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWrpHeNVwB+GkiqROTZhS4t6CHL9pNiXBLd9w/7fc5Z2x+EbrzYkVgCNUJs93BnwNfE4t+RRC++UhHjVU3umg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeeZxpKQZW1moJFMStLi5yjTxCqt6afjaG/PNFPC7nAkCn2d5C
	EYR6h3zH5VkVDwgX7V+P6TWDLco4NStaPAypdC3La8i+zbP0BSkj
X-Gm-Gg: ASbGncsjXh1+PG1e9NXo6Taw1vBDMRJqXfCkfV+Wq5BilF/1E7fSgYy2CJcjo6F+vIW
	q4efOqX+qM+GgPT9ENRvzBzZfjfpZxggBtGCF7GDSJVhiDfMdTucdChY1jKUzoqu+uuG7TUHU2/
	VXOm4mSdikGtEoYwHtSoT7h6KtXsf4Uwgf2nuCxWN4R//9a8nkUWmTmG5cmx4sHSUNiLI/K35fN
	6C/N6WczgNOOUcw7u2au+SY61K+Kzj29gp96t/hKyQNHfbJDjiKLXFr6XSGdX5fptaaqj8j+g==
X-Google-Smtp-Source: AGHT+IGFJEik2Ut15igezSRRJrQUvQBJOtShMMBcJALZhBQ9x7GaTRWakkwrOGbF5TScoAJnl3VflQ==
X-Received: by 2002:a05:6830:3748:b0:71e:1b44:35c5 with SMTP id 46e09a7af769-721e2e7966bmr15611503a34.18.1736820443561;
        Mon, 13 Jan 2025 18:07:23 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882755172sm3915340eaf.27.2025.01.13.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 18:07:22 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/6] wifi: mt76: mt7925: fix the wrong simultaneous cap for MLO
Date: Mon, 13 Jan 2025 18:07:09 -0800
Message-Id: <20250114020712.704254-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114020712.704254-1-sean.wang@kernel.org>
References: <20250114020712.704254-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_180724_449068_14E88D79 
X-CRM114-Status: GOOD (  10.46  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The mt7925 chip is only support a single radio, so the maximum
number of simultaneous should be 0.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: generate the patch based on the latest mt76 tree
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 502b76a40ca8..90a6d62aa816 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -256,7 +256,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
 
 	ext_capab[0].eml_capabilities = phy->eml_cap;
 	ext_capab[0].mld_capa_and_ops =
-		u16_encode_bits(1, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+		u16_encode_bits(0, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
 
 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 	wiphy->iftype_ext_capab = ext_capab;
-- 
2.25.1


