Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E6C2A073
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx7Cxs6mPWElG9bplppz5XOkNbtbfz1JGfVMLJ0UqF4=; b=E6yfr6/7Zyfy5GqfYCokVNi2DV
	CN41iuzS/5BZgnJmgRyl1O6e0AMMnjQKA7epX04sb2ECq2trurjwpBEZjgygbgdGeNMMTKKScCXGk
	7QPDP9bf012AC5vAKB1knN1aAzRdY+kInO967ivx9wmeXo/ymEiJBf8QdVUQ1m116jGjzM5dGYoAZ
	Twp1kkN1eD/7UuYubx6Bb0lg3b0EGiaiWxPbLRms2d8VDbJXuL/FLdOGwFPK6itCqJ8h1PQ3IOPhg
	pRRJLixqaoa3gc+GpeyMdw/TY2POJkQPo5KDoQD6aUPkrFd8+rMxLhrMY9fiflMAdc+PFdJFJrjWf
	mSkifg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRF-0000000Aa9v-2M50;
	Mon, 05 Jan 2026 00:27:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRA-0000000Aa4o-3ukw
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0fe77d141so155215405ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572828; x=1768177628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx7Cxs6mPWElG9bplppz5XOkNbtbfz1JGfVMLJ0UqF4=;
        b=BP0tyIuqG566v7j9oUU/cnv2a/veZNWxccttDnGH0rdBhSLg0+WSTxLR8SD8k13RbP
         0+7cM+yMm4WOYj1kibmKeknCwYzTMABB/Tn9WnOza2qoL7wUfbk+sUsfI1z2qY5ckneS
         0i5XLAVnuiM7kP6x40SzMlCoq+ipn9nnX8dgwgE9SHNHxWbDLtUqLr7IXHRToikfDVNR
         NGV/yfvJaNs73LWVC5fLo0X8aXkQCRplKhUGdSObZmIoOTe4P1NuE/vehJARERJ8NoK4
         jC+Zo76lGPn5GZDApoxwUiwZq1+yLeniz/4C0qBZFHTVXXqDngfqcJRZTCgdDHkiWgQM
         I8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572828; x=1768177628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lx7Cxs6mPWElG9bplppz5XOkNbtbfz1JGfVMLJ0UqF4=;
        b=jCKXXAJmZIPRghNjAe8FsvnXKZ0uiecXt71I9jTYG7B5xS921rF+SmQADUP45eNWEp
         +ngfeJu+/DHzmLKrcIttydCSqFVbauXzfkZ8bLg2UaA+JVpFEKzI4GaUE7mX0ZewttF+
         xZJv+i99kk14fGaK7urV/Fz72BEz2R2FQO0E3xJRr5FbBYUhIsOUKiT/GFjaPtHkbYkX
         JhCWhYbIdMXlrUc5WNd+kCo7Urom3QEPl7OozeWxIZ3WYTlzzaTWECEdrkEYcG9d0/CU
         qVVNyY61roJYjjQhKHNRadDWl5Fj+ITkKF1qLssyg2WcMRB8SNR4luksgd0RhMJ+1AYF
         dLDg==
X-Forwarded-Encrypted: i=1; AJvYcCUrat7lX2hAXmdLMDJ9t7PX8gqiqwSOZ4UjPrIa70ZJJKOhW6Xp1YEWBjcQfvfG3Zyl2gNA9mahfc9cAN1NDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl4/jc5k2Px3S8zpmm1hAThWhE5mkYKPVvNidoz5TaOHQ6y+07
	TpfJHU1CHAD2fLA0sSAAKsjcrHQS0BFdqBNRVHc8NOkJMMpU62UuMb6k
X-Gm-Gg: AY/fxX47hhkZdZRK31Dsmqm99I9iLlsQEB3q7NgGMDU0L36S9DyMbpcfcsugnitotSF
	3r+gVFkInbpqbJAr2T9HOC7pT4LRmGGwiFCgFbLIPKIauc26v76Lfqx7RwhfG6Y9GnvFtPWUXMT
	0v1zCvWMQ8OUDMzjCoPMb/BWKMAk+9wUeHwGBFha55wcfQdGNfZlvZomi/yJ+9CFu0Dv5U4D2gN
	JdJbHn8iBIr1wH0d351ThJlTVR58TyvPLs4LtWZGiH6cmY2Uw5nwg6Q/IlByPDu6qB5D/NLs+Ra
	RmpovbRK7e5BPK8Ztj+KHbJZp+UTfJ6dyJtNj6lqtzAg6qVS3dIdQSDqwfW20e56MwlLiCRYOeL
	gzNC/DWL2WRqDTyUYtaX/1K3NS00re9NbiKVLj+dKwqjSIr4GmYpI/r1XhdURbSa1CObMml2Vn2
	IQayAYw2VqZdqElSoAG/eOdEN/LNEBtI6TLM99Jrl1DX4stmEpg/5PxK7i5rBiGBM=
X-Google-Smtp-Source: AGHT+IF2dXIfKchGTeNJHu2azmCNIm50WiML6/yJZT6JBX6bohZ5k2MDH1QBCndrXw+T70AJIWjSig==
X-Received: by 2002:a05:7022:eacd:b0:119:e569:fba6 with SMTP id a92af1059eb24-121722c348emr53252639c88.21.1767572828149;
        Sun, 04 Jan 2026 16:27:08 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:07 -0800 (PST)
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
Subject: [PATCH 16/17] wifi: mt76: mt7925: add mutex protection in resume path
Date: Sun,  4 Jan 2026 16:26:37 -0800
Message-ID: <20260105002638.668723-17-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162709_035020_8666C797 
X-CRM114-Status: UNSURE (   8.21  )
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

Add mutex protection around mt7925_mcu_set_deep_sleep() and
mt7925_mcu_regd_update() calls in the resume path to prevent
potential race conditions during resume operations.

These MCU operations require serialization, and the resume
path was the only call site missing mutex protection. Without
this, concurrent access during resume could corrupt firmware
state or cause race conditions with other MCU commands.

Found by static analysis (sparse/coccinelle) pattern matching
for unprotected MCU function calls.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index e9d62c6aee91..3a9e32a1759d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -584,10 +584,12 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	}
 
 	/* restore previous ds setting */
+	mt792x_mutex_acquire(dev);
 	if (!pm->ds_enable)
 		mt7925_mcu_set_deep_sleep(dev, false);
 
 	mt7925_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
+	mt792x_mutex_release(dev);
 failed:
 	pm->suspended = false;
 
-- 
2.51.0


