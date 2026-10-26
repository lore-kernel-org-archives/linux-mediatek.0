Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5732606A32F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nn+bh585;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EuZIlTJl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=; b=Nn+bh585RBTD9DpI0V8yXn4xm6
	FWAxUwkluZTnWBAbKcaezQ/biXsuY7McQjvNpnCnDeVp1j9D+rpeVJsRJR0/n9RxxYMPfV4O86vvq
	tn5vBI8X1ySa7VUtjhdYRSDu/HB7FvUxz/0IlWg7DTv6BCiD/p9Ma9LOYevt6Eq9t5Iai2WG1YdjW
	ozBtMwGRTRKWwmGMQAJMRoIGT8eE8OaozXX9QVptjF5hMrvxTKQJa5QJPzDWyqiR7PLdavo+u4Su6
	L1W4aCKsNP1F79o/oORjPg6c7/iWjWkYLfHRqTZu5N3fi9nUfXGSEi7qo9i2r8IHh7UMBvK+vYRZs
	pNVedXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5m-000000038QH-2Bal;
	Mon, 26 Oct 2026 19:10:46 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5k-000000038PW-0oUQ
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:45 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-824413e10dcso1692040a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041841; x=1793646641; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=;
        b=EuZIlTJlWFCbcM14ohi++/LCK3YSh8w8TVfd00eN0Kucy/xZlSF8q0DFEBShKQwLNq
         oyUXfU+mmkCjhLtUI40q98RWtRqkR8WbbvHEu3UGmaEC9aaCnnd/WTMhO0I2QGdqR1u0
         m710Sx0OXzCKKqeAROA6U1n4291IhDPkAOiL3QpslvQyfRcyRr+CO0dVjvGwA3IbDzU7
         CT8MG2M4R7m3lmWEAIgyOZjmkG3oJ1kwUQE5CS+J7g1ity211lJZrVsTupZ33oQH8aw/
         kJjFvpVGKg+m8QxANiZzZwqs3eubcYnkS3XAfCtqRGE84FQIK/JzDjyndbKdtBZ6MizT
         GsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041841; x=1793646641;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=;
        b=qfSDKJ4qp707j7zQhDAfzFQKj/8aJ8TziwTHImBny38cexJhc6BSBzz25T9N4qQlb7
         L8LsxN7XuTj/hc6ATbHnnnbmHkKvnrQc+YxQkeJPJVKQyNcfs3eZRBUG2i5S+/jVx0KM
         wt4N2xJPWZJxxo1sqgiW6jXcYqzIxU29EWIssjJHkN6msUeXzByGStuJt5G6AM2HRhp0
         BWCsAqVQEBXf+1+1UzP7Cn8GlG/K97LNfxNTzJq9n4dEsen2v7QnLutyvYg6C8Aj3Rqc
         alhkbgcQsTu9OrNCD2wznnoiVqmthNhzgcIR1ODnTMhYtrZQpbMXwpmibg0Vn/opA3MU
         f2Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxYeMPmyhrKU17OpVO998dsXUjAiYePLZMoprRloXu3l32V5iDZQN4TZuyhOwuaWDP3g4tfdDvSdMOm+K5wRg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKtnujhFQcsMg4STWK890cIKVRlmWdj3LLw1Wl8D8fGIg0gssyJ
	Cg0VawiH5iMftPrgad/P9UOlb1bIjrgxZQDQeJHYRF7/3fT8wrzNZMFq
X-Gm-Gg: AYBFou0J8unRv3ujftqjA9hjqfJw4gnB9tJcHujJdyNvE890LcuEZYIQSfVBrOw+z7A
	akXpnCr5Q+HkhP+pnowJA4gXevG5c7NJSdbJeJ9lv08gUsRhuIKkA6VRylnybYqj/rfzRWBkyXU
	7aZGxWzAgmhSVRZOTA6HyyReaCegfGqT4msHm4NQAG1NXeYPlhMU9zbo9Xke4xgfmr36ZPZdHjM
	zt5Mn4pcEYPQg1fucndTC2a4Y9yp2JkeKxZZCRS2aS4JYe5gIpLHS92DoYiiI4bREoGx1QMIrsu
	vixZS3+zXcH/Ee0uMMd/ANj+yAY2ftgieh129Ur51wNexP5ms0NiyWd1W6EzTvkIx1pnnUdkt/A
	N+0X6aNTxHZ0UF0ennxA/W87XQMqPlHZwyrizRA0vcbivb+ypejALwh2ib6xNR2osYc8wDCBeV5
	0R48mNVJa7uGw7YOiJDh7XR8O/4tWTTDzBL4ZTOl2fG9eQsvUvZ24eWgBXF7RKzjzbGQCwfDbTf
	rFmzUGP9a6TsBbRUkL4mQ43bRcunD/2poHE3fLy320j8h0RiblAu8j4Up0addlR8NFzuy5em4qh
	4qWJS/HVFOJWvj1wNu1JfJaqYTVYvlVyyUDqJnGwyKyYrA==
X-Received: by 2002:a05:6808:50a6:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-55c002c4d6cmr5571600b6e.29.1793041840897;
        Mon, 26 Oct 2026 12:10:40 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:40 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/4] wifi: mt76: mt7663s: two fixes and fewer SDIO status
 reads
Date: Mon, 26 Oct 2026 14:10:35 -0500
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQqDMAwA0KuEfBuwKXSjVxn7cG3UwKyS6BiId
 x/sXeCd6GIqjhlONPmo69owQ+gAyzy0SUgrZkDuOYWeA9nLDiGf5V3XRsfmu8mwaJto2W8pRSf
 mEkONY0n3ih3gZjLq9388ntf1A00N4KtzAAAA
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-mt7663s-22c31d3fc68d
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=2308;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=tyqWodcb4HgA2IBe3psm2WrhLsTpaYYAyzN5LeZv4/A=;
 b=E4ysnrAqpc/wKUI5mzFLxFe8CxGZEzCtxfGQ1JNY+laZcPUAM6KONFWstDZqbNG1+jqMwAzk5
 HJ/ByhvWs+cCbQl2zCyqQISK2s1XAC/Ns8YnvGdS8EMZajk3AVJWTye
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121044_252976_113C24ED 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These came out of bringing up the MT7663 SDIO module of the Amazon Fire
TV Stick (3rd generation, MT8695) on mainline. The board's devicetree
is not upstream yet.

Patches 1 and 2 are fixes. With the offload firmware, a hw scan with a
random source address ends at once with no results, so NetworkManager,
which randomizes by default, finds no networks; patch 1 stops
advertising random-address scans on SDIO. Patch 2 lets mt7663s wait
while btmtksdio holds the ROM patch semaphore, instead of failing to
load its firmware when Bluetooth probes first. The matching btmtksdio
fixes for the same race are posted separately to linux-bluetooth.

Patches 3 and 4 make the txrx worker cheaper on the bus: the interrupt
mask writes become CMD52s, and mt7663s takes the next interrupt status
from the end of each RX read (RX enhance mode) instead of reading WHISR
before every RX read. On this board they halve the status reads; the
link is air-limited, so throughput did not change.

All four were tested on v7.3 on the stick, with btmtksdio built in; six
boots in a row brought up both functions, with each driver downloading
the patch first at least once. They apply cleanly to the mt76 tree, where
they were build-tested with W=1.

This series was developed with the help of an LLM coding assistant.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (4):
      wifi: mt76: mt7663s: don't advertise random MAC address scans
      wifi: mt76: mt7615: wait while Bluetooth downloads the MT7663 patch
      wifi: mt76: sdio: use CMD52 to mask and unmask the interrupt
      wifi: mt76: mt7663s: use RX enhance mode

 drivers/net/wireless/mediatek/mt76/mt76.h        | 10 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7615/init.c |  6 +++++
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 14 ++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 28 +++++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/sdio.c        |  3 +++
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 21 +++++++++++++-----
 6 files changed, 69 insertions(+), 13 deletions(-)
---
base-commit: 16f56d6e78fb3cdb3214bdc6a61c2b1c567c9aa0
change-id: 20261021-rbrue-sheldon-upstreaming-mt7663s-22c31d3fc68d

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


