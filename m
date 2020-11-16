Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F35EC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:44:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1CA9208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:44:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Izii9Dxc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="nKf4wSaS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1CA9208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6xEZ/HWNP5IlXsWYdnMeF7473N4Yo308lqTOpvPxDko=; b=Izii9DxcRYpYdxQYdgtD4PzfIr
	GzM7slOdstAfk5eVHMxsHwSz+XisGb+I7QhT11moqhSEUYRGhSLiABD3kfalH9h7DTQzButoEnZLQ
	prAa7OVeyG11Yl2kt804l+bHpgOvOg+OcOqSX98vY+2KEmDR1Z9sj0vAsdWLs2asVqiixr6wwk1qV
	K9b2aHHkWWiabJP56lpGbpV8RnOS+RjBDSyYLEuGi8bq5X2fiML86KSW10GahQ31yysKvPCwNsu+Z
	QnJbzQJTpXqyQqO4onVmB1qFYiqbaUe9v0lS3b29YXeyS3aMSt7u4LNLg5G85GA3cjXi6RrJ5S1pR
	X5QfC5tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea7v-00042G-6S; Mon, 16 Nov 2020 08:44:43 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kea7n-0003z6-Nl
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:44:36 +0000
Received: by mail-qt1-x849.google.com with SMTP id i14so9648676qtq.18
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=EYm0YpIuSEKXmoOwhp5dqYgsEVKwf0LgB8WVW+JP2iU=;
 b=nKf4wSaSa1Oa8WDBPXVMJS40jcU8haoimLiQE4LfvJHnlVTCGBPYDFtq64KX0dTsOr
 obCVwYpP64WhpR0b9chrWC0mfd4H5bO2PsZl1s7Etb/70r1OgMrFl/R8UFeI2/0wMnEO
 g4wFxUz0iKZ03GJiOe434LYHYNM7zKVuzQPa8861/k3RbQDcbfnPEWeK55g1taexjf4R
 pUTtXwPqyFjRXYBXQbsichx3gtULikKwqPwEPtE1HHC9JJf64SoJ3+aL24QGVJqswkx9
 VY0NY6kk/7z52wHBAFQFqxo7cWHhM5RIGxm2QW/FQcnmRPElsjd4ee/lsZps0rUEJh5y
 qJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=EYm0YpIuSEKXmoOwhp5dqYgsEVKwf0LgB8WVW+JP2iU=;
 b=ZT42pFHWrnZEa8bk+bmN+5k846caoMnvB0Zf0Zj2wQ3vxXnDG353LBqIuws83OYfgZ
 zYQKAVHAlbBZnm4iyt+h80IQwKTs4IJTBQclFRT6h4+ZY2RLkA3GXeAWwA377ou68FBB
 EBYzRAY6OPM/7BiEi3FUdRTTdjjlHf87RXLyo9UHxe5YXKUIF+QLdCBuEFePgyqlXpCv
 NieuCkH4BqZSt8HRx5KQYaZXZH5I/bYqbis3sDiIeBtvpQrYLDTuONowYADrV+1uMRIE
 3Aempv8dlXGzuOv/lzLUaPi9xxwmzktV8ghSpk7yVe0EHXB2+YdDS73Pc+ESHTmpwO/c
 Olqg==
X-Gm-Message-State: AOAM532atlP0HBpiDA5XwNsg3WHM94KwG6pTv38sMhCnq4LJ+8dEE2O9
 qZB9/cjVsoKLsTMNvsBBJsK5FC2XB5W6
X-Google-Smtp-Source: ABdhPJzNwWAgPW2u7kRBv4mmNN2RUlmEWb2T+8MS/r1URNN52cr2jtibw6055Yx7UYTLAjL3HZeWEe5EC4RK
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:df0f:: with SMTP id
 g15mr14565849qvl.19.1605516271856; Mon, 16 Nov 2020 00:44:31 -0800 (PST)
Date: Mon, 16 Nov 2020 16:44:10 +0800
Message-Id: <20201116084413.3312631-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 0/3] remoteproc/mediatek: read IPI buffer offset from FW
 binary
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034435_786422_FB70E716 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series reads the address of IPI (inter-processor-interrupt) shared
buffer from the FW binary itself.

The 1st patch fixes a boundary check bug.

The 2nd patch skips a program header to parse if filesz is 0.

The 3rd patch parses the FW binary to find the shared buffer address.

Changes from v1:
(https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201113070207.836613-1-tzungbi@google.com/)
- rebase on top of some sparse error fixing
- update 3rd patch's commit message to the latest

The series bases on https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201116082537.3287009-1-tzungbi@google.com/

Tzung-Bi Shih (3):
  remoteproc/mediatek: fix boundary check
  remoteproc/mediatek: skip if filesz is 0
  remoteproc/mediatek: read IPI buffer offset from FW

 drivers/remoteproc/mtk_scp.c | 89 +++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 32 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
