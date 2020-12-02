Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB1CC71155
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:47:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2202222A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F2202222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O50KQlMMRCMwgodaKUOwXq62U9Ew7PoZjwIy4HKUHnE=; b=J7yY1Q1UE7hb8QFuetnt1xJq+k
	TlYu/inbZ6ZS0FxSSHwkj9kJIdl84DOE6+UCu+YbJ03/73tddPsqimmu5dHfWNhBfib+K5faEVz2s
	V3gxBYG53s2122QvUHSDN7ERI2TEP1GtqgKtbne4jkxphLkjzRzHuqwGtIQNjJvsNqAeaLhwNGstj
	wDEyYtdV++XQSLXFuZGdYNyJ+uw6WLcHiPrLOl9c8tTbaBhZnXaMz2e4Zl40/e8psS3saw2dOvSET
	B3bhU2FdSybPO9FD5JsRlMLeWm0e0XnjOXpeiZN/L69as90eX+/dD6paDkXojVQfCDMOz+uOfcuXw
	s8kxlGeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkPf8-0006M2-K9; Wed, 02 Dec 2020 10:47:06 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkPf4-0006KC-LV; Wed, 02 Dec 2020 10:47:03 +0000
Received: by mail-pf1-x443.google.com with SMTP id s21so971618pfu.13;
 Wed, 02 Dec 2020 02:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sxwpW4/HVr9IelDA6cDLbeJJnX5WGx+OvjI8RRJKBVE=;
 b=tFNnhNscDh6wGQvdD8bV2PLbX3vfebe7dPJcVpXpVRPp/bPhBdJKVrHJqvwNpTZOjt
 U8+nTrwsAGhNT86JL8thxhbduqIN97ajS4drnOpNkJuhnD1CKrTFruvQSSTZpzMOYc+b
 ABFmuc6w4XxNYiNe1AWk5DlKLG46hyiDg8/M7zl0+srje5QZuuf0A8hzn3mu8yUMSu3s
 fwUSa4Oz+AJ5uFahoBdOcEiMAlShXQ4SZV8/2RDAtdRk4k/V96OzOxnKFNtWn+sxpqVl
 98UuJA/HKMGj6/tF3tCtlGq7jTIj47iyk6PFUgnQX33tKCnAZaYzP72v6Ge+03XjJ+Wl
 E3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sxwpW4/HVr9IelDA6cDLbeJJnX5WGx+OvjI8RRJKBVE=;
 b=ejJlix3DyOVsVR8Yu6n78rSgR7BKTkxarsGub4sA8AVJEWWu29lJUkboiRg0bF8Zbj
 sofe4Qd6qv8gOiB1u05fT/yROck2xCYlb80b+nFx7Fu2hqs3s56w7QSxwtp30G5KDqu2
 4o/Uo7AKutvotEBuFXEUKHSjpFfqG4Bye3Qxgu+wz46O0zS8+brD9Y6GlrQEft9FfBvy
 1eeCskz78HJ4y6y1mYMEH4Y76Lxe3IM+aXhukJLEFY9Rzv0tFY6H3DAmNy+FeSN7AeG7
 rWD4Le6uXhBZ4y7yIkuhd13uxZMKEvwyPt7DoQh/hl8j1WCGiXSi/EQcoMCcvdKAjmkK
 4MnQ==
X-Gm-Message-State: AOAM530XwEgFnZIPZs1PI9CMYDnFDg9PF/0Sd1VwMK9YzJr3pfASpreb
 aa1ZU8eQIRr8ndmUeurFqLsCBW/Jp26JXg==
X-Google-Smtp-Source: ABdhPJwc1ozay0nQL7YcKeKqxZTjP4EJXPLR2hOZkCjH6hLcF3k7h7OoqAS438V9+E8LJ/WYcBqjmw==
X-Received: by 2002:a63:1b11:: with SMTP id b17mr2064181pgb.1.1606906018584;
 Wed, 02 Dec 2020 02:46:58 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
 by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.46.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 02:46:58 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v11 0/5] leds: mt6360: Add LED driver for MT6360
Date: Wed,  2 Dec 2020 18:46:46 +0800
Message-Id: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_054702_737174_39D758BC 
X-CRM114-Status: GOOD (  12.58  )
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
