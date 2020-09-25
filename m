Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92529C4727E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:55:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 306CC21D91
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LwURB/oh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X6OR+Kzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 306CC21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WXW5RrlX40rL3gZeCGOgu5kMKl1ykBEwY4duV+ByHBE=; b=LwURB/oh2fX1IZqAQyQ4OFNZd
	jm6lqgWfQcKwXrwLf98B6Z7YAITdT8mWmjNUjEIaLlFzKprGYEvUYpdLWTBVa5lEX5YQ6J+KIyuJS
	ym4Gx2BmAtlOKcPMTubROOmOaDk8t5Jfp3mUn+QxS7fhBGZWg0Jp9fgUdd0EZCEAoczV+tMj370LS
	pmr1ygdPNqOE1nR5sn9KOWIUqZLvfejA+qdApPr9/f72ownjms57PEfMbHJqPvHTkT1FGXaM5Vpc/
	NnA8XgwSXqzfTT2MjPf2dYeZYKnzu2kzZkEDxSj+c8a/S+1jto/Zib3cYQ/9TNMksBe7ioNBg0eRj
	n+2eTuWiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhdK-0003bQ-98; Fri, 25 Sep 2020 06:55:06 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcp-0003Px-2y
 for linux-mediatek@lists.infradead.org; Fri, 25 Sep 2020 06:54:37 +0000
Received: by mail-pg1-x542.google.com with SMTP id y14so1708862pgf.12
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6A7I2+xa+JzqfUUJmmCkQYIIjfofSHKtXj6ieBn98k=;
 b=X6OR+Kzr1L29x1BQVGldMkJqu8KRWqcyEcYQJD+ya42lnml69EzPYF9ouzFHvDwXIU
 znn3F7jcsx24lM/hZxLfd6CZS9wcsK+YefmG7jjFFrsZna9EEaJzH1c2mMj55g4AQ1N9
 JNTp73XgNucjtRN7dYa3pW6DP0JDe8gFoxuFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6A7I2+xa+JzqfUUJmmCkQYIIjfofSHKtXj6ieBn98k=;
 b=jbV+3XwabW6MNoLCxl9wVgPdXgJ2ej8c1n+Hcexs4KlL+3hJ2ynGZ7s9f7H4kJ2pam
 Go8adMXycKfuasOLe2wpbNSTHMJP8+fwQ0s3CVZBvav0/zr8xV61IK7lKnwAJ1Poabev
 2V/m0veZArLxCqcDCMVq7HPt2UbOSxlQiYJrO1QysF5CphgLWvxSJjiqIDlxCmtKfRRH
 xBiccDwmnsILsovPDVp57ZDb3XvmGgup/899CGQ13hXca1Ri5uwWAZWG7y/PGNOuIXAP
 HO57WzNXC7PieGMo/Cf0leRfreda4AYWN1UJai09RBwVYxJYMRqkn01olVbmAjLg4xdd
 2UFw==
X-Gm-Message-State: AOAM533PfZm8W87fRbwc3V++Nw5N2bPtHCd1TPKFMYFmToovROo0+Slt
 NNX2fBHhHmzUq4sYaTygmj4kHQ==
X-Google-Smtp-Source: ABdhPJz6kdElWH7oBxMzrNtroD9NdXSuNaRDKOUS8ZeMpdwM7u/op/NfT2A0F8AbN8AIg0ARptiwAg==
X-Received: by 2002:a17:902:d913:b029:d1:f388:9fa6 with SMTP id
 c19-20020a170902d913b02900d1f3889fa6mr2963337plz.67.1601016872951; 
 Thu, 24 Sep 2020 23:54:32 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:32 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/6] spi: spi-mtk-nor: fix mishandled logics in checking
 SPI memory operation
Date: Fri, 25 Sep 2020 14:54:13 +0800
Message-Id: <20200925145255.v3.2.I48d59ef5398f3633c6ebbab093da6b4b06495780@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200925065418.1077472-1-ikjn@chromium.org>
References: <20200925065418.1077472-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025435_215753_A049AF14 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix a bug which limits its protocol availability in supports_op().

Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c8..0f7d4ec68730 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -211,28 +211,24 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 	if (op->cmd.buswidth != 1)
 		return false;
 
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
+
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
-		switch(op->data.dir) {
-		case SPI_MEM_DATA_IN:
-			if (!mtk_nor_match_read(op))
-				return false;
-			break;
-		case SPI_MEM_DATA_OUT:
-			if ((op->addr.buswidth != 1) ||
-			    (op->dummy.nbytes != 0) ||
-			    (op->data.buswidth != 1))
-				return false;
-			break;
-		default:
-			break;
-		}
+		if ((op->data.dir == SPI_MEM_DATA_IN) && mtk_nor_match_read(op))
+			return true;
+		else if (op->data.dir == SPI_MEM_DATA_OUT)
+			return (op->addr.buswidth == 1) &&
+			       (op->dummy.nbytes == 0) &&
+			       (op->data.buswidth == 1);
 	}
+
 	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
 	if ((len > MTK_NOR_PRG_MAX_SIZE) ||
 	    ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
 		return false;
 
-	return spi_mem_default_supports_op(mem, op);
+	return true;
 }
 
 static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
