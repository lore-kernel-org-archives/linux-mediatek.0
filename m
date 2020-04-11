Return-Path: <SRS0=Ks85=53=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0B7C2BB86
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 00:20:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE71217D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 00:20:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E3URF9Cu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9YsHLT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE71217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5eiTYBYiFS+7PI1qz9vjpHyWxTTV+jBRNM2NJZN+NI=; b=E3URF9CuATkODL
	nQyr8mwVwNcKrSuL5S33cbJL4wEz6eMHyr4SAYDiG+frNBOZyukNBlYlXtUwLIrZk+jdPCEInYrZ3
	wwOJkAUa/3lyNGr7f+nnMEovrZeVmHJU8Yonh/LuAgo4c8STgH1k64Ab30PGbmeaNWECIDZOqXyqB
	iD1nA/IsAC8BPGctqleYVrJHl+s3Vpi6XdpPGcVGNF14dG2b72hMb4NQ307tGHBuA66p5Cdvt2hAC
	mHQtBf8IMkJqEsmL+Yr/oTv+VZQyvmVSKaqSbIkrU+jJAMQLaa4fx1urO/92y9wa1LSpgW6Iq0nbG
	M3y1kDWDpjnUHsttYEMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN3sh-000335-Do; Sat, 11 Apr 2020 00:20:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN3sW-0001kg-EG; Sat, 11 Apr 2020 00:20:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id w10so4070692wrm.4;
 Fri, 10 Apr 2020 17:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sRH3JFUeptItyC/byHDQ4iblgMkc70TZ02v71lNx8bU=;
 b=h9YsHLT94sq1B7Gd2m9vfQjDDjwuRywJ6stYTd2AoaMifIgbj8aPHmg3MZc3BoP9P/
 /7aTVdr0M1eFeFPMZPgzkCLcaU3Af5Qk0i3U8sfgF+Jz1nc9aOALSLSTJ5z4cDSX4dq1
 pJwUO/LPz8t8NcEQHLC7LwmlHKHxASvXLrfG3w0nXVEujoAuWmD6VFQdANXtkTlx9Ryr
 08WOcyi/i/5aXV6mT6jV7xD4XhcsMidJAkhTEO4LxHRqeko6zaIS54HUyhxC72JRV0l2
 mz8FwRIXLGvWNpBqpPXVK0BYzsWmkRKct0qN8QKv/C09UbSBe0cwC3mFxwmuvhmYqlKS
 igwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sRH3JFUeptItyC/byHDQ4iblgMkc70TZ02v71lNx8bU=;
 b=MzmuE5AapYg8Gd5BJXqaKD0j7Nn6m4PZWNyrBhoxQHlAxKG0l4wTfi6ZCpgYbcJ5S1
 J2oopvsMRBhSb5gPGqdqX9iYdq21+/sgsvdpEXva055+dYPeB+FrpHfp3kT9afgUIgpi
 nNRuzO8yHO9LTZKTlGfXW/1cSCrTkb0BuRMQQZNpl6ZwzgiPeQGzDSOBwD9MH9rXguzH
 UJeJX/RZ4WMiiNHl+21ihtiB8sPoNyOx8WKl42aggIpjDebk7XgRkVL8dwZWo7eLTHiY
 KV9TbszkixHzAGovQfL0WXxeOyCnX6K2w1tM4pblkZCwx8pm4kYCfUIQqNRVWjaxlmf3
 Lltg==
X-Gm-Message-State: AGi0PuYphoS/3WFettH1Vy+cfr2E+pGZoG795k0tYK51cg6uxpXElYak
 qWrXdzS3OY+vF7pbjHul8/Lqqby6wg==
X-Google-Smtp-Source: APiQypJv/An5qeP9XsEFImZSPQ2G5er0IpFLyFLLqbKFf4+MQFDstxbiXVJ03iqQxAJ7vjr2p8J8og==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr6744639wrs.22.1586564406327;
 Fri, 10 Apr 2020 17:20:06 -0700 (PDT)
Received: from ninjahost.lan (host-2-102-14-153.as13285.net. [2.102.14.153])
 by smtp.gmail.com with ESMTPSA id b191sm5091594wmd.39.2020.04.10.17.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 17:20:05 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Lock warning cleanups
Date: Sat, 11 Apr 2020 01:19:24 +0100
Message-Id: <20200411001933.10072-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <0/9>
References: <0/9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_172008_529542_14618C96 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, boqun.feng@gmail.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds missing annotations to various functions,
that register warnings of context imbalance when built with Sparse tool.
The adds fix the warnings, improve on readability of the code
and give better insight or directive on what the functions are actually
doing.

Jules Irenge (9):
  dm snapshot: Add missing annotation for dm_exception_table_lock() and
    dm_exception_table_unlock()
  mt76: remove unnecessary annotations
  hostap: Add missing annotations for prism2_bss_list_proc_start() and
    prism2_bss_list_proc_stop
  mac80211: Add missing annotation for brcms_rfkill_set_hw_state()
  mac80211: Add missing annotation for brcms_down()
  scsi: libsas: Add missing annotation for sas_ata_qc_issue()
  scsi: bnx2fc: Add missing annotation for bnx2fc_abts_cleanup()
  power: wakeup: Add missing annotation for
    wakeup_sources_stats_seq_start() and wakeup_sources_stats_seq_stop()
  power: wakeup: Add missing annotation for wakeup_sources_read_lock()
    and wakeup_sources_read_unlock()

 drivers/base/power/wakeup.c                                   | 4 ++++
 drivers/md/dm-snap.c                                          | 4 ++++
 .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c    | 2 ++
 drivers/net/wireless/intersil/hostap/hostap_proc.c            | 2 ++
 drivers/net/wireless/mediatek/mt76/tx.c                       | 4 +---
 drivers/scsi/bnx2fc/bnx2fc_io.c                               | 1 +
 drivers/scsi/libsas/sas_ata.c                                 | 1 +
 7 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
