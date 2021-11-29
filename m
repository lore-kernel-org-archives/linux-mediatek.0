Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FAzhZCzGCw6w6oH+vhnD1BeHlpmxGYAYkD97xpwfUXw=; b=0ntswKa8pCRMg2
	yt9+Xgs96IgJ/0zh0v1orlEVUecWgeCFwWpeHagP5KbYrdQC2rV1lhEXSUKdbFPRnjanwJqPo9Q6F
	/G8qo2kpy5LeBfdorKSto+/O6edrQRJX5Q95rUsUVYif9mlTCfdPhikaZ/E22/muWD08cBCSVcJL2
	zgfqsy27nvU7oI4r47yPEnG16ZC/se57n/CZ6bvUAUHl0EgfzvKsd3rpQQ1grQK7UbFhXsNc9izoJ
	As+i7yzIb8HLCSTKowGLB7ynhQd3FeOcYJa39gXMgzkX5aQCxPblF0mI9Oylt7prWKSy27xpMfnX1
	/8NXRX2G0tWa34bfAfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdGi-000HkO-TT; Mon, 29 Nov 2021 09:48:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdGQ-000HW3-8s; Mon, 29 Nov 2021 09:47:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D4E261257;
 Mon, 29 Nov 2021 09:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BBAC53FCD;
 Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638179276;
 bh=5CENAf/8QanA+lLNHGoriAWyTBD8I6cnLPIi4nuvTN4=;
 h=From:To:Cc:Subject:Date:From;
 b=H5x3OCE4WZM12i3Vle4WyTNxy+SESS5l9MQeZY2n7ErMwupHa1wRMhIDBf89g7wm0
 6gSP3nnbNkjlvyl5EfRHCHT9yuFlAICe30EKLNuUnfkgpJwvV7j/LK/tpRwFkXXtNL
 ngawzo+pjvK7MjnPQuBBEVueMaD0DcmNhT89Dcki0PS010FrjtX4z8KjMu49WiD2hB
 Gbe7aXtjeIzubLax6URGtRpmgiSQWSoZk9ytffAodGu1kBI6yn/I9CQGZat+iZ9dFm
 X+llPm1yrsTkJuLdmzOSQUGh9OICb+q4/osiwb1c99vuQQuHtvh97hr5+sg2lMOfgk
 gS60XsLMi2/+g==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mrdGM-000RAt-2h; Mon, 29 Nov 2021 10:47:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrey Utkin <andrey_utkin@fastmail.com>, Andy Gross <agross@kernel.org>,
 Anton Sviridenko <anton@corp.bluecherry.net>,
 Antti Palosaari <crope@iki.fi>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Houlong Wei <houlong.wei@mediatek.com>, Ismael Luceno <ismael@iodev.co.uk>,
 Kees Cook <keescook@chromium.org>, Malcolm Priestley <tvboxspy@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Robert Foss <robert.foss@linaro.org>, Todor Tomov <todor.too@gmail.com>,
 Xiaofeng Cao <caoxiaofeng@yulong.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: [PATCH v2 00/20] Solve the remaining issues with clang and W=1 on
 media
Date: Mon, 29 Nov 2021 10:47:32 +0100
Message-Id: <cover.1638179135.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_014758_445018_C26C862A 
X-CRM114-Status: GOOD (  12.59  )
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

Currently, using clang with W=1 and CONFIG_WERROR causes media to break.
This is reported by builder.linuxtv.org.

This series solve the remaining issues.

v2:
  - Use __always_unused for the code we're keeping
  - Dropped a couple more unused functions
  - Added reviews got from the first submission and addressed some comments.

Mauro Carvalho Chehab (19):
  media: adv7842: get rid of two unused functions
  media: saa7134-go7007: get rid of to_state() function
  media: davinci: get rid of an unused function
  media: drxd: drop offset var from DownloadMicrocode()
  media: drxk: drop operation_mode from set_dvbt()
  media: m88ds3103: drop reg11 calculus from m88ds3103b_select_mclk()
  media: si21xx: report eventual errors at set_frontend
  media: solo6x10: mark unused functions as such
  media: si470x: fix printk warnings with clang
  media: radio-si476x: drop a container_of() abstraction macro
  media: lmedm04: don't ignore errors when setting a filter
  media: au0828-i2c: drop a duplicated function
  media: adv7604: mark unused functions as such
  media: adv7511: drop unused functions
  media: imx290: mark read reg function as __always_unused
  media: davinci: vpbe_osd: mark read reg function as __always_unused
  media: mtk-mdp: address a clang warning
  media: cobalt: drop an unused variable
  media: mxl5005s: drop some dead code

Robert Foss (1):
  media: camss: Remove unused static function

 drivers/media/dvb-frontends/drxd_hard.c       |  8 -------
 drivers/media/dvb-frontends/drxk_hard.c       | 23 ++++---------------
 drivers/media/dvb-frontends/m88ds3103.c       |  6 +----
 drivers/media/dvb-frontends/si21xx.c          |  7 +++---
 drivers/media/i2c/adv7511-v4l2.c              | 22 ------------------
 drivers/media/i2c/adv7604.c                   | 18 +++++++--------
 drivers/media/i2c/adv7842.c                   | 10 --------
 drivers/media/i2c/imx290.c                    |  2 +-
 drivers/media/pci/cobalt/cobalt-cpld.c        |  5 +---
 drivers/media/pci/saa7134/saa7134-go7007.c    |  7 +-----
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    | 12 +++++-----
 drivers/media/platform/davinci/vpbe_osd.c     |  2 +-
 drivers/media/platform/davinci/vpif_capture.c | 11 ---------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  2 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  7 ------
 drivers/media/radio/radio-si476x.c            |  6 -----
 drivers/media/radio/si470x/radio-si470x-i2c.c |  4 ++--
 drivers/media/radio/si470x/radio-si470x-usb.c |  8 +++----
 drivers/media/tuners/mxl5005s.c               | 14 +----------
 drivers/media/usb/au0828/au0828-i2c.c         |  7 ------
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |  3 +++
 21 files changed, 40 insertions(+), 144 deletions(-)

-- 
2.33.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
