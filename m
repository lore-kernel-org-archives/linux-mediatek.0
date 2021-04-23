Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917C5C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E44613DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E44613DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b9lJVf8nra3UDjcPZxEbznNkxMzs/itu+DSOJJEvyAg=; b=BZ1TQ8MBrgG93Gv/txKCzo0cM
	2dL7kjeHvjWEYXm/1FfuxgTSi3UrXnDX8ZuI+Pc6arwKAEi50om2CC0QVwsrRkcD27vqvE8dlgPOV
	qqeq9VTvYZOy6GunXCY6M1H1i0zUmoIS52d2uSbyC9ZrrdeQ4zirYVU3SGYQ9UxeSt5TzIrrA9lnH
	DZ8wm+nrNb7IizYsqdbRLZ6vEQ7LiZJLb43eAIua2O3v7Sl1YMkosiim1vwPYjDl75sxpszJOdtG1
	UGYKJwugvAx7wZlTNJfO+UBxtSqSHmpPO3HwVAwqxty4XYj9P5vjotR37D6Vl3nErb4yO8pxs2azX
	fL196dAdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPz-000hrH-MS; Fri, 23 Apr 2021 05:31:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoIY-000fhZ-T8; Fri, 23 Apr 2021 05:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=gd2eeenzHzwxV4sfn08mWZUyZJLiTmgc3YKbWO6N3GU=; b=U38TNlUDStVJKGhK/vWQqlv63f
 /PeJpOjv/i+hj7zgahbb7h7N3waTyqnEyP5+Zqg+DKUtA93sP4sg6ciPYom4EEouC0bkFFpS6TlNV
 sGuSo6OFFb0fP4U4V7EodMqYFNhcj+jbceF99QeEXlKBivgjQTOyYBFj/Hs1kWcqy6ezZxrRvAPPC
 /0qyXJ+RMMLbEZr0ADg8ELOjZ8pd3nH1RZZvTRzZyKltxkU30KrdBjQhmlQYftQpxtQTwKxEG/DrZ
 1q7RMK9h3A4JbnMddTHYQfsTelBPrEGH6BQ1Jpv0GdSpFfW3uXZ1++A65Uq/kHyYBvi6yeMfCovce
 Ppk7z1dw==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoI5-001RDh-M2; Fri, 23 Apr 2021 05:24:01 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso623092pjn.3; 
 Thu, 22 Apr 2021 22:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gd2eeenzHzwxV4sfn08mWZUyZJLiTmgc3YKbWO6N3GU=;
 b=qH12pRVy93Bpwpu9grmZX/L/ts8gdwG8rLRbo6+mrLLehr1BCvFrMpf+YUOHiDYyXW
 p3TG8yP/iZIrQVa+VoYBMyaiSHb8prsVoMYBhgWQ4Sj7ZZmzAJjG4GbbSveS9WXYExFJ
 tfnj8xWDI69wTmaGqHq8NVxqBxcKPQF2+Zdq1hxsERD9tOqsymiaSA3Y5bkbK4Tf6P6+
 05kaVXqTtH6JA2NB0NqkqAme+F9DdohNa0fAuv/WNxuc3KYx9BxEf5J8cepxIgwwMjsr
 c1B5YPeIljm23GYN+CJfPHwxR1qygxc2GOA1jRNRKY0KpEr/BkhR44AIr/qO6giYqzUy
 ucqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gd2eeenzHzwxV4sfn08mWZUyZJLiTmgc3YKbWO6N3GU=;
 b=KkTyMANJjhrZ2EEeK0XZgil6kqVa2dvYzC7ZC5STAUxwNGdYj7JIC+1sAjg/ls1eX7
 zJd0fSK1WfhVKc33sWdmtO2SyIHP3RIKtA6jk268TPopF8bEC3iuVcZ8HELQlUVprrJP
 +g/6nOhOeRNI3yDuVSRoGKN7LfQB7eyPPEx1d8JxhT8V3AS7jk8J7eiwunuT6+JTb/Bb
 qFN4/R1BbGyusPRmFpQrtvo5XR1i53J8usvCQ/JCTlvZi6DmlQT9IU/7JxCqWDmZuQdD
 qDLP4jEvjCo+P1IyCrSXbZCdzxaqXM72MEyBQz3VDdTmbyb0kyrRBRHQo02Jk0578svo
 XH0A==
X-Gm-Message-State: AOAM5338G6HD9x2wcS7RWgswlkmkVLjFuQLrgNNyesZ0c7Oy0+qzjde8
 9gXaQqWc8RhmDDjLJCnveLE=
X-Google-Smtp-Source: ABdhPJzSMCg+HXa0Dmt7mvnI+vnZq8ce7m2ns7uSGSYbxV/thCTkhu7yKbJoA8wAJIdnkYkmDVrFwQ==
X-Received: by 2002:a17:902:b68c:b029:eb:6c82:60da with SMTP id
 c12-20020a170902b68cb02900eb6c8260damr2410047pls.25.1619155288670; 
 Thu, 22 Apr 2021 22:21:28 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:28 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 12/15] net: ethernet: mtk_eth_soc: reduce
 unnecessary interrupts
Date: Thu, 22 Apr 2021 22:21:05 -0700
Message-Id: <20210423052108.423853-13-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062349_461900_4A7041A1 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Felix Fietkau <nbd@nbd.name>

Avoid rearming interrupt if napi_complete returns false

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 4735942ed283..e1792ccaedc3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1519,8 +1519,8 @@ static int mtk_napi_tx(struct napi_struct *napi, int budget)
 	if (status & MTK_TX_DONE_INT)
 		return budget;
 
-	napi_complete(napi);
-	mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
+	if (napi_complete(napi))
+		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
 
 	return tx_done;
 }
@@ -1553,8 +1553,9 @@ static int mtk_napi_rx(struct napi_struct *napi, int budget)
 		remain_budget -= rx_done;
 		goto poll_again;
 	}
-	napi_complete(napi);
-	mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
+
+	if (napi_complete(napi))
+		mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
 
 	return rx_done + budget - remain_budget;
 }
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
