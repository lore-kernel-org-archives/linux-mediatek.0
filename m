Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A1FC6FA8F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A/I5taWqYocU0OpThCzxV/acNgUnkDEENY3xVb7wNfc=; b=SkRvFpQSaoZisU
	w4u/5Y6asLnvJ2RCjDLeh65kg9hRNfxCXncMUOpgrn/+aOuG7tDbP6rRJ/3Xszv66lV1LwddqZvaV
	/EIGKrRSh00JEp/ATnCYKqrLvDeWkOOr0vncOSAkF7gQsuVI/88Wep59hcRvtVOQ01FtUABKUCg0W
	qR7eK+3kCigQgZAah1cL7yMKxffsekdzxw/Unkrw0Mv2875C1pVB17tg/Gj/UMoUGuQ0nxB+z7unC
	59rwT27/YCFwLSApdaKOdhqicXDP5t97H8himLx92fzsWbSKsjgt3HY/cwIKRoKq+3kAcI9rN9EQM
	nqBCzSjTKaGI1LnU8XKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7mo-002tjC-02;
	Thu, 24 Aug 2023 10:41:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7ml-002thv-0N
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 10:41:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bba48b0bd2so45016725ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692873712; x=1693478512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/I5taWqYocU0OpThCzxV/acNgUnkDEENY3xVb7wNfc=;
        b=lFjArl4n/ZcVrdCFJS0q4L0NJTCnLVp9Ig2zjEjsYqkNjmafnMaHjD4iOwjtcS2Jy7
         jFJtBo9q6C5RKuSUAbV8J/W3jSs9v2yZJyDWL0gN7UCBhh9C3X4iSdM3GcihiLaqZ75y
         SlxwBbOXIUIF5AN7UafZJsT2wIb5QaxB2wJwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873712; x=1693478512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/I5taWqYocU0OpThCzxV/acNgUnkDEENY3xVb7wNfc=;
        b=izuDunoLzp29zwuh317MLmZ7raQRoBQ9H7eJMO0YGoeiommIdXqqKivTJduCGjE9rl
         R/zolse1gBlyK2ckO+F4xPJeO3kK0Krhlorpwwb1liN+/YFnYue5xr5ddiX2QyVjT61m
         atNRFSh+HKPu7YOKF7jopnwW3jKeEFjKvEsCti+J2rSvZE/BUl6GPBi7v54ocjAK7zxT
         gF6koxid/CSlS61LrxhYts9Lmhb9i+CaKrZ58m8I1mOSLLkFSDrM1QDibae8zbG4A0Z6
         O4QQCEf4/v2txrQ6Vo+AcBVHijmOvG7IJeg6DaUmp9NWWE90XGfZZJuYOi14iThNOaEk
         d+hg==
X-Gm-Message-State: AOJu0YxPwUdjP/oZI35d4g//eXFxB1WaGHFhpdINLakKJX3Q8lmFSgcx
	Mu+rrpZcxkIRytfA1Ak6gtdTqA==
X-Google-Smtp-Source: AGHT+IEz6LdCYMosyZ5GXgijBrljcB9v//RQ3p4COqu2hVs6APjaJVb3ECJXw5jyUglsTIDBX4leOw==
X-Received: by 2002:a17:903:491:b0:1b6:6b90:7c2f with SMTP id jj17-20020a170903049100b001b66b907c2fmr10968815plb.55.1692873712648;
        Thu, 24 Aug 2023 03:41:52 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ed6d:42e3:a23:8316])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b001b5247cac3dsm12524645plx.110.2023.08.24.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 03:41:52 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 0/5] spmi: Add and use managed resource helpers
Date: Thu, 24 Aug 2023 18:40:07 +0800
Message-ID: <20230824104101.4083400-1-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_034155_150886_8FA44191 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series adds and converts to the devm_* helpers in the SPMI driver,
based on the suggestion in [1].

While at it, I have some patches fixing other minor issues as well, like
reordering the remove sequence in spmi-mtk-pmif and using proper error
return code etc.

This patch is based on next-20230824 and [2] which is not yet applied,
in order to avoid potential conflicts.

[1]: https://lore.kernel.org/all/20230821033532.GA21555@google.com/
[2]: https://lore.kernel.org/all/20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid/


Fei Shao (5):
  spmi: Introduce device-managed functions
  spmi: Use devm_spmi_controller_alloc()
  spmi: mtk-pmif: Reorder driver remove sequence
  spmi: hisi-spmi-controller: Use devm_spmi_controller_add()
  spmi: Return meaningful errors in spmi_controller_alloc()

 drivers/spmi/Makefile               |  2 +-
 drivers/spmi/devres.c               | 61 ++++++++++++++++++++
 drivers/spmi/hisi-spmi-controller.c | 32 +++--------
 drivers/spmi/spmi-mtk-pmif.c        | 28 ++++------
 drivers/spmi/spmi-pmic-arb.c        | 87 ++++++++++-------------------
 drivers/spmi/spmi.c                 |  6 +-
 include/linux/spmi.h                |  3 +
 7 files changed, 116 insertions(+), 103 deletions(-)
 create mode 100644 drivers/spmi/devres.c

-- 
2.42.0.rc1.204.g551eb34607-goog


