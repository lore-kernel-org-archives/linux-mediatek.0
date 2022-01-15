Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 17:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ix0dcfsXRmVct9OLFL13+o+VN/W/sIXzsQdi90SKeek=; b=v4gz3G/Q1yVkVl
	LokOq73osPIpCFN1f1rm0c8V//8cRS8NP4LAOqj9CTChZZvAEevcV55JPTQlrvXTDgTmA4BL/Uo2W
	8+YZPThMdDjoHpKT06kORk8uTd3fE7kVcFnr362I72B9i0//AdujdlNgnrzMuTlDw44XxHZEYZUCg
	0WZFcHccApjJ92xE16z5OM3anvdJghVWxC5nSq1BZHzI8CEd17C8+RUy5Jnf5Gs3KeJMZxN0BI9q2
	po1UYOqnL/Amr3Hlki9yVHkXVHRM06HqgGL256vqhe4/uqY1wO4kkilkMacaAjR8wCZrzOmL816L3
	OQvqLoz1fi5+LJisxziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8nBN-00BQIh-P3; Sat, 15 Jan 2022 17:49:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8nBK-00BQHZ-5b
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 17:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642268975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Ub1hbMwAGMv83XYOlhCXiwUBfOTPfG3vBCU3vhpmD4=;
 b=LnEno+ZEVtcKdth7EwZiAzeiJWxMXZTG3dti/5Y6JRG4tygFDpRlUN9vQCkwXc+YTsq45l
 nApgg1UwA0fd3H2qsfU6vYspzBv5TmXY9GFcciBZNRhGpetj2ra9RMH2nmPYVVxurXs9LW
 gYzZ1+bbqb+ndjdMv5Vz5fCJ4yY3maM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-zrXf0on_OteQ_QmVX069RQ-1; Sat, 15 Jan 2022 12:49:33 -0500
X-MC-Unique: zrXf0on_OteQ_QmVX069RQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 q127-20020aca5c85000000b002c724c26e41so8592447oib.1
 for <linux-mediatek@lists.infradead.org>; Sat, 15 Jan 2022 09:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Ub1hbMwAGMv83XYOlhCXiwUBfOTPfG3vBCU3vhpmD4=;
 b=JVNK5UNIl3uct6skQAdieowH5rXznVYjB30Msihua8veELzTRUS+nFgV9NPEj3Ki3p
 GnJNdjmDDux9uNU6tyTDE+p4GKrxCmZfktsLQ/5jq2M8n5G/KVkIq+ROCerifLOxoMbW
 Tx2UiPQWPbl81RhjrBFKPju2GF797R+2OKbd7Agq5gfbEoWloctjUe6LCB4sBXiRJKmD
 s7U/A5hgthYPj+oNDbr3gkdUhOGkFp/wfRzQtVKFo36Q/4atIRAqng4kTN32pWB8iQ4T
 +N/vhUM9pOoGVAFxA8+OCchj7eh/nbx6iAA1ytex7cZt8eQup9G42711+RdXK8r1Go7H
 WdJQ==
X-Gm-Message-State: AOAM530w1MvVjJwSt+WSQ64XE8sUZeUYq1NRIVq9MXuFH0d4Xtwg1oOZ
 8+6UCjV/TrjFS1/lHNBvXP/7qggqf663ehKkfFR/rkBadMinDMUkGeFDyykXB7UNk18uRWxVxPf
 EB/0E12Y49a6LZoPog1ssXEiDP0XvU3bN
X-Received: by 2002:a9d:6d90:: with SMTP id x16mr10349762otp.104.1642268973022; 
 Sat, 15 Jan 2022 09:49:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR+KmHmEAcU1CSZCeT7bkPUleD6/z8y+Ucc7A0A1vb7OVK0PdYFegZBJKcQW1fj3jjvlhqdQ==
X-Received: by 2002:a9d:6d90:: with SMTP id x16mr10349749otp.104.1642268972841; 
 Sat, 15 Jan 2022 09:49:32 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id w20sm3239438oti.69.2022.01.15.09.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:49:32 -0800 (PST)
From: trix@redhat.com
To: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
 opensource@vdorst.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] net: ethernet: mtk_eth_soc: fix error checking in
 mtk_mac_config()
Date: Sat, 15 Jan 2022 09:49:18 -0800
Message-Id: <20220115174918.297002-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_094938_334225_3A42D845 
X-CRM114-Status: GOOD (  10.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
mtk_eth_soc.c:394:7: warning: Branch condition evaluates
  to a garbage value
                if (err)
                    ^~~

err is not initialized and only conditionally set.
So intitialize err.

Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: change to initializing

drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b67b4323cff08..f02d07ec5ccbf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -267,7 +267,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 					   phylink_config);
 	struct mtk_eth *eth = mac->hw;
 	u32 mcr_cur, mcr_new, sid, i;
-	int val, ge_mode, err;
+	int val, ge_mode, err = 0;
 
 	/* MT76x8 has no hardware settings between for the MAC */
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
