Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC85C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZ+/9OV8Mc5JxlhZVOQhzLguNCV/n/rg71UUYz6q9ho=; b=LW708eRZ0ZVH6Z
	bjVz5kLRt1lTfM0FRBpCRPtk3BJY1uefpFbn8WX7th7Ts4zktWoi2OnpYhVqwGQp1Y3rtXO+BJ3ad
	jXPX694TrXfwzrUisxQZ65bXTc4147o90Kl4fqZzv1+R4vwW6JgBG5OtTwMy9oSz060KP8AHIZG8q
	LR25sE6w1bVRiWYtNoshbFu5H2vnJrYavM5kVt5cugHQzwcR1I/xarAax8zBC1uIg+WNxErVM6nDr
	NZ0b+70R7PPfGkX4kX/35fE/1cqDFo+586jRzdSw80pvhdCQXWmDXEllnwUddslxEsdWREjAjLGKw
	GOE+PX7poR52edxW8BnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FF2-00G0FH-2K; Tue, 11 Jan 2022 11:23:04 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FEp-00G09G-FB
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:22:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id pj2so16632924pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3RGIjUh3zkO2TSrEh9ANB63AzKRIvsxnYvzUQhlL+o=;
 b=Y80ZsRuSH0nHMEuCQfy5g+v40fpq3LOUz5/ICaGJahs4F6d7BAGPybV22cQRHOcYPx
 xRpvG/MnkTRUy3brFfZewsw3Hh0jlKLdyZ7xdPFoAqBzzMQKO+rbS7hBxqQj9qMRT7+u
 TkTEyuHdR5L1A3WSaQcxv2/b1Hf6vutNMLgoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3RGIjUh3zkO2TSrEh9ANB63AzKRIvsxnYvzUQhlL+o=;
 b=SLttAsdM1erVYm49DwApRJNB/oDAX/kJGkRWok4dWG1MT4eCgHtAmtCb4c0Sy484hP
 /+uGD6PID4s7iAbZHaogYpbNxSM6zLz3EVO4D0cP5xqQe5RfuhfQAjxofiIU0VLRGh4T
 q+Fhb/Jlf/AgGmLjuEqCjhHc4KA3Oq7ZE3Ees3o7eKEW/sNLY/hoxrRRPB2EVuDRyg93
 Ss29BEpOWljiPVMrvLlOj9h3tKs7qMtvCvMDA/sbcdtkvumvguUq9oJl88ySNgIR74uV
 27MTRvKEe3q4xY7U68PQloql7f6aQMEjOIEolG2OHItDRoid5TE7hLt5czqESZiBbdSi
 PB6A==
X-Gm-Message-State: AOAM533NsUFi2tQMfM00/V/st1syCPBYtghRxsiliDvpmoea7Hg6GQaU
 7JUpf9VPxLSbJkxYorwLy5Jt9A==
X-Google-Smtp-Source: ABdhPJxyb6khCxx8QJ4wZdF/qzdXMCwXXuWyr+5j5JU9u6njT4vwx0W1aH0tkLphD00UBXSQl+BSiw==
X-Received: by 2002:a17:902:b58c:b0:149:57d2:3165 with SMTP id
 a12-20020a170902b58c00b0014957d23165mr3791864pls.29.1641900169486; 
 Tue, 11 Jan 2022 03:22:49 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:22:49 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 0/7] pinctrl: mediatek: Fixes and minor improvements
Date: Tue, 11 Jan 2022 19:22:37 +0800
Message-Id: <20220111112244.1483783-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032251_589744_C92E2968 
X-CRM114-Status: UNSURE (   9.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi everyone,

Here are some fixes and minor improvements to generic pinconf and the
Mediatek Paris pinctrl driver.

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

Patch 7 adds support for PIN_CONFIG_DRIVE_STRENGTH_UA (drive-strength-uA)
to the Mediatek Paris pinctrl library. The goal is to replace the vendor
specific "mtk,drive-strength-adv" property with the generic one.

Later on we might want to deprecate "mtk,drive-strength-adv".

Please have a look.


Regards
ChenYu


Chen-Yu Tsai (7):
  pinctrl: pinconf-generic: Print arguments for bias-pull-*
  pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_DISABLE readback
  pinctrl: mediatek: paris: Fix "argument" argument type for
    mtk_pinconf_get()
  pinctrl: mediatek: paris: Fix pingroup pin config state readback
  pinctrl: mediatek: paris: Drop extra newline in
    mtk_pctrl_show_one_pin()
  pinctrl: mediatek: paris: Skip custom extra pin config dump for vrtual
    GPIOs
  pinctrl: mediatek: paris: Support generic PIN_CONFIG_DRIVE_STRENGTH_UA

 drivers/pinctrl/mediatek/pinctrl-paris.c | 106 ++++++++++++++++++++---
 drivers/pinctrl/pinconf-generic.c        |   6 +-
 2 files changed, 98 insertions(+), 14 deletions(-)

-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
