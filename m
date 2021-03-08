Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31840C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:36:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B8F165163
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B8F165163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lqlGE+AUsICOmG7Yeo63yftkpDgLlK6VEpVOU2J+nqo=; b=MYBhz6nxhOFgQrSJaEuxBDdnQg
	V7i31HM0rDSy7IYgvH8RhUslrmHXLBwjokFceShghqSR6XjjgLPecCCLMcXrJLHHR0nA2VkYWZwCb
	pnGVHopVlMFBNr1SKaa5cDEvXWI2rpXNUtgFjGafnWZY4b5lVXNhx83tUhHsMtze6s4hw8SQeAOmB
	x1iINDi3qaAzpakaq1c4scro28+tGWFUiveLNeLA66H06qimhpTlcyXD1e4+XD05Gb4ntnsy/QBZN
	rXkwvxD/pnDenkdkQyE5gPZK+7kAE77pon3afp07unceIK99TdjB98AEsNx42MRo+AYxm7PzrQL4z
	Xce8Ejcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ7cz-00F7G2-6U; Mon, 08 Mar 2021 04:36:21 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ7cu-00F7Dq-KW
 for linux-mediatek@lists.infradead.org; Mon, 08 Mar 2021 04:36:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso2382889pjb.4
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Mar 2021 20:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frFr0rEwZ1mvFx0ODNHz2Mn0uGUh3IUayStZXkwe3Y4=;
 b=oS/pZFhfYsLgWpBMD4U3ondO/K8Dlcn5ex9y+wNgTIJbS6v2IOE/SRXl2p6TL8OFGv
 HUJ1yNbIbYQxJthZQA0Cm41Dx593QLs7qhSoqDrKX9xkwfgHh4TxVYaqB8iyI/q18WOX
 Kj1yLcZRMuMVX0nYsESD3NORPOnyM9AtN9Gic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frFr0rEwZ1mvFx0ODNHz2Mn0uGUh3IUayStZXkwe3Y4=;
 b=f0Vy82Zg1cis/B7Ok0QZqWhFXT1goO6NSmUy05dV+c6TjjlcVVt+xiM07KKu9EYN52
 Tmni7LM0lwdIi1GVZMcyDnJiqH6HCdYE6Buua459r73WNqoOCCoTOrR6uAL2zJQxStu9
 jQBRO0JY/W+FbpR1u/TAYK2M9CKDnZb+iHYJq0WsBR33AwPMKABmqMNsLBOntQ4fZSiT
 2Hsvwy8Gveelvo0h5E9H4Tm5BSpa7uWK38d0r22cHxZ/dBK8UHngJmk7juJ7FnEhKeye
 UfpzTflV7RrB3umTqEYluQr6kn6r8PJd4He2K/b13fEgGrjh9GQ5xLt9cU/9x6O46qeK
 wh3w==
X-Gm-Message-State: AOAM532GlkgDpcdxekSiGgidI+YUMYWq5vfnVUPYdDw4h0lcCU05lXmG
 uwBar564PfYN8BRZ8/uHWA65Zg==
X-Google-Smtp-Source: ABdhPJzjTHgZfblSCwgJ8vilflebyR1Y+UKGgoiG73tGWtfd+EgXsnrLI5gUCZ/UqbMJyjDyZQpraw==
X-Received: by 2002:a17:90a:1049:: with SMTP id
 y9mr22687217pjd.173.1615178174280; 
 Sun, 07 Mar 2021 20:36:14 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5da1:da1b:5bcf:2d46])
 by smtp.gmail.com with ESMTPSA id q2sm8191562pfu.215.2021.03.07.20.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 20:36:13 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v16 0/2] add power control in i2c
Date: Mon,  8 Mar 2021 12:36:05 +0800
Message-Id: <20210308043607.957156-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_043616_789853_10F1CBEE 
X-CRM114-Status: UNSURE (   9.52  )
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

Although in the most platforms, the power of eeprom
and i2c are alway on, some platforms disable the
eeprom and i2c power in order to meet low power request.

This patch add the pm_runtime ops to control power to
support all platforms.

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

Bibby Hsieh (2):
  dt-binding: i2c: add bus-supply property
  i2c: core: support bus regulator controlling in adapter

 Documentation/devicetree/bindings/i2c/i2c.txt |  3 +
 drivers/i2c/i2c-core-base.c                   | 93 +++++++++++++++++++
 include/linux/i2c.h                           |  2 +
 3 files changed, 98 insertions(+)

-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
