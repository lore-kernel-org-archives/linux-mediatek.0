Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oLbHprJbPO4fcOVCWCPy9b+NLtTSajV+TzvsQhYFgoI=; b=4wfNLUV44wxEdt
	vewTrkFQWgohy0NoCX8oY6CieKwU8G4K2fWwwH7oLzDzpFjZoDpOYIJlYPrV6+HDanTzcq6Ly+pjR
	UtX6Zc69yhH7nCN2d56sopaBis7cll1NWR/yx6OpkU8Kl4vZ+bijuWXoUQ/XLTlYJnomAQM812epC
	yITamiyy6TkJfXKq16/+SKm8nSqbIf1YVg5NTdjx1teym8zieZZrOjx5w7SUz+aV+CkfXTz46IZUn
	swqbg3EJYpvNUqojNyCUb5y4rWrDtqwNfBg+U3hr/Xo/yideTPaxmeyTfmrdJvPIYJHkiEGSllkee
	P73mZZN8QiiE2r//Pohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpxiG-005c2g-6g; Wed, 24 Nov 2021 19:13:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpxhz-005bmr-Tn; Wed, 24 Nov 2021 19:13:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F3C061058;
 Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637781211;
 bh=ShVkegqqlX9t3NgDlpdxjJkZAHHvUFAOs0QktUXWaRU=;
 h=From:To:Cc:Subject:Date:From;
 b=JIPgVQG3LDY5LNEy7Z/faVPS18QIVYSpCdrmNV0RLG6Q1njtwPhcvrv7OBO3+7Wi5
 fg5JlbrEm2Wg6L/E8YSB0hKu20+VA1KuMhtyRVALaxKGjWbRFBjGIFlJhHi9wf9S4R
 auZDiv2kx5dj6jSh53Zq6PZ21yjcsxzVzdQHUQgSGNjUKctEUU09E9oRip3y4igX1K
 cwLDePxNW8/es+iXmX5r3az0ypdnogpJP9lh7RceFlHG3Wa+fAJeknC3SdyHHKXZum
 ZRdsPu+gqIz1mchnAbaI07zLtdwBCVXNdO4Vriy113unQ1nq61PimTpY3SDS44zW2x
 C9rQwPqdmBvGg==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mpxhs-004Q50-Eq; Wed, 24 Nov 2021 20:13:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Andy Gross <agross@kernel.org>, Antti Palosaari <crope@iki.fi>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Todor Tomov <todor.too@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: [PATCH 00/20] Solve the remaining issues with clang and W=1 on media
Date: Wed, 24 Nov 2021 20:13:03 +0100
Message-Id: <cover.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_111332_030750_B42EE577 
X-CRM114-Status: UNSURE (   9.75  )
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

Currently, using clang with W=1 and CONFIG_WERROR causes media to break.
This is reported by builder.linuxtv.org.

This series solve the remaining issues.

Mauro Carvalho Chehab (20):
  media: adv7842: get rid of two unused functions
  media: saa7134-go7007: get rid of to_state() function
  media: davinci: get rid of an unused function
  media: drxd: drop offset var from DownloadMicrocode()
  media: drxk: drop operation_mode from set_dvbt()
  media: m88ds3103: drop reg11 calculus from m88ds3103b_select_mclk()
  media: si21xx: report eventual errors at set_frontend
  media: solo6x10: add _maybe_unused to currently unused functions
  media: si470x: fix printk warnings with clang
  media: radio-si476x: drop a container_of() abstraction macro
  media: lmedm04: don't ignore errors when setting a filter
  media: au0828-i2c: drop a duplicated function
  media: adv7604 add _maybe_unused to currently unused functions
  media: adv7511: drop unused functions
  media: imx290: mark read reg function as __maybe_unused
  media: davinci: vpbe_osd: mark read reg function as __maybe_unused
  media: qcom: camss: mark read reg function as  __maybe_unused
  media: mtk-mdp: address a clang warning
  media: cobalt: drop an unused variable
  media: mxl5005s: drop some dead code

 drivers/media/dvb-frontends/drxd_hard.c       |  8 -------
 drivers/media/dvb-frontends/drxk_hard.c       |  6 -----
 drivers/media/dvb-frontends/m88ds3103.c       |  6 +----
 drivers/media/dvb-frontends/si21xx.c          |  7 +++---
 drivers/media/i2c/adv7511-v4l2.c              | 22 -------------------
 drivers/media/i2c/adv7604.c                   | 18 +++++++--------
 drivers/media/i2c/adv7842.c                   | 10 ---------
 drivers/media/i2c/imx290.c                    |  2 +-
 drivers/media/pci/cobalt/cobalt-cpld.c        |  5 +----
 drivers/media/pci/saa7134/saa7134-go7007.c    |  7 +-----
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    | 12 +++++-----
 drivers/media/platform/davinci/vpbe_osd.c     |  2 +-
 drivers/media/platform/davinci/vpif_capture.c | 11 ----------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  2 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  2 +-
 drivers/media/radio/radio-si476x.c            |  6 -----
 drivers/media/radio/si470x/radio-si470x-i2c.c |  4 ++--
 drivers/media/radio/si470x/radio-si470x-usb.c |  8 +++----
 drivers/media/tuners/mxl5005s.c               | 14 +-----------
 drivers/media/usb/au0828/au0828-i2c.c         |  7 ------
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |  3 +++
 21 files changed, 36 insertions(+), 126 deletions(-)

-- 
2.33.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
