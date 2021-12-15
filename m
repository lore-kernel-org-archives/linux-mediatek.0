Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BC6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 06:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2MmvQ0WB3Y4tPbB8tVqh+VgAfiEFmZkp8s8YX7FVCWY=; b=PReB5Qeiz2jxKm
	fM1YF8vIoTivijgmFsN1WmkPHSMY/79QvXHtMDG+3laMxnMAkmLOaGUq2VinXkwJJLmFsXPEKsEM6
	bPIwiZHtgHRU7pmr4ZIvzu+N58TXVkZI8ZEzlkJn3nR8MJio1u/L6c8QdmRN3RdX84J3G9UzCkK/T
	qOBH3RfUYXlCkWYNqhuhW3qzpsIWndkhxSfQDg6wX24T5Vuar+Z/LegsD/2/+kmqkVaHHvx+RGK19
	qcGPbPTIS8WQ9bkd/FOVdeDPM39Ky1AMJJNhThOR9T1YcgQwKHvkKXtiaZ+r94BzmcGrL6P7OaJcF
	E2XrPhRN/7Xeu6WoiPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxNQB-00GmiK-TU; Wed, 15 Dec 2021 06:05:47 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxNPz-00GmfY-0X; Wed, 15 Dec 2021 06:05:36 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id m6so2260546qvh.10;
 Tue, 14 Dec 2021 22:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfB50yz+wtniH54BM6Vm2zw9w3vq/rJwIyH5Smo+/Jo=;
 b=J5aTdyn12laJzJtmwQtHRwJpYqox3Ppg6gM9O/iTPQGJKCJAw7TrOojuAKaCcjiltK
 CVZqgLXIvG9RmyevGn1jmP+PW8ttpavSiWK9PuxAdOvKqf0FUaMrd6j1HktU6MERFg4L
 wfClW46lzk/3xFlhI8DmqaZE+l4TuLrCDDNq39MjvFYH5H8HYHo9I5KdSeR6CJAhrg0P
 7EC16wyCVZWZi2uz9n+CU7b4PrlVdWSPipQ1xmwe1jNi4SJ+cum+hM0hbA10fwA9Sc8P
 Gt1DCNUUL79eITCVOmPkUSzB9QziYTWtpJmCzySWRLLwAsGiNIWEksgvGtJ2zzcuJq/Z
 +EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfB50yz+wtniH54BM6Vm2zw9w3vq/rJwIyH5Smo+/Jo=;
 b=qN1mTrulpLpbBwdGDZleVHqp0VkaqapiUJGaSMIXHGvtvXuW8hGqbZXXNGL01pYJ3E
 NiuDzmuxgeE2OVERWK0jZ8eYt8BAVCZAuTn1nhzjZjaHO8BR7/lubx/4Qo83GWqWS1eR
 DQuk5SiQsNxCVWBiUn3YohjTDMQoO1+QaMRnmj5gZWaBKHUu42wvzvejvB11mqeIGTGq
 Hkg0fmmu/uoRTU+8gyq54YPVKlwesCHW8X0fbr9ge0GBuWWK3duNEGs+pq7aQrzIx4KI
 jVPt9oT7ynm4KDZceZqxNPF2UdkmEkVozlCJudzx2sdUoAZqtL0P/Fcogkla5touXqQa
 gY5A==
X-Gm-Message-State: AOAM530bjOvJKzgOhL96+n27dRRwcrIRE2I1tHzSIPZ2BpXx+oNvu0Vp
 81I34QrZkGugWyRTIU6nO/Y=
X-Google-Smtp-Source: ABdhPJwhFH2MM84maffO9BMwznbkRqZ0gyp7GM8TVIIzFezFqVl2zZc02G1CuV/iFJlx+kbkFey5KQ==
X-Received: by 2002:a05:6214:2428:: with SMTP id
 gy8mr9883423qvb.18.1639548333964; 
 Tue, 14 Dec 2021 22:05:33 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id l22sm747156qtj.68.2021.12.14.22.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 22:05:33 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: tglx@linutronix.de
Cc: maz@kernel.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH irqchip-next] drivers/irqchip: remove redundant ret variable
Date: Wed, 15 Dec 2021 06:05:28 +0000
Message-Id: <20211215060528.442001-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_220535_084589_F90457AE 
X-CRM114-Status: GOOD (  10.64  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value directly instead of taking this
in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/irqchip/irq-mtk-cirq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 9bca0918078e..2f895473d9d3 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -60,8 +60,6 @@ static void mtk_cirq_unmask(struct irq_data *data)
 
 static int mtk_cirq_set_type(struct irq_data *data, unsigned int type)
 {
-	int ret;
-
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
 		mtk_cirq_write_mask(data, CIRQ_POL_CLR);
@@ -84,8 +82,7 @@ static int mtk_cirq_set_type(struct irq_data *data, unsigned int type)
 	}
 
 	data = data->parent_data;
-	ret = data->chip->irq_set_type(data, type);
-	return ret;
+	return data->chip->irq_set_type(data, type);
 }
 
 static struct irq_chip mtk_cirq_chip = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
