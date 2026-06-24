Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3053BCDB481
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BCqeUIYXnFvsifsboKxFvJZWYto9gkhRGJWwSC7wviY=; b=UKWHAbngjhTx7RMUVA+bh0trWT
	41lRGN5R/NxLwGJlKkMOi6Mc1n6LHo6+fisMxxdr/j/LtnxNLSjLwLHnWOBHyeqPhkGre5jguPDzH
	JsUiO6dEF9E6gfsJyds8E5xDLDRjjJrEUGc8wxs15JFFIe/LQ6zh3HVaXxNJXtVoRdVB0T/Hv55u1
	BBZN5CW8F4AH1s4asw1jMOOr4mlPQImXQGR4QNXAf019gXtr8ICyodWmhC+CJIzffsD3vhcod1rbb
	EfxQL9hDto9UTfD5TzTecamjqKC6bZCePCt/hw7TldI496Myi9G7MlmXM1+KpmLbXv9/JUYYGsAb8
	30EYnuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOrC-00000007wB1-2crP;
	Wed, 24 Jun 2026 14:45:38 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOrA-00000007wAa-1uDD
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 14:45:37 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-30b6dad2382so1969703eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782312335; x=1782917135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCqeUIYXnFvsifsboKxFvJZWYto9gkhRGJWwSC7wviY=;
        b=TjSrKmjjU8m09/n+MnmJuaqVFu53gIqIyTsPraqUIyRSctmp+CgCS7hN8bBxxwwHVb
         Wj0NwTK1+rHLbGqEBFN0RddXpuKzl5tpqzEivZRu7+fI5NBidfhYh3m8qvHCPYIa3yoZ
         Q1EEL+mIs0e7TtBTfsqNTUAt2RNL7nbUTSZf3c6A+GZ3MEdrrCix4UeUZ7qkMYQmHcP+
         T7kSFP4Df5zuCKp9U96EKpVqurY0F6ANFQ6Fs9jiTpVsbtQ0bSFiNqdmmWvjtv0et8OU
         Er9bQkoE0/ziaysV2+Xj3BnoorcdJB9YcMjPMkci+2BfqtrDJb2cdLAUiDZbXoWw0Nl8
         f+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312335; x=1782917135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCqeUIYXnFvsifsboKxFvJZWYto9gkhRGJWwSC7wviY=;
        b=SiOlYkv8L6rYtBRKMlGEcSfOjtI9NyfJr8/vvYKPdeujIKztLkETkdtc8wL5/CUlOi
         svjJ9bRyEGW6D0EVqUeQn+MXJ5GCH4Ks94BuDxrKUZIsXuHtCz385QzfS4SiF2L1yybi
         XyqH5jahTt/tvHkzkYodETeBlTbtBOqpbOwE03PQHnl7x3z/vXtAqsrr+in7EN/eMRqt
         VZGJjAcNrRgGAENKyzrfPaQpp8jmcKWyZqMv2HzpWz9MMK6Vx/jzcu5jlvG5QXLDDtt4
         6Aj0J7uUVgeZCfgv8VLVE+Nwsc15wcQNq0+1FnZ6NY1agYBY0JjEobm+k/XQkHgPbGRQ
         NbSQ==
X-Gm-Message-State: AOJu0YwASxRnSc5RB/whjjOinmtXQCvcfF/8LRckhOcUyCUm1P06g5lV
	iQjURESBKh/UAMTKab8SOXiOYfM4VtAgmpuLmEFu/+j6OO7seYs6SrBu
X-Gm-Gg: AfdE7ckB+Zi33jUqWxjegiLb6tR+bjzNKSVlfahmB05eeafe67/HrOSbpvVAxvopLvz
	HyGxEd+zxVxew2qeRttq5FtH+4Aa42mvCWtq1CA7mzGEyfFT0+dbpFhOjxVVLAAF1iTA4OFp3ex
	IULXWdiWhJQBH1dtYxvyTagMGGjDUNAhxvoqgDEbXYB9ei4Dsha+3ZI35OX2yDk+ft05iq7tRQE
	puYEtDWdyPCmRXWzjvoPoSWF++yGRNtgNsb0IbUE1pIABIhj/XBd1ZX0extXM/YCugG/XDyztQw
	mH7+1mzljJuHfS3RYVw+2q/nsy9leGqSuFvq/p/4CStJZIFVnR1CEy4SNureDrOtV3IQNwUq8Ez
	zDCqQYsa7xW6oI1Y+qVm88TnAxsFx4AtjmQvJLlIlvNaWC+VzydVXytefZ21oKHVt1IHgzeVKcu
	qjUYPOmBdn9ENeZqSeDXoeqOfAQ5M84JUojnOE
X-Received: by 2002:a05:7300:6da5:b0:30c:1707:e4b0 with SMTP id 5a478bee46e88-30c58ca3ec1mr6240781eec.25.1782312334862;
        Wed, 24 Jun 2026 07:45:34 -0700 (PDT)
Received: from yyh-VMware-Virtual-Platform.lan ([45.32.131.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba5c25csm24899292eec.8.2026.06.24.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:45:34 -0700 (PDT)
From: Yanghan Ye <yyh94306@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Yanghan Ye <yyh94306@gmail.com>
Subject: [PATCH v1 0/2] wifi: mt76: mt7996: fix runtime txpower limits
Date: Wed, 24 Jun 2026 22:45:14 +0800
Message-ID: <20260624144516.1841063-1-yyh94306@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_074536_495508_190A0DE1 
X-CRM114-Status: UNSURE (   5.48  )
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

Refresh the mt7996 firmware power limit table when mac80211 reports
txpower changes, and enable the firmware TXPOWER SKU/backoff controls
needed for uploaded tables to take effect.

Tested on an XR1710G/MT7996 device with 6 GHz AP mode. The reported
txpower follows `iw dev ... set txpower fixed 1000/2000`, and measured
signal level changes accordingly.

Yanghan Ye (2):
  wifi: mt76: mt7996: refresh power limits on txpower changes
  wifi: mt76: mt7996: enable firmware txpower limit controls

 eeprom.c        |   9 ++
 mt7996/init.c   |  16 ++-
 mt7996/main.c   |  72 +++++++++-
 mt7996/mcu.c    | 365 +++++++++++++++++++++++++++++++++++++++++++++---
 mt7996/mcu.h    |  25 ++++
 mt7996/mt7996.h |   6 +
 6 files changed, 471 insertions(+), 22 deletions(-)


base-commit: 2dd6e4c8892f59b7943ee163afd6ced881bfb31b
-- 
2.43.0

