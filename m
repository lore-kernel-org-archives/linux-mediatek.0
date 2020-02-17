Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2928EC7619B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F278B2070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WfdpcMwR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="nEeqMrk6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F278B2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cVpsGfYa5SIaAaMG0bCWwYdEap/VX9XLBMe3m4cQzoE=; b=WfdpcMwRWEL9+d
	8TdUpDH9eqbqw8DmWiqcWbZG3S6V2fVjMFqmVzLETZYLG/S9DFj0F9We3NLp1+hRlqmtHMY3r/Zbw
	IDko0mwuQbXtSmHoDIozVmaNFxtB246s22eQXnqJW1/ZnZoUazR7Z7e2d4/LdSS33QE/YoJLYASlt
	l4S0aFuL7FYVjZi9G9R2It9PiiAs+kSuFGP/xB9vbxDz9QLSpR11YrJwemB+UkSXKyZT8b2dOLu+Y
	Tm/nnRZpifBnmuvckSxIjRmP/VoOpKGYDynAZ0A6mF56OszFNXC3JPzC4N5J+taQoktstcl+11/ub
	82BXapk5TeZvdF5fo1gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3WuJ-0002rA-1u; Mon, 17 Feb 2020 03:17:15 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3Wu8-0002hQ-Md
 for linux-mediatek@lists.infradead.org; Mon, 17 Feb 2020 03:17:06 +0000
Received: by mail-pl1-x649.google.com with SMTP id t12so7484003plo.4
 for <linux-mediatek@lists.infradead.org>; Sun, 16 Feb 2020 19:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=95LDy22BpOxyIQvBk6FRPJlH91thVepwqVtwc6u1oGw=;
 b=nEeqMrk6uvG7rmPyXEGMSsIzelMz2dF99i37OZljcuo4oh7xZZoesAk4KrAQMOsWWY
 dTXreQy8BM9DKwR58wY7FRf4V9otbgQ2XYeTYDnHZE5mwrwLwuzImNlHIxOYMJTELfpn
 Oj3mN6jy/gx0BWtD1qG2u+X3A/guxcA70lSFPD9ekQq7rxSFDroFkBkLCEB23lH4+s+Q
 z9csLL3pxzo89k/O1pFjcwy9Wsr5bFBxD1GgMiWnQ4CKwXX9VjrgXroTSSEhWGrFgWCn
 A8/mcR4NzEWuyhlTwVoQ1RUK7TvfpCEUgR7ilK/luqlKNWo5sZacMLWsquJBcfmQt92V
 iirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=95LDy22BpOxyIQvBk6FRPJlH91thVepwqVtwc6u1oGw=;
 b=aiLxxX5SrHeZ4D/56sSVovcQQp/ZqDzc7TPElXII6px8HhxpJDdLECIx55njRuIn1a
 xM0MeyfMm/nfapzya8FdKpycuFQlVDGs/ULROEdxffJjfOIV1gzijCFLl8rfvd/wRY99
 A0sEw8+psJYaokU+IfXGVR6H+O9wT7od/P+YjKu9/DXoMF41uuU9uBhB1fbe/A8c9zlM
 nTfGAISOUHLDH3veisZ9Qm4ofM7ZtlhYIyiLvwE0rQh/csHDtupVH8mVnnyBRcUjj94W
 iQMs0qIrXgZ6ducdgdyPZMGU5DiSnGmwX2jbXCQNSjwovy5YpNihCqB6dbfZuiL7J4fI
 B5nA==
X-Gm-Message-State: APjAAAXQcTzc2jF2yadT3XYqazKiui7z7RG8+8pggnfnnfLDnjARf7/x
 fibvuYws3OBKBl9ACrvG+QQNT6WcG1fv
X-Google-Smtp-Source: APXvYqxBjslw8uxUiWz+4Eukc1k6XyGzGLU0KOA8j+kAfZKXNmE12yvV1aiYrnwpHrjkFRt+J4989fLX4IEC
X-Received: by 2002:a65:4c82:: with SMTP id m2mr15138678pgt.432.1581909421205; 
 Sun, 16 Feb 2020 19:17:01 -0800 (PST)
Date: Mon, 17 Feb 2020 11:16:51 +0800
Message-Id: <20200217031653.52345-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2 0/2] ASoC hdmi-codec: fix HDMI jack reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_191704_734430_2DEEA2C5 
X-CRM114-Status: UNSURE (   8.23  )
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

With proper unbinding audio components and inserting the HDMI external
display, kernel crashes as the following messages:

Unable to handle kernel NULL pointer dereference at virtual address ...
[snip]
Call trace:
 plugged_cb+0x1c/0x74
 mtk_hdmi_update_plugged_status+0x48/0x6c
 hdmi_conn_detect+0x1c/0x28
 drm_helper_probe_detect+0x110/0x170
 drm_helper_probe_single_connector_modes+0xd4/0x608
 drm_mode_getconnector+0x1e8/0x418

The 1st patch fixes the crash by notifying hdmi-codec's consumers to not
report jack status anymore when component removing.

The 2nd patch fixes race condition in mediatek/mtk_hdmi.c.

Changes from v1:
(https://patchwork.kernel.org/patch/11379979/)
- added the 1st patch
- use mutex to protect plugged_cb and codec_dev in 2nd patch

Tzung-Bi Shih (2):
  ASoC: hdmi-codec: set plugged_cb to NULL when component removing
  drm/mediatek: fix race condition for HDMI jack status reporting

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
 sound/soc/codecs/hdmi-codec.c       | 10 ++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
