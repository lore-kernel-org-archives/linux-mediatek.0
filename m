Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54497C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:49:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D295C229CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D295C229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wQiTT2xJ9r3N8cIp8Xk6b8y64Hi/OjCAin0sO6pRhpQ=; b=Lvxru/vXDlgN1JFvzshrplzO+l
	iy/tbROxDWGJhzxGo9WE2nH+FlrZahlotnT6JoTyzNJsq0KMcteZMtNAtsCzkxZej1liTw5SyEuly
	NYRWUzdtfoSF67DSvJAAv1eRGDg3+gn8Vh361Z3dkf6yjlZI16o7uNMvJhH/99V4EF1sqLpz6e3W+
	EBLAGRtygmLEbEtkuGjVMLYXuLTl5vVZryoBFdEhjwFpX2ao7ZenmjiOEHAYg+FrgukeLlnY5WDf2
	qeHBm5mGEaOug9TkPbb4V8kkYhDWx9N8BLify3OXqVmKXLc5jn7FQkzUAyhJH9pB+QdoSUit1xnTW
	CAueq3ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksLNM-0007eA-7f; Thu, 24 Dec 2020 07:49:32 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksLNJ-0007dV-5e; Thu, 24 Dec 2020 07:49:29 +0000
Received: by mail-pj1-x1033.google.com with SMTP id iq13so733937pjb.3;
 Wed, 23 Dec 2020 23:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=SlolyWi3tYq1xjC+al0ttrUuofdE52UVAA6blmH9sEM=;
 b=eTO6Wl+eK8gwXywAW6K3qck/icFb64N4GiVqAC6ycJ0TvwhrHEGsqxJTc28XXz8UQh
 sQ+4XClMQ4xTmp8MeCoIn9nfIP5NrZUk5xXcgaiGlPy2ojq8RkJn2ZmSQ/c4hcWWa/tM
 +fOX5ycpLqJ+zQbLWj13ir6d8v4PisJ3h/qyr2wwjo9qQ5CtOD9sapYerjRgzJjRE5mR
 AmB3fWQSqFtF4+4hXnKWYIYccmbTWy8hrpbYLR7R/7Z4NoxlGFy2SCF2GFSnP5A65pWF
 581q1BaK0rteZyOJeidlnIPsc3+TxR0VDYq290OuokHMBqIEL5/cXWkF6MOd3Vt8VC+4
 08Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SlolyWi3tYq1xjC+al0ttrUuofdE52UVAA6blmH9sEM=;
 b=NL6so9o3Rs0B6+0AiTpjZXXc0OIszoLDpBbMY93OVLPN9f6pYDm6+oyQTNwprAupEX
 vLpRUawXnhln0Wf2LEczy/pjOYfblSkJL1mDfc2rYw8oJZHYD6kPlAL64phhtwDEsEQG
 tFRISbF5pbT0d7F3ZXvJPisTHv82w6aaBauNrqr+Z4uOLH7y4lhnl+J7vA0b/8eMxpMM
 hGVUWo37pGSNm+LZdMr8MyX/LZv9vw6HutZz05k5Cq2jcrjhSLlm0zk//8DUhf60r5Ku
 HV07G+r7ExfLRIwI67txCVcSuDaT1U7LQX8S0HAzZ1oT+acLmlHNm2epWADT1jFRHq1Q
 Gvag==
X-Gm-Message-State: AOAM530jk9EBMgUx5A36EzkAdEYXY1qpuu3YL930Rqjkz5fcKqU40RAN
 7aBRqHAYulzCONNlMm+jv0A=
X-Google-Smtp-Source: ABdhPJyi/7Wn4+jU196A5/CLHyiFSodaESpmG4ccXdU5u3v9F0vaAteF6Thcaq8a0pY4cd4y/bGevw==
X-Received: by 2002:a17:90a:a382:: with SMTP id
 x2mr3320685pjp.178.1608796166985; 
 Wed, 23 Dec 2020 23:49:26 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
 by smtp.gmail.com with ESMTPSA id y9sm1743507pjt.37.2020.12.23.23.49.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 23:49:26 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v3 0/2] power: supply: mt6360_charger: add MT6360 charger
 support
Date: Thu, 24 Dec 2020 15:48:02 +0800
Message-Id: <1608796084-29418-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_024929_236882_0F910F2A 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 Charger support contains driver and binding
document

Gene Chen (2)
 dt-bindings: power: Add bindings document for Charger support on MT6360 PMIC
 power: supply: mt6360_charger: add MT6360 charger support

 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml |   48 
 drivers/power/supply/Kconfig                                       |   10 
 drivers/power/supply/Makefile                                      |    1 
 drivers/power/supply/mt6360_charger.c                              | 1022 ++++++++++
 4 files changed, 1081 insertions(+)

changelogs between v1 & v2
 - Add binding property with unit and custom name prefix
 - Remove extcon device, redundant brackets and interrupts
 - Fix power supply prop "charger type"

changelogs between v2 & v3
 - Add register selector to value mapping


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
