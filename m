Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89097606A326
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDsvxHTB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FwTYpO1d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1sm2hc3YWGgsvsgSDqn3L9ODNcpGkRux3zpwGIv5W5A=; b=kDsvxHTBpDaw9t9x1KdbRmcD0A
	0oTUVrGNuLATDzu17mw85K3Agcok8HZlOCCknWMKXFocXt0Ezam1HxgmEomeQbw2rUBd3JVzsG1KO
	ut4BzEur0X9NkTZWoH8HzCICnFOTb3UAyt2eooP+i/XObRw+b9ZK/qrS5wlhgthiPFfzb3T9a3Aun
	arA88AI2SLXSA2CCPc9zx2LlfQrXEp4Sc3vpmcaDFsDHdnGxuFHja+RTM5V/gUfCbch+0+dQcvfcG
	NzStS9EcURkj2K81Fkj30xrKb5eUQ9XZenE5DPzH/BTSkuw53T8FSdFyVAmmU0XjpDkxevxRn3hQ5
	HIw+vKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxh-000000037ZY-0rpU;
	Mon, 26 Oct 2026 19:02:25 +0000
Received: from mail-oi2-x07.google.com ([2607:f8b0:4864:32::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxe-000000037Ye-1UJN
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 19:02:24 +0000
Received: by mail-oi2-x07.google.com with SMTP id 5614622812f47-4b39374fab5so1424084b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041341; x=1793646141; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1sm2hc3YWGgsvsgSDqn3L9ODNcpGkRux3zpwGIv5W5A=;
        b=FwTYpO1d608zfH1iyhFUc3b+104jKzrSEx127UWlGxV6ldGg20P1VaFo02UPrGGZ4o
         Zd67wn7lXQvKXx+MDh5L1bNx9QFSCHRk1TV/SnmuHaO/sPooh9E6KhQDidGkBb2x8Wwg
         tkg81ORdKSN4H0xBdTGzOfGQWK0Wyjxo30u2SscCojpr4MdpmMEyLJHI0vHVwUPe1AMB
         hTKfXJdpFJTokVoqlK6IM4ulYLu9rjxnRl65E27yMXxNgXrl4T5mmJP/zqvdI77QPyex
         8nQq1aLuvq3grNI0U1zm9/DrJj9l3hfSJyMJaO4CYSEibPsjWnQWXHeW2ucVUTdcNI+K
         ayzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041341; x=1793646141;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sm2hc3YWGgsvsgSDqn3L9ODNcpGkRux3zpwGIv5W5A=;
        b=mQhtmnkdfhTAyBFjowWQLBTGYbTxUd63mmRmQr+KJ3vpwpZ8eaUTcIWvhqQU4QsoMw
         knUYOW7uOx3gjP4umHmAzCT8Tw5IxCt2ISIfwyWRU0NJwpiZkTl5aaWBn0yRr55xIstN
         w2QnxhzP/8rWkrx/o1MTAFamTJaEHdr39FBUq7KYCX1N1rxNm/SfB93S+hx+hM1eUHkl
         IefBH6XkTgmw2KLTzq0xeQLiQmLRYyG972mIcumAhKyNcFD1oiUWl5VVjdpRni62jkN6
         EZSph9+KwFoEp7rgxhHI4msUvnFKyga/FgXVpHhrJldcdnF5HogCnCyOcLxqUwvbg/rU
         W4DA==
X-Forwarded-Encrypted: i=1; AKwUvBwAm1WPJLsh+d9FbrYlj3u5uw8s/rl22XysidjcKU1t8jmKlztg+v4DwMCwj3m30qSNLIZH5jX7PiOC9+u0Bw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKOteL5sgX7kkf2dkBcztOGBEW/CMY4MZwkwaK3yBvAAUIJsrdl
	oin1WIsQIIuCUIaVc59lRENF7yptQ7pgBAVdB63dIMk0kM1HTFKxvTgp
X-Gm-Gg: AYBFou1WlPCeGqTcALf88uPqgZmI8yScQmZ5D0v+b+uXGhaPohgaU4n9Lyifo6fPa81
	U8J7oPJy8Jvve4gqHf0Mt7rmgzXAYwKzdMU7wzwY0wqEUQkrTOEXsT55qskeq0/kLyB7qvi2EIY
	0lrPfkR9YYelVAHvbT7ml3P/c9w/BZ538hnejYNx+xglEytAWtY3yl9LR4r6M41TLFjR7deEk3Y
	qvkldWOvngX0OXDR9Sz2N4qVVe6Dz5/5k0VRofZ6C3y7T7cFb0hnd2uy4vXbDy8CgeuacsVo5Hn
	X4tRorcC8BseGtqmwtHmB7qgY7pAnXpgqCEG/jy70sRIT0PCt8Mi7fqfbsmvKm51mwttDEoSzU2
	R0+3YG0lH9NPE88BrkGKT+B+sXkUhmKK8oUXPNX964QajBOnQi4YE8SUpvVYUszc6iUijkqxXBW
	9qNXbBpftvRiUWufkloEXkplMtqmzNYVEMaQ0fSb1bZ1Vw6M/XT2pw1rYexMwiCc2leZJgkS6a3
	7I6zh2yQ3zi4R11efpE+Cwcs0XvIuhEJFAdylqxOLiigik/bDu7R3pb1rH3mflwynY37WC90d/j
	80qWRTAIV63YZnFiVKXUDWbJv4AUgeqcneYeTIG0bsxHAg==
X-Received: by 2002:a05:6808:1301:b0:4cb:818f:d571 with SMTP id 5614622812f47-55c0025b87bmr5612703b6e.25.1793041341117;
        Mon, 26 Oct 2026 12:02:21 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:19 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] Bluetooth: btmtksdio: fix MT7663 setup next to the
 Wi-Fi function
Date: Mon, 26 Oct 2026 14:02:12 -0500
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrDIAwA0KtIvhtQJxa9ythHO7M2bGoxtgxK7
 z7Yu8A7QagxCUR1QqODhWuBqMyg4LlOZSHkBFGB1dYbbQ22ue2EstIn1YL7Jr3RlLksOPfc35K
 4Yu6j9zcMIWkXRuu8czAo2Bq9+PvP7o/r+gHmIKJrfAAAAA==
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-btmtksdio-mt7663-99d049724644
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=1556;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6qJwEv7Uc5GPnWb4YaFtFieR4chWToQkRjD2wM7nijA=;
 b=72qqkFwF9FgiJAEB+j5/HaEH0yUzFNF6BlW8rZzrGZefwnlyqwa2toYqOLqF+zVSUi5bAnqOU
 TpNXaoo33i6BwD3S4bBj2AcCfza4WGrjKTuBsJ5CxPaYuqTviIDkXKB
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_120222_408517_0D06A381 
X-CRM114-Status: UNSURE (   8.23  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT7663 and MT7668 combo chips the Bluetooth and Wi-Fi SDIO functions
share one ROM patch, and which driver downloads it depends on probe
order. When btmtksdio probes while mt7663s is downloading or starting
its firmware, setup fails, and in the first case the chip is left
unresponsive until reset. Patch 1 waits for the other function's
download to finish; patch 2 retries the function-enable request that
the chip refuses while Wi-Fi is starting.

The matching mt76 fix, for when Bluetooth downloads the patch first, is
posted separately to linux-wireless.

Tested on v7.3 on an Amazon Fire TV Stick (3rd generation, MT8695, with
an MT7663 SDIO module), with both drivers built in: six boots in a row
brought up both functions, with each driver downloading the patch first
at least once, and BLE scanning works next to Wi-Fi.
The patches apply unchanged to bluetooth-next, where they were
build-tested with W=1.

This series was developed with the help of an LLM coding assistant.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      Bluetooth: btmtksdio: wait while Wi-Fi downloads the shared patch
      Bluetooth: btmtksdio: retry enabling the function on MT7663/MT7668

 drivers/bluetooth/btmtksdio.c | 63 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 12 deletions(-)
---
base-commit: 27731ba091954eccddb2657053b590d2113e8d98
change-id: 20261021-rbrue-sheldon-upstreaming-btmtksdio-mt7663-99d049724644

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


