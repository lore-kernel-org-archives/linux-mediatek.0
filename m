Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8B606A31D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 19:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pD0ZA4eV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LdkTRSH9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=; b=pD0ZA4eVSWeMOJ
	feyJtxc2fS+ahX28FF+DawfOv4I4PU3eRmoxEv2EqPdFtaQpNyV7sZFlIFEqnZKijCduyzgwiMGgy
	TmIwacfuoDVMaL5/lOtMJJoA8Exjd1FCq/NzCPJIEI/zsRaAH0jfBYs7FSYz50Mlul9Es8Mu/n6M2
	ObySQXcp/I+RV+d5MPd//UEv0ukY8wdV+cusLGqH8B9kWHTjEF0IqaThAdaxJVTkw+L2aftO9P1qS
	nDaIvsIQq6+aYP2w1eKeRlTygBNkOccLtBAJ/BPHY0nxMei2JCVi1VlzDnl3uwlFFNOjkchqzFMx2
	4Ki9lPHSOzsfdNwOqAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxj-000000037b4-19Qi;
	Mon, 26 Oct 2026 19:02:27 +0000
Received: from mail-oi2-x07.google.com ([2607:f8b0:4864:32::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxh-000000037ZF-0BsS
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 19:02:26 +0000
Received: by mail-oi2-x07.google.com with SMTP id 5614622812f47-4b39374fab5so1424132b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041344; x=1793646144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=;
        b=LdkTRSH9oajDSwkuBLFfo31BdfbY/gDBHzDlk6kiQUkMgw/KB5rbUk/TgaGV+UkuJf
         T5m2Zu3xF4nz8hhI+SHCUzfojLbcIWtaLIOK6fsSGVYz6qEYG8nxb8HAemfThamZ0hGO
         3NwXYCP4TRr72bT/aF+y6ezMWncCi644+kNfuBuvnc3EnJ3TfK9NoBmNcTvlj/kMIEje
         jEOt+c/B9Bm06RIxHFQMCOIfnRefapvXiKuVkRyR2LjViegs3aB+mRQKAIp9ArTnxNwe
         GSQpdiqCBpxHgVbnqhy2GgTINVKDKuWI8AH9V9Ixulc23f1PM+4HcJRof9QfykD3VKk3
         xx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041344; x=1793646144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0/sOWlN1MqwJBr0A98O/WByIk4UA9hHkggdJ3H2bxw=;
        b=haG1jKpBsMjeUDw1qJvv2n2wEO7Id7Esh4xd2zM2V6I4KDOsksxqgjgdcEWSO16x5Z
         QXyEEXOKKGFF/0pgvCRTPnPPVmMOPChBtJBFTlQ7maauaFCRRYGmq6rI2O6lZsk8SDnT
         vIol9aBOLZoK+JkrgMTczjG+Qx/SPcOAm4pduX/CjB0L5TVhrwvgIFuG7RkR6zNJN5hD
         dIFCG5Wrh2sJuqr3YpB4Y2xFqmSHrHpFPGB0bYBZcLTZkVVBofzRZOyjOcrO8xeU0UlM
         pHUF+nnRaAp9qJlgveZkOR5ri/9jhH+hXChBE5D3SwsAXCuCp1nXPrJGDirnDSccFIM+
         Wagw==
X-Forwarded-Encrypted: i=1; AKwUvBzX6ITOWDk3FstgLnW89x48FS/GMSk/TvRyrHIdCvbaP/iS9HFNKS5N9F1Fx/gSHdnZvUzedNpf21qzmbcrdg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLPTgU2+4NvyBSuEZykFufrOAbW7qBaZ36De60T7l7fOlwimybo
	WnojD6BtvOZm9AAs3eU1mEEucVJ7HSVrgXSaNsz8V2WF/wDBeopIkZD3AJQnDT/RSkI=
X-Gm-Gg: AYBFou1Gms/q499IBHvmCSVAGFpqgd6CjNNkQsePys/CV1RYXXvtFT/iccwqztZ7NpG
	a+q6KwHFlPSgSsm+3CdCCyEdbNDpuGiU7ZOR3OeM1APE5uC1j9XW+eOQaCcs/UJ8kuHipcBY9VL
	tJSWT2UtcEM5ajm+k9BqoaNGdZweyTGZq23HZVs3LCm4gLvRVYcktWg9F2hJQfGndG0b0gfGIb3
	LaDYDKOHJGZhUq6/7nR3enASktjSrws4p/EfT2VDxtLhZZw15GryeSiI9PqrYDLz6KiGCRh0YE8
	DWSZtRbn5yYsbP37219mOWaVDlEN8vPfVHN/AELE0wjYfg1lRvoMW/Rx4i7dl5O/o6PQqbrWRmU
	kd4Yz993LYWteGRgAjwUW4YJ6Vo7wTkHkY1IZ8r8dumY3HPRU4atPyFoWHLUIfF9HbFrkbY1GSl
	tEIUh5dEhmNoL0+IL6E37sf/aMsQX+1CgxQstJHHa5kOCPDC7xcXA3BAs3SS9GgmUj+h2YfUQKB
	FmJCyPRoTgJLbW0M/mQ4+GOhk6QBBbaxvs4g+bPd8C/ahr/iC9Yuhp+H3pVRRIsPkhS/DPIe9Ok
	I87UCEFlz4vXD+AevZYBnTrAIZ1HenV8WJ7Yr+IKN5JR6aDeGUq7JjdPftzbcIGkm+rW55h4m8g
	KuXXxxAnLkxPvLiSYg2k=
X-Received: by 2002:a05:6808:c2f1:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-55c0038dac2mr5576376b6e.59.1793041344128;
        Mon, 26 Oct 2026 12:02:24 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:22 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:02:13 -0500
Subject: [PATCH 1/2] Bluetooth: btmtksdio: wait while Wi-Fi downloads the
 shared patch
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-1-121792305f72@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=3241;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ddztoRYUESDPWb2PQYPya2Tntue+gD/4f8ofmkkWRzw=;
 b=Xpakt9Wyhh2fH44z/HY3v5CV//e6jdBro+k8eFbYlXhtJ3WfwmxDtQGqwSusmrwJNYH6TjbNb
 2hHcf/PxIVLDax2JTueLWoyqslFrC7Zmb2Rbz+fxerGE9NUNOiar/kM
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_120225_126649_B92831A9 
X-CRM114-Status: GOOD (  20.80  )
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

On MT7663 and MT7668 the Bluetooth and Wi-Fi SDIO functions share one
ROM patch, guarded by a semaphore in the firmware. The WMT semaphore
query answers 0 while the other function holds the semaphore and is
downloading the patch, 1 when the patch is ready, and 2 when it needs
downloading (MediaTek's own driver: PATCH_IS_DOWNLOAD_BY_OTHER,
PATCH_READY, PATCH_NEED_DOWNLOAD). btmtksdio treated 0 like 1, so when
it probed while mt7663s was downloading, it went on to enable the
Bluetooth function on a half-loaded patch. On an MT7663 module
(Amazon Fire TV Stick) that left the chip unresponsive until reset:

  Bluetooth: hci0: Firmware already downloaded
  Bluetooth: hci0: Execution of wmt command timed out
  mt7663s mmc2:0001:1: Message 00000007 (seq 13) timeout
  mt7663s mmc2:0001:1: Failed to start patch

Map 0 to BTMTK_WMT_PATCH_PROGRESS, and poll every 100 ms, for up to
5 s, while the other function is downloading, as MediaTek's driver
does.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b9563df72983..bb311986271f 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -234,8 +234,16 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 
 	switch (wmt_evt->whdr.op) {
 	case BTMTK_WMT_SEMAPHORE:
+		/*
+		 * 0: the other function (Wi-Fi on MT7663/MT7668) holds the
+		 *    semaphore and is downloading the shared patch
+		 * 1: the patch is ready
+		 * 2: the patch needs downloading
+		 */
 		if (wmt_evt->whdr.flag == 2)
 			status = BTMTK_WMT_PATCH_UNDONE;
+		else if (wmt_evt->whdr.flag == 0)
+			status = BTMTK_WMT_PATCH_PROGRESS;
 		else
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
@@ -842,20 +850,35 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
 	struct btmtk_hci_wmt_params wmt_params;
 	struct btmtk_tci_sleep tci_sleep;
 	struct sk_buff *skb;
-	int err, status;
+	int err, status, i;
 	u8 param = 0x1;
 
-	/* Query whether the firmware is already download */
+	/*
+	 * Query whether the firmware is already downloaded. While the Wi-Fi
+	 * function downloads the shared patch, wait for it to finish.
+	 */
 	wmt_params.op = BTMTK_WMT_SEMAPHORE;
 	wmt_params.flag = 1;
 	wmt_params.dlen = 0;
 	wmt_params.data = NULL;
 	wmt_params.status = &status;
 
-	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to query firmware status (%d)", err);
-		return err;
+	for (i = 0; i < 50; i++) {
+		err = mtk_hci_wmt_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to query firmware status (%d)",
+				   err);
+			return err;
+		}
+
+		if (status != BTMTK_WMT_PATCH_PROGRESS)
+			break;
+		msleep(100);
+	}
+
+	if (status == BTMTK_WMT_PATCH_PROGRESS) {
+		bt_dev_err(hdev, "Patch download by the other function did not finish");
+		return -EBUSY;
 	}
 
 	if (status == BTMTK_WMT_PATCH_DONE) {

-- 
2.55.0


