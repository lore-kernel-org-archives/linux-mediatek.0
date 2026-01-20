Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9712D2ECF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZqhvQUqHyPjd5YwFiryR+es7m9UdWSAqM9hdcVMAYY=; b=Fl31BpbF+LPfX6zyZhErjBT7g7
	cKuwu0WIhWpEZLBm/Zu8d1mx8LwtLj37VJpC4qTM7rbSRAX3NLgcUdtMN22DimlE9UlgE/g7osSws
	oiFmCZA2UWLJZCiJD+IN7Cdsrv1Cfw1ejtgOS0SFOSzz1eQv2/71Puc0GxtLmO5kf5odxv15cUfZB
	6iByN5Qzx3Cb2Utpdr7kCPx+SU5JpxzLt3119Xtha+60Stc4OcUitOuO4lgvwWrbYp6DwbbmIRJ5A
	S1ISvVz76s5sFNDnXUEhIocOam4RmHXJQLX/mAYUgGycVjD0A+KBhdHU919aBUwo8Onl9/DGP6/FD
	/NrkWqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ee-00000003GaV-1AJO;
	Tue, 20 Jan 2026 06:29:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ec-00000003GaD-3gkJ
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hZqhvQUqHyPjd5YwFiryR+es7m9UdWSAqM9hdcVMAYY=; b=rCMV53NhNewVewi0yNDllodCIQ
	YElBUQ/j8yZzSttG1WXOL4aUKSPmR3R6R74z5jFyasM6f8iyiyowtSRJUzJJYhSXCwEQ9vonzjhrd
	+c9CBmUZ6Zw5Bg2tY+rpxCcfBaqqbXA8TULMiw87qC9O5gWLGq3HJN8YL84UgU8eX5v2uWw06ss0J
	angqY4RqO6C8eUNJc8mm4MyaazuCgNPJ/iQcFkXaooAH6zwmT62VkSvmSPd2y6A9H4aztrRiSTlQs
	1iOy/TQLteuPljEjdY+WuMJ1OW8o1idKKgot9t1WBR1/6mYEI1zcWKZMDTeISvEr7804C/+wa+gp0
	nBrpTnQQ==;
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ea-0000000DP5F-0RKb
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:01 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b6bf6adc65so4982768eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890538; x=1769495338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZqhvQUqHyPjd5YwFiryR+es7m9UdWSAqM9hdcVMAYY=;
        b=fA3lnmWDGj9TY6lPTsRJv7NoLn4Qp5xgi4E0cRl7Zn7rdZ0YB5V0P8w+9p6pOL6ryB
         CgXD9DfKlxuWMav9TrBe52DHDpwhpit/h1nwq+brYawrIeo0JljOeDcwa83PQSTQ9WPU
         NQiCDdJjjmp+fO5Yv2DQP/M+rNRiqIosNt7xiPp2nb00QYXzjnKicRlyO8ydmpYfMdCl
         sJPkT66K4LJChUwsnXRMor5eb3TW28QQPs34ENqe5QykTPkxjERewBqD2vu37PEUBt2l
         +BtQvrubw3171evzTfdTRNG/36ojkCOyUPwSMZKxX+53LJZroIwi+e34m6MqDJbcFLft
         n7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890538; x=1769495338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZqhvQUqHyPjd5YwFiryR+es7m9UdWSAqM9hdcVMAYY=;
        b=emqAsG4zFrRH2dZLryPhXUb2+gSSy0CBh3yCKIB4UiwSbHQ9iu4vSBVd4/BOHCe4o1
         afzWOyVWQtPZbHDFtZ0zbgIrj7gZlQIhvdsDKHCYlQPtGMRIjdxKvvvYNjHu3IyChgVJ
         vqn+TYX3OS0UpqbKTDt33iyDZZlf68L1DDBVtk3C78RZmWyUSAl/xGDad8a/ssAbtfPN
         gWJgXNgkfrAcHcIWp1dedEi7ykn0TJiJXTSXgIVBXUJj1GdfhLdcHLvz+n4A3O3uUHUz
         lU0Nhl8LFgpTXq7vjhLIWaHQi2H2dNMoQ8Decd7YjxK8GK6oR/BN5rhWcWUFPFkzJfE/
         3MNg==
X-Forwarded-Encrypted: i=1; AJvYcCW3YLTgw6PA6oM2NykhbBVsJ9tN03JG+kCRvcAyEKyx6UkT5nyzFATgevPhHha4zXqXNagcKBIHgTiHdQNAFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE4bRXcUXqDd7SpfJnGygTDYYGLJpJpI4wm8vjiKk9V+3i/RKS
	CFJzIRdKza1mRs774z2vR2P70Biw0u8k4eIZmz3XLbO28/n+0OrkLB2S
X-Gm-Gg: AZuq6aKopgwMp2lRKEbuj/cOig+2vnZybHJ87U1gBGfJ/jJgTJpJNpxPSqfIVfRJEhI
	oMAzP//UKTzgT++R3yb39r4AcD3mEHt0rGzh9SWWs7lggmH4Be4mJbIVgDTadWXPEI0tlleMZxZ
	XfpcP2x2NMypUD+/iVcWTobcPQdlidwjcAs8leqGBjEK9ceZufYFbFJ7/+aeO+XcQzz3d8dsAjk
	D4VSnZK61Ck1Oid9/C93lrmQpsZjDD5vKp34Y63HgXuxxl9I/rJz02+2dwCbN1dWM5UfcFbISyK
	4B/6oEBBrFqo5wWVP55XQgZfmurndFuAFq4EVLFhfGETSYHjCGFSQS2+ZUEZX1EYTRcH5wQeGek
	VmCiKLlFKcoyHcVHu3DNO94XLJwsZtdkpBjxyEbC4XcxmYbUd1agN1CEy6yk2jps4reFQ/MQEU4
	fydueQQaLGCPvCfr6Lf8E6yNRK0ryQEJN7ZFWfkwgEx4d5z1qJkG2pBgCph0lISu6jJM70C/c=
X-Received: by 2002:a05:7300:6420:b0:2ac:1c5a:9950 with SMTP id 5a478bee46e88-2b6b4e98df3mr12535391eec.34.1768890538000;
        Mon, 19 Jan 2026 22:28:58 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:28:57 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	stable@vger.kernel.org,
	linux@frame.work,
	zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH 01/11] wifi: mt76: fix list corruption in mt76_wcid_cleanup
Date: Mon, 19 Jan 2026 22:28:44 -0800
Message-ID: <20260120062854.126501-2-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062900_251398_ACC8F528 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Zac Bowling <zac@zacbowling.com>

mt76_wcid_cleanup() was not removing wcid entries from sta_poll_list
before mt76_reset_device() reinitializes the master list. This leaves
stale pointers in wcid->poll_list, causing list corruption when
mt76_wcid_add_poll() later checks list_empty() and tries to add the
entry back.

The fix adds proper cleanup of poll_list in mt76_wcid_cleanup(),
matching how tx_list is already handled. This is similar to what
mt7996_mac_sta_deinit_link() already does correctly.

Fixes list corruption warnings like:
  list_add corruption. prev->next should be next (ffffffff...)

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 75772979f438..d0c522909e98 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1716,6 +1716,16 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 
 	idr_destroy(&wcid->pktid);
 
+	/* Remove from sta_poll_list to prevent list corruption after reset.
+	 * Without this, mt76_reset_device() reinitializes sta_poll_list but
+	 * leaves wcid->poll_list with stale pointers, causing list corruption
+	 * when mt76_wcid_add_poll() checks list_empty().
+	 */
+	spin_lock_bh(&dev->sta_poll_lock);
+	if (!list_empty(&wcid->poll_list))
+		list_del_init(&wcid->poll_list);
+	spin_unlock_bh(&dev->sta_poll_lock);
+
 	spin_lock_bh(&phy->tx_lock);
 
 	if (!list_empty(&wcid->tx_list))
-- 
2.52.0


