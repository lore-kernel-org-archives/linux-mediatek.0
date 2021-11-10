Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:51:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4CE861077
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4CE861077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Og7/dvrhtqLSoNgsW6ZHyf5UIFzckNmWUKLgucadyg=; b=abolrOO1tHZvxD
	VAlC/FqpmY1kK6pK8FRsJEwg8tYFUU1ocb2y8it3ILYji1RXQECdqjvgiP6D+iWOSSH6azsw0QY0t
	4gsNftVhzbwUwgeQr07dL/sYZTK30RZNjGNz7ykmwwjzsax5wzD32cKp6xSNMuoZ/GCjKNawuPZ7t
	noz12B/EuuRALqS42l+bhVAmzPXktKHepBpkGytDcEETcv/R5Ile5Ytcw2q3r5cOINzYHd6XMKuEl
	7db8HMyd/QuCXr6BOUw6EUMHcmzc583YPy8c4zEFvsNdvY4w+C5818Y/nKkS3FIQOjVdfh9vBIR5e
	Ih9GKiHYE30xDTUwbFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mklCh-005Bx6-8P; Wed, 10 Nov 2021 10:51:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mklCe-005BwB-MN; Wed, 10 Nov 2021 10:51:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id z6so2308504pfe.7;
 Wed, 10 Nov 2021 02:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dzXYDr4i+8E1rpU2w4lIdJbKk6ZeJdjzAy1gZDTXjo=;
 b=iIwVK3BZa4OjsgzCh7y2ME1f8c/dppxSc8gobbBP1kvkAH5lbWH+RSLXi2YSdI21lG
 qoRpQi4ZYgq0NYJYChWMWE3GuiC0ehi9DMlgySL6OFRL8igyEglWGENgGjo8yB7rBwhw
 BiUXeBRl9qMrKdBd+5PIzoX+/BYlj+icjlFlXzKxtjdNnNkpTAuPLXJNAncKtru5Ut+X
 PGMLr6p6787Ess7MUvPxOOuaC0UQaJqB1GRrf8mhfzo40hzjIQSlGw233zzgrq1Vw9J8
 sxNI+wPF9TE3GbYQPYA9HTWAS+czqNf23+LrZ0oX5oMts+MKD0z7eFXWh1EvmnRl6XhX
 Wuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dzXYDr4i+8E1rpU2w4lIdJbKk6ZeJdjzAy1gZDTXjo=;
 b=GRHBrn78NbDt9YeRBoHOaC0d/b547HP4zCLsWiEkfewSkr0DKcfprx4StGz7FRbS2v
 x7zieCuDB4VpwcmSaGn/LllTk9aqFP+CkeL0B+eT0ACOL/11sMOZgbc3ELhFZKml2WK4
 R6htEFYuvLDHtDqroYKflBfXVCfmF4qRzT9j32agcQG9LKVZh+6OJ1uSQIq7/Gmvoz9o
 4pI9O1PQJufZ8pLZW019dNq0iW9XspjslLzJZh5vxswqjVl2gfSw5OHLDclmRWjDmjcO
 FTjyTHhtqQ5RH10gzotKNBLCv3lP1RWCW+An0BfQ3iyQLyhxpRWAEhwTPmV6IKfSwv3S
 T2JQ==
X-Gm-Message-State: AOAM530UMHnQHVidGx1hMZY8+4GYk0XC2sgXItyWH3t0YmJsdcVwIlTc
 G1xu4G31Jqe2B2Xv0zWsbqY=
X-Google-Smtp-Source: ABdhPJwMPdRMzl4AmzcgyZZhbVTwDWb6Obrc6Y5hq7A8Y0uO83r6bdhuU6WCgPatiKQw7X4Roev4wA==
X-Received: by 2002:a05:6a00:1903:b0:47c:34c1:c6b6 with SMTP id
 y3-20020a056a00190300b0047c34c1c6b6mr14883980pfi.17.1636541499684; 
 Wed, 10 Nov 2021 02:51:39 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id h4sm5516552pjm.14.2021.11.10.02.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 02:51:39 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To: stanley.chu@mediatek.com
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, matthias.bgg@gmail.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ye Guojin <ye.guojin@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] scsi: ufs: ufs-mediatek: add put_device() after
 of_find_device_by_node()
Date: Wed, 10 Nov 2021 10:51:33 +0000
Message-Id: <20211110105133.150171-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_025140_759643_F98951FA 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./drivers/scsi/ufs/ufs-mediatek.c, 211, 1-7, ERROR missing put_device;
call of_find_device_by_node on line 1185, but without a corresponding
object release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 drivers/scsi/ufs/ufs-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index fc5b214347b3..5393b5c9dd9c 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -1189,6 +1189,7 @@ static int ufs_mtk_probe(struct platform_device *pdev)
 	}
 	link = device_link_add(dev, &reset_pdev->dev,
 		DL_FLAG_AUTOPROBE_CONSUMER);
+	put_device(&reset_pdev->dev);
 	if (!link) {
 		dev_notice(dev, "add reset device_link fail\n");
 		goto skip_reset;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
