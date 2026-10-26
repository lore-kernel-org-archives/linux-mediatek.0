Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B87606A322
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eijk4W+z;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dugtSS7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=; b=eijk4W+zJ0yUjH
	mtEJmGk5AOsG7yX7KcQ9zWm1K2nDbZukyFufKxtFRyVsBu9ay8IbnOsuMU1kLwgbSn2bCInjRdTYA
	7hJbCVEIj+m2nqiFlaODKKrdo9IcgAQ55LSyfGK4WDXJUtP9maLWFHW/jRsEE6vFnM/ZWmirAFTWw
	kCikN3VNcDYvjHLtqqbWGLlDwk67GtjBYGlbmxDVyS7wZA9Gpc+c5ySC9VRLSQRcjs5UZKbjfDKru
	879oOIiDKhoEXVTmPP+11pE7h1my/KABtC6yIFKIL/7Je3NrpREZbrUQiHoYYqpH2XYc8BzCi+WuO
	M9CEPbkbvfLQkmDUqi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxn-000000037eV-2Slt;
	Mon, 26 Oct 2026 19:02:31 +0000
Received: from mail-oi2-x03.google.com ([2607:f8b0:4864:32::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxk-000000037bb-25x4
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 19:02:30 +0000
Received: by mail-oi2-x03.google.com with SMTP id 5614622812f47-5413fa881a9so1187840b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041347; x=1793646147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=;
        b=dugtSS7Gfoxf8l1IXEwr5Lz4M9P0knxSbn+qQjsJBQiSRsKHJj26gLxQ7lrI+VvjEH
         JrRaVcrS4akWkfMVlCtTzsG0ju8YX5dzO7n9MUpsWY0LjTdgjVEaZ+GIlOHV5aDZbFiS
         1KQ430qCCxpZGC4rToPGE6/RiIjshD8LXfrwAvqeP4o9/L1ExzyM15VzVTN4jYR7z2/n
         SlXd/ki6JMaXCYnl1kwZwOL6xVGe+oUyJcLJGnwtHq1jVx73+6MXfyMWgzbTYspV6IKL
         LI8cY94FysUatIV1Jx/vI5M1Aqu8cnqfVGWZhHfTiscrVxXphAm6qkNCAdkdqOZV1o/s
         couA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041347; x=1793646147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=;
        b=wi7d/aVaXhIzqT2Eta3FtIVPVvsqYg22tT8cl3+jKM7VOxHnERrulF16h9tPdJ8QPG
         4Z1c4hfk0EC8wltH311PXL7zCgc85J4huca84A6Jb3dXDvrgbGAVdLfF3vRBEX7baGOe
         YCC7iYYubXsyhG3NC3eGd4BlWCl/+9GN/Mcw7Nu+SswETm4fku1gj5woYc0ySEBfmU8f
         yxJTOLyxCbbltRbYe4urOV8K1dkTyr61ROrTbaKhAg1Mba4iGxeLi5+rzHD3R+VoqIze
         JzV+79yVNWIhYWbYnJA98rvj5CU4P+AbySIvE+WUKGHMnyPRvGSqeiqYuf8EXxx+wszx
         t48w==
X-Forwarded-Encrypted: i=1; AKwUvBwZ5Zijmv+6njy5m5R9JZPRD8FckdTF1RoCUmwnV9B1S7gfSlCBTeJhSCnxKFPXL3n8yGgE1+QRByI5EYD4mQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJeV0SdGmoc09+CIRQVpYX5HPfd1PtoKEz2txpZBHka1VWPE48K
	35Nub8Ka6Fgpc+o9cCp0zz83bkof1YBrbWP3j96ady7SEsPJsO4jF8xR
X-Gm-Gg: AYBFou1JsZOLJCPjfnSdNMhSq0NiOJGenZb5LHtUZ+YZwrCda46bHCz22XXjt9FjeLa
	1nipGdDiQtBRpYd+nnxAZziH3xrPtSYQdO6+lpPob1BdDoVuOl8zJYdpTZUOOIiHNPNYvNOofJN
	1oLdYXjWHLIxt0qnKEN7uNOplW/D/hGRkGtIJOIhuqPXAFOqexSRh9kGKrH2uJPpaTXWibdTflS
	Y1GpAYjOWd2NvguJIqVoispuW2UlKV8cCdyeftPC9zcy4+eEJTDVg1v/Vrq4eslTGZyOKaVScF1
	F/moUf4sPEbA5NqT8hU2vOE2Ewmgmwh6Uid7RJCInRqoUdZsjWERRXEEI76zyb9O5JjM8hMo7Nm
	wUHSgjSndtecDJR+QutHCXNxsNEM6IvL+qR3BqnygrECgTpwfDJz31gnBP7b1SVlkrS3oHa5cyo
	2F5W7iajbxeiyhkrvHinSRcaHXoz5ogANEAKB6jk4UgimJX7KuT6rGcVH/558tmZOb4uBj1zT50
	m6gqo21jIFoK6sfRyiSCQswskhJh9p+G+9zm4hBoYffyEdY9ma5V3ds1sgvwUp46zjbe/4JmLT2
	oG2p0Oqa9GIrMkHfLH7Zy6ZZhSuC8SjCWZgGMsCUAGLyBA==
X-Received: by 2002:a05:6808:c226:b0:4e7:851c:23f5 with SMTP id 5614622812f47-55c003fa3f9mr4544096b6e.59.1793041347210;
        Mon, 26 Oct 2026 12:02:27 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:25 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:02:14 -0500
Subject: [PATCH 2/2] Bluetooth: btmtksdio: retry enabling the function on
 MT7663/MT7668
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-2-121792305f72@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=2175;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=p5no/S8PpFqMwynWIKqGncsBNwjfIsmYO/W2PvcD6mQ=;
 b=IJ298NG14mxx/gBOBanVXzZJRrSHN5am2KydNnQfi4ZzU5GBakO03eJI17yPJL1Tz8N0Tb2xS
 iLeV3zN+1+pBrri+wlcCSBgNRlJh/9gFw2i6TTiZ85XBNSg0HrlsWbj
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_120228_555614_7F8A54FF 
X-CRM114-Status: GOOD (  16.14  )
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

Right after the Wi-Fi function of an MT7663 combo chip starts its
firmware, the WMT function-enable request is refused (the reply's flag
byte is 2). btmtksdio ignored the reply, so the following low power
setup command then timed out and setup failed:

  Bluetooth: hci0: command 0xfc7a tx timeout
  Bluetooth: hci0: Failed to apply low power setting (-110)

Check the result and retry every 500 ms, up to ten times, as MediaTek's
own driver retries its power-on command. With mt7663s probing first, the
function now starts on the second attempt and setup completes.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index bb311986271f..239393a15e46 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -909,17 +909,33 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
 		goto ignore_func_on;
 	}
 
-	/* Enable Bluetooth protocol */
+	/*
+	 * Enable Bluetooth protocol. While the Wi-Fi function of a combo
+	 * chip is still starting its firmware, the request is refused, so
+	 * retry it.
+	 */
 	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
 	wmt_params.dlen = sizeof(param);
 	wmt_params.data = &param;
-	wmt_params.status = NULL;
+	wmt_params.status = &status;
 
-	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
-		return err;
+	for (i = 0; i < 10; i++) {
+		err = mtk_hci_wmt_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)",
+				   err);
+			return err;
+		}
+
+		if (status == BTMTK_WMT_ON_DONE)
+			break;
+		msleep(500);
+	}
+
+	if (status != BTMTK_WMT_ON_DONE) {
+		bt_dev_err(hdev, "Bluetooth function refused to start");
+		return -EIO;
 	}
 
 	set_bit(BTMTKSDIO_PATCH_ENABLED, &bdev->tx_state);

-- 
2.55.0


