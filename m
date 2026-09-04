Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A752AC79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 23:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8J4pfuEqg45wBz2OtxsLmdgWSWNFwt7hzDzefF/UB0=; b=dHln51qOWXAYnRg8N/gFy+xtNe
	wv8JzMaG5Ir+v8KomwdhUcTnpCJS/p/QN/ozHf6iOIxRqWnF9e2+DRJIZr6NUKWXfBaMjQ7o/1YNM
	Ld5uk63V3Bd0kvRerawyA1hJpal5QjihEbNzT3d9so/inZ9g59EVxVxERYbq+4md65KSWiUFU9bh2
	pQLjgl4ItTTV7NDOScKo0z2Y3sPsMR0yoaGqMfZFcTf8jbJmcUEbT/+/s0HlEQs/zwDtOMqhuvROW
	KOTijA+Lc5UfJyuTVSkGvYOgJlQfhw0Q8D2rdtt7SVwWDkGGxIDQzuuktUiZbX3rJAca4Pin17Q04
	gQNvtTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dea-00000003UIG-02QA;
	Fri, 04 Sep 2026 23:49:04 +0000
Received: from out-54.mta0.migadu.com ([2001:41d0:1004:224b::36] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2deW-00000003UHl-0wU5
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 23:49:02 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ala5/BLJL1vTZTT5rbnsc1HNb2XPUuq3vvbqNTEsGFM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788565735; v=1; x=1789170535;
 b=v0SOakSsLwcrG1+czFK5BX6o+NUDmnmQnkYAQ60LL+W0RvcfH9Y+gobOTuCvnJ9jMRT1PlQ1
 X1Y/UW0jMw8ESWwtM6GAg2jNgSGBqsNDIBjEZtxbCSupJsAT0gCYk2hB5MRX99ZtoDaUh51+6+/
 MAx6KxafXTk0u1/W9/xo7ilY4wjKuH/0lhyNOZZYWT6Al3UujxolEonJjkejK8X57w6N9FPW4In
 TrVrtMjv4yMkfPqQ05TMULzuMb3fhkO6i8zrhRaZ6xtASzG0s6MkdQI7QskHsnKEL6C1aqaf5vl
 RyOY1uIZ607s6+f4NByH70mPwzhHl6NWrRJ62Yy+ksk+w==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8d2a338e5845b8b9;
	Fri, 04 Sep 2026 23:48:45 +0000
X-Mizu-Trace-ID: 8d2a338e5845b8b9
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Klara Modin <klarasmodin@gmail.com>,
	David Gow <david@davidgow.net>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt792x: fix NULL pointer dereference in mt792x_init_acpi_sar_power
Date: Fri,  4 Sep 2026 16:48:38 -0700
Message-ID: <20260904234838.19342-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904161826.5638-1-scardracs@disroot.org>
References: <20260904161826.5638-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_164900_919146_30710569 
X-CRM114-Status: UNSURE (   8.92  )
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

On Fri, 4 Sep 2026 18:18:26 +0200, Marco Scardovi wrote:
> Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")

There is a patch for this from 25 August:

  https://lore.kernel.org/linux-wireless/20260825181712.28548-1-lucid_duck@justthetip.ca/

Klara Modin reported it, David Gow confirmed the fix on a Framework 13.

One note on the Fixes tag. The crash needs a regulatory update to run
before registration, and that only started with these:

  9b80bd9cab40  2026-06-09  mt7921 regulatory wiphy self manager
  e9f3f1cc133f  2026-06-09  mt7925 regulatory wiphy self manager

Before those it just set flags, so the 2022 commit would reach stable
kernels that never had the bug.

Your trace enters through the regulatory notifier, mine through
firmware init. I could not find mt7921_regd_notifier_work in mt76
here, so if you have a second trigger I would like to see it.

Thanks for taking this one on.

Devin

