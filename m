Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296C3C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:37:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2322083B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rk6665Or";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4kvzWmO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2322083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBxR6BJffwiAnSIJHZQes+afvscPubZxAXn3zvYLz6U=; b=rk6665OriKrlXN+In0Es8YC+SV
	6w669jm3P/BlYDml36lco9r2xMuz7PBoDIngNNpON79th3MCKquBqhNgussp2Cr0G5QDEC8ckgZ4l
	h8cF2asiV1zi+xi+GLTKG09SWFYihlgYnrKeehMsOoZsLanrcrlBwrSuZxRihUUVjlcNVjbxhZg92
	5AS6nGEKSUYidc8IJ8J0YCTQbu9iRtYzL2oedIGOGwS3zTyBMiaFgloc9k/2Py62gd3ALyjNEzEHc
	sOsJ+H6RIp9X14XlBAzTENDxw8wQhek8af5x39k2h7pC4gdGprEE60UmTyzNc/iI52y9qLCKXs766
	pprsssag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAtkD-0006kr-Ax; Wed, 26 Aug 2020 11:37:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAtkA-0006kD-20; Wed, 26 Aug 2020 11:37:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id bh1so759029plb.12;
 Wed, 26 Aug 2020 04:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8soih7ZxN39aNjkTCbL3poEBD4/UNqwDrB6uxoTytTU=;
 b=a4kvzWmO8jtGJVQYuSq1G+cXV23TSB5ZzHJjuG0JOBeKi/R8IEB/qOR26gSrDElDXG
 ZAerrY/Pa8CT2fSuFA9MLiHuTWFR3bbuzeyt2beKXyUbjCALT0LayevgzJ9w5rtMp3Nh
 SfEGPgeaBy/11OOomsVR8fT3Wkd6L5f6vf2WloNM6PdXH7kQCphTYPsOxzBL/owxjjuW
 j6KmvH6F0+L4ZKgaZfT6JjrnAy0vXSueDHC/xzFwNO2HBkLPXVNI+YlDGvobIvqjUz7Q
 Gr23ZiXDTHrFa2sZMZzuKJcq1cYjZk/vNRp4j1erZ6HW/QEVO04bbDZswylV63WdA38r
 i44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8soih7ZxN39aNjkTCbL3poEBD4/UNqwDrB6uxoTytTU=;
 b=nAYD+dZU48MRG2agW5ldNvNCnDui5S3mqVwp1tmtH+QvpSpK0Yh/9GcV5lo/51wXnR
 IEJvUvS84RVqhlCGbS5c46dqmUN6xGls3gx7QoSHj0wWrW/ieazlIp0igzhvKiqjvFgT
 y+Tb6gokBKpapZqLKE3WLK3PV/iAriUPYfAhF0B8j0tDARnTMPQ9b1f6QgIRmK3dSUQ6
 5JdKSxXwR2/83QTOEAbY03dBezh5Ra1MmT/ld+0zF4e9C6UIRy+P31OfUb15QPgCI9yY
 eiLg5FJTWEOMXwIPSMdzr4iEO2yW8HNshoc9wmUYM+ZHEXpviqL1ILP/tNXm+gXSGz+u
 OoUA==
X-Gm-Message-State: AOAM533sNDuWKm6x6pIaFBRjvtT3STF2Qh79zkvpjbYMFZLzC3MbDcVM
 xhUMNyfHztu/kBuKBL8kI1U=
X-Google-Smtp-Source: ABdhPJySGi7F+fERC98gHqZLstD866hBK2wxBVxBmVDj6SLjsGOKgupRRUayD5xVky4hYDXfEZJ9FA==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr11873691plr.58.1598441847811; 
 Wed, 26 Aug 2020 04:37:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:2197:d2eb:7e49:dfa1:a882])
 by smtp.gmail.com with ESMTPSA id x5sm2591047pfj.1.2020.08.26.04.37.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 04:37:27 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com,
	pavel@ucw.cz,
	matthias.bgg@gmail.com
Subject: [PATCH 0/2] leds: mt6360: Add LED driver for MT6360
Date: Wed, 26 Aug 2020 19:37:18 +0800
Message-Id: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_073730_149629_4DB8478C 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org, dmurphy@ti.com,
 linux-leds@vger.kernel.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In-Reply-To: 

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (2)
 leds: mt6360: Add LED driver for MT6360
 dt-bindings: leds: Add bindings for MT6360 LED

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |   50 +
 drivers/leds/Kconfig                                    |   11 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  680 ++++++++++++++++
 4 files changed, 742 insertions(+)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
