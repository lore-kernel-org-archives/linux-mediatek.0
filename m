Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139E9C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:38:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA3E613C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA3E613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CMb4wj/0rvHtcYPZ5eKORW+lZCwZMuevB1MjJEZmzno=; b=MvzfzvRClDcgwrMOBQuy4ZmdLN
	D7HYw6vvOVM+BE4xquFeZRi7wZa7rphktq7/LwPYp3PAyOvIYLOf3/iVN4c0CXczU/ogP8MvogFs8
	28OWWuQWD0TAAHfJUSPBZ3aGxfO7pfe1OkxQNRRuf8Gi4tjRpO815Lj+aiE97yD8l7Yq/8pzT6y2g
	pgOBF7rqv/SFuc1WGm76Y5HEaX9PB+iHYXXbnW9Cu6oRDRc2YKnnK7CJotOTxEO4YXVzd0/U+YTQX
	9rL84G82b7t47qQZniKGEg+60tbw7pmZR0ZAWMgeyC/XVYU8/Q+7YsYcDwP6XgH6TbnmnclYQmwHu
	VqWuEirQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWb2T-00C0P1-Ve; Wed, 14 Apr 2021 08:38:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2Q-00C0N5-SB
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 08:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ziD1BQdNKZSqD9NFOROVnnc3R2EFM0orDAwFpUzsN4A=; b=4zWBqqDSrGB/u/bJxcODRC77zp
 hbzwXO6f7NMUQmSQLq9H2ORBmjJL2WGX+93P4VDfqIrUikbCS2qim6/e8glD3h/CL+w+I+beqaqKp
 er5bmWnUg1lOWsnx+LWofhTPIgCRAJb/bnd+F1qwftYTGoybMhyHcE2hGOwrfoWhXrefOC/nECFc5
 Iel+zaDaQ09IQpbWdyD6AOtLA0HEiF6mYgYtZHrVUCpLne65YfpuyBfH4oQrSW3vN6WU2isRxGjhS
 czAd9ELiAmoo0bGgOXm750ivYBZa8UxKW+3dAR1X1BtztBCUreSfJj2W5Y0pBLqIethUKxjItWWbc
 bZkRPWeQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2O-007cKJ-56
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 08:38:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so5616687pja.5
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziD1BQdNKZSqD9NFOROVnnc3R2EFM0orDAwFpUzsN4A=;
 b=C0vWj0hcBIafvHaGDWKGXb8qFbK28K+6CTcbRx+jBhqGxVEenk0ZpfI0OEJ3GBjUn1
 OI3le/p6rRWJtcT/v150Mb1TBw0aVJ4I4ujf8XZJ6QCEcWxfboN3sWqrCM1RMVPgD/7m
 LGkG0VLXouLy5TRv1hH1BP9Xpzl7X+4Qz8jbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziD1BQdNKZSqD9NFOROVnnc3R2EFM0orDAwFpUzsN4A=;
 b=fVEA2SSbfb0ShDYzLUvo0I4IK3M8IedvkagjYPNOXQZYbunCzMs10mvK+9LRrI7jap
 kfEQF9EGZsq2vLl2pfWjeiB1JSyON7DTFwJjq0l/WsJGRjRUYuJGXtxbmbpQZ2pDZzx7
 RSg5UH5zH9YVtupYZkgDKB1MFn/mUQTT9b4AWMDwLK13slGKinuxhiUHWfXTMKrndv8Q
 nYiNSGxF8nhE/g/8LjDhIzCUQQqAtpjFZ3HcBTvlHhOe4zlc5xqnukJdE84idHCS4d3w
 ofLxv75cX3dZ8U0BFqRQ/bzgixtinv5HkdjlKybsx71gQisw1+YhdhNd1/uFjW91qnUD
 oDsw==
X-Gm-Message-State: AOAM5332fkQkaU6ZxFULN6mb7FhhOFEmob/N99RKmNu6fxFVmE2lVKUv
 sTnzAWHNqo8klB+ybWEmke+k4g==
X-Google-Smtp-Source: ABdhPJxSlTkPVFR0T8QT7aqFYNKg9cTSJzvySRAavLQ24KU4Uo3AyiacyaFpCBzs8QBA2CP0H23BOA==
X-Received: by 2002:a17:902:f2d1:b029:eb:2e32:8804 with SMTP id
 h17-20020a170902f2d1b02900eb2e328804mr7489637plc.40.1618389494389; 
 Wed, 14 Apr 2021 01:38:14 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 01:38:13 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v18 0/5] add power control in i2c
Date: Wed, 14 Apr 2021 16:38:04 +0800
Message-Id: <20210414083809.1932133-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_013816_243871_630AF75E 
X-CRM114-Status: GOOD (  13.71  )
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

Although in the most platforms, the power of eeprom
and i2c are alway on, some platforms disable the
eeprom and i2c power in order to meet low power request.

This patch add the pm_runtime ops to control power to
support all platforms.

Changes since v17:
 - Add a patch to fix unbalanced regulator disabling.
 - Add dts patch.

Changes since v16:
 - request regulator in device instead of in the core.
 - control regulator only if it's provided.

Changes since v15:
 - Squash the fix[1] for v15.
[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/

Changes since v14:
 - change the return value in normal condition
 - access the variable after NULL pointer checking
 - add ack tag

Changes since v13:
 - fixup some logic error

Changes since v12:
 - rebase onto v5.7-rc1
 - change the property description in binding

Changes since v11:
 - use suspend_late/resume_early instead of suspend/resume
 - rebase onto v5.6-rc1

Changes since v10:
 - fixup some worng codes

Changes since v9:
 - fixup build error
 - remove redundant code

Changes since v8:
 - fixup some wrong code
 - remove redundant message

        [... snip ...]

Bibby Hsieh (1):
  i2c: core: support bus regulator controlling in adapter

Hsin-Yi Wang (4):
  dt-binding: i2c: mt65xx: add vbus-supply property
  i2c: mediatek: mt65xx: add optional vbus-supply
  misc: eeprom: at24: check suspend status before disable regulator
  arm64: dts: mt8183: add supply name for eeprom

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  4 +
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  4 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  4 +
 drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
 drivers/i2c/i2c-core-base.c                   | 88 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    |  6 +-
 include/linux/i2c.h                           |  2 +
 8 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
