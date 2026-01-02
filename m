Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02231FA3755
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 20:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOTwbgpeLN5pXgDisgz/s6pvtJgX11/afdNTzS5QM/M=; b=vk7C5Rm7dJWX3xOUFH2DQR/DPj
	wl7zq/6Fnw5mRh+KKzWa9VukIFNZ47UnbRYX+lOGAa2XKZ+aq9KWYCD1s4MEe4LH5kih6g9mYBLuu
	d3aTXjw+Ha0/uFzI4jo5BPKv/GxklZcLoJE2W6phqHc2Nzkv2FpBTl0qAewgoE+7RmIxlOzKpW9/3
	U6T0DUlzABehuXeRmxB/rDnNhoRDYSr0MjCNsJzOy1jCE3qfQJmCPnexu/w0sQt/p9ZfY8rdv5QQT
	vG9nT+ZNRv8oU2RwVPUk+ZhTQ46jVf7Fd6DXdsBiqguo3TWjMl5GB/Fuionzjfpfvew6f/a34zimm
	cWhdZ+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMu-00000008gl1-44St;
	Fri, 02 Jan 2026 20:03:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMq-00000008ggu-2x6Q
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 20:03:27 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so15813743a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767384203; x=1767989003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOTwbgpeLN5pXgDisgz/s6pvtJgX11/afdNTzS5QM/M=;
        b=B71qBlyZJoHwQ1aSdyFeDbrrVp2PiW4WUImhdojWyw3/9BHRdYt7zWnFaqv01aiOC7
         MynakXqeRtl6FizoOAi/p+ANWNMchsRaxBhOra/Pr0RLPo6LT0okedrppMcVCcGTpdYZ
         A0YJvEqZtAgn42jWDPatXHFUurIPOSpgMXlC8Y+RrRroRqdnzAygdll9qo7SkR4wifoy
         KndDpzFnAhgpywXZbiyfEgHZOjd7s2SgNgXdQpQ/KJzBHE91hcoIqMnwJKWvabuWnNmt
         hgl/dNR9iqdPIWy67D6MPSaodiDx5oIljCgRQzC+CSlnMPNGaQqDc2SnHVedGt/GQogv
         +/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767384203; x=1767989003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOTwbgpeLN5pXgDisgz/s6pvtJgX11/afdNTzS5QM/M=;
        b=HwHdsyYIdI9buNuq3wvqV7Ax9PvXyy0619Wkur+TRchfTfjfn3iT1UUFok6kiz4zXM
         CA4d3pXWZX3b0Rk/0Vtq5/AEN3mXNN+SoJTNBoP0OFW6h2I0Wx7NSw8WjB5c76Jbj3zs
         CdMuswfJJTZxyYRdEvRBa1aHpRibZV/KTCjMlXYxa97JRZ1go9/nxRcg9Ujpv0M2xTHG
         2GkS42Fz6Xsxm5RJLshXYiOMnkcHphtnQzf0Zu1QxvdVnYFIvC2OpgVBf5E95HVrDla4
         yroUEQBldMMwpVMiVF095/2/UFbLbFDGKke78TtiVYL3XDEpZsoSjpClPFuA78M9R/59
         7MLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC0Xpq9i6JU8QUgBXms72vOnDHflCzqQJ+yEOeDt3gI30xzZy8rIXtprxeI3BCttUGGCwawLDGcrYD/X+QUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKr9v/kKnrCe6XFvFWiRPTCKkSqxHiT38E3u2monE/3KBWUVus
	dLkVayr5NL21VWz9/QBbZ4IPyLIUOa5UrzpklM4lRYiu9+1BoAJ4cKZC
X-Gm-Gg: AY/fxX71HioeJ9EJlzbikYWP8i0cK9UR0D5K5EEqz9tN3yhmvGPbli9q43+e0FR8xHD
	bsAPbaHmsOfB5VBNvRUj0P3p48sJ/re+7TRPLCA0AjWNyoqmWyOz1kN1Hit/Sef0T2LlyPD7bIc
	BOI6SUvT/4i9Pn+Z31Ix3dXK1chAXjkIA8ZMWwTmVfcWClH5a0ivtUKpfl1lpuZvH5Pv8rr7VVc
	rhJaoa+yrjRdUsyCBFu1FIR2XAUnf+9+sdE1CBuBp0Pyjawg1tUogYf4H+jKHL4Mgo4g+myDM+i
	dWvpeJcF9TdiDlrsWIpKAoF9xUptUDD7ObRAo3kuj9bY+DhyfUGgD1gc5e4Br+VBOeS/I+GFwIl
	TP7gB+75qbLRigup9A9Jets70P/TiwKXIDQGfYGUWks3bitWDDYM1OKst9JhC7lEHoJluY9xhWw
	nndvRc96UbdaYdMunoDmdhk4mSY0RIbK56XY080D3HM63gWqj+CQ48T8MpoJ/m+fU=
X-Google-Smtp-Source: AGHT+IF84sKN8CnkJa4viQsaxDmj4nFuQ05LM/gZRcXeDb11Nou8i1NdOUdfSg4R18Yx3AAJrxHd9w==
X-Received: by 2002:a05:7022:699d:b0:11f:3483:bba6 with SMTP id a92af1059eb24-121722b2861mr39252551c88.13.1767384203373;
        Fri, 02 Jan 2026 12:03:23 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm120203795c88.10.2026.01.02.12.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:03:22 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add mutex protection in resume path
Date: Fri,  2 Jan 2026 12:03:14 -0800
Message-ID: <20260102200315.290015-6-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102200315.290015-1-zbowling@gmail.com>
References: <20260101062543.186499-1-zbowling@gmail.com>
 <20260102200315.290015-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_120324_747429_8A79CCC9 
X-CRM114-Status: UNSURE (   8.53  )
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

Add mutex protection around mt7925_mcu_set_deep_sleep() and
mt7925_regd_update() calls in the resume path to prevent
potential race conditions during resume operations.

These MCU operations require serialization, and the resume
path was the only call site missing mutex protection.

Found by static analysis (sparse/coccinelle).
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index ca868619e1b7..b6c90c5f7e91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -583,10 +583,12 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	}
 
 	/* restore previous ds setting */
+	mt792x_mutex_acquire(dev);
 	if (!pm->ds_enable)
 		mt7925_mcu_set_deep_sleep(dev, false);
 
 	mt7925_regd_update(dev);
+	mt792x_mutex_release(dev);
 failed:
 	pm->suspended = false;
 
-- 
2.51.0


