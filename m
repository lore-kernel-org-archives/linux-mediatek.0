Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDB2C00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 19:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B242225E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 19:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xnvm8+vo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di4hLUug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B242225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4Wbsudf+bzpU5O97QIKMO1SYO27HNQqmGMfQbzMCiA=; b=xnvm8+vocFiHetLB2tflhz4FA7
	8XFjEJjeF+v7iDUU9kH4I999TEfN1rC3Lcu/asBIAfxsa2ASWul3Mg+LtZOmJcwnfC7b6+nyUIx8h
	l05WktNaWVSBLil58RBsBuhakI/RNeRC1IBdtdD3uJlFSGNqO0ccxi3O06hMajErypnZyFk5oSHnO
	woFr9S+yUlSH22z8rjoYrhcqF8Vz9LsN5fAvmSb69TTulD2i0cdIHlnD0RxQ50BLzq8YH3moUtsaL
	1DbQrDvF/htFKGit93PLmprjmmHhd7d87p2xTFcqSiaIBmVF4dZ53xTvJMd60sTxVvvNIE9vOAKRM
	LMq2zWsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZfav-000256-49; Mon, 02 Nov 2020 19:34:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZfao-00023d-If; Mon, 02 Nov 2020 19:34:15 +0000
Received: by mail-pg1-x541.google.com with SMTP id x13so11648206pgp.7;
 Mon, 02 Nov 2020 11:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=zJZ6RJTnErujF0lDgi2VwA7AjjA905AP/3ViCZfttXI=;
 b=di4hLUugm7xL+TP/he0btTeUvJrmVti8iHMyENl31g2iL4BNNIAV+0GJwxCa/0WjqF
 IZt6jGVS/BKUrkKRmmsqnIegGFN2MDvg9WqVFspazwUtrtbtMZf+gi8taGjyH4re5NZr
 ipDmLQaviyI1JyO2gdbeTRj+j/5N1dKGghpwNnHQZlM9yY4JhetlVrsEgj8uniduuZtn
 ELyKQMqkGFjd53hU4v5YcoT+Mo+c/P5g2Fe2fbumGmQUK/zXxMyGFixYOc4SqWH0hlIY
 yZjqUJcgzhT5fluHP5/SGEBr9LnVSiT5VVvdri/ru1BCN+vKi3tSbT2ZehvflAPJOf34
 5SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=zJZ6RJTnErujF0lDgi2VwA7AjjA905AP/3ViCZfttXI=;
 b=NVr+httsr0x9ytyr7e9GtDxO8iiuflaOioL4eJv6ioYFBZhpjd1oQUs0SLq6Ftc+1N
 HbHngD/ER6DrkpoNL9iHPZ+rTEv+YdJq789yTweiH84f3sKPcXkG9SNQaNnc3mHXIyGi
 781nupYuEjvoZU1o+DEyL7s6QX5WHaBlwPPkHi6RJQZ/lAlyNLYUmjFQtj6p6ZC+Mebv
 Lz/I/n+FbQ2KtRGNhnYttf6cGbDkLN54OYlMEjbQSk75UuoH8n7IKLzVZUjH5L5JNIjY
 7t4xwpRZTGo+VtWDGL+XAHpF/cZR9s2Oa82ibKW5bfOZcCDKdFkfyX2DpKaDRvPYVRZk
 qJQg==
X-Gm-Message-State: AOAM531p97r/iUVFLQ5umt6bVOKXQzCrnIV5Jdm5BI6T+B+5g4yuMJ8X
 Hq6dz2l/2UsosfvVTfK2Cg==
X-Google-Smtp-Source: ABdhPJz2aIASybo0JHfjTrKlJ/Au7tLUDgP3dPA6SyAkLoYz59E1MddDTm1sXjFQWZgttz2aLJVtLw==
X-Received: by 2002:a62:1991:0:b029:155:f476:2462 with SMTP id
 139-20020a6219910000b0290155f4762462mr23426168pfz.43.1604345651018; 
 Mon, 02 Nov 2020 11:34:11 -0800 (PST)
Received: from Sleakybeast ([2405:205:c82e:472d:f3dc:c193:6b6:3d7b])
 by smtp.gmail.com with ESMTPSA id e15sm14643816pff.121.2020.11.02.11.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 11:34:10 -0800 (PST)
Date: Tue, 3 Nov 2020 01:04:02 +0530
From: "siddhant gupta(siddhant1223)" <siddhantgupta416@gmail.com>
To: matthias.bgg@gmail.com
Subject: [PATCH] staging: mt7621-dma: Prefer Using BIT Macro instead of left
 shifting on 1.
Message-ID: <20201102193402.GA14965@Sleakybeast>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_143414_659357_49B70CFB 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mamatashukla555@gmail.com, siddhantgupta416@gmail.com,
 linux-arm-kernel@lists.infradead.org, himadrispandya@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Replace left shifting on 1 by a BIT macro to fix checkpatch warning.

Signed-off-by: Siddhant Gupta <siddhantgupta416@gmail.com>

---
 drivers/staging/mt7621-dma/mtk-hsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index 354536783e1c..a9e1a1b14035 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -72,7 +72,7 @@
 #define HSDMA_GLO_TX_DMA		BIT(0)
 
 #define HSDMA_BT_SIZE_16BYTES		(0 << HSDMA_GLO_BT_SHIFT)
-#define HSDMA_BT_SIZE_32BYTES		(1 << HSDMA_GLO_BT_SHIFT)
+#define HSDMA_BT_SIZE_32BYTES		BIT(HSDMA_GLO_BT_SHIFT)
 #define HSDMA_BT_SIZE_64BYTES		(2 << HSDMA_GLO_BT_SHIFT)
 #define HSDMA_BT_SIZE_128BYTES		(3 << HSDMA_GLO_BT_SHIFT)
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
