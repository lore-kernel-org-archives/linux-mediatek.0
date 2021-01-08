Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F60B235DD
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F60B235DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qwGFHjGwy/wSg1w0R4vRu8PWdkRGRP5G6ODYRF8hvsk=; b=dWoOGpPPfOtUsd6jk5a+0y/M0l
	dqlWhK6492iAfXP9jVlBNk83TLS2Ek3i8mlyUr9cQhZHo+eUdakWXtdjyABhKAYddlmnutneOPAdv
	gjr4A9+TxI2bsEoLFq41NRhH+3yYrWazVE19mNcNqAzZHxKvTwC9GaGRQwe4nzs921MjWYPQUtNee
	0J2mWAoUegvm6x2vmxv3yTnJraZyPCpNk43t9IkxIqpgePbFze4+BhhDswTTcU7FAFufXD8TZM46a
	kSvZr72W5jlurvgqJQHGlsT96NtMo6tfEh22RVVtjwC1DtUCevTtkwSz5xJsp+2wgtkzJ+Q0/j+go
	uupBltPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxmyB-00038O-CS; Fri, 08 Jan 2021 08:18:03 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxmy8-00037P-QT
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 08:18:01 +0000
Received: by mail-qv1-xf49.google.com with SMTP id c17so7761118qvv.9
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 00:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=h/f0Sezv5E7gowm2IVkdW/Hc+xS2w4KSaSPNUtJ3G4s=;
 b=NdP6wNH+93ntnELzijpUGrug3vc8TILMasJEq8bChHTeLhS9+UCzjJK/7ml/Y3BCI6
 zwBOso7tmkzW9SJtT4qx3fX3ljnozs0XQ1q/2McWW/WODq81JIxFWFgCbe3dDCwP3QIi
 SVMvmPLsmJCtAjPYWk/dife/BGsLOzS566JmI/Uxr6RaMPiPrY4GD4WLmn6QEVKSYFCl
 ukm0Ax08crXpSFYtS2HYyvSdt9sV+D+zjDgcBDmx3kLwSa6XrvnnWGiMOOSZFGre0rvW
 CxMpYZRAeTn69paSaaIVBTtLawZWZ7vOvACeG78GcYI0nUKAcTFboARmlbyz24/Skk2o
 XKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=h/f0Sezv5E7gowm2IVkdW/Hc+xS2w4KSaSPNUtJ3G4s=;
 b=NupF7/eX9iM3WqLi1DaZGi7d2Tj9/1cXNsbqSc4ND0gfO90hW2ukcjOGJ954bR3kGu
 W6T6AhPsZdrQ283tbA8t/bjzMLKt5ZeOvp4AuNUf2uWOo65OaxvSYWxMT7Ysf91JmFTr
 FdQe8ELXEx1netwqdIzWso+SF6MEpvKAKm4tlV53wPAR+mSf8lfe7kSNn11z6n0qBrLJ
 ZDq0gNYtKuJPlMWCGtWHFPpFjc4HXHli0K5KsjxgbT5W0SX4/D4ail0TU8Bx6ajA2nIy
 tmniSK6TjwbSzOeMk3cAyy5bm+6MabVaW29zzATvdUBPtGik8PFYBK5eA6DJdpkgenBG
 EV0A==
X-Gm-Message-State: AOAM533/nj+Gvgr/W40ArBe7X/ur/es5Ua/jAz4YIYZ6rmXtmuUtYy1H
 JgXUSfO0XJdiuTkq1i53uvwTDVJZWyIb
X-Google-Smtp-Source: ABdhPJxH+xzloJvfPk+mEmyk1fhEyLc3F/iKaV5CFbzljxIu7V5/Ld0yM+l56aUf/z1P6Lnk5AWbn2pG4FLo
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:cb:: with SMTP id
 f11mr2346237qvs.15.1610093872893; Fri, 08 Jan 2021 00:17:52 -0800 (PST)
Date: Fri,  8 Jan 2021 16:17:34 +0800
Message-Id: <20210108081738.2175224-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 0/4] remoteproc/mediatek: support L1TCM for MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_031800_896959_712D437C 
X-CRM114-Status: UNSURE (   9.02  )
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

The series supports L1TCM which is a high performance memory region in
MT8192 SCP.

The 1st patch replaces platform_get_resource_byname() and
devm_ioremap_resource() pairs per [1] suggested.

The 2nd patch enables MPU for all memory regions.  The patch was
independent but merged to this series per [2] suggested.

The 3rd patch adds a new reg-name "l1tcm" for L1TCM.

The 4th patch supports L1TCM in the firmware loader.  Note that MT8192
SCP is still under development.  The patch breaks early MT8192 SCP
firmware which should only break our own development environment.

Changes from v1[3]:
- Adds 2 patches at beginning of the series.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/#23879113
[2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210107023020.3224002-1-tzungbi@google.com/#23879623
[3]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287

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
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
