Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB5BC43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904C8205CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XX+6n9UQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWqWj4O3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904C8205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IhZSnEYTLuZpDLE1+A9KL1vwrA8D0dzI++D24lsGeU4=; b=XX+6n9UQzIsI50H7DjfLArxPyH
	M0G2R8Fhumq0YX4+IbDeveKOh7ZpcyUambGdI5rK7kFe9/xf1NVyCGs+lS4RdJoLpLxQoe9JDFwHN
	Bf8LbKCM7twV48PzlfSu7H8FAuWynpHkFyJQi6h+3h516bvKOaYEelxPrN7B5jT7NlFArXymxpkeJ
	rSMNQC8KimkDqOz4tKmF69ZspdGiEuoP1j8hJiGvXSv4w5N9jGrERXbTLjv3yQf5nZC7NkvdnJVBE
	bMBF6DR2kTaIyCPHCsPjJM9nH2AoTFj0a2vAVEAET7EtMxTjAFrzYKagggkelC4g6finBcQWyb/zE
	o6pbaWCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFENq-0004Wp-6d; Mon, 07 Sep 2020 10:28:22 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFENl-0004VD-D0; Mon, 07 Sep 2020 10:28:18 +0000
Received: by mail-pf1-x442.google.com with SMTP id o20so8409747pfp.11;
 Mon, 07 Sep 2020 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CBAjwcA4hZoU/siThfOYzyCueHpWs1VgxUUUg5ulGQ0=;
 b=kWqWj4O3Jx+m/ssQOZ00iU5lgeVEeWpcUrqXYL85RfPgNlQOAHeVGJUBJrIj7jBCtf
 Y8NUcg6GsAsYi52Ok9Hu8fHOIPS3jlhSN7tWtHiiuJ/AnKemrTnRg75Q7OsNL+/4VQl1
 +MmpZ6VzwgQek0rakGYay0eoe7GsmhNpUrwjCqraEM+10asJoZje0gFbdxgymQ8KR41A
 2zsU8Nu51mzG2zGfG+3XTSZbHBx3tTZ1fy6ALPtverMG+1l5utw4Zpl/XvPhpgjQPYki
 p/fjAXU2ocxRc6vmVzjz4YX0dxXuBLxYQ8sbAtUodxEsZvPtAr5B9/SR6f3NTCp/2K9d
 ht4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CBAjwcA4hZoU/siThfOYzyCueHpWs1VgxUUUg5ulGQ0=;
 b=QhWtPklEco3Iu9pYZEQ2CcEctYIWs2oDK7Fexhiml8Ybg5cOSczL2DTZqmlzubmnhs
 +5A/dvz1mBUsrvNglKZLLq7tjAvs2DGScSFn3N5l4AUyb73dRYCSHifrCjsUY34Yh/nJ
 00Dj2f/kwOkMNznvsWmcpDseVvc55QF4mU+v3zqqhfPZQWEkUqETgJtXLRwLzRuXYjCx
 j/btEkKC3BMUDjaS6Z8NIgH769/PcR0Ns7VJjuK8jYm0GgfDZe8zqJ1UANjlSKh3A9la
 eUd8VEovXInO4XfXjbIBss0uEZrBkMVtf3juCqhtRVfcG3VrbhNjPpuq5PHXQCkL95Rb
 +TTg==
X-Gm-Message-State: AOAM531IWKGu2pFUzp33VQvNoEct0P2ixE0o+YMlzWKEeNX0UIgoHbML
 RiEIGtcOOWrrwABLIl927Io=
X-Google-Smtp-Source: ABdhPJyz0ak7cYr71ekRNjFYcWrCNQYPqc6H+PRwgl7o7v2SVn0qNSINzfq7opvN8pkv0zZXhPtn+Q==
X-Received: by 2002:a05:6a00:1688:: with SMTP id
 k8mr19948800pfc.33.1599474494511; 
 Mon, 07 Sep 2020 03:28:14 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:81bf:545f:f984:753e:4bcc])
 by smtp.gmail.com with ESMTPSA id q193sm15009717pfq.127.2020.09.07.03.28.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 03:28:14 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v3 0/2] leds: mt6360: Add LED driver for MT6360
Date: Mon,  7 Sep 2020 18:27:37 +0800
Message-Id: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_062817_438775_B82FC561 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
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

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  105 ++
 drivers/leds/Kconfig                                    |   11 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  681 ++++++++++++++++
 4 files changed, 798 insertions(+)

changelogs between v1 & v2
 - add led driver with mfd

changelogs between v2 & v3
 - independent add led driver
 - add dt-binding document
 - refactor macros definition for easy to debug
 - parse device tree by fwnode
 - use devm*ext to register led class device


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
