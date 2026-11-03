Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6B606A328
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nfgt6IcH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI2ZIhwU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=; b=Nfgt6IcHbvHaARX4OibOp5Cyt9
	szfmt8y3NFBcSH4xBDCCR/zf7cPlvWsDZS9BvkkAqzlEI3jRtNf9r7lQ/CAHHMWcMfJujPMkIOkFy
	qZ6uZ4pLAa7Iy+bp4n3fU956afhIIs0a7dSktLeDTzWrrGJIo/afegFMwDG7Y7vxUj2OZEZuBsNSD
	wivWRKe6Ez0hqZFnf4c0dyDUr8ISKKyXSNo9bB9lqMTdsN8sz1FunB75C2xH//ouknwpb4Au4UL15
	GJsnmYPpmrGtxkBVUd9M/QlWHkY4vD0/MOFuchJkWEAXPQo4fu4d5hOF5aptvqFH0QiKNIVia1r+R
	v9J5Y+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfp-00000002a15-2l1N;
	Tue, 03 Nov 2026 13:35:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfl-00000002ZyK-1pN4
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 13:35:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so474411f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712931; x=1794317731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=;
        b=pI2ZIhwU32xan0sle45v+VarVaI/fW92+3eUFzifwC9pGp/6k7NHFXslJzDi+kC3kP
         rbnCdh6XqbksqnNjeKBXilX/f7FBxvPrWrr9nt5Fqa+1PKk9n5pDklAsnxLrxjjElRSc
         umGfPIO9Z8iD4WgrDHOJqgL/+/iPHDvQ57u+UDnRuEPd0oQDYJx+hOmUf12T8CECcPZl
         PBaclNkfVq6qIjYQyE/eSacGSlrfOe8UCLh6BGf8nr6L8bReI8ORtK9YJrp6wmklPvOr
         yx7orCWuthDhB60DyLQEnY5Vxbv5XecPIucmslteZPk1gkUw4ErE0QMOYwOZkzSQX7Xg
         cy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712931; x=1794317731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=;
        b=bTLJb8evC/qWW3kO9Kssqu+CvKxUpJJbi+vt6MopNQsDtsvl7XhJkZuTVjHZCmL91o
         El/JrZ9KTZ2VzPeMfQU6vqrQWAA+dICmZstzKZbhpAd6XZ4YFNEai3FKKBsaAGaTsO5c
         SYDZwq3TXZH4rRgtmJhZf/QzPHfiXnAQ/Fiqh9QHViZn59v6ZdZYN86oUhGFF5pdVZ71
         lPIPcV4h0LmSdwnhhHFgGvFTK+yLZIwZX1esrb9XUS3bAKHNGarFgdlBpRs4YGzkcT4V
         hUJEywFwswmcZOcHe6MPLO4yieMbUTLwKjfQa4vXOcvJD2oZzpij1jxMmximfsaBBUYB
         0QTg==
X-Forwarded-Encrypted: i=1; AKwUvBzHV9+ra+/F/f5qzYbsBm5IMoe9D3ZO1IVYWfGh1P6dMA157zfHN+NRSqvAK+eRxeKBnKtm0wvdScNHWU0xaA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZXiOYgPKZNb3ufysa52FnRHFvjPewcbpKYiPKPKR0NW/LJs42
	AxYSpXUVN5re1j+0Wx9w70hY+7yJsq/ZWzhhQxvIVfCMswl/YxXAgvq8
X-Gm-Gg: AYBFou0VrH1iAGOjw7OIgDdw7z1ROl8q74CkWbTCPi4wuaZ8JXsgtMbYRMMOu5X9vTP
	HiHv1pNdsq+xEea6DXXLeRl7Moj5/D4VXAWb9MLu6J9vqfGQkaqjG48KpE6YfcKI5cpb3RcSsLJ
	WQvPjchw05m3mP29lFJm7oFp38gCW5Oj1vIqXPdwK62lMQMq7thXzLOl2mRr8buvltrtcLysXr4
	/AiwMCoKam5IsRfjZhVyOT+NRLriT91ED56AmZDfk0ccOkIPkf+b6FOQpnwNW2dZ8J4qENd5Le/
	WcBwH/ixaS1FdfUmLXNHfWMFkSLki9FqtjN/eyJ4+CV7Kbt2WKdzVk1v8gz2I8RsrHu6+1H/362
	DVRGkG5anzkJNyH19U6cudrwHP0omfzWmGHLOz/D3MHzHHDmdxDLeGBP1am8ZgV0SCkHhslrLRM
	kRDNDUMKgVMcYkwZPNi1m0znjnST39LNQaoYUVV+cNLPJdg8dd0Lfde3B7Q0DXosh2xyF9NG+tq
	/qggGSOZPLlR5n3Kd1IJpqtq+r7ARuKQ7OKydoNJweM/LxQbU3Cod480No6+bwQH7WIQrDSBY8y
	EJBosYX1LmJtqCbfbhUfBgAl8zFAo1grkgUB/Mf2Sr+3+rPG+3X88PNBzz2rIb3vxDovNJLnggS
	D30xODcVLqSd6OgSDN+P4oguqlUcW63ISe5Zo15buC3Uhbg9hhG8S8NU+58P4CvGCw33WlURkx7
	/GQcLk1LCga5i9hINgK+eKON2jycATLco88j2ZqfZHypUgCUueRivYyw==
X-Received: by 2002:a05:6000:250a:b0:48e:643e:de82 with SMTP id ffacd0b85a97d-48e6e2cb652mr30505104f8f.11.1793712931006;
        Tue, 03 Nov 2026 05:35:31 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:30 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Tue,  3 Nov 2026 14:35:26 +0100
Message-ID: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053533_509500_F4DE74F7 
X-CRM114-Status: GOOD (  13.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT7925 USB adapters such as the NETGEAR A9000 have a status LED on
GPIO 8 of the chip. MediaTek's Windows driver asks the firmware to
switch it with UNI command 0x2a, but the firmware in linux-firmware
does not act on that command [1].

This series drives the pin from the host instead. The layout of the
CBTOP GPIO block comes from the coda headers in MediaTek's gen4m driver
for MT6639, which uses the same CBTOP register map as MT7925. The first
patch lets the mt76 core register an LED that only provides
brightness_set_blocking, which a USB driver needs. The second patch
adds the LED to mt7925.

Tested on a Turris Omnia with an A9000 and firmware 20231227 over
several days. The LED follows the throughput trigger and manual
brightness changes, and turns off when the radio goes down.

Sean, JB, is it fine to drive these GPIO registers from the host, or
does the firmware rely on GPIO 8 staying in its default function?

[1] https://lore.kernel.org/linux-wireless/20261012125310.13917-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  wifi: mt76: allow LEDs with only brightness_set_blocking
  wifi: mt76: mt7925: add LED support for USB adapters

 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++-
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 51 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |  8 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 5 files changed, 73 insertions(+), 2 deletions(-)


base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.54.0 (Apple Git-157)


