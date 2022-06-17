Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+zfxAXUXstiy9HFbkcUgRLR8H01OXibXa/AaMrxxFvw=; b=bcS8rzPDDAZN63kjT1txiIQygy
	qlSnIv44rATiq3K1whsc0tuiJQLXTxaav7AwS4nRqkb+UGBlNWENxFn4YNGFkvnOGbm8UiJElf8Sk
	njypN47Pcoso429K24EGzYdkdhkLAnWpN0E5IED8e6Qt/O1lxesMRNyN1z5pGBAcagqWq7HRSc0Xl
	+1QDLEc7dgFGkHAE86cnzMsH47p480FsW3qLjUwEUx8w126uxrBiBPQ7v6J41svIU4KWiB8hPdth5
	ZBmUZW2CSPahmnYfSSk/lET8OOBKfvoULyl6RJXzseVFz9G4ufTFQ3h5xMF+b/2dVKngRbQy6boRx
	vJ7SVceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27CE-006FqD-CN; Fri, 17 Jun 2022 08:19:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27CB-006FoV-1y
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 08:19:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id a10so1921108wmj.5
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+zfxAXUXstiy9HFbkcUgRLR8H01OXibXa/AaMrxxFvw=;
        b=0/lpT5HykZNP39UyQqCjq47YFnbNhY6JYeUpCQof3XsUCTKrQxaR6kA28RIQxTsbd6
         1LEw0QDrN9P2uFjEA4gyoQ7AYXPWDm88DQ0XGhQzPDkWiZP5GoHzZaZ9lxAkY/imqrZr
         OxKFwb9rRWc2WMYOqSmapsicbLo5l+Ja0iMnyEsotqYS/ssTeCAl2EQeq9PuZhBGQ0f4
         SCrQSvV7U5fEf17jmRCIvxNuAxCpvn28FEJhgz3Qw4bsLodKjeeow04oKVRWlrHSrmRE
         4JvJEcYARhLkW9ETjyCako/k/bFGcivdLZH212LSaMl/R4vpsEF86YDRiinIbLXTzctp
         ntZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+zfxAXUXstiy9HFbkcUgRLR8H01OXibXa/AaMrxxFvw=;
        b=g1Zxg10hLjv9Cx75qRAY4kRWCPavRaTew4Bk6QJ3L573F4/qqDLX2aXE3FTT+3CaUS
         5Di66k39y4tCzidqa9E8INcWI0JwhDZySNWAMFirQwz4c5OtaLTZgFDIiry0reKsYND+
         zGM1pEBwkEyAbzAmE4zIYs3Hs2BFmBh1fcQVPMuh8wNtXrJ4LjFRmI9u5JlS/bD1aAwa
         DvDS5gyWXFmqTfTAPa984/Wj16f7n/KKmVcQoDaUYmZMucA87qn5D1XD1bhk1kSXrwBi
         yXuD121rVz8/FwRGgB8FXJYohZQJLMPIskWNnxI2y20pEn/40BFBY1JqmTvAaLscWxpx
         njvw==
X-Gm-Message-State: AJIora+QpO1KSj74qN2L+LFodKqkU8u19EcAJIlb/rAFdCxFtE9ypCMN
	GqF1xvGHHvEDY+dXj5UTM7P4Zg==
X-Google-Smtp-Source: AGRyM1uA1po67esnYEyNcEdUlzYn0dRDp8zP7JR6MJK74I8T9W1lnpShELLVdMBsJIPq0QGFqWNaXg==
X-Received: by 2002:a7b:ce87:0:b0:39c:5509:660c with SMTP id q7-20020a7bce87000000b0039c5509660cmr8961277wmj.163.1655453947001;
        Fri, 17 Jun 2022 01:19:07 -0700 (PDT)
Received: from groot.. ([2a01:cb19:85e6:1900:b8a0:45dd:a367:2e65])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b0039db500714fsm4970245wmq.6.2022.06.17.01.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:19:06 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 0/2] Input: mt6779-keypad - fix hw code logic and row/col selection
Date: Fri, 17 Jun 2022 10:19:00 +0200
Message-Id: <20220617081902.2931099-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_011911_123320_9A3CDF75 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes the row/column logic to match the underlying
hardware matrix.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

Changes in v3:
* reworked row/column logic as discussed in [1] 
* Dropped Angelo's review since patch 1 changed

Changes in v2:
* Simplified SEL_COL/ROW_MASK macros as suggested by Dmitry
* Added Angelo's Reviewed-by on patch 1

Mattijs Korpershoek (2):
  Input: mt6779-keypad - match hardware matrix organization
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

[1] https://lore.kernel.org/r/YpMDZORAlHmg/x/0@google.com

base-commit: 69cf890d8b283c8d3a77d28dbd3024f58ae236a9
-- 
2.34.1


