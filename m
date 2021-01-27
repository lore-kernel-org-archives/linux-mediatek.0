Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD9BC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:32:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D10B2073C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D10B2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KVDR+pMnJQkD9UgV0uEgTOol8VZL6nB4WnxaT5Isxds=; b=1CEhwgaSVtuSuj79EBSqKZPRGr
	NYMs0StfL+aPPbJ6ZXEZlfMN+UQm4qtEZmb5tPxcJqnlLGf6nKMRZHMBWcRXgmGOIXn/bg+IgHNKJ
	zv9NUMZzSaLVsTvMawjj3VtQNDO0xweSnDHhMHgdgBaNaAh/sIMEjPwYny4yX9OQ27NWnwY70SGQT
	OZ7JCTVja/xXH7VUlUOIuYPsV3vtDfg2OB+dMJbDKbm1/T+9DpT71Nbg7iJAJvUMlkmH48t7O8iZf
	7MzXNESli/bszEDRaB0cnVpLTFsPYDDUeAIHuOVcH53Pu0wIbQcDYIHQfPlvEdfsLeCQraxevZldI
	0zbjudhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4gFb-0005nJ-LR; Wed, 27 Jan 2021 08:32:31 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4gFZ-0005mc-Ci
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 08:32:30 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id r1so1598137ybd.23
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 00:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=aKDeH71Tli9XQuLs5CYh8sW8w8ao2Xs2kCULImvJNK0=;
 b=t436uXBjJDL+yAOtaCIiKZx7xqFzhPjLrwAyt2lrxpY6ZeOSNRyktTvNjLFl24cMCq
 KxQCE6AnzrMEWkPgOKB2AB56npuFWUkiWZTJq9Z51GTIHlo2MPHhmx1RXK4r7ImMO95e
 uc7O7Z3acdjR8VnOtkAXney7xBK4KCd89aTR/S+i4FA689wAo/GF+lqMh7d2rWXuIp4a
 F2QF2nXOPUYQ0w1/UxIOJU2VhbS4ZYx4Bqzyzhj7DIfVxaHYqFzsL2S1UnNX9RIvBIFX
 ESecTmgJeJvVeIAgPWooU2VUCWpF78AicfLhkFw7VKz/+7PyrzjLC5NOXVv4xuCWsStX
 UnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=aKDeH71Tli9XQuLs5CYh8sW8w8ao2Xs2kCULImvJNK0=;
 b=YgqZMELe9IEbdV/F3KJYKgH1MNfC8a50bpBz5VlABG+0KzNA0KwGZGruNX3+SBz6dc
 1XeUuYnljIIyLt3ko7F6H3NH3dQUU6DpU/rouYka8v2PFIcKdnCQQscQk1BuiZPlMfLo
 FkV+IiN3EXEbxpYMDnWNyVgBz4DtrKVIC/c9nHHEj89lE2cDnKzwxk6XI0eEh2qZdnZU
 /hToMRH8RPXHk83Yc9pBF2fuFqaW2qfQSSA/RYrABoR5LAotYkcDPkgc8ObdCk0JqMpT
 0j0VyWR2p955xuzmCPd4GFoGgF9YmlYmPfcH9dyN4QQ+Zpu7n5b6u2IqWHo58PF1BJOn
 dw5A==
X-Gm-Message-State: AOAM532SkfaYxPXxHt0gf91FlXZyu9PLT90fxRs6WAq9JSCDamimW4T3
 DBmksACxaKXxeq+TL8Pr2oFqZ3X62pwX
X-Google-Smtp-Source: ABdhPJwHk8ASW2v639pnmwmCI7M4JqSqFGoRe11lllt8D4Z21ok2zLpv3pYTVNGlFca6bOW/98GJg4yPQ7fI
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:b7d1:: with SMTP id
 u17mr15271518ybj.227.1611736345240; Wed, 27 Jan 2021 00:32:25 -0800 (PST)
Date: Wed, 27 Jan 2021 16:31:32 +0800
Message-Id: <20210127083136.3745652-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 0/4] remoteproc/mediatek: support L1TCM for MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_033229_471572_11900C46 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The series applies after [1].

The series supports L1TCM which is a high performance memory region in
MT8192 SCP.

The 1st patch replaces platform_get_resource_byname() and
devm_ioremap_resource() pairs per [2] suggested.

The 2nd patch enables MPU for all memory regions.  The patch was
independent but merged to this series per [3] suggested.

The 3rd patch adds a new reg-name "l1tcm" for L1TCM.

The 4th patch supports L1TCM in the firmware loader.  Note that MT8192
SCP is still under development.  The patch breaks early MT8192 SCP
firmware which should only break our own development environment.

Changes from v2[4]:
- Rebases the series to [1].

Changes from v1[5]:
- Adds 2 patches at beginning of the series.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=422635
[2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/#23879113
[3]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210107023020.3224002-1-tzungbi@google.com/#23879623
[4]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=411065
[5]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287

Tzung-Bi Shih (4):
  remoteproc/mediatek: use devm_platform_ioremap_resource_byname
  remoteproc/mediatek: enable MPU for all memory regions in MT8192 SCP
  dt-bindings: remoteproc: mediatek: add L1TCM memory region
  remoteproc/mediatek: support L1TCM

 .../bindings/remoteproc/mtk,scp.txt           |  8 +--
 drivers/remoteproc/mtk_common.h               |  6 ++
 drivers/remoteproc/mtk_scp.c                  | 62 +++++++++++++++++--
 3 files changed, 68 insertions(+), 8 deletions(-)

-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
