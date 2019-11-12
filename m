Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B550C17441
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 11:04:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14AF2084E
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 11:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/3KnS1G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K8pqxR84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B14AF2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PtQ5t8gg0I8cUuAbLga5iwydlE+ks8crf6gvJx6vOQ4=; b=K/3KnS1GlemNlK
	IgxTY9F2EPdR5p7bYmCB0bKS30fm0T+sOdYTCKygJNsrgFbsQKdllTMSRjg3d4ZtZSMTaQPGDKnm9
	UEDulWoXlrQlpqFIPEfg7gZRCZb0Mo4+Ikyewo1ZZ7aUInvmaErSjabADDwmBb8gadnfUqvsMNBVX
	o5uMcMFE+PXAfDm/n0rQ2s5MApSFGie/mXJTvZzkFPkFrzcgk7/vtVT3UsgeAuli+7fJoWz9diEwD
	atrmO+gcf32Sw6WTDECQFwcOSaU5uuB40j/+3Rta7OEQKUy3iFrK3qP4VoJTwCxD6eNkicqgPf5HI
	ugqIB0Yd/uK44ktdDY0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUTyE-0005Z2-W6; Tue, 12 Nov 2019 11:04:27 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUTyC-0005Y4-BS
 for linux-mediatek@lists.infradead.org; Tue, 12 Nov 2019 11:04:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id r18so11578629pgu.13
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Nov 2019 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFhjUJFs5no4yiSlxY1BbjA9nXYA5kYuXUrDXqqyYHs=;
 b=K8pqxR84jS9pwV24nmhOTvuCjxZjWeopPAXLjsU9s0DgZ27WLwSdic0hrUXkLpfPFK
 nDx3fovBqn9s6Q8iMI4Xc5DnT4XL08sn5MySWYQPNvcV5a0xQfssVe8EnA0kXZ1W+3Qr
 M7MwKlnaQYKVBY9FPsVZA2MmdoBrtU4Ac4wms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFhjUJFs5no4yiSlxY1BbjA9nXYA5kYuXUrDXqqyYHs=;
 b=f8te0uqIpsIweuqoZoMOqIeWvSa4ImUHgdw7IsD5F+R8/S30gsfaHLBJa5+3uSB3m7
 POlOQ9gfbR0Pg3bVEw/GKpQKIIf845w9c4HMgYFJbRZ8ZdofI9h81oomTcHZnDdnYXbZ
 xxhK3XzdN7tp5Hnp8v8f1q5Rxnquoh3wwud8rDMU8/RUJ2sci4O3LGvuOU1HC8kVzJFN
 sntHpwl6yhkltx4maqwMI0RWVwUm8D0SF884y0phzl2v4kX/zJTaetMOt9GBkQD3veZD
 DbqE7Y8PhiIyvNUUvv62jM4yroPngoMCLQi4ZUf4s4xwkSAxcSCEpDNcKEruWsxDPojI
 1jbQ==
X-Gm-Message-State: APjAAAWK8mKKzpk+w19mTlynZu5BU9gfUVAYXoL5Jf5MH43yoND0RtNM
 2VKhdPQ2Kz2nPS8r5eYcJWsXSQ==
X-Google-Smtp-Source: APXvYqyTQedqUkzhJsI4mPQBlLlsEJbFBlBQ4HI5KnQSbc/jCorqCINBQJyavGatvvs1sABtGK8maQ==
X-Received: by 2002:a17:90a:1446:: with SMTP id
 j64mr5766266pja.142.1573556663436; 
 Tue, 12 Nov 2019 03:04:23 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7889:7a43:f899:134c])
 by smtp.googlemail.com with ESMTPSA id 6sm21528389pfy.43.2019.11.12.03.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 03:04:22 -0800 (PST)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH v21 0/4] Add support for mt8183 SCP.
Date: Tue, 12 Nov 2019 19:03:23 +0800
Message-Id: <20191112110330.179649-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_030424_421721_8FD01F9B 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for controlling and communicating with mt8183's system
control processor (SCP), using the remoteproc & rpmsg framework.
And also add a cros_ec driver for CrOS EC host command over rpmsg.

The overall structure of the series is:
* remoteproc/mtk_scp.c: Control the start / stop of SCP (Patch 2).
* remoteproc/mtk_scp_ipi.c: Communicates to SCP using inter-processor
  interrupt (IPI) and shared memory (Patch 2).
* rpmsg/mtk_rpmsg.c: Wrapper to wrap the IPI communication into a rpmsg
  device. Supports name service for SCP firmware to
  announce channels (Patch 3).
* add scp dts node to mt8183 platform (Patch 4).

Changes from v20:
 - Change all public API usage of (struct platform_device *) to (struct
   mtk_scp *).
 - Rename some variables and functions to be more specific.
 - Move docs to implementation, and improve docs.
 - Address review comments.

Changes from v19:
 - Fix an incorrect include in mtk_rpmsg.h (linux/device.h ->
   linux/platform_device.h)

Changes from v18:
 - Change the way shared memory is handled, and drop patch 3.

Changes from v17:
 - Fix mixture use of __iomem found by sparse.
 - Change the ipi handler to take a u32 instead of enum scp_ipi_id.
 - Mark mtk_rpmsg_{prepare,unprepare,stop} as static.

Changes from v16:
 - Change the desc_lock mutex to be a per-id lock.
 - Put the execution of handler inside the per-id lock, to prevent race
   between scp_ipi_unregister and handler being run.
 - Move the initialization of mutex to before scp_ipi_register.

Changes from v15:
 - Fix a bug on incorrect usage of wait_event_timeout return value.

Changes from v14:
 - Fix a typo on variable in DEBUG section.

Changes from v13:
 - Move include/linux/platform_data/mtk_scp.h to
   include/linux/remoteproc/mtk_scp.h.
 - Rename scp_get_reserve_* to scp_get_reserved_*.
 - Add lock for access of scp->ipi_desc.
 - Lock the whole ipi_send function.
 - Move more setting of cache size from SCP firmware to kernel driver,
   to prevent problem while loading firmware onto DRAM.
 - Minor fixes addressing comment.

Changes from v12:
 - Initialize cache before firmware load, to avoid problem while loading
   large firmware.
 - Disable watchdog before stopping SCP, to avoid extra warning message.
 - Fix new warnings by checkpatch.

Changes from v11:
 - Fixed a bug that mtk_rpmsg_endpoint is not properly cleaned up if
   rproc_boot fails.
 - Add missing documentation in comment.

Changes from v10:
 - Drop applied cros_ec_rpmsg patches.
 - Add clock reset before loading SCP firmware.
 - Fix some type mismatch warnings when printing debug messages.

Changes from v9:
 - Remove reserve-memory-vpu_share node.
 - Remove change to cros_ec_commands.h (That is already in
   https://lore.kernel.org/lkml/20190518063949.GY4319@dell/T/)

Changes from v8:
 - Rebased onto https://patchwork.kernel.org/cover/10962385/.
 - Drop merged cros_ec_rpmsg patch, and add scp dts node patch.
 - Add more reserved memory region.

Changes from v7:
 - Rebase onto https://lore.kernel.org/patchwork/patch/1059196/.
 - Fix clock enable/disable timing for SCP driver.
 - Add more SCP IPI ID.

Changes from v6:
 - Decouple mtk_rpmsg from mtk_scp.
 - Change data of EC response to be aligned to 4 bytes.

Changes from v5:
 - Add device tree binding document for cros_ec_rpmsg.
 - Better document in comments for cros_ec_rpmsg.
 - Remove dependency on CONFIG_ in binding tree document.

Changes from v4:
 - Merge patch 6 (Load ELF firmware) into patch 2, so the driver loads
   ELF firmware by default, and no longer accept plain binary.
 - rpmsg_device listed in device tree (as a child of the SCP node) would
   have it's device tree node mapped to the rpmsg_device, so the rpmsg
   driver can use the properties on device tree.

Changes from v3:
 - Make writing to SCP SRAM aligned.
 - Add a new patch (Patch 6) to load ELF instead of bin firmware.
 - Add host event support for EC driver.
 - Fix some bugs found in testing (missing spin_lock_init,
   rproc_subdev_unprepare to rproc_subdev_stop).
 - Fix some coding style issue found by checkpatch.pl.

Changes from v2:
 - Fold patch 3 into patch 2 in v2.
 - Move IPI id around to support cross-testing for old and new firmware.
 - Finish more TODO items.

Changes from v1:
 - Extract functions and rename variables in mtk_scp.c.
 - Do cleanup properly in mtk_rpmsg.c, which also removes the problem of
   short-lived work items.
 - Code format fix based on feedback for cros_ec_rpmsg.c.
 - Extract feature detection for SCP into separate patch (Patch 6).

Eddie Huang (1):
  arm64: dts: mt8183: add scp node

Erin Lo (2):
  dt-bindings: Add a binding for Mediatek SCP
  remoteproc/mediatek: add SCP support for mt8183

Pi-Hsun Shih (1):
  rpmsg: add rpmsg support for mt8183 SCP.

 .../bindings/remoteproc/mtk,scp.txt           |  36 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  11 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  12 +
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_common.h               |  94 +++
 drivers/remoteproc/mtk_scp.c                  | 663 ++++++++++++++++++
 drivers/remoteproc/mtk_scp_ipi.c              | 219 ++++++
 drivers/rpmsg/Kconfig                         |   9 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/mtk_rpmsg.c                     | 414 +++++++++++
 include/linux/remoteproc/mtk_scp.h            |  66 ++
 include/linux/rpmsg/mtk_rpmsg.h               |  38 +
 13 files changed, 1574 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/remoteproc/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h


base-commit: fc6d6db1df2cb11bbecc542d67885742e75b4b07
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
