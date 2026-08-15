Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7F5C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JhpLH96yWQRLag1AzHDPgAFi9pZTcqqLwnfeJZRrbFc=; b=n1tHLwp6RY3HLdohtmaUS3c2yX
	OlqMtBUWBgs7+HhE+ToEAzCB/ZPxv/nAMc/Pah29WNa8JXZPhJx18gDvfnzHWwgaQ4Wu47zZz0Ud2
	PjwDynd18hmIvb2L8N/MLlkqA8n4i6LUo34ONHh3jRpJcuacOTpAQarDEf78jwXZiAkppONkJB1Bi
	a01J6GHLSg/SaqdiYbJWeO60QvsRLrLvOHKVwjWsyHc/bmNu9O0atxL9TzeHiaetkkC3o60KNsneO
	8UPTnm8CRpUdf43p2VKnb0/CD3FfEleJbyHSbEgw5c1KIPo4yUG/zbTOf8HwmcznI7P1y02ShvBKF
	+RLLNusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC8x-00000003ldk-1FDD;
	Sat, 15 Aug 2026 11:01:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC8q-00000003ld4-2h1W
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 11:01:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so17825895e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786791690; x=1787396490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhpLH96yWQRLag1AzHDPgAFi9pZTcqqLwnfeJZRrbFc=;
        b=OLG4rdemW/QYI6uijiNQP7yqYWQn42+ZQ3EuWT+vboHa1qhCdfre0GoImY4z9HCcu7
         lzxTLxBg49fy4kqb/IlaxM0ti0VVTNFCqNT5pl0nae4WBo3joDruY0Zd/NaXyfWPH75i
         OTVCBaEPtSVvsIDvbNl8W5GBcdYSJFUMdmvzuBA47v+hHdQsQWYfLcTEu/vM8Eu5NjJJ
         58fyx/a3cVR6anD9WFFlQRt07l81jnjtigKfSQGbBVLw/M0O98lWXpv4yyI6LcvRVACb
         7MMCpwBdKrmyMwZ2jJfQCbGPE5ZxrP6KEcxl6IAQna3UrXLFGF5HHfd0U9PUnIrqVI7v
         nTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786791690; x=1787396490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhpLH96yWQRLag1AzHDPgAFi9pZTcqqLwnfeJZRrbFc=;
        b=RQVnpD5XQWS0B26zAEJmxuPiXhzmJzmndY9hhvU/liJl+499yYN66IRytxL1UWBi5Q
         B/dJVXC5yU+naa/r5fr3x3OM1M6B43Th/CvxS3s3cURSOkdjI75V7DibCwScn3nklFzd
         D2nBeO7xoBA6BpeJonUK8wLC0DDKEd1vDpYDV4khCNmoh8QmpGR49iEjIQle0MzFs6Dd
         TZayLoOOVibCumveKUYlwJgCZHICbsCjh8Lx5xqGIAdBrNYeNcGJiZvadOF1rdYxEO61
         Em95xiBGktwOIMEOzTlPNCYXoOdVYXxXb15ODW3BMefkj27vanuJiyvztY1z7jeZ9Toe
         Kc4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQx09nUFmeKnRaIN0cFETAdptPuiEiX24aV+ajYkBQRZhFSuB4VDcVQNxN9BBUPxbctSPi8Tx8CRYu4t2vaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxclvaKfe2WdjeowUiE90MTeBNuCZS1MzVXlviBbXz7I8weD1Yj
	w2y6F9+/4/ZyZLPQbLCXCc3S7cvnHuUxP6I9xQNHo83lfc1E62J7iRs6
X-Gm-Gg: AR+sD118VHJbGcSpwOttkvngJ072507ovOpvQ8gkssOLG3H3HwFgsEx2Ocb98RVVOO8
	h39617Kp3UPsgk3PMLqJiUCDn74S2sdnxOovPO4fxOXqaB7ZtqjuTpsIz0RRrCaMWFe3THCH3eN
	C4oDm6E3mzxtzJ4Re+CVrcyRWwdisAB26moxrdyGXSGFvyMVYXokRHljNRQs/VTdi/RBXI/U3vc
	RzY4hLEWqRSVl02kasMH95VvSXqomJDF2F2DH0Fn+QX8Gjvqr5Eo/L3rKANTnmIU8gsOCwa2ZTG
	s8QRJXVOTmrBsmqX8LGz1zBNBJzxbv8VmWlV8EJMXJzPNUSBPlF8YrAURHUFYzJ8GzmBF8Xtjbf
	xhZDWJyBj4je4QnmiBB3kFdZFmGQCKOmNhnBvHbvFl08PqAWD244f43QsCzSnZgtLRwmI9lpxxG
	N4Dow3E3czpvPHWKGnR7Pu7Yn/C4unDmbjYW7UEw1pBSZNLW/YfbZ9ltsOYrsiZ4KkrHZj0u6X8
	RgPs2LVyTu/CA==
X-Received: by 2002:a05:600c:3485:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49987938e19mr184694055e9.1.1786791690107;
        Sat, 15 Aug 2026 04:01:30 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b1d8f4sm133728035e9.11.2026.08.15.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:01:28 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Jing Cai <jing.cai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ismail Tarim <ismailtarim7@gmail.com>
Subject: [PATCH 0/2] Bluetooth: btmtk: fix subsystem reset error reporting
Date: Sat, 15 Aug 2026 14:01:17 +0300
Message-ID: <20260815110119.11301-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_040134_539890_55FB400F 
X-CRM114-Status: UNSURE (   8.67  )
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

Two bugs in btmtk_usb_subsys_reset() that make it report success to its
caller when the subsystem reset has actually failed.

Patch 1 covers the case where the post-reset chip id reads back as zero:
the function logs "Can't get device id, subsys reset fail." and then
returns the (zero) return value of the register read, i.e. success.

Patch 2 restores propagation of the MTK_BT_RST_DONE poll timeout, which
has been silently overwritten since commit 3dcb122b3064 ("Bluetooth:
btusb: mediatek: return error for failed reg access") started assigning
err at the chip id read.

Found while investigating an MT7902 [13d3:3579] whose controller firmware
asserts and never returns to the USB bus. Both patches only correct the
error reporting; neither changes the recovery behaviour or makes that
controller recoverable. They are a prerequisite for anything that wants
to react to a failed reset, since today the failure is not visible to
the caller.

Compile tested on x86_64 (W=1, no new warnings); checkpatch --strict clean.

Ismail Tarim (2):
  Bluetooth: btmtk: Fix btmtk_usb_subsys_reset() reporting success on
    failure
  Bluetooth: btmtk: Do not discard the subsystem reset timeout

 drivers/bluetooth/btmtk.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)


base-commit: 15ef2f78c49d20d53ec7c0f1c9b40b02e089f2d6
-- 
2.55.0


