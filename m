Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9634C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 13:23:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853E860EB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 13:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 853E860EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwTgsR6i0CfSHeepQNn33dQ7V4RavVRclnG5fHKm3NQ=; b=O4AZ+A3TJ0QssQ
	Ve0MGbhITPrmvELL3uSMZU1N0XlLOPyOschjORP6VcxlJtNhBDn2rEdC7rgSAWmQnNaX2tYM02lJ/
	R2dwhkmRNJ6xkI/rGOFHTq9DAtuBHPh7nUjbo23e6ISgJ1HmLlH7xzpQhfyz0944XNr44j1AT9IsA
	iRDGlySdloyfa2YprxXh6ULlGhJQ2PiJgOVPcTGmPXNp6Qx64mnJs2wl9Q3peQzQlct5ztEDf3d87
	sWG5xF3GDALo0+guUWkvT4Il8NunE6VM3+f2BckS5wGOmO/GX4+fQZ90H7F1j+Z3DTgs2ekoWIQmH
	tRDdqCg6VRlyAfxnRu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6v9Y-004ooL-D3; Fri, 23 Jul 2021 13:23:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6v9H-004omc-TH
 for linux-mediatek@lists.infradead.org; Fri, 23 Jul 2021 13:23:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 x14-20020a7bc20e0000b0290249f2904453so4206506wmi.1
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Jul 2021 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ZkYDta2fk/bU/8g67PbA751XL8H00snBSaWg+n28pmQ=;
 b=i3ChRDvjrvOCnGIsTtIulpn/RRAXEjWknfRLq0o/bLpJzYLiR5KgOlUgbFOhvSUBiv
 tq1xHOIe4NTqIIF1hzW3svoh1a7gnEsJn+6c3+88KIIh+X48kjMGU/3mN/7k2kkVjG52
 qtfxGfChDXyNGASf1rS7YSJoQMqmB7ocO1T0oA24tBrZbEuq5189WYli3kyaeutBXgF9
 EuJOcCekneVN3LbGza0++PLIAwXyo6aHKxcRbdQAmtbE81+imS67BkGqpsfSeP8qY80X
 D8rIs+IRcqmWPR2FkcXHa7mneU9k3EX8hZ5lABUlPkXn93LqMIyPe7OVLbCzVjFKFCBT
 djXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZkYDta2fk/bU/8g67PbA751XL8H00snBSaWg+n28pmQ=;
 b=EKj5VywDIOs9JcWVAY7KGc4WzLucCf2N+7lvRqlNInu5yxCQ7qPShpy0X6A1OiNSNt
 bGZeR4bQNyNvgYaOiolHPjfx15KfSlaZ3OO5LkWarrT/igz/co10YQobPd9fM6O0TRTS
 OTq17pJhio7tzwd8tVlqstUPzd+WOig7VCyqaq0pMMOYD/0UeAdv6e9YJtX+ZOgs3lpQ
 lwmHu3UATNUXBXhJgPl4gB64vKA9bUVKrnTM5q5GApSBfs9Aw3CyaRus0jIjJEC5QazN
 Ue2M/ZRaT8ZzPZcfOeuoIbr2Mb78Q0rcSFyu+cs8MKZcrou3ac+e/kjMk3+NMYHKGgjh
 clrg==
X-Gm-Message-State: AOAM5324RkQPEC+xw9LYnBXJjwcqhBT5a9sNHHr+i2LjpNDS9pq/0nL8
 XpIRKmfwSxsi7CS1CHFgxkQiUA==
X-Google-Smtp-Source: ABdhPJyQdcRO+wkAR+Y+fC0Zhu1kxgf6fMJoYKzGwFiLSEFala+gnxw786uInQreYNyv1cNp0r019g==
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr4482762wmq.137.1627046607228; 
 Fri, 23 Jul 2021 06:23:27 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:4e65:8d4e:279c:96ff])
 by smtp.gmail.com with ESMTPSA id c125sm6009522wme.36.2021.07.23.06.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 06:23:26 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] input: MT6358 PMIC button support
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
Date: Fri, 23 Jul 2021 15:23:25 +0200
Message-ID: <87eebp88qa.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_062332_043853_F6B39DA4 
X-CRM114-Status: GOOD (  16.22  )
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

Dear maintainers,

Gentle ping for this series

Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:

> The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.
>
> The interrupt logic is a little different than other PMICs from the
> same family:
> for MT6323 and MT6397, we have one interrupt source per button
> * for MT6358, we have two interrupts lines per button: the press and
> * release interrupts are distinct sources.
>
> Changes since original v2 at [1]:
> * added 4th patch with device tree enable
> * cover letter title prefixed with 'input'
>
> This series depends on [2]
>
> [1] https://lore.kernel.org/r/20210512152648.39961-1-mkorpershoek@baylibre.com
> [2] https://lore.kernel.org/r/20210506094116.638527-1-mkorpershoek@baylibre.com
The MFD dependency has been merged in linux-next.

>
> This has been tested with evtest on mt8183-pumpkin
> using for-mfd-next as base tree.
>
> Mattijs Korpershoek (4):
>   Input: mtk-pmic-keys - use get_irq_byname() instead of index
>   dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
>   Input: mtk-pmic-keys - add support for MT6358
>   arm64: dts: mt6358: add mt6358-keys node
>
>  .../bindings/input/mtk-pmic-keys.txt          |  5 +-
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
>  drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
>  3 files changed, 68 insertions(+), 5 deletions(-)
>
>
> base-commit: 495fb48dbd9bcbe15859e086edd24519a6bd2961
> -- 
> 2.27.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
