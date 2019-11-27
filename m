Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8872C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 16:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACFD206F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 16:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bBfqd0Xy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6/t6QHF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AACFD206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rEP/RiJEt9ymfOxVwXU+1p97eAGKGva2DcVrUQ5s8Ys=; b=bBfqd0XyPQ8+c6
	99nJcOz6NDsc/LH85LmkYzmvOrCnXF0dOqKEMyGvK3Xj1psCd02HwGd0QY+m2ukPZSqse/kk2msV/
	V/TJBLtGa/kYNFTpz330AlDj4FOrjsDkNcSVDe/oo+MQfwuGuns3JJdldBxcGSXR9xIOAqblqzZI+
	w24bIstS3ou3LwOXPhyCFKxtjEAdAEhOpb3IQ+zWHU7eIqCXJhdmsXuuF8z8riOWdqvdLTLh/FxJH
	n6YANxJccx4YJLYy5JogSi+V7yrsTFSvkqAH3/0QoKOhCLYbXKG0ZOrz+JP9K9Z5MQ+VmMS4fZJ5F
	jauQlQTPZxcNbQe9tmbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia0LR-0007Ve-5g; Wed, 27 Nov 2019 16:39:13 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia0LH-0007NE-3q; Wed, 27 Nov 2019 16:39:04 +0000
Received: by mail-pf1-x444.google.com with SMTP id x28so11286575pfo.6;
 Wed, 27 Nov 2019 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=a5uCI8sDk06L3eBN4lbKYbKhhJe2khqKsQK/HeBIflE=;
 b=q6/t6QHFrX/IIKybww/twC4NWcDBGujHbbW6ZuVds6JG9ulrqK5lGwr1HEBFZ4qBMz
 KqP6zyPrBs3/04rc8fYDrdNoQdEevLJOUBc8uPUWa+zRDeHtu8gR8xl/QIibsnwYu0yL
 UoN8lGq5hVtEUcpRqBZH8G0VcwLCbbVIwQNS/gH4HJ2CfGuoozN/DCE7dcd32FEsYFb4
 0EzrAg0jCspjpo+faC6Swl+nwb9tiK0BlLK9a+ro9ULbguCqhX1B5Hgz+HaxnPV0DafW
 ov01MNMyPRgxNBLbfpIaQoX5yHLNMiAgPGNW2CvWdKalrlQc+yPBiubqa6nDWJtJDMfy
 RKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=a5uCI8sDk06L3eBN4lbKYbKhhJe2khqKsQK/HeBIflE=;
 b=TfaoOVoUyFCR8xxLMWP8WDtf/p71+WXca6QPLN8m99Qsxet1xYfibH0VR89uWXglyQ
 pUmnFxcv/emlXXITEOPnvyPzR/NLA5dPONQJR2tAzmdzATUA/tBzhcZ3FJsjp92jrjBy
 Abp99gIUNTQd0m83FvM9U+liMDC9hHPGs6QlIAv8fp8zIsvX8pXjKSwTUfS+ZigoPlvu
 1hlRSMR6oaNwoLjqOKFurxyAfk9Lmg9SYTTJ06Y0/9ly6ebcrQuOf8qsnA94kQxtsR0V
 qqWY+0pKeXrtW46LM7/IDQFsbrejST3gE0SPVA1BhbxvRw1C0ZbBXWdkV7l6kphPsV3m
 wM+A==
X-Gm-Message-State: APjAAAWlzfBwRmGaNfAdbUrqRD/4ORZNlqI9XH8c3NRhcikifMbj+Y+n
 vRXmoLOub6XTgsoTI4zqoW8=
X-Google-Smtp-Source: APXvYqyhFzYRUOGgpal+39IdvGP69h56LXE8h32YtVVh0FuJl/Vspv8GKTCoDBf/zWCNFBX2XPiQ7g==
X-Received: by 2002:a62:aa0a:: with SMTP id e10mr47148355pff.46.1574872741931; 
 Wed, 27 Nov 2019 08:39:01 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id c17sm17084710pfo.42.2019.11.27.08.38.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:39:01 -0800 (PST)
Date: Wed, 27 Nov 2019 22:08:50 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 0/5] pinctrl: Use the correct style for SPDX License Identifier
Message-ID: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_083903_164404_7FCE1E9F 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch corrects the SPDX License Identifier style
in the pinctrl driver related files.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46
and some manual changes.

Nishad Kamdar (5):
  pinctrl: actions: Use the correct style for SPDX License Identifier
  pinctrl: mediatek: Use the correct style for SPDX License Identifier
  pinctrl: meson-axg: Use the correct style for SPDX License Identifier
  pinctrl: sh-pfc: Use the correct style for SPDX License Identifier
  pinctrl: stm32: Use the correct style for SPDX License Identifier

 drivers/pinctrl/actions/pinctrl-owl.h         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 drivers/pinctrl/sh-pfc/core.h                 | 4 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h               | 4 ++--
 drivers/pinctrl/stm32/pinctrl-stm32.h         | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
