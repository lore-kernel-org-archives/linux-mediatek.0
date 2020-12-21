Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB6AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 10:52:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6323022B3B
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 10:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6323022B3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KDeN67LJqo1SijGN5Mm0gN8rBjgNNNlcT1s0yRnovkM=; b=w0+RuG2PcrjVLTYUj9BB0KJ7gQ
	eY4a7zozKt7MXQqWVbHze/QVMi65RkUwFxHjolhC+PQ0wovjdpSL+/0kxhUMda9lXgRtJYczZzqmv
	vZBq/2r+0VjxkI3Olfh33oyUm26KnwLzH2imzw2J+iM1ctG8xfJxQ0262sybRplij8l0LgU52caEB
	uw1RxGD4aUcaYnBMlFjA9UaRxLoY9CrsCWIKPLH1EqRvIK1fE0psVcvON+YH7q8XLxvnDuKPF05bO
	G/G0EIXGMJbRXvN+8BZa2iwJrW/mFn/JeAAmnSBITlbkuJMdHCqdCNEZEqL1P4kDo3HNSeuIwgMia
	pGF5NqFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krIn8-0005Q8-Oo; Mon, 21 Dec 2020 10:51:50 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krIn1-0005Oi-LX; Mon, 21 Dec 2020 10:51:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id x126so6240979pfc.7;
 Mon, 21 Dec 2020 02:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cPuxQSxzMWTU2G1K91YlflotqfV+c7j7rgRMPeG1ygk=;
 b=WYnpvh7A2/BU+oA+5c8Nxu2JyYVuDR6Z1fIOfwq5Oyejckp1lr9LLxg9neN2XsG6AB
 3ApHJuCK9wCpFmaUEe02e3InMRpO7KWbAkn2wK7Agqz3LaJ8BY0EaPrYnwWRVGobSG6H
 Jk3C9cjzOwqrVC1imhwsXAl6SQKijAwYmItvnyZb0QRaj9HZrAC2GZ6ikKvHnHWj1ofN
 aoBkgRVOo/lSmOd6r0sP/DgdX2XgFcZT6cCNI8EuqS/0j4KOIhmOpdkqoUCGiEUGTPIe
 +XKNGxG77LSdTVspNT3y1oa3JeIT/9Bjabcq0Ph/qbkNJGkcXx/LDmmehc5/usIA3aFU
 TkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cPuxQSxzMWTU2G1K91YlflotqfV+c7j7rgRMPeG1ygk=;
 b=mTVxCeiATVavpGV6MEoOKRfabDHQwXHpKiEXWL2jgnMGUe5RQ21sALfJxUrYPLwMvj
 IZTj1U08IVQJZghqlQjxzmMOLkcCZdyEeTKoScJZ2qQEm5dsIpkdPNIYDlsWMphU9h4b
 SY23RVsaj0PDM06p9aSjVs20iHFxiHK74ThR6Bl9kBdLjC+VuGdxommrVc9PQmmxaVWG
 fOgkmGjtPqd94t5kC8CGq5SD1I+QjFA+rIcr//njOSgnpHawhbFpo1Qe8svZ77kqzmwQ
 +mPxWoE+l0XI/6WpM48b49ALmv/0Ik3JOYeUBbb6nXtXzgB5zMhTbadi3PdB/1FrRW2A
 9WuQ==
X-Gm-Message-State: AOAM530FhoZGm4n0zy5d6RwH9i2UvagwgUqoaqTt/gAV1CsTscx1iXFi
 qLzJzQ20IN8rts+DlIRDr2JsXhNIJMJnaw==
X-Google-Smtp-Source: ABdhPJxtHBxoAlxeEaEjorEwBwekb6hvbRDr+kStQjV9g5bdCHeXCa5ZJuN0mINxC067EQlz839/yA==
X-Received: by 2002:a63:d855:: with SMTP id k21mr3814934pgj.399.1608547899772; 
 Mon, 21 Dec 2020 02:51:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:469:a113:4308:e075:646d:7374])
 by smtp.gmail.com with ESMTPSA id p4sm15364193pjl.30.2020.12.21.02.51.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 02:51:39 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v13 0/5] leds: mt6360: Add LED driver for MT6360
Date: Mon, 21 Dec 2020 18:45:49 +0800
Message-Id: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_055143_728633_735C2D6B 
X-CRM114-Status: GOOD (  12.35  )
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

Gene Chen (5)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 leds: flash: Fix multicolor no-ops registration by return 0
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  827 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    1 
 include/linux/led-class-flash.h                         |   42 
 include/linux/led-class-multicolor.h                    |   42 
 7 files changed, 1049 insertions(+), 36 deletions(-)

changelogs between v1 & v2
 - add led driver with mfd

changelogs between v2 & v3
 - independent add led driver
 - add dt-binding document
 - refactor macros definition for easy to debug
 - parse device tree by fwnode
 - use devm*ext to register led class device

changelogs between v3 & v4
 - fix binding document description
 - use GENMASK and add unit postfix to definition
 - isink register led class device

changelogs between v4 & v5
 - change rgb isink to multicolor control
 - add binding reference to mfd yaml

changelogs between v5 & v6
 - Use DT to decide RGB LED is multicolor device or indicator device only

changelogs between v6 & v7
 - Add binding multicolor device sample code
 - Add flash ops mutex lock
 - Remove V4L2 init with indicator device

changelogs between v7 & v8
 - Add mutex for led fault get ops
 - Fix flash and multicolor no-ops return 0
 - Add LED_FUNCTION_MOONLIGHT

changelogs between v8 & v9
 - reuse api in flash and multicolor header

changelogs between v9 & v10
 - add comment for reuse registration functions in flash and multicolor

changelogs between v10 & v11
 - match dt-binding reg property comment to the functionality name
 - remove exist patch in linux-next
 - dicide multicolor channel by color definitiion

changelogs between v11 & v12
 - Fix print size_t by %zu
 - Fix dt-binding name regular experssion

changelogs between v12 & v13
 - Fix kbuild test rebot build error


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
