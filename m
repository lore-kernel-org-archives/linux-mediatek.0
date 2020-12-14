Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AF4C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88CBC2085B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88CBC2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iwh5LrDhmInNeYsQQkUTvG2RjcqtcsV3LCdHrvDcUG4=; b=Kcx2R3iXQuOLMBwZDjA6G88aRs
	o4Ou2eyaWOZT6olvTfIVTaBsvXINUHDJ6XICPQ1RmruYnlG9DE5w3KbLNVIC6BECtjIgF6GLvQWaM
	oog9g4u6k6f3h1ylAgeTCxjayfkgO3OUIjy4oKDxCl1kIEwIq3BTfgL7ljs7wI/ANIR6wHVsl2s8N
	uJ/Sty113y42tDXZjespbdMJ2n1sH+hhwg8uNMg0c+qEJLO+aibCr79vXaIDYTv7LkUh1Vm15z8Zv
	5+o16qT9irCbQnepEyIwLL9k9tZTwl3yO5FXcXJba+VY+hO6KCJPuOUClWTixA9k2y9xiBmSjv2f5
	tryfVD8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kog3Q-0003hc-9m; Mon, 14 Dec 2020 05:05:48 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kog3P-0003hF-1M
 for linux-mediatek@lists.infradead.org; Mon, 14 Dec 2020 05:05:47 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id g67so19545082ybb.9
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Dec 2020 21:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=4jvDXGubsRxhn2wRkLBIdD8iEb/d8966gxDD6ar7m8g=;
 b=KlDtMcMyuXTNxGUbetGWjtd3p7hpvDYcz1yB/r9pWRwYbw/uRunc0oLBIoTyedZka/
 +uuHMnhMMyBV7rLugg+K5pmhAH0HTPVj2ACp8VNveYiyt1bsViUM4EH5sbY46MFSXwBy
 gkSSUCqzVQeUMEG8jbZtx+UiCUAiJy/73YoqXfJA0oLwxQXS1Qv1d9081Dg4F162E95u
 XwQBFC5e5B18uSMlsZ+EUEcGl+d2tO6Y8wQSpjEl9ddpnAhw8OBOpVyYZNo+7VTezreg
 UVCGtaSnTN62Yf/xe9on+NX/47S1JMoMzXs4G20PMxuQkomLERygpELc1ZVfSv+Pn+sM
 60gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=4jvDXGubsRxhn2wRkLBIdD8iEb/d8966gxDD6ar7m8g=;
 b=a3HlrJbc/9X7FdTDGAlxI61/d46LI2DY1HHNOYE4dJSow2frw0FEL+1kjiEGnOSeUZ
 wAJ/GXrPm6Ck8/fPJNNYbF/h+z+YCPMBHHnKyPFeKF6hvjAKayzPJpNol2O/2OenORkB
 lgyzko8RLxbx/1mYtQxRTmyBjiU7t+eDhHsTZfx4dIT7+Pb3s92wwFPt6yEkloI6zv2V
 mSsFQUH9+evTKCnu0egkJnSVX9zUM1p7SfP3n899tkUqVwEtyPG206b3iKYQjylf10CF
 G15uHemo14VTYfZ+rvxAyhzWx8BKlsueJ4MsKaGGgrWstWrT7ml3i4aPb6r59pK7BE/t
 q+2w==
X-Gm-Message-State: AOAM5320g8rtMOMVh6huGaObg2ieHCX8rAkq848V1kZLCOiD2qEuSQmV
 M6SJu36AzvgmpLxYM+CwTjEyuKwFUijq
X-Google-Smtp-Source: ABdhPJxUP6w2FBmL9+7gdOpsdC3JE0U//nSrm7jMotOm88ZfM8KsOD/SRblH+17axFBMDd5+7SSemS/Ft2pS
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:25c7:: with SMTP id
 l190mr4045475ybl.177.1607922343460; Sun, 13 Dec 2020 21:05:43 -0800 (PST)
Date: Mon, 14 Dec 2020 13:05:19 +0800
Message-Id: <20201214050521.845396-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 0/2] remoteproc/mediatek: support L1TCM for MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_000547_129609_5BB2FFE0 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The series supports L1TCM which is a high performance memory region in
MT8192 SCP.

The 1st patch adds a new reg-name "l1tcm" for L1TCM.

The 2nd patch supports L1TCM in the firmware loader.  Note that MT8192
SCP is still under development.  The 2nd patch breaks early MT8192 SCP
firmware which should only break our development environment.

Tzung-Bi Shih (2):
  dt-bindings: remoteproc: mediatek: add L1TCM memory region
  remoteproc/mediatek: support L1TCM

 .../bindings/remoteproc/mtk,scp.txt           |  8 +--
 drivers/remoteproc/mtk_common.h               |  5 ++
 drivers/remoteproc/mtk_scp.c                  | 54 ++++++++++++++++++-
 3 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.29.2.684.gfbc64c5ab5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
