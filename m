Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65638D3EE67
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SC/ESIJoZQ70wF1atIQSPeil4YspI+2VRZWfBeQOJBg=; b=GmpFcuUioOqwUN
	MuKk/iiVyES0t4+M/Yl3G6von+8w9LoMxF7cFpfqaMfz46ZBPYXARw9yGviMrdJZbmtSRCIXHjILy
	EbzD3gB306vLc85EeevUa0k5OoSqmdv/yTVZuQUIdWs67/yeNFbBPylx97IOvxgu77jRaFDGjdn+j
	XQvanP9SqPlB86ptHuRnzvzSLqi+NzFynWMTqCTpWKdDd7M54sLSC1HCQtMqFyGlclitMLuqaaaXN
	14gB7qLJ5yR/8y9GI6yORY2sKO6hoSjsl/GzQIsQdAOV9ew+2cFl7RKjDc//c8zRCvUHLWeDxs1nx
	1gKaniJ7ihyQMwTiQe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viv6K-00000007BEf-0yr6;
	Thu, 22 Jan 2026 13:51:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viv6H-00000007BE9-3IVP
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Jan 2026 13:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87F68400EC;
	Thu, 22 Jan 2026 13:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0489C116C6;
	Thu, 22 Jan 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769089912;
	bh=2ovK75HHk76zhj92vAMM51CdwfMHMuCPL77ODcQJ3IE=;
	h=From:Subject:Date:To:Cc:From;
	b=Qtk8j762n2/gQZqJnlKHjUAULJIxNce6x5Ri5lpG2j5fSf+MvtLt2Sh20km0/t7RP
	 fuHfs36LHrv5pgqqJBmXzjVf1hjNlVKhwRfFdA3GbLcjjl8l26YuLdgdIJyuHhb8qw
	 vNFW1CHgPwIs/ji9qUd2BcPlygX67nBPZGzZShHEIr0k/8MuilWYOnxQHjU3qxdD00
	 WPEAm9dUvqUMsPP+r3JMAUnebY3pRysds4AU83oY7P4XSwqlsR/xzYz7nJoUxdvUg9
	 iQ5O9Y6wZOd2ZwrE9kzN132EtAW5U5dl0U818xP6tHOQf4ljyAFoWpdsJRjnofLAOX
	 IgtaDJxchoNPg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH wireless-next 0/2] wifi: mac80211: Introduce eMLSR/eMLMR
 parsing support in AP mode.
Date: Thu, 22 Jan 2026 14:51:32 +0100
Message-Id: <20260122-mac80211-emlsr-v1-0-f0e43bb6d95a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0auUrC00wU/xKuJCaqoBrdKACOLdL
 S7fYuYB5Sys0JsHMl+icqQCrAyEdUoLW5mLgRy1DgntPgXvCNHyvmm2TdfVzlOMPgQo0Zk5yv0
 Ph/F9P12f0ElgAAAA
X-Change-ID: 20260121-mac80211-emlsr-5774082ff8cc
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
 Shayne Chen <shayne.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_055153_851413_54DFC944 
X-CRM114-Status: UNSURE (   7.79  )
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

Introduce support in AP mode for parsing of the Operating Mode Notification
frame sent by the client to enable/disable MLO eMLSR or eMLMR if supported
by both the AP and the client.
Add drv_set_eml_op_mode mac80211 callback in order to configure underlay
driver with eMLSR info (control and bitmap).

---
Lorenzo Bianconi (2):
      wifi: mac80211: Add EMLSR/EMLMR action frame parsing support
      wifi: mac80211: Add drv_set_eml_op_mode driver callback

 include/linux/ieee80211-eht.h |  5 +++
 include/linux/ieee80211.h     |  6 +++
 include/net/mac80211.h        |  7 ++++
 net/mac80211/driver-ops.h     | 21 ++++++++++
 net/mac80211/eht.c            | 98 +++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h    |  2 +
 net/mac80211/iface.c          | 10 ++++-
 net/mac80211/rx.c             |  8 ++++
 net/mac80211/trace.h          | 31 ++++++++++++++
 9 files changed, 187 insertions(+), 1 deletion(-)
---
base-commit: 1e1dd9eeaab3908746d1dce5db6b0c29e0d28d6d
change-id: 20260121-mac80211-emlsr-5774082ff8cc

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


