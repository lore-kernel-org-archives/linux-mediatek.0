Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5987EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:47:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96119225AC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96119225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHev0/ACFZSGcghWVv6aUx9BVLqSqMsWcPn9w7DTGBw=; b=vy6syR6hZQIGXGjgX6ngmXiSNj
	1RvgEPXAUlLU2IspPE5yhvHQqTBhjA6ou+eq8wHWboJRbJK/x86qwvHNOVCOkHHe0WiVuB9C9HvnL
	i+Ebpsm5oME59nUG0aSvTdwTfCyAIJ/4WupbxTds0/y2L5KkHcTS370DcfWrwi4/1rzB7bRC7AIxr
	Q0jqUveMdDkBz8I3j94xForYzBmIh6Q5YfZOHctiDwvkzT0s4d8XJ2P6V+W985qgk30LzO/yeRWoj
	pjhOu0xXl1Em/1EzCfEStHx9t49DBANAm95oLx9P5TJQf/MZ2erMAMgLBVWWzY1k4z2pr5QtcOL3t
	XS3sEYAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksFjC-0006BX-RR; Thu, 24 Dec 2020 01:47:43 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksFj5-00067I-J5; Thu, 24 Dec 2020 01:47:36 +0000
Received: by mail-pg1-x535.google.com with SMTP id f17so676840pge.6;
 Wed, 23 Dec 2020 17:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tzHgEMUxRYvZKqB5JDDJlTYF56dY3pbo9pa3hpqmyT0=;
 b=Ab3/L3mcNLH749pYNhvPsW/MYdN3CmkTMilrLXOcN8wv+fd/sv5H3FZsMTSvgkBNYq
 0HCb1af3OyRXTacf6hC7ssOqNleUS5iTIL7f3d7nMWkWnFmZTQ+Bz95TAUxqlPpTlSay
 lHSJLwAqVcAjYokAxOes6+mSIeJJEA+f3qR8XRW8+lmGTEf4wcl+GV3rmp05XbsdS6HH
 H8tRHOFZ8oM+i+0cc3J64iMkElPwrodeMIz8ntEQZRk22+W53LYhsVjpyLsOlxUr7k8P
 /Ge1usTYj5SSizMS9EbKh16fp4DaMO0hRrUfwlyh77QEmBtS0vm0JHx82SVQ/8TAMjVj
 N66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tzHgEMUxRYvZKqB5JDDJlTYF56dY3pbo9pa3hpqmyT0=;
 b=XgnqneU6InfMYL5oiN4JIZ9/6jAdN6vJMYfOXOvmTi/xtqDjLUz4BEQuZxKhUqMnTD
 1LxyjFylZlj1lfFLqxWwfBBJVwkMF9QmHxYbUbVwSYiy6zWUSFkYyBdcFjdcdm1pp3f+
 tFcR/oyffACc5zm7nFPU+fuhR0go4chMor8pZDoVvC4MA1htexTNudscESFpC7tXSleR
 aj0ZCjH2gJAGIBpPgj8naotrUZ7PSqB8CKa8my3cpzTRkpMfpwFw8Qvuzro7E+VTI88O
 OyyaZQzgm39G/F+PkqpagNYbUQgfimo9PeJnUsaa/F6/Riz7/0Y4wHXt2TK3CcGJVfRR
 27HQ==
X-Gm-Message-State: AOAM530QHefK02F4p4JNOe8sg7dCYgOq8QOGlUAJNeJ2k3TerXWNI9bO
 RozmQUfmQPg5ChaXgPp7WEE=
X-Google-Smtp-Source: ABdhPJwcKlgXQ2M9R+IC8gRzixZ8H6fSSw05E4sNNAVfAbUxfs9mlCV8Da0LH5UF0Fy8mRVzzrTmjg==
X-Received: by 2002:a63:4f04:: with SMTP id d4mr27002623pgb.225.1608774450193; 
 Wed, 23 Dec 2020 17:47:30 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
 by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 17:47:29 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH resend v13 0/5] leds: mt6360: Add LED driver for MT6360
Date: Thu, 24 Dec 2020 09:47:15 +0800
Message-Id: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_204735_721615_CDED7280 
X-CRM114-Status: GOOD (  11.98  )
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
