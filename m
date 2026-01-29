Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDADD358DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFOoxK8g/IJtQ/mNGnUc7nA5v9dS9d5PcciCzXU4s+U=; b=Lj0GgvpenJdQnM9OlsBV2jM8/u
	F9K1KlkUBReI4lG5YRgadgqA1EhNIskCmW49VwV4pO/Sib9FTG3jeOhGWX/16pgizrs6vQamftrlD
	ivz+njyg7CbjIPdJObhQJWOx5QWYPNecDqkyD/sv37Y2eghyahvHTP0EpPk1SNzlBRVcKgyDUzDo+
	VSpVP4P+by3N2ZQIvkF78jZlEfhXaTUKEEZBPIof4Lnj26cYAlZ26HLe4k/ekJbsu2K4OSlKW+Wta
	cZKgTcLmmejpqMxp8Nm+tgBttGN1nc4JN4msLuXD2xtSv/tIQsFzvVA35519s2qYHAinE254xktt4
	IMotTuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEk-0000000HRlL-2tBf;
	Thu, 29 Jan 2026 08:18:46 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEj-0000000HRkx-0ZIi
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:18:46 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-124a1b4dd40so1785874c88.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674724; x=1770279524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFOoxK8g/IJtQ/mNGnUc7nA5v9dS9d5PcciCzXU4s+U=;
        b=krCgPlKjCS5VnTcOXZ6ELBU7Kn22TxFvP/G6EYmru0kRP4K7afg6w+Ygj89QrRGCor
         Y/tYNM4LLtWakLWK9hXr8UbtOKXXg7xOSRtYrIH33DNHzj11M+QJ0D3R2RyUHqJHjMyX
         WPGHrr5ubGtcuLC3+we4RWa+M7kgug6mYQj8UvA29U4h6T+mbxALCfjiTkOIqBuaLCvY
         HAb5pE6sNTqk6Ha+1I3ueJ1o987TiLQb0yPN3N+tDhkWz01b4w3PPpLrBBnjSbNDNKZ8
         6ty1Ds9QiJn3Fo9LEvTSDK0dyj3g+6ISqKsw8w4m9Pk2lwLcEgxJD1mckFIuVOdscoIv
         xKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674724; x=1770279524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFOoxK8g/IJtQ/mNGnUc7nA5v9dS9d5PcciCzXU4s+U=;
        b=nK2tkV2vferRM37u5BTNUIl5BrVk62J9OnK3syCE24WLaXDZwDKQRPe6tRfWjCuYiB
         wVJ6xBB6gtxpAvKM9sPVMgs1CsPhcbPvvZHWu5zSg91BCHpXVhv5i1dtTJyURPTEU82n
         xRJGHjiEDMFtJM2klnCmdxxJCwTWRMQmAxT8NDMqESbcjaQH6/L2heFE2YsPY5+zrBb/
         t9sUUJ/tddUo5rsKjUT78FpZWR2Qo4sb3CZ+C4RGxTkWTbK6qi0pNHZ6OunBIKqFM0BN
         At4bTt+LWxmh4EkiTFyPk4X1EPuZiog535ffqtnkahR1zqWYDN6cOrRyuBqdPpAf64VX
         YhwA==
X-Forwarded-Encrypted: i=1; AJvYcCWSNZKvqWXQjSe6HSo8Z3YSqfQpe3pHg4RMNxiv45y7EMBls87bp6WwcR2CXKoogy9gTeTFFkD9fkH5nq6nxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvY9O34QXhn8fHy/VoTmuVhBnWb3ezKfhCjiwCAP54tWbdYw7N
	sMof+/oroW0ODNBsrVulNU898KQS2hX4Hp4LBvWBTVKykHdvZX8V3XJusRdUtwwx
X-Gm-Gg: AZuq6aKrq7ITLhl4By7B/8b10oITUtRicNE8H4gudVxMu89PF3L5/8mj4VUyRVJx2zn
	mqe7A/c4JflKtT7ofgc/Byg1CpH9DSXDa9TbKjhUmafflhIbSl2M+9djQ2fmby1q7oUopuLzOIm
	Z5ajfdG10zAcHqjJMwz9zIsVL2r3dSD5nBmRKgOQnmt+X/We4V9OHy06aY3VgOywd4OlffuXhef
	MyDe23KR1p3DzPDvKYeeAWbE+BSWgwX73m+tRrCrph9fFwRbKRsa/4ARiGbpKpasWWfSrIKJPNc
	RQZo0cDEPvxd0gYdAMLcbbj552gt3ZhtV3rpa5iSJBDfOMnMDAqcWvPoZGXEwD58Pb62xgGUJYh
	YO31pYIAtNb7JL9u88cqmq8zXpKukh/oZ792sYMYhsayxBq8gZt/AAmZrHjOoUtGCRn2fPewKKp
	26N4IaOhF4Cvhggg4pFefw5CPypyAzdLEyJ5mhBUCcLXxGCHv8KXibgcgkhxKm23bjctqg58E=
X-Received: by 2002:a05:7022:249f:b0:11e:3e9:3e9a with SMTP id a92af1059eb24-124a00ddce1mr4207421c88.50.1769674723913;
        Thu, 29 Jan 2026 00:18:43 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm5483508c88.16.2026.01.29.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:18:43 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: nbd@nbd.name
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH v7 0/6] wifi: mt76: mt7925: MLO stability fixes
Date: Thu, 29 Jan 2026 00:18:33 -0800
Message-ID: <20260129081839.179709-1-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
References: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001845_179476_9CD06A86 
X-CRM114-Status: UNSURE (   6.85  )
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

From: Zac Bowling <zac@zacbowling.com>

This patch series addresses several stability issues in the mt7925 driver,
particularly around Multi-Link Operation (MLO) scenarios. These fixes address
kernel panics, deadlocks, and race conditions reported by users on systems
like Framework laptops with MT7925 WiFi adapters.

Changes since v6:
- Consolidated from 12 patches to 6 focused patches
- Removed patches that have been merged or superseded upstream
- Improved error handling in AMPDU actions
- Added lockdep assertions for better debugging

The series addresses:
1. Double wcid initialization race condition during station add
2. NULL pointer dereferences during MLO state transitions
3. Missing mutex protection in critical paths
4. MCU command error handling in AMPDU BA session management
5. Lockdep assertions for mutex verification
6. MLO ROC setup error handling

Tested on:
- Framework Laptop 16 with MT7925 (AMD variant)
- Kernel 6.18.x and nbd168/wireless mt76 branch
- Various MLO and non-MLO AP configurations

Zac Bowling (6):
  wifi: mt76: mt7925: fix double wcid initialization race condition
  wifi: mt76: mt7925: add NULL pointer protection for MLO operations
  wifi: mt76: mt7925: add mutex protection in critical paths
  wifi: mt76: mt7925: add MCU command error handling in ampdu_action
  wifi: mt76: mt7925: add lockdep assertions for mutex verification
  wifi: mt76: mt7925: fix MLO ROC setup error handling

 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  3 ++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 65 +++++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 24 +++++++--
 3 files changed, 75 insertions(+), 17 deletions(-)

--
2.52.0

