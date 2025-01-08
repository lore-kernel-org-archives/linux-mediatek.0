Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6716E77199
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 02:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or6qBsvvHcTCXq0k3fSdgM/Qe5pV/yxt5yjVz1LHWzA=; b=IAlocn5T5SRMKD4g2oyBTMwCb2
	/lM8RB83uE6qDF8DlQMRUBgyB8UEZ83dQoxRvB4pPY0UuDAuVWO7Pp2s8qDoF3LQu+X+tqNwv3dI+
	03Q13YwbLxBkPK8cj92pqWjmFJj4v5gpIzbZ1B9HVMfTdjBkkDONu1orVsI3lWXtJ/V5eorv5NRuO
	P9eZQlKYWC90dDnzWyLCRbsdVS95ogMASQMlU1Q45rRbcDFCjpOzxciFHqEXx+y7FlNyH2+a1Bi0K
	LvvBNkAzUTeV10z5KEDnyC7h4GcUsyexwgCtOlMYUu4T/X4Mw/fVAYicSvzE/9YX5tywnLmQ/Mcvx
	uYuk5QeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLqx-00000006usk-3AEg;
	Wed, 08 Jan 2025 02:31:27 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLl6-00000006tH0-06Mp
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 02:25:25 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29ff8053384so7424427fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 18:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736303123; x=1736907923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or6qBsvvHcTCXq0k3fSdgM/Qe5pV/yxt5yjVz1LHWzA=;
        b=UMWJlNUnPckgmdTBJJpmsEtzqDeFb7zJzPgNayXAqHTd8AqpNIBsADfeYDD288Dk9W
         6Vtu6DrnHFxoNl7wPrD7A69Nw7PPqmtz1FDSKT1cKBFAd6qsBTokKKXhmtydMNtbHSHi
         sdvAk3hxJrEc0LXCbFeBQuIULpaTOfsKby18p90AxLgcTvmTbefkEW2KY+ymk0HW4GN7
         EURn9qJQciTAyLwywPmJntSk3nxc1CKaWK5CSiE2uh2SsYP7XOZWpNj2tfn7pm+xJ93I
         Gy9L/YRiBPicCEW6MHD7k07ZNun+p58QxdBBSxupByCbhM5m6FZNj+ya119DtAaBe8B4
         /OSA==
X-Forwarded-Encrypted: i=1; AJvYcCVIVtUXIx0ZCbluwOy9zxdnak3vzJEhiFwAjY4iPxH9GEQw+0UZfu2yLmUaWQZOY4f/ht8JV9zcaQesE4vTLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+uLk/DDvj6Lw/pt9OGR+xNdBZXqeKh3N3U16asutJqXW2XMZi
	OXYGjqPGL46AV8gq7xuNj+QTZjOXjr7TjYMtinBiEcnswyzOj8mZ5yf1EZ0Y
X-Gm-Gg: ASbGncuN53wRbjMD3h+mzNToUnP9kAgSa86U4osPfbP9bNZ0b6vZicbenImyZiNlN5e
	/qDgqC6Kt1oSbLcJ6VG9/0tLziNFahZthW2NE3hMTt8zc0KD6wl6lM2B6xhc2vMn2e4UGTd4B03
	gsldxIAHaHsoBC/dkQQhEI3XPpUKsnWq8lNhkvc5IQrYSLkzEsGmwufcJM1MiSdbSnRjIdI06Ol
	y0/zCIdhO7uS++FnTaD++wgU0guXIUNKzYtPNyaoGzOPh+R5A3rYqX9qzyJ/8AU33gE7e5g5g==
X-Google-Smtp-Source: AGHT+IFmVeZA7a04nKu5uP3hkyO3yyT9r9H8R4UMIdEmCc8mPaH6OfXpUfFd9SGnpKj4tZzw3EWF2w==
X-Received: by 2002:a05:6870:d0f:b0:29e:48d6:2e62 with SMTP id 586e51a60fabf-2aa0652ce6cmr643330fac.9.1736303122595;
        Tue, 07 Jan 2025 18:25:22 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d77f6340sm13072862fac.48.2025.01.07.18.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:25:21 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/6] wifi: mt76: mt7925: fix the wrong simultaneous cap for MLO
Date: Tue,  7 Jan 2025 18:25:06 -0800
Message-Id: <20250108022509.217803-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108022509.217803-1-sean.wang@kernel.org>
References: <20250108022509.217803-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_182524_114735_0D6994CE 
X-CRM114-Status: UNSURE (   9.86  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The mt7925 chip is only support a single radio, so the maximum
number of simultaneous should be 0.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 6c8a9ebfbe5b..35dede041248 100644
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


