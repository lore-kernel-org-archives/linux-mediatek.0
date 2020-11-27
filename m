Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25250C63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:29:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0D620782
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wOOGcDvA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8qbI4Cy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB0D620782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S34NA4cixsTCBuMaXGiLzNlUBSqxgnhzqvx6Mf9JJe4=; b=wOOGcDvAqt3rKnTE7g1j0L+RRV
	PLNBQO5r/nctnqsFq0ItwhaMn2z+OUlScFa8GYk84xzhuphjHE0cA67Ph8yMXP4dGD+RNDT7EQE+x
	rrOQSXIdfvpGFwksw/gUNzRtvrz++jetxIQL+KKmXBD+Z/3sTWx8kDQ6rM8knxxO9VA90YG2VXxkc
	qsfIifCLkoW3wcJvxw9YlikY6kx2wmj4nhaJvLj9wSW+As2xv1fXZ9ZjrX7EwgPzG3poY4konCjaD
	dr+C1nZKs+fAnQmWkSb33g7QhRc8f/04h4ocwBCUhSQKJoL+UtLldqyfmUNdK9f9IcjUFBaN+fjyz
	NJuvHdWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiURg-0001qS-2q; Fri, 27 Nov 2020 03:29:16 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiURX-0001mU-L1; Fri, 27 Nov 2020 03:29:08 +0000
Received: by mail-pg1-x543.google.com with SMTP id t3so3193212pgi.11;
 Thu, 26 Nov 2020 19:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5Rgv32VZUwFhjMObiccjuovgZTw3dAi0BO9MVS0sHMY=;
 b=s8qbI4Cy7S7Uecnh5irZ4A3ADqna0oAGoJ7ZDUN/vODsWdJN8MFz1bUg5HMfzdjQse
 BXloh82EmcS3ARrzTvPbYmh0N7eRliD/AUt+BdMuxm21OwRaZg3pVHquIpE2MYDQ+ju5
 iL6Zg2sBq3iI0RQrhdPdErunvzy4/bP2W3T1j7fpGVK0qt6SmQCwsLOX0xyFRKDnVIh9
 96zVwn6O+HPzyoC6cTYxtsq/bZSf9cPtqKhL9S5KO6rMxyuqbVuZwREWUWX5CGwFa6ZT
 H1wUsWbCFuNrmLOMm01oaW7YYc87yqiiL0Gv+9Sl/LWkJn3btC32a5LVI0fI9pnQFHLl
 4hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5Rgv32VZUwFhjMObiccjuovgZTw3dAi0BO9MVS0sHMY=;
 b=WQM30RkQEelMGyQ0gxEgiPGQIho/yAh2EijU43hMmrB2zN0wi7olazvnN0LKyC0KNs
 9+PYM6GAIZabqFswoA0y5/IWM0QIWhTiDewMfU/7zbj4x6J0GlOu3bFAvNGxI3hlPFZz
 XyIVkF5FF9U6BlMJHYO8YvRClHSBs+EVhLwZPwodmAf+WqowfRFRoSILUTqSHX7l7cBn
 ZHkSJ8quMaBsfooI2UW09WDEStKVcdJ52kBT9sDv/Z6t/N1fk1WQ0I10XNPpkbEotr4z
 6yTU6vbbKNFd7/yGrus+7MMUXobH9gieVbY75Kt8y5th+T1sfioJjGIv+q63mYEoSxMn
 kq+Q==
X-Gm-Message-State: AOAM5316+/va0skkLFT6TqiGdni9wtaoEX5XRuSfRbJBG1aFMRJPvJky
 Zl4GYhPtvOG4lYaOM+CXDp2uOwpk7d1YWQ==
X-Google-Smtp-Source: ABdhPJwaSMxuHN2zvV6khR85zt3NEzpQh2zWdKfxVYpuwuNdippLrqPOwhcTdzavJw2iXmmpFBaXFQ==
X-Received: by 2002:aa7:8801:0:b029:18b:5878:30d6 with SMTP id
 c1-20020aa788010000b029018b587830d6mr5224265pfo.77.1606447745521; 
 Thu, 26 Nov 2020 19:29:05 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
 by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 19:29:04 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v10 0/6] leds: mt6360: Add LED driver for MT6360
Date: Fri, 27 Nov 2020 11:28:50 +0800
Message-Id: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_222907_821811_B8654179 
X-CRM114-Status: GOOD (  11.85  )
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


[PATCH v10 0/6] leds: mt6360: Add LED driver for MT6360

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (6)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 leds: flash: Fix multicolor no-ops registration by return 0
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/common.yaml      |    2 
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  164 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  811 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    1 
 include/linux/led-class-flash.h                         |   42 
 include/linux/led-class-multicolor.h                    |   42 
 8 files changed, 1039 insertions(+), 37 deletions(-)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
