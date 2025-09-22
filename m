Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C337CAC592
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=; b=3ywXmb0H+n5WEH9n67fJg3o+0g
	RwnSdr4sdNa/SSyA45PjwoVgXW8IvIk+mW4p2r/DUS36z6xAMNX/827fAA9vh1hPeLRc2Y3Uqf+pr
	Mi/GRKS6Lki+wie4/Vv0ZkXIk59Z33k845hGi0AmfWPlfmc8X21BoD/8iD08jn6PAbcJEuhaImlu4
	RR9uX9g+pCV4GK3mV7Hde+lRIVL8/Ii62IST5ivt5dtRMmRtZKdBUlLeTxnNnUcY83lcT5u1uJPES
	DqKhDx4XGkIaW0xbzZrJTY7Z21CKHEHg5xFEiiPfD4rQGsXMbw6gUukUl4c/f1wk2nBMKT/KKaX3z
	jsPWmxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0i67-0000000Al8Q-261I;
	Mon, 22 Sep 2025 15:04:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0i66-0000000Al7U-1CBE
	for linux-mediatek@bombadil.infradead.org;
	Mon, 22 Sep 2025 15:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=; b=G0QyhAYoRKL+a0o0/nwwynd7qz
	B1/VYzFOO5wjGsPDgK0lPV4hm2F1Y6eTO9PtfnE8eTf9AYvedKWSf5GRYCHxftFVxA3WXGcgYonsA
	9QvUa/JpxJhZHwvDse9+NG8QgAKnATmIl0s3T160AtwE0Lgw72qKVevGN4Ugnh8ecOFJlSPqrNUHu
	UrKY+JDeL1Mb0jWXFqMbGVICI5PJqwR3A0ulnktfOPm5D80tnFR9mo3WX6KKkkCajOtzqcJcAiCHJ
	94BJcwjX28mnCA0Eu6LnBsIIfDyjdAx52WTG7iqw0DUbehqtAyoIpQMXGZnASkEwKl3ns8jKM0CWy
	dVLNkpHg==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0i63-00000008Ky1-1Ffi
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 15:04:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77f41086c11so880636b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Sep 2025 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758553493; x=1759158293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=;
        b=EDOeyRW3mUgNwlbiFNHM9r+L3cIemL47ghVZ+fxjtV0GHj5qfUS7/q1o/mtJwJG0E0
         BUe+8fJmM98Tk0yw/FbCkt/dwWOUXRsGK+fr2GFAphCde8MVztapfLCwK8ntySmTZCLS
         bxj7ozvu6xqCMEsfESsedT/fCNaKFmkex2QFU0Qely6AWp53rf1ua8NEwiQSDk09ynxR
         HRnqHhAPNmRivnaO946tqQXzbjJq9hU5VdHA/ji0IRCP7vr5Q+dY40FB+NNF960zMmB7
         VgC1I7xvHM3N225ba3xhAkt5z+hTqliN/MjoMD1+XMBA6/LGCpND6HiA9SQ/opWw2LRt
         Ei3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758553493; x=1759158293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=;
        b=Ngl2tevXA2yQ/0jSOTAysO71VVI8rMfyulVuB3GKXtB+k5euVD35KCe+3hEONTg6hB
         yZIwuoFBPZfyPBRv9pNTF5f6HtsB49nsludONGoKjuMYfH9+M95K7gatDYYaopd19GXS
         oknHRCM//kiUAC/k6KTb7bVSI07FBoAq11dmV+eidpVAMmSGw+j8FYhcvJ1KjsPaFKr9
         dIeHl+BV1Y3GMZGO7qy3+ZEPqzLxPz3JHBNjmqw3AuOAlSJeGGAO/l3hysWtfes4RxEe
         GvkGLg3m87zNTsVGhzybE9NHg1xcsDqx6wfmws5+OLQmRYsqkq8w1u/82jq33W6ILnX7
         LJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaLslv8BgNVm2UZqhyMctP41DjPtjDRLDVor+Vk+4bN9JtQrY+BVuic3C12xzVwrz7LO912LnjZHd1383Zfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFQkvD1qIrRcHLWVKwB5K+J5fffI5yVanIeEWN8xphnYdAaxA2
	fZih1U/qmMPRz9ZoWktB6bj8zAGEutpaoIPyiKZqSBRO1C0ohbSTyAUX
X-Gm-Gg: ASbGnctt1OtfHfjYF+wLo2i5iAlhorlz6y+pVz22ovwnYsnxmbIMRr4lnZ04SwD7H89
	4LqTuvBkX4FS+EiWPkYLO5MmBcuyEh2FHXcVx1ZUb244A4jcywtynCPXxPdT61yVVJHt0tFKy/7
	f/dMTWA4sL7seAlS8boqJqo2mpZWmU4Hsu0CR3yWoyPn4mQt5bFH2DqBr7S8NWDXCJAHs0BE1XT
	3FDnkErJkr5klR+aQxyda8WOz/E7sZbM8g+BqSyxvbU2tCmH371qT2tq473hCQcRR3TdkTvOJXd
	ixU4HdUG3PSos34K5+l9truPH4zHoCBpfoeldhCi5Ts3b640x0Ud8J6eyCK8syai2E+5qfMNjw8
	jWsfda3ZBLuNKsTTZZyZ/Yg==
X-Google-Smtp-Source: AGHT+IFeAHlS4iAJPoHh7ZOm/cwEens/eNTaBkhmdeLozkDog20ChhiRrPA5x5jaDTgoFT+gLSoGCw==
X-Received: by 2002:a05:6a00:9289:b0:77f:2ab3:32d0 with SMTP id d2e1a72fcca58-77f2ab33626mr6873061b3a.31.1758553492759;
        Mon, 22 Sep 2025 08:04:52 -0700 (PDT)
Received: from lgs.. ([101.76.246.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f315029c0sm4101850b3a.47.2025.09.22.08.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 08:04:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] powerpc/smp: Add check for kcalloc() in parse_thread_groups()
Date: Mon, 22 Sep 2025 23:04:42 +0800
Message-ID: <20250922150442.1820675-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_160455_449940_3CEB7797 
X-CRM114-Status: GOOD (  10.97  )
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

As kcalloc() may fail, check its return value to avoid a NULL pointer
dereference when passing it to of_property_read_u32_array().

Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 arch/powerpc/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..2da064e00d0d 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -822,6 +822,9 @@ static int parse_thread_groups(struct device_node *dn,
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
 	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!thread_group_array)
+		return -ENOMEM;
+
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
 					 thread_group_array, count);
 	if (ret)
-- 
2.43.0


