Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D70C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:47:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C9961EE7
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C9961EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Xaoueqa9LQsixU7pKB+GCUtWC3GBwtpFEdpSQ6MILc=; b=4GPESDAhMyRApe
	FvomrzcyaZhV6wgnutHDPwhAzqbq++GcOnJAfeAKfeVx8HaOrzKoOXlBdv4zUbqiWvPb0J0mnHNgj
	Wfb2CK6S0xmZMlZ9qapdheRGoIGVDVZ/aajXuf6Gt5PQ7gvuEONvI5e1HjD3M4UJuDXoxnq9msXaO
	1iJJgmCA97Dpo3HVRa6e0agrs4tDfxD5vwORLl/7W4yf2EBJBOIZrjjzFKS0mWbabc3xJHf3UvTJI
	DDBAy79vNzuEXFjVgOnL0/P2COHg1r5uPTk+rtl2jDS3/LW/4mONwvxBG44Pmx79shMoiRR46Kw/C
	YfpXVvuadLCwMFViSIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jY4-00BXJt-Vg; Tue, 06 Jul 2021 11:47:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0jBw-00BJCD-Td; Tue, 06 Jul 2021 11:24:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84D8361C31;
 Tue,  6 Jul 2021 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570680;
 bh=1gVbLL1kI2FGGL9Jt893bMZph5qvrOclaJZR6CxvTRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q4fehHX1kQ1ps447hEqoc2FllCoEa7EJvTWz5HYhlSkbvCsLGdrkkBqtjXexffPNs
 2OE2nJPBQJtwqWy4UwJhQlsgyfhIM2+WN309aRsrc52qIbuXDkdxvkO3BKPGTDrMgU
 sWV4+zoZ8EbIvLdQ9u90sRgn00TxsAT0Ye2QZS2GtPGF5+LU6l0qOo9xsODxDO/B3d
 5gD6VS1UzYmOS2sGVVI2eFS7OevHNo14OnA+tox/tFhdTseHS1hpxbFCp5cbmQP0XZ
 wo94gqqlvqI7Ydg9W5zzzlZfhSi7zGl/2mbwvyn16h8iEgwxPv0cR3NWQhtgHhAcH+
 fi7D59X2xfl9Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "mark-yw.chen" <mark-yw.chen@mediatek.com>,
 Marcel Holtmann <marcel@holtmann.org>, Sasha Levin <sashal@kernel.org>,
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 121/137] Bluetooth: btusb: Fixed too many
 in-token issue for Mediatek Chip.
Date: Tue,  6 Jul 2021 07:21:47 -0400
Message-Id: <20210706112203.2062605-121-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_042441_035720_71339B77 
X-CRM114-Status: GOOD (  11.83  )
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

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

[ Upstream commit 8454ed9ff9647e31e061fb5eb2e39ce79bc5e960 ]

This patch reduce in-token during download patch procedure.
Don't submit urb for polling event before sending hci command.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btusb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b1f0b13cc8bc..8195333e5665 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2963,11 +2963,6 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
 	struct btmtk_wmt_hdr *hdr;
 	int err;
 
-	/* Submit control IN URB on demand to process the WMT event */
-	err = btusb_mtk_submit_wmt_recv_urb(hdev);
-	if (err < 0)
-		return err;
-
 	/* Send the WMT command and wait until the WMT event returns */
 	hlen = sizeof(*hdr) + wmt_params->dlen;
 	if (hlen > 255)
@@ -2989,6 +2984,11 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
 		return err;
 	}
 
+	/* Submit control IN URB on demand to process the WMT event */
+	err = btusb_mtk_submit_wmt_recv_urb(hdev);
+	if (err < 0)
+		return err;
+
 	/* The vendor specific WMT commands are all answered by a vendor
 	 * specific event and will have the Command Status or Command
 	 * Complete as with usual HCI command flow control.
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
