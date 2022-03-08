Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C7CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHfslFPNyk2n4ahMeeSCjtufzw5ZRjJSntbbh+e0DqE=; b=r6Ox5/PDfh1xS9
	fVbMeYz0ujiJSsulIU6rScQ0+pnrVy5yUvlXWeNljMeW68PevfvwT+srKbgWSq7rno+UjVzeZ1hhr
	+1PFmMePLUgJ2ZK/brOdUYjo+WK+GbPjMdcYcd2P3s5gNzdHP6ij0TaULRTnIdXS8eWofIaD1vVzW
	q1Uw/V8v7MB+cuWId+bwgrHn3A8vSeljEM/Bs94DJkZIExYLgwkdpEKbrlIRveeP3oG71vktFXDKi
	+8D450pjHCb5lGDyoMSRL9fj0CMl3gJXUJJUPreuLQxSrm6FdY750IIvnG0hMNzPUfTvxYnUTia7h
	jtgen/d+OJcWX4Mq45kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWtW-003maD-H4; Tue, 08 Mar 2022 10:16:42 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWn8-003k29-Kl
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:08 +0000
Received: by mail-pg1-x52c.google.com with SMTP id t14so16030485pgr.3
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oNIVKpvm0s6LUmPZub3N1Ezg2lYCnjZhWgfroeSjFzY=;
 b=GW16XTWJxnJ3xJoYKWf2LL1zStyTxkVf0OSEZ22LTyDCb2dMqecV85IUwfEk/m0M9h
 LtLQkTaKSH3UP/vSgLNNEN5rwMTsf/1CXYjr3nMi+/Sq/zUm/wHJfgvLMntaw8JA242B
 s2PRMi02fpuOlEDiJu6hgSKAsxWE8pjbkjbxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oNIVKpvm0s6LUmPZub3N1Ezg2lYCnjZhWgfroeSjFzY=;
 b=1lSglTf2yWG1NXongij0D0tF6WvwyiMGaWSO/fmZ9Z4QK8Y4Sk7cGabEbBHMZpaGCw
 YWjfvnJ2wt3co+3mjqe02XIevK1xEYpxJhsJtLOsO/6SEb5G670DQZAcLgUcJM0VAh3j
 CXX4bNB7rpmNCEzRymlS0wcwmKRKHRDB21O6tFvdILwDEHhMnrA6HKESEn2N8pGQFzSv
 QJqIIesMnIJPu59SqBjL+m4ApELP7dEmwiliehMniCIGwnIEhxI4foG3Wz3iWpAoHAEB
 K0JL53v68bXJNDctaTIjDpA9fyB1OmoL8q929RC/NYRuDF0XiZ2QNHS8L5XlW8UdO58H
 qYTw==
X-Gm-Message-State: AOAM533KWPgkgB+XHfJ22Mwvt+hX2kp3nHu+NHuHDs88pG1rqXCoE5r5
 bcmNAAYVlF3RlaWsfSBgbwmAwA==
X-Google-Smtp-Source: ABdhPJztEHkxcH5xrdq032U7xg9J5hZyVp6igs1Tla6Wh1z2kfGqBekJR2Bc0KZMr/7ucD/i6KiSew==
X-Received: by 2002:a05:6a00:1bcb:b0:4f7:1b5c:479 with SMTP id
 o11-20020a056a001bcb00b004f71b5c0479mr5961549pfw.5.1646734205085; 
 Tue, 08 Mar 2022 02:10:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 00/11] pinctrl: mediatek: Fixes and minor improvements
Date: Tue,  8 Mar 2022 18:09:45 +0800
Message-Id: <20220308100956.2750295-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021006_756624_CD83FEC1 
X-CRM114-Status: GOOD (  11.83  )
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

Hi everyone,

Here are some fixes and minor improvements to generic pinconf and the
Mediatek Paris pinctrl driver.

Changes since v1:
- Correct PIN_CONFIG_BIAS_* read back for all cases
- Add patch 7 that reworks switch/case logic to make the code in
  mtk_pinconf_{get,set} cleaner
- Handle case where PIN_CONFIG_DRIVE_STRENGTH_UA is not given and the
  advanced mode needs to be disabled
- Also make the vendor specific MTK_PIN_CONFIG_DRV_ADV config override
  PIN_CONFIG_DRIVE_STRENGTH_UA (or lack of) if the former is present.

Patch 1 makes the generic pinconf library print out arguments for
PIN_CONFIG_BIAS_PULL_* in debugfs.

Patch 2 fixes bogus readback of PIN_CONFIG_BIAS_DISABLE being always
present.

Patch 3 fixes the type of the "argument" argument in mtk_pinconf_get().
This was erroneously typed as an enum when it should have been u32.

Patch 4 fixes the pingroup config state readback to actually do
readback.

Patch 5 drops an extra newline in the pinconf debugfs output.

Patch 6 cleans up the debugfs output, skipping the custom hardware state
output on the virtual GPIOs, which have no corresponding hardware.

Patch 7 inverts the switch/case logic in mtk_pinconf_{get,set}() so the
code has a default error code, breaks out on error, and has the indentation
reduced.

Patch 8 adds support for PIN_CONFIG_DRIVE_STRENGTH_UA (drive-strength-uA)
to the Mediatek Paris pinctrl library. The goal is to replace the vendor
specific "mtk,drive-strength-adv" property with the generic one.

Patches 9 through 11 are from Angelo [1], rebased onto next-20220308.

Later on we might want to deprecate "mtk,drive-strength-adv".

Please have a look.


Regards
ChenYu

[1] https://lore.kernel.org/linux-gpio/20220103101855.17350-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (3):
  pinctrl: mediatek: pinctrl-moore: Simplify with dev_err_probe()
  pinctrl: mediatek: pinctrl-paris: Simplify with dev_err_probe()
  pinctrl: mediatek: pinctrl-mtk-common: Simplify with dev_err_probe()

Chen-Yu Tsai (8):
  pinctrl: pinconf-generic: Print arguments for bias-pull-*
  pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_* readback
  pinctrl: mediatek: paris: Fix "argument" argument type for
    mtk_pinconf_get()
  pinctrl: mediatek: paris: Fix pingroup pin config state readback
  pinctrl: mediatek: paris: Drop extra newline in
    mtk_pctrl_show_one_pin()
  pinctrl: mediatek: paris: Skip custom extra pin config dump for
    virtual GPIOs
  pinctrl: mediatek: paris: Rework mtk_pinconf_{get,set} switch/case
    logic
  pinctrl: mediatek: paris: Support generic PIN_CONFIG_DRIVE_STRENGTH_UA

 drivers/pinctrl/mediatek/pinctrl-moore.c      |  25 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  25 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 290 +++++++++++-------
 drivers/pinctrl/pinconf-generic.c             |   6 +-
 4 files changed, 200 insertions(+), 146 deletions(-)

-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
