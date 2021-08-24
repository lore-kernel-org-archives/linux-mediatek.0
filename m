Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90733C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 07:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51BCC608FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 07:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51BCC608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VZmLPZ46htVAmq6/eZa3mjC7vuujfuFnWefSNcUX9e8=; b=omRonSIDUxIvVX
	q6eUOG9+OeXpnMPqkBFUHndCCntawjOtjixos9JVuausaGlb7Vtkf7eKFXSlT3jS0tbLpvquh3LX7
	NefrPlbw0JkU7H63sF0BlJFux+ru5fDHssZezhGT0RZvpBeUaFpzb2Bp5QzQ2i6fB4vbJnkgeFh0x
	9JjJIzZDflr3rMn4dA/QUPhtxaSNAAxTMfA5GjbOzlDUAdgUKTPlIlgwF3ptmW2tDMNfG2LOEd0DQ
	XiielcYxjNfLWd6HqKoma28d4H/c4WMc5RSU54SpoWo+KluEf57u1o+QoIbdsAdp3jB15f58n24jx
	Jg5FmWcY0aI9x1wxYHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIQQK-001y8C-7I; Tue, 24 Aug 2021 07:00:40 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIQQG-001y3k-T3
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 07:00:38 +0000
Received: by mail-qk1-x731.google.com with SMTP id y144so22076847qkb.6
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 00:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fwvoBNnOVeLStj97kABmgr2lP/M5U/faVgrrsm4jm84=;
 b=mC9Ff686jjOmOumd3lR9JG3qMEQkK+Ag9ppBQvU50pFOwaIUXq64acUTXdLBaC5GtW
 tUnI2RlSyaCDAOfyVIT/QMuEv/4E6HIGFdhfaM3NJ/MtQjeUpFaUac1v5aAIDSOhgzwk
 a3sjh/voQHFgmv/8G/nrUN0QCH2gCJWVcvvSsWzhso40Ow5FctuGQ6ZED7094hK0Q1gl
 7s2lQ8C+FrlLFrIbboHdCoxnznwPnw4RnV9RGiTKjBNFnMfp5Rz6tzcezU5TmBjQjNNb
 Q8o/eVo/X5iqZje4p1IdLnLrVL4DLDpWtfqXEd7w3mt51rzgx6Rtqw4TZU1KefhSsoxH
 Fvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fwvoBNnOVeLStj97kABmgr2lP/M5U/faVgrrsm4jm84=;
 b=UReo0DP2qvuOhpL/kCLboWnpygnerwias3HtpJfILlMijktPjxe0mvDRzffQgV1pw2
 ejDabR5UuyUFtfLXTIl9Ma5hetvDHamPDXLIewTjrpK+3ngEsV4/8vZ4Nrn3quTukrHs
 dC4GEj9FZ9YyOwSbFuVc2tNAN3/8n55vLKjh5+VxHi/NUwGhHX2KwDoRAlONKesWdCaX
 oq3N+gZxX9LtZFAjT6R8B7Fyhm4RugsMH9Gg9rXOqbFO1ykakGQ5gVhH9hoOu8yihIho
 pbcRswgEjp8m3TtWiUS1irpzviyYc2hCTfrLsuldI5vasAqruWEq27lgavUovHhzizFD
 NqwQ==
X-Gm-Message-State: AOAM533BxuRYTA1gvi/H7JYPf1EsgkIryi2evW7ogU0eYBlnnbyraqWC
 mU/WbGeF2ubSx694Hez9UQ8=
X-Google-Smtp-Source: ABdhPJyImx60V8UEyg8azSONvBkqYkkNAY287rTKR4p7BzwG8oQScs6KgKrohwK/SSQxWCZuq1S5ZQ==
X-Received: by 2002:a05:620a:1342:: with SMTP id
 c2mr25256932qkl.264.1629788425718; 
 Tue, 24 Aug 2021 00:00:25 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id c7sm8420156qtv.9.2021.08.24.00.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 00:00:25 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jing Yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] wireless:usb_sdio: fix boolreturn.cocci warnings
Date: Tue, 24 Aug 2021 00:00:17 -0700
Message-Id: <20210824070017.60880-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_000037_011907_9E3DB735 
X-CRM114-Status: GOOD (  10.86  )
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

From: Jing Yangyang <jing.yangyang@zte.com.cn>

./drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c:172:8-9:WARNING:
return of 0/1 in function 'mt7663_usb_sdio_tx_status_data'
with return type bool

Return statements in functions returning bool should use true/false
instead of 1/0.

Generated by: scripts/coccinelle/misc/boolreturn.cocci

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
index 996d48c..bd2939e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
@@ -169,7 +169,7 @@ bool mt7663_usb_sdio_tx_status_data(struct mt76_dev *mdev, u8 *update)
 	mt7615_mac_sta_poll(dev);
 	mt7615_mutex_release(dev);
 
-	return 0;
+	return false;
 }
 EXPORT_SYMBOL_GPL(mt7663_usb_sdio_tx_status_data);
 
-- 
1.8.3.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
