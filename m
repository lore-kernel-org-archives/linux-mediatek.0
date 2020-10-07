Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AED2C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 01:43:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A84020782
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 01:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Frc9gEGb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqLL37wR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A84020782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/QI6mj6deKY4PgSEcHuO5olx7LGZrk3dOoMuUfYgnww=; b=Frc9gEGbibDKvx/oLR27N5JK++
	zcB3PmBKAVucXvVX2Y9CK/7kngJnlyht1HuQ8LeSZCcqPypEtJTkpMnI/1Z/tF0yCX4i1h4+UWt7w
	CeaxPgRXPXzuUdievIN5fSzoaPpp1kW0I+xuEOYwfJUPCKSa/c0YumZ1ftMKd8Ubfq2On4qPs7MBG
	Ucn+42qZ6uaayxtHK2ODQ7A/9XbsDD2kZXRnarILey1FKkqfu2Rj2hceT8mPaGi3Ot1RB1XEb8IDm
	YAPLlFWB5Xk8l2J8DJabYo4UUUi8TvjVyzDqFFqVpiR8xhTPIlq0s2SRADFx/5KwmOjub7GgptpP1
	S8tl9PXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPyTy-0002B4-Bf; Wed, 07 Oct 2020 01:43:06 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPyTs-00029Y-H6; Wed, 07 Oct 2020 01:43:02 +0000
Received: by mail-pg1-x542.google.com with SMTP id o25so392788pgm.0;
 Tue, 06 Oct 2020 18:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BSwgb5vSoUbb573urqabj8/K+d93yszEnYna0kzT394=;
 b=dqLL37wR8nDbV45dP2ly1+tI3LrHo0FcXEH9knPtdGi2U//1h6lWirvlZaFvWDkwBw
 OJDap5KFM1K+8wD31b0dUBFwzReQkeTuqcs0tBj6m/un5104ZgdvV0Q0cUdS02V7B0wc
 xc8hIrbH2fc+JdQRLxoHdcFi2A2M86bLFv6pfKjZn9E4zeT6+GlzR7lTg1MS0N3f5HVg
 OBD5hNT1YhILcGVEsWWN9UY+f0Uq9icLPyGsoY/NMJwI4npg1V1nZHTEXLi5vqo1IVMS
 p9MpCDEpSuG+kq49JBgiU7E/ZI3G8QY9ScvpHqm25ZoU2r1wuQpMLFxgsMG51p+1VKiE
 gIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BSwgb5vSoUbb573urqabj8/K+d93yszEnYna0kzT394=;
 b=kn8FNyQBTmzkDFtFjMY/uOPonC3Azsto57zHz5hFKiYJB1KAmT5RDyTqqK0yy+yege
 qJj4J5U/bTNe22guNDPjr5nx7ihS59bfPQgmFKacLMC3q9pXsJdTo4PgCBHk6xR1MZew
 ZuEUn5qnqSOI8+njCVe0l6j0AsDkBCokwwRxkhCLQnw1zJtsYZ/8ohFqGj+3sRbXSxps
 Ny0MT3sM9+o5N67hLFJgpIrW2QeaHR4RnVXaHE0ISIowF8kEnAShpw4JP+hNH64rrI2P
 q+mNRS6o/isa1I1pZSIzKAlWtrdgIUpoDqS8O1ZBkipXjhtgOf/yq5qjcAGIBubuHIWf
 6q4w==
X-Gm-Message-State: AOAM530DtJCCYh3hwtSLXWG6dYJUwRnoEWHDqHh8XatU/NOXzACuoUJH
 JA/gWWcfzpP9VX7TTztmz1c3hBniKcE=
X-Google-Smtp-Source: ABdhPJwOtctNYgd+bympQf2CnHiuVZiqRB8CdT80zq4aE5EcPTa+SWV7SmTq4501USU/lTgevAxUCA==
X-Received: by 2002:a63:1e0c:: with SMTP id e12mr907420pge.386.1602034976633; 
 Tue, 06 Oct 2020 18:42:56 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:dc67:6c85:26f7:3457:384d])
 by smtp.gmail.com with ESMTPSA id a185sm485863pgc.46.2020.10.06.18.42.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 18:42:55 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v5 0/2] leds: mt6360: Add LED driver for MT6360
Date: Wed,  7 Oct 2020 09:42:44 +0800
Message-Id: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_214300_600517_34581371 
X-CRM114-Status: GOOD (  10.08  )
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

Gene Chen (2)
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |   95 +
 drivers/leds/Kconfig                                    |   12 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  783 ++++++++++++++++
 4 files changed, 891 insertions(+)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
