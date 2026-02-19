Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F04E9A04D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXfVeHyX+vnFiRwnw/g9U5y3U00iL+2V2iXWuqTDgPw=; b=flOPN+L3gP0/pkTxieszVgwUT2
	XNmLpjm5UZgtTrLH+zOK8waQa9VhS/woKzlTz8pB++zvor/yR7qRJCd8l1vBFZwYEMpavDCjV+YBo
	ZEIxBMnl8B7pAr+iQGNYh++aFgU3uw7v2Rlted4OBT0bN8tF1RVHVliscT1nv3KFxoPFfvSWEsb7+
	WrHJM2IHsn9RMzlT55IIf4Nhl5sT3xBwhe0pOq0jz5JfW4FqOoARdo/ZpLCyFnDVKDZqzvnU6e+P8
	tKP3K5rPWgAjKdNly60dnjg41gsqlpgDRYQ5lCg4JRdLx6MNZDwc5ZK26Qn7zUJAdA3MWK4KfETiu
	DL0jBWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5j-0000000Aeg8-1uAn;
	Thu, 19 Feb 2026 00:40:27 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5f-0000000Aed7-1DLv
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:26 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so244585fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461621; x=1772066421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IXfVeHyX+vnFiRwnw/g9U5y3U00iL+2V2iXWuqTDgPw=;
        b=fLGxk2j4GqOwXhvAbhH5+ZLNI3qvxnpSZ0Ub6eMqL1X0d66yZZDzX91p0CSx9BOcsk
         3yQNGzzngov+YoiyMWkxJyikU70q+nhnvaGqAgyeIq6FHdf9337PYtJ9xReztoC2ughW
         8wJydT3hDiuPTmyUiRl7hjhoM/YYT99nKQDrGU7VPunEos77HONFvP16TUwdOfPhEvXP
         kVVzshP6ztqLYIbm0UUzGEP8WONeJ6d6k/qK/alr2U9Hc7ZIINCAWvMkTiOND5wVemGj
         XQGW1dzgpOn955yfD8Z8Z2QCndkwqS9CHatpqiStKRxs2zoM75DXJ7CLpUZM0doY5K51
         Dc7A==
X-Forwarded-Encrypted: i=1; AJvYcCXG4NUyhSlAlr567XO1zgyGFFn0seZLWsup8J1KEZMHmRyR3x4tPdbLXCVhEAzR6B+kB93kf4PYMMdL80sLaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx00Ud2dz6gsup1RKMXKl72ucuR3POc6i/dKE9LLOnKZl2Gbfnp
	+eVg7O/17ZhCqNvcdyb56F2aWHpObfxep+wL6rbbilf6Fg/ZWhe2deoi
X-Gm-Gg: AZuq6aJDEfUD1Bl22mw3JSAepVMnDa7vUKXMn4OFySpLzqO7mB6nQt0o8u5Lv4Rk/jQ
	ag45rSdxtYc5+ZnFXa3udJBAikZEbCJwtqBUHQ1EE6G/SEd9jYDoLaBm3g5NOsDsxEP0PKVbL0g
	6U1hOKGuMNpDGD2DBZrgJLs3yYZRWYXMnuP0DiD+v1vc5TljfmkdS27QLf6eUjAjFHEvKLXsBXN
	GndzK9e76Rkv0Xcgx3IsChk6D24EXNKn1+iGnJv6J/JNPpohesCXCropMawQxxziOnNM2ZjPyc+
	JbDQRaG8w6GEJVwUvXx2Bd880f3Gy1bUxmm8ufkd7tZ5RFMYu7iAwS928B+po5xIY0sCyN6Kybm
	MnuIOpRC8TaQMbSHKXAqn2cY1gEhNerFoFU+TcW42FTIjqxKtSvpPi/4MY+ZupLJVdkq4CdsUAQ
	qRe+FKCqKZx4q4r0NoODV/pZXZHnAMIEPT+LhLL+xWkr6b+Dg=
X-Received: by 2002:a05:6870:1741:b0:409:7fab:e3fe with SMTP id 586e51a60fabf-4153a148ad4mr615569fac.50.1771461620588;
        Wed, 18 Feb 2026 16:40:20 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:19 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Xiong Huang <xiong.huang@mediatek.com>
Subject: [PATCH 05/11] wifi: mt76: connac: mark MT7902 as hw txp devices
Date: Wed, 18 Feb 2026 18:40:01 -0600
Message-ID: <20260219004007.19733-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164023_327732_0748470F 
X-CRM114-Status: UNSURE (   8.10  )
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

Add MT7902 to is_mt76_fw_txp() so it follows the legacy TX descriptor
path like the other connac2 chips that return false.

This is a prerequisite patch before enabling MT7902 pcie support.

Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 02bea67d37c3..d868bb7c7ab8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -271,6 +271,7 @@ static inline bool is_mt76_fw_txp(struct mt76_dev *dev)
 	case 0x7961:
 	case 0x7920:
 	case 0x7922:
+	case 0x7902:
 	case 0x7925:
 	case 0x7663:
 	case 0x7622:
-- 
2.43.0


