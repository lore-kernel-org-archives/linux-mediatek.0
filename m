Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BE2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jW2n0VfCZajEBbCp9ut/7yc+LeJ30zTYUhNGB0PuwZ0=; b=TahIbTYNLwJy20
	15BWEEMMCm6gx6kQ0lMiYerU5WXhjhpA6NMchc4DtTuGuLKxNKfjli/DYCZtPEl9OcxEfoeS1H2eC
	qPLgVEuOflsV+23BouOgxvSNujmsCbfu+4yU8omTSbMVn2XEdOD4BVH2vjeBhwWW6UYSr3ONZ37kN
	4hBPAnk8+a3SBY4vCC3oi9f6mkCV6/N7AyLFlhMbQFdemQZnaUM3xt8+2tsGqkBHpGsrpayAm3f2P
	2UAYLXxB5UGu6Rw3nhQdIV+MAZ+wrAOeDSuifBlE3YsRloeUBcbzQpa93UR3j/w/Nlwv2ytwL3+4I
	qr2tawAImNquKjnOSOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msVzT-00A2dc-M5; Wed, 01 Dec 2021 20:14:07 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msVzQ-00A2d1-BS
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 20:14:05 +0000
Received: by mail-lj1-x233.google.com with SMTP id d11so50477491ljg.8
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cm/LOgLyBHKAfjqechOv4aUVLu/lBrZhgrgfeAG5yYo=;
 b=fwEyewYur5etSp2FpL23q166Zxo/52wGLeItiLpnYKKIEI858vqpTANucPYAH3vXMn
 F2EJNFiqfRkM/cBZpB73BNMWsNecOfeKKv6xpobMrWm03XeDZ/drZzf2cxE/xzXNT2v3
 2xjvFop0AVhHAF8nkpPjaB1M/HeMkVxdkzQguOtyqaTl0VL4AkDfyH5U/UMOINph9A2a
 +Z04PdnBMK2KObVwXh2lH0bgw8ttHbddrFTRhroCovx5ZaPuEdNnnLetAm0zjuJlRhUC
 EPh1PjcCJw1NBjU8coV44cNv39c/YMeYTihhuUDhfwGuF+Tsghs4DIltrdiuiuZOBZzd
 MzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cm/LOgLyBHKAfjqechOv4aUVLu/lBrZhgrgfeAG5yYo=;
 b=mTiF2pVeOIwRy93maYZd+ynBYxj+UkibXsKfUeUPokUkPDLuJRZrfmqRmIaJr0P52A
 7RW+cA939M57dQND7K6kE81fo2KNlSgbMloyXTCqka2DjIuZ+3LIUmAkLUYaN/pIXECY
 ZL56slkp+zCZNEJnY/7iLB7aktfurNFYVrD9PkWgjDodTuqfbAWE42YmYNIyejysE6Nt
 RL28/JqsoP78FdYY8uUxxRWypwlgzw07sKsAbLowsJNrDifug0FDyWg7t6kh+jhKeq5k
 Tplj2WGti/k2fTDUwYsoJC41vOFmfHDxmNKBYhXp1rwfe5rWcgd7/zn9kB9DHwMs1PZS
 aiLw==
X-Gm-Message-State: AOAM533D0IVFIHGMKGaRWuvsTL7hprU8875C9+vr/+PIGn+3JTCZsZGd
 K0Sw4rx6SI0PzrbS8QEN0fkp
X-Google-Smtp-Source: ABdhPJwh7kUWJI3j+dt7aVBYHbMLal6jtWKJqNYOZ4M5lBHwJFT3jmirtgmKTGx4fzYCylglSD3stA==
X-Received: by 2002:a2e:3e17:: with SMTP id l23mr7025336lja.380.1638389642146; 
 Wed, 01 Dec 2021 12:14:02 -0800 (PST)
Received: from localhost.localdomain (public-gprs378549.centertel.pl.
 [37.47.109.246])
 by smtp.gmail.com with ESMTPSA id i3sm86821lfu.156.2021.12.01.12.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 12:14:01 -0800 (PST)
From: Lukasz Bartosik <lb@semihalf.com>
X-Google-Original-From: Lukasz Bartosik <lukasz.bartosik@semihalf.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v2] Bluetooth: btmtksdio: enable msft opcode
Date: Wed,  1 Dec 2021 21:13:51 +0100
Message-Id: <20211201201351.2552-1-lukasz.bartosik@semihalf.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_121404_457246_B3CDD677 
X-CRM114-Status: UNSURE (   8.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogxYF1a2FzeiBCYXJ0b3NpayA8bGJAc2VtaWhhbGYuY29tPgoKRW5hYmxlIG1zZnQgb3Bj
b2RlIGZvciBtdDc5MjEgY2hpcC4KClNpZ25lZC1vZmYtYnk6IMWBdWthc3ogQmFydG9zaWsgPGxi
QHNlbWloYWxmLmNvbT4KLS0tCiBkcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Js
dWV0b290aC9idG10a3NkaW8uYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jCmluZGV4
IDliZjVlNzBmNDdhZC4uNmE3YmE2N2EyZGQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2JsdWV0b290
aC9idG10a3NkaW8uYworKysgYi9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwpAQCAtNzg3
LDYgKzc4Nyw4IEBAIHN0YXRpYyBpbnQgbXQ3OXh4X3NldHVwKHN0cnVjdCBoY2lfZGV2ICpoZGV2
LCBjb25zdCBjaGFyICpmd25hbWUpCiAJCXJldHVybiBlcnI7CiAJfQogCisJaGNpX3NldF9tc2Z0
X29wY29kZShoZGV2LCAweEZEMzApOworCiAJcmV0dXJuIGVycjsKIH0KIAotLSAKMi4zNC4wLnJj
Mi4zOTMuZ2Y4Yzk2NjY4ODAtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
