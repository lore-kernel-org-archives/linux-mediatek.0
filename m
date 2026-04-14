Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE702F9D0ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2026 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cp+RfCU2cxNRTrslQeqfjoL+Wugk/C2lusZI0u6wgbA=; b=WNnUDMv4p/mluZd3vw3p6U2IjU
	8LN3D26d/PGeh5tA6JrXnBcmuzRmXRqzUeXpisgWXoMFgi8HP0EGxAv7VLjp5robJUS1pIAuQqvPe
	MrmVT3v66X5NijVydUYdw+dbnEzvh6BfgmqcIXIOcCw5iWN6pCVrh2o25vjFwz2b546fjT6jE9qdb
	9x6lOOq7Xyr/tz/rmDUCAyakPAa3BqHCA0QM5vepXzF3vUCkjqSYY9dJu6CP0qzDi+qrxVarw+zAw
	zVxpdMxxFVCiZTX6CLRblEOliZZE94fV7DRGb1HcBWM2+eiXTVTur/mBPdYgewl+oLLKH1I28SJ6E
	olOlfZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCiga-000000006qy-3Apk;
	Tue, 14 Apr 2026 18:40:32 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCigX-000000006qe-1DcV
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Apr 2026 18:40:30 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8a151012558so71274486d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Apr 2026 11:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776192027; cv=none;
        d=google.com; s=arc-20240605;
        b=Gw1HUW2bInpEX8i4P1yU+kTsYQ2qWfZgtlFjYYo14sz0Ce8wyv0WKuUBMbP2O4o7ib
         ul4qSWZjqqWzkAjoIAlnPsq9TgGXtEQttdMuhqFtiRHpvq2vdEmzwL2pWyLsDvLvW3Bv
         ITC1memH/ge1aoCRqpd/KISoxGkD9j/bBu0jU7PWIyrKeW0Y2Yejr2yC4kZ3jHP4LByi
         Pqwm3CWzUVbNtenQUDiATQnzBhP6m3UIJ+ya7npFMxkYlPi68eWQKNBQekvYA8+NGgLk
         /R+Mmh92rxPRWwAr4VGChY/bjWimscgYjgrWSKxZYNOIWE+7XWts39DPELSGn8awNwmi
         W9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cp+RfCU2cxNRTrslQeqfjoL+Wugk/C2lusZI0u6wgbA=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=MwG4KGXyKH26+ewj6Q6T52ITGbmvcywqUlFsd6uNPNbYxLOHIh+CPLKYrmANqlPl2c
         dvRzivDBPqXgtCA5fWB4Ydyi3vkftO7dN8bTqJW9iPcH+YokymthScyke6igPPQPGOhD
         h5WQFF2KmEttGhO8ccYhwZp6xeJvaaMDZr8/TrpK2JEBOEfpVkM+lQSAc0FIXIHszUiz
         SltfHk3wVDvgRFKNV4BDQqS5iV9RzdzhEJ7ohbxK4nFUtZ763S6ldQ+v0LzFi5spxj2n
         jFPwuX+j74WIcYME/UTNpZPotkch3TpcVuam1rp02I2Jb4lmEcWIAXwSARErcFMV/Uk9
         ZCRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jqluv-com.20251104.gappssmtp.com; s=20251104; t=1776192027; x=1776796827; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cp+RfCU2cxNRTrslQeqfjoL+Wugk/C2lusZI0u6wgbA=;
        b=W/800bsts9AKSrHddvFZolmeAeO3wRvKH1Ishb7ss5djCGinIxu9m/jc5mjtoOdXke
         0R11hz9mOPUyU2bZcdAue61OJUqi/asMURs3TW0Toe9WlriDrZkWJmLs4uUE+2EGvmCM
         7DkG4GPh8C/jNiy/i8T444SE0OZDC967jcPcoSQMzOA7yBAVCLXav6Yg2ZkX6I17Rf/j
         AlZ/y1XgnLwb3axzqjvPNT1Fl6LnIp/5Dsi2a3nQK3oCz3FUICgz2vEzt4T5NJginlg5
         m+6i79N7oHRUkvadap64VyJqvTQoqT6ly04L2xPVs3Ve18XytSuIkch7TN1/bEj2QFKs
         Y/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192027; x=1776796827;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cp+RfCU2cxNRTrslQeqfjoL+Wugk/C2lusZI0u6wgbA=;
        b=rkILJEa7YhvkCazLrzaUJ42KLvciaJrBI30EVEaYdZzTxS6gbSs6UykCs9Img4S+wb
         PaOJtMxi6efriBQow2wU0GBpNi5Sao/vIKonjg8yK11CKuaurid7OJfNLde8oJD2yYxF
         ZgKNqenTS1f7tK4RcJkwMnVQE/hyMoXGC6wBW5miSgL0CVEhixuGbDt8chaXVz4/y+Ch
         W+4VZL0MAU0KDyaLK4uiJC4AoiNkBnPkUDKae/vNmX/xTfiZDffDvBGluRqARQ/AxfBt
         +4PfdKcU84koDUfVR2zyRQHiPLZS7FuHGcfmsl/I4CUd62Xip8xwGtb3+jB8NRrKip++
         oQcw==
X-Gm-Message-State: AOJu0Ywx874noc0aPLCmvGrzoGsk+EQ8h89mZRo70Drsnqj5R4tFRqDm
	xaB+L8AhfteuUlQSFNPy9CHUI8fEoh3rs1pVBnik4gb8hV/aFaOXcVteKH7ZIUHxt933pWIA8dN
	dc5d8Tor2A1sVuDPR8rTyQfAANTrvo2+HgCn1M67740gH97K02adyxZU6VeJW
X-Gm-Gg: AeBDievrNg6pEYtIvI3kcjqIL00sDOUAsp2n7BoOmRtt4K6dOhPWQrkXj8oAVO3y4Ra
	4F2R2AvmvvDlRm/DEbC6vf2yu9K+ZtkC7zkLFFsPs8ndqWWpwvGQCSrI4FuHmTLrysPrZ4u5ZmJ
	+AlNW9lr5imQDnQUMqyt9p28YlhGA5U8GrkIv23yBwWcbjLoS5KaCx/PmZV8XYq0O+Di80hQ34f
	rDohjMneljj6ks75q4zUQyCJomagz9kLhnbjLw4EYA28Pvkh/tOWk87gGe3PHH+6kAJTvs42D/Z
	slOzA/epALD31KI=
X-Received: by 2002:a05:6214:5294:b0:8ac:b1ad:3a1f with SMTP id
 6a1803df08f44-8acb1ad3ecemr127498816d6.35.1776192027124; Tue, 14 Apr 2026
 11:40:27 -0700 (PDT)
MIME-Version: 1.0
From: Geramy Loveless <gloveless@jqluv.com>
Date: Tue, 14 Apr 2026 11:40:14 -0700
X-Gm-Features: AQROBzCUOxlhUBtJqQayNqh6uhvubDwdSfrIH-MpMOSXTtqogPjtlaQcr1s3FBM
Message-ID: <CAGpo2mcU1qW12Fk69MRW5TCdpKXQ-3hcK+W6-fAJgebsGmkLEg@mail.gmail.com>
Subject: [Question] mt7925: CSI (Channel State Information) support in STA firmware?
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_114029_612417_C6F15A44 
X-CRM114-Status: UNSURE (   9.36  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry for the duplicate email I didnt realize there was a mailing list
for mediatek i got the last mailing list wrong also which created
another duplicate sorry, anyways to my problem.

I'm working on enabling CSI extraction on the MT7925 (Filogic 360,
PCIe) running as a station. I've built the full kernel-side
infrastructure (vendor netlink, ring buffer, debugfs, event handlers)
and have been testing against the stock firmware:

  WIFI_RAM_CODE_MT7925_1_1.bin
  Version: t-neptune-main-mt7925-2249 (build 2025-12-10)

I found the connac3 CSI patch for mt7996 in the MediaTek SDK feeds:

  0095-mtk-mt76-mt7996-Add-connac3-csi-feature.patch
  (by Chank Chen, Jan 2024)

which defines:

  MCU_UNI_CMD_CSI_CTRL  = 0x4A
  MCU_UNI_EVENT_CSI_REPORT = 0x4A

  Command tags:
    UNI_CMD_CSI_STOP          = 0
    UNI_CMD_CSI_START         = 1
    UNI_CMD_CSI_SET_FRAME_TYPE = 2
    ...

I've been sending MCU_WM_UNI_CMD(CSI_CTRL) with tag=1 (CSI_START) to
the MT7925 firmware. The command returns success (ret=0) but the
firmware never generates MCU_UNI_EVENT_CSI_REPORT (eid=0x4A) events.

All commands return success but none produce CSI I/Q data events.

My questions:

  1. Does the MT7925 STA firmware (CE variant) have the CSI reporting
     handler compiled in? Or is CSI only available in AP firmware
     builds (mt7996, mt7981)?

  2. If CSI is not in the current firmware, is there a firmware build
     or roadmap that would add MCU_UNI_CMD_CSI_CTRL support for the
     MT7925 in STA mode?

  3. Is there any alternative path to obtain per-subcarrier channel
     estimates on the MT7925? (e.g., via ICAP, WiFi Spectrum mode,
     or PHY register reads)

The kernel-side driver patches are ready and tested. The full
infrastructure (NL80211 vendor commands, TLV event parsing, ring
buffer) will work immediately once the firmware starts delivering
CSI events.

Hardware: ASUS ROG Strix Halo (Ryzen AI Max+ 395)
WiFi: MT7925 PCIe [14c3:7925]
Kernel: 7.0-rc7 with mt76 from mainline + CSI patches
Firmware: WIFI_RAM_CODE_MT7925_1_1.bin v2249

Thanks for any guidance.

Geramy Loveless

