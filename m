Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4234FC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 09:19:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0325420707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 09:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zAjBdlQT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K+PUZGRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0325420707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xiPPEoBDiIc0OS6UpPP6MCvZ6w2ERtcCqJPQyd389yI=; b=zAjBdlQTomvJG2mMAUHdzb9jxn
	cPCj8V16nceThX5JcITdh8Ez92d9NVaV8vykW7EEr8hKprZhCuKLGzufgKzn5LMKHLW2++rVZUlJh
	xO+HCbF4Az5GQRXB+nqbPAsIh9CDtD5LwYEl9K/LiF+0Y6ci2k+GiIHWZ55Ph9WBKRZ1BbQEUY7Fs
	vGo2u5IDOaUhaF4lgqpcgvtrLx7dtdudROzEDcdsPGTPAytScglMzsoA3YJ520Q5eXSL/sfdFeewn
	Hpidcq8N/RMKAsWi0avLxWKekLz64kFDNC0XLY7OiuzoXZ1haPdCMjJu3CHE4AVV+MPEVprSsRx7v
	VMVt/uKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAraB-0004M8-4h; Wed, 26 Aug 2020 09:19:03 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAra8-0004KZ-3s
 for linux-mediatek@lists.infradead.org; Wed, 26 Aug 2020 09:19:00 +0000
Received: by mail-pl1-x641.google.com with SMTP id k13so607406plk.13
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2020 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3zVbq7zEl/VylsOkImAEnSsEooCYxqv16B/0RWDkhJE=;
 b=K+PUZGRMtL+WeKb15tJBnfkVOHrBfTwHgTsG6Vhq5aOYQ9VzlMP8bC3D4H9s9Vmnwr
 T9UbSHeZLvi2f0631yma1BoIk5JYO0ZMUMnnNgxwstvJPuxz6OXM3Zei5mB9fjd+8QXu
 tOQbQiebKGt/CBAaRYhsoaC02PXAPOJ+6bDTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3zVbq7zEl/VylsOkImAEnSsEooCYxqv16B/0RWDkhJE=;
 b=XEHdqzSgfo8PKwiDNG5YFS2RRzwIIywSJ/Hv56EYRd2yMiQnZ+WPre2thmO/3yQQ/m
 qlp+hM5oVQsAsODNmB+cjUEarqZMrkG+lVsInpIgNb0X5Y+ayGx/wCNTm207TxlccE3X
 IwBCZaTWMejiciw1l1C5mPbphvy0kuaUUGrZPoEHe18U3XDHY4CHHlZmMSt/1jT790vD
 DjmQ7c7ojuTEwx1LlydgxRcpgp3V/rsowHDEenRywxnvr1LtZAUVNJ+dVeNcbSBkcc9H
 Ml4SIeDJQx6DNsucUTds/k3H0zIMYpv2C5sSWJIRCt5Q522ujjaNa1whU5uplpEHsYoq
 qaSg==
X-Gm-Message-State: AOAM533Y0CbpUfKGhxgXBJtUlMFgQq2RVAMiE35cS8y00+YMau4yX2XH
 Z8W8bYBjbRj84T+4y4lkUKtbPQ==
X-Google-Smtp-Source: ABdhPJwmlAUvfRKgb9uu3liuf+trZDCW7x2GR14ieJBTwinOvb3MMKRDTkVHVMx+HWNAbWEyyr44TA==
X-Received: by 2002:a17:902:bb89:: with SMTP id
 m9mr7541350pls.108.1598433537693; 
 Wed, 26 Aug 2020 02:18:57 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id t20sm1922270pgj.27.2020.08.26.02.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 02:18:57 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] spi: spi-mtk-nor: support standard spi properties
Date: Wed, 26 Aug 2020 17:18:52 +0800
Message-Id: <20200826091852.519138-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_051900_181985_ECC2AAC7 
X-CRM114-Status: GOOD (  12.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use default supports_op() to support spi-[rt]x-bus-width properties.
And check dummy op's byte length instead of its bus width for output.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/spi/spi-mtk-nor.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index b08d8e9a8ee9..6e6ca2b8e6c8 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -211,25 +211,28 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 	if (op->cmd.buswidth != 1)
 		return false;
 
-	/* DTR ops not supported. */
-	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
-		return false;
-	if (op->cmd.nbytes != 1)
-		return false;
-
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
-		if ((op->data.dir == SPI_MEM_DATA_IN) && mtk_nor_match_read(op))
-			return true;
-		else if (op->data.dir == SPI_MEM_DATA_OUT)
-			return (op->addr.buswidth == 1) &&
-			       (op->dummy.buswidth == 0) &&
-			       (op->data.buswidth == 1);
+		switch(op->data.dir) {
+		case SPI_MEM_DATA_IN:
+			if (!mtk_nor_match_read(op))
+				return false;
+			break;
+		case SPI_MEM_DATA_OUT:
+			if ((op->addr.buswidth != 1) ||
+			    (op->dummy.nbytes != 0) ||
+			    (op->data.buswidth != 1))
+				return false;
+			break;
+		default:
+			break;
+		}
 	}
 	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
 	if ((len > MTK_NOR_PRG_MAX_SIZE) ||
 	    ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
 		return false;
-	return true;
+
+	return spi_mem_default_supports_op(mem, op);
 }
 
 static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
