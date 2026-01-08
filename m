Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC81DD1D47A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bZzS0zHELVYtXurlWpt7FUgJqesUQqjQtQOkePfmBf0=; b=aE8KD9FOWPuE9gQ3mTitgODds3
	2eS3mt/qkc1QYabI4CfMXjS2AI8vGHdTJwKHHGqLRdmall10/RdYcajFS0mlIcn4EZ4JM1WqQko9f
	FiJgtduewdwNSSmFYudeYbsVM0beDIcrh/+LfMD9q/wICfIlkXIcasubults3mOaZKtLkgbFjEvDU
	OvNsMUDcw6qXn4TfBbKJQeycwbDLX7F5RKs0wti3ActRkkEI6f74EQ9x5H0ywb7JXWLtaTJk/dDCn
	YrcM2Sb3bQK9ZYQKHxJr3hJXWpbx+6xzwQd1YRt2/lgaSIN4raTx9BTLFOBF91ZN39rTsI4yBWMoQ
	2q0GuSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrrF-0000000HVfx-49ws;
	Thu, 08 Jan 2026 15:23:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrrD-0000000HVfJ-2syx
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jan 2026 15:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 185E142B88;
	Thu,  8 Jan 2026 15:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC136C116C6;
	Thu,  8 Jan 2026 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767885807;
	bh=lKUjOpQjsrio8LVg2MdCngrlvUGtYnTK5X3c+0ZSIYo=;
	h=From:To:Cc:Subject:Date:From;
	b=n3Qrp9HlW1xrqaqUaRwRMbdaq/9N4aGFW+NM127LkZkMDfTYE4inb+azVV5tht7i8
	 QsiGoMvagiPVlUKtIhp50p11MBGyT/TtnjAgAoEnjQtMXrl/15OJku0y6IHN/07uNJ
	 QGsr1YwJnD1wFYjKKISVfoNwpJQvNUi7pJ5CziFdSl83plkXG2W5KnmhDhXHQMmOLc
	 UcnVy8PVrDXgtNGiPfhCjTe9oQ3Z3oXNuxxV7Dg3XKXi9q1DhINovMiOPShOc9dx3E
	 HQFrEh6/fCgDhY+qmXcUfod23YvO7XjP3Y50sqsx4wzPxHcI0DQtYmbiAP6/GuOtiV
	 FGWJ+3+xMegew==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux PM <linux-pm@vger.kernel.org>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Subject: [RESEND][PATCH v1] media: mediatek: vcodec: Discard pm_runtime_put() return
 value
Date: Thu, 08 Jan 2026 16:23:21 +0100
Message-ID: <3396476.aeNJFYEL58@rafael.j.wysocki>
Organization: Linux Kernel Development
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_072327_797678_A892A3B8 
X-CRM114-Status: GOOD (  11.46  )
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

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Printing error messages on pm_runtime_put() returning negative values
is not particularly useful.

Returning an error code from pm_runtime_put() merely means that it has
not queued up a work item to check whether or not the device can be
suspended and there are many perfectly valid situations in which that
can happen, like after writing "on" to the devices' runtime PM "control"
attribute in sysfs for one example.

Accordingly, update mtk_vcodec_enc_pw_off() and mtk_vcodec_dec_pw_off()
to simply discard the return value of pm_runtime_put().

This will facilitate a planned change of the pm_runtime_put() return
type to void in the future.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

This is requisite for converting pm_runtime_put() into a void function.

If you decide to pick it up, please let me know.

Otherwise, an ACK or equivalent will be appreciated, but also the lack
of specific criticism will be eventually regarded as consent.

Originally posted here:

https://lore.kernel.org/linux-pm/3690736.iIbC2pHGDl@rafael.j.wysocki/

---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c |    6 +-----
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c |    6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
@@ -67,11 +67,7 @@ static int mtk_vcodec_dec_pw_on(struct m
 
 static void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
-	int ret;
-
-	ret = pm_runtime_put(pm->dev);
-	if (ret && ret != -EAGAIN)
-		dev_err(pm->dev, "pm_runtime_put fail %d", ret);
+	pm_runtime_put(pm->dev);
 }
 
 static void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
@@ -71,11 +71,7 @@ int mtk_vcodec_enc_pw_on(struct mtk_vcod
 
 void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm)
 {
-	int ret;
-
-	ret = pm_runtime_put(pm->dev);
-	if (ret && ret != -EAGAIN)
-		dev_err(pm->dev, "pm_runtime_put fail %d", ret);
+	pm_runtime_put(pm->dev);
 }
 
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)




