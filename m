Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFD8C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:31:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49930613C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49930613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VVk2T+N/rdVPMbRvvG41WSROhp0Klp5GHItTQzFHKXY=; b=EmjnoBldbN3btWwZmw4fdUWisp
	oS0fCKAfoyfJVpPuCnR6PUVxLP4BhNqs0aSoK1jN6W15GVnSZ/YqeGhpSF86QLhcuxZbOq3wN5Og1
	5GaVhb7jqe6aeH8E0UG5+TY1cDKbRrc9ymHFUCMNqs0gX2Y4m0gliyAvPReJoWGYik+7KTOzwzptz
	hPW8gcDxy57fyF/koTCOk70xv05yWnzl/Ugi4X2HJhHyn3/4j0Z+3aRVzMY9bXQ1jBO9i+EOP2ndY
	aQqYnxe4gajwIqm4GllFOennQdXdbwkRqd/KkEtIo00cvAKLia5M5+qtNYTy/kQCIFgS/W88ecE1f
	8g9fREEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhH3Z-006Gzu-91; Thu, 13 May 2021 19:31:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzE-006GVO-Ob
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 19:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PqbwR4L945w2uSfsL/kb8dhVuFB8CH0RH4aZW5kJJIk=; b=lbMMcuXtxxzcqOljIH6AaM6p55
 FaDcVr/biBPfoElUeBiROCLRTGsLXrbD3lrhYHnd/wCGNektRIl21EjIvRlpCqIMFb26kaqFvxrW/
 h9EPcFvVFNBWCfSV0G9mxssX+Lv8xge8kmmU45eAsmGIqqHovRMmwChabxGDwDdROgawOucoynCuF
 OKaT1h/d3sBkRvr+Z/uzBxZYwseNQzx8XTOhm9qKdOvSoUKthLGyry/7NRpfAAedf5RXW4elQcKv0
 PNI1aev/sEGsuPIa/svDuSd0U3tGnMYfz9HW55klgPICI4BW2fMMLdbcfb4n/71MaWcZdQ+2z2Sv8
 QWYTfclA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzB-00BTXk-GV
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 19:27:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so373130wmb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 12:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqbwR4L945w2uSfsL/kb8dhVuFB8CH0RH4aZW5kJJIk=;
 b=qheDlMFs9657HZlMSTPtCq60kx8JJ9r33kg5wCbbtaI+SqpJ6ABKQZPil5sA7vFvi1
 uKNhcbNdm/w5QlXLie5rnaol59/E5eehkpLGde/QLp+Ap8osnZ57CYSQSl8WY1/AohTz
 q11NE/A9P7jYwrSfaspW8G2np4r1bOcq1wVoUzdi/f8V3MQUCsc1dZd5ZkGcwII4auvD
 zaOSKwokGQwTC4MmweTKn8vzWxbRS8xk1HGOG3NYR3id4/qDwvv4ouuR9v0NIKkkRVj6
 DjuzfXhlFNU48YeC3dUAbOaxAt+I+iUh/CAhEc2s7cPqTf34k2vyuyRou9sgqy7t0oWg
 QOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqbwR4L945w2uSfsL/kb8dhVuFB8CH0RH4aZW5kJJIk=;
 b=POsaJfHOj6yptrxm8z6miCmxPZwC/r732wb1KUe1pn6bSc5fZbASjwgeLlcCucllX/
 SHdcPKUMFtRvfpCfASFba2z3Pxp4I9x+boNSBqUVU7zVNxvTAfFVfo1pl7JtnAHcyUk/
 hg93OIQko+lgfBoCqB/RAH5gT5bHI1/Usui7jkGRUdNY9hS8kONwhVUFrd8r1EKk9vB0
 XvbzvHXDjDPimUL+aGKR+VMHDPSlIW4ZdKN8iK4EvjOiX76WpZ833zUZX8iN1ffr2Qi6
 i2hql065V6litTfggbmVxmMqqFOCvzVlNeZP8ZeFu5Kt0AbLvLvV0MAimBltaEW4Ltgj
 DK0Q==
X-Gm-Message-State: AOAM533bTBYasFaZfOl12mFUtZkxegyDqZTPZGQM5HKn6l8UT3eiepye
 Y6Yrbr/QiJvwzNSJ1WDHrcZg1g==
X-Google-Smtp-Source: ABdhPJzCQlePs8w6v253FGGV68DYI4RKl5BD7B4i7n53vRV8poZuELeUjHXg5qpISOprpoYFeSUkSg==
X-Received: by 2002:a1c:1d55:: with SMTP id d82mr5162172wmd.12.1620934022866; 
 Thu, 13 May 2021 12:27:02 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-d842-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:d842:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h9sm3053621wmb.35.2021.05.13.12.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 12:27:02 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] fix mediatek UART APDMA desc logic
Date: Thu, 13 May 2021 21:26:39 +0200
Message-Id: <20210513192642.29446-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_122705_645382_63DF513D 
X-CRM114-Status: UNSURE (   9.55  )
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

The logic used in the apdma driver to handle the virt_dma_desc caused
panics and various memory corruption.
This is an attempt at sanitizing the logic a bit.

Sending a v2 as the previous mails were ill formatted and not threaded
properly.
I'm also removing the last patch from the series as the fix is
alread on mainline.

Guillaume Ranquet (3):
  dmaengine: mediatek: free the proper desc in desc_free handler
  dmaengine: mediatek: do not issue a new desc if one is still current
  dmaengine: mediatek: use GFP_NOWAIT instead of GFP_ATOMIC in prep_dma

 drivers/dma/mediatek/mtk-uart-apdma.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
