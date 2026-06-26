Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E106FCD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=; b=UVI40CSO+AsmBi
	TyxRDjwXab5Bxqjagbr0x2nWH//8uw6RKtXVLpG8IsKtRQ5SCihtNxGeJGvZGSbHBwVLqpZEAI3Mb
	hvYkjqTlO3qm2FZkeRhexMr0k6bBELwF8ZIxayYaW1MyTQs35fznoAq7tkWvKjOhYR2F7ybrUCpU1
	DLXRGuXKc4bvvUSgI9RUkyZEn4Heuv2izYNI1HOL0GW2SP0gt6seedScEMsFKaT3lFYPnlkhiBcRK
	QUSaAgx8sVx+fkC7O59UMHctz+htBAXu5hJ47Ok5hvswkolqUOR9IpKyiAibKrURXpG/WS7ZdanF1
	1gZJ9kMCvUZDVzl/WIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qD-0000000AqAL-0A8z;
	Fri, 26 Jun 2026 08:23:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1q0-0000000Aq3E-42ki
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 08:23:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c7f1db3ad4so6490755ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462179; x=1783066979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=;
        b=aZj2hlL0lPnlj64cU8ttlQvur1mpOhzDDQcIFb7rkAVHQprtlpJZGz5wETUOpzlpLQ
         W6oo9jrOYKaVcXVJrYjvIr9PIb6URCnEIw/W4Aw8QfupeY/t/GtSLwzaY91fx3ZKcXG1
         J/NTg2a6KTL4rOHXnqZAfa+x4NNEGt8cezHoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462179; x=1783066979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=;
        b=rD4Mi0VduX1219CUmVeptVotBnGfnG2h+KHsX8B0Rsgd3hDi7ZOY5wQYYY2EpWPpzc
         0hM9HzY5vxSdP1sCuy1kNghTkg6c84OWy+Z2XC+1sZiuiTSHmnWewWp9cAW5tOqwQdNN
         v43pliXQOlUy+b91UeN9ajBAA8jYmkjDtq5V/djeB+fdTkq9ldcSJF2N1wYuHF3ZQ7R7
         gSJpxP69kKNhVyJDzBaRFP7PFFYXpkV5W5ibi6frqgXMu59uRGzmFoUMWJPViHSgtlJ2
         oCtnuP4JieI2/I4rbJsz39eZGRL3GVOV42ozd67ZorjbhunRJt/RggFe+KPGSK7H75bK
         kfxw==
X-Forwarded-Encrypted: i=1; AHgh+RrK0d+QGTWAQe2FJhdn3g7Pt0DKoBu799eVJL0ZrJmLSpcuffsWZJ8JCCme0gPpvd4IREQK30bNX7J6O/qWCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+vZuoWtsaxeeDoP5K6hHNZeRHU4yIFTnhvIMYZStvnLpYOE73
	APmPWhyjzkSuCO1IoAU1s25C5C7iyfuEZby+vtPghsfMeyLrWPP1mq6iLBynxMgwIg==
X-Gm-Gg: AfdE7clLBODiDsFuI5moXLwlTLEidKBc6rLWaD6h22NfjAnBi7ygDhs1IFvcPb597n1
	kR06uStqFHZCyZnX8jd7aqyIqe9a4OjAXJHnaDZlUH+laJtUqpkSSb743S2RBUHYWQe2D8FEqxT
	wFHP2IP0ZRVezM+zSFvE1LK/gFrnQ6a1nffJC7SGoryLPR4SInYzArq8jZHc01PcjpED2M9BJQs
	ZjvdcuiROZdgwYZKIiLNRz+qLdBIaMhe8Qzxngg15xBzjCIPPxBxK1dT0tmW21B7TclC4gyzAe4
	oBtbE6RXAvQPAYbZyr+L5jCWKDi57ziqLvxdAPICcqNn0N8VhSIqvZsrPYAdp8Gbyma/6N5aN3C
	k1OXB/Z9WzhKSms+AhHmKHwZaepFQNS2hDUusXkOL0JHEsqIKXlLXOET6hTz+SRxaJV5ibK+ty6
	vTgH4QwhmJRZTWqPoRr2up+UTSIatyTN6FOaMp+Y4LYXYPqNcGlrJkncTlm+DqibvCqKfFFm4=
X-Received: by 2002:a17:903:2a8f:b0:2c8:218d:4373 with SMTP id d9443c01a7336-2c8218d4499mr8132345ad.10.1782462179430;
        Fri, 26 Jun 2026 01:22:59 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:22:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 0/2] usb: mtu3: fix system suspend failure and improve gadget PM
Date: Fri, 26 Jun 2026 16:21:50 +0800
Message-ID: <20260626082218.2750459-1-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012301_112263_6A174FA4 
X-CRM114-Status: UNSURE (   7.39  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This series resolves system suspend failures and improves power
management in the MediaTek MTU3 USB driver when operating in gadget
mode:

Patch 1 fixes a system suspend failure when connected to a host by
restricting the active connection -EBUSY check to runtime autosuspend
and performing a soft disconnect.

Patch 2 improves PHY wakeup handling by conditioning setup on
device_may_wakeup() and restricting it to host mode or runtime suspend.

Regards,
Fei


Fei Shao (2):
  usb: mtu3: allow system suspend during active gadget connection
  usb: mtu3: condition PHY wakeup for host mode and runtime suspend

 drivers/usb/mtu3/mtu3_core.c | 11 ++++++++++-
 drivers/usb/mtu3/mtu3_plat.c |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


