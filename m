Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267BDFED3FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r5s4ITLzucb1NombRG39OYMqsz80PblAoilF2T+Vi8I=; b=xcHlmOEOn1eys0UD6Q28TgzLNC
	CaWgCI6VgDN7vMtaS+XSuHiqXdbws3j4t064d6Xk6E0oGXLPXPxEoM4XCBPdX/KuKRg1M/BNqum5y
	PGBy0C8e6tkD80UNVI7LruHRx0d4esMIRRvQ8bIGWrCMM9XptoJzY2Wxd08b3RtldAwRcdz/xUJw6
	hJQhYH8J45+CMQCTbMbuwjQtK7Ae56SZZiUSB6XI6BnnN37QoZZY492kWHEinGtTHGlHOFU5tzglL
	2OJSR0MFqly3O8pEdEnH0PVUGFP7ESD1W6cn6v6OBRl6tjVKyO60SXPehPoyO6BmulE73iSEIMHvG
	TjMkgOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGM9N-0000000DhdC-1h5O;
	Fri, 24 Apr 2026 19:25:17 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGM9K-0000000Dhc8-2wpH
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 19:25:15 +0000
Received: from monolith (unknown [193.138.7.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4g2NFl5mFPzyV6;
	Fri, 24 Apr 2026 22:24:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1777058701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r5s4ITLzucb1NombRG39OYMqsz80PblAoilF2T+Vi8I=;
	b=lYm9Sz8Su6evx9NdAj+NTRpFmH+VaKSbfnNYiWy4GiQ5Hq0VtDwqofaeRgDuf/CaL3EeId
	KktWdt9Z0/Ma4m/q9mN/7Hn9Mfmr+AldJctIalDiGFSuaKn2NJHZ3+elK7nLQv2mpgjx15
	plpWMgSS9NFXnF5fzK6Nzgfn5j6oKnc=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1777058701;
	b=lVKRQcw71A0X2HmW6qGRuOXSvX42hQANcV+YaO/NEZgIQDEDKF8RSBwHaaSfskQ2C68kQm
	2G+olXdqYAK5cNR7wLCbVtaApRKz7DQ8jlLUE2XGx5Zf9fcQrtbQP6JtiknC106r79jgHT
	Na2R5PWieWtQ6AWyHqe/9fnI+n1z5e8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1777058701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r5s4ITLzucb1NombRG39OYMqsz80PblAoilF2T+Vi8I=;
	b=sNFrQ2sbGtdQ2cyjNtHKrjvkm+m2fpUXJwSc9VLf5WJMx/Mi354s3/MQ+SlzQU7kmGy1z/
	E7kXDc7alHpSzgqeZDCuj45cJzgACS7GQ1OHOWNKciEGuEHyin9PRn5oJLOlVoxUIon8zd
	I81LJwj81aGsyPCvbxRbk/RX3AHhsTE=
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	tristan@talencesecurity.com,
	linux-mediatek@lists.infradead.org,
	sean.wang@mediatek.com,
	mark-yw.chen@mediatek.com
Subject: [PATCH] Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
Date: Fri, 24 Apr 2026 22:24:29 +0300
Message-ID: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_122514_938553_E16999D0 
X-CRM114-Status: GOOD (  10.91  )
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

MT7925 (USB ID 0e8d:e025) on fw version 20260106153314 sends WMT
FUNC_CTRL events that are missing the status field.

Prior to commit 006b9943b982 ("Bluetooth: btmtk: validate WMT event SKB
length before struct access") the status was read from out-of-bounds of
SKB data, which usually would result to success with
BTMTK_WMT_ON_UNDONE, although I don't know the intent here.  The bounds
check added in that commit returns with error instead, producing
"Bluetooth: hci0: Failed to send wmt func ctrl (-22)" and makes the
device unusable.

Fix the regression by interpreting too short packet as status
BTMTK_WMT_ON_UNDONE, which makes the device work normally again.

Fixes: 006b9943b982 ("Bluetooth: btmtk: validate WMT event SKB length before struct access")
Signed-off-by: Pauli Virtanen <pav@iki.fi>
---

Notes:
    AFAICS the commit is not yet pulled and is only in bluetooth-next, so
    maybe this should be just fixup?

 drivers/bluetooth/btmtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index ab34f1dd42bc..68a32d11e5ec 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -719,8 +719,8 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 	case BTMTK_WMT_FUNC_CTRL:
 		if (!skb_pull_data(data->evt_skb,
 				   sizeof(wmt_evt_funcc->status))) {
-			err = -EINVAL;
-			goto err_free_skb;
+			status = BTMTK_WMT_ON_UNDONE;
+			break;
 		}
 
 		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
-- 
2.53.0


