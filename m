Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C8DC5DF81
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYbsrWivBMCeajuwceCcXZv8DWqP+VkuZva8rP+5LTk=; b=ARP526YTrWY03mnn+xb9QrqP86
	UBHFWHceYypm4AAlwHG5Guj+eJp5rpSRJRcPvoinmj6uWrtoq44usEArje09U86gDDwWGeQ4b1VKV
	nwIwZu6OfQTPE/xovEtjXEDz4UwNRhZt7prb+4QWk36G7Mh6k766L7xrQ9COsnRJW3HUHE7XS4Vr1
	pEpq4qycgzxWWu/CtgsNNZoBiL/APIf3uJNvipN/nZLKdgRFYu9XwKMCOMNDddqfSjTRzw3ZjfHMo
	IFHyG9nlGfnPIZW+CgX8pnxsk2LOtCE+eTzifzo6yYMcBytAbQYqisT6u81+QD8nC5YmuTaXDAcrZ
	S8UeitFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjso-0000000AG7j-3ztj;
	Wed, 19 Aug 2026 17:15:22 +0000
Received: from out-121.mta1.migadu.com ([2001:41d0:203:375::79] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjsl-0000000AG6a-1l9t
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 17:15:22 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZGyWkzttW3nnagzLYFMbHLzIPd7mtY05HDR/82e8DcI=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787159712; v=1; x=1787764512;
 b=U8cSw0MW2e6g2QBtQZQD/7lMoO5b7STVbZ8eb/XEPs9bVb0RmEUSSVwhlZoQ5sGlku5Hk/Av
 hwSg5mE7w+S0HF9GfcOOIXZHhxI4bpeGSRWUyXccVePcINT9TSH91ug+YR/sKv2tjaHjkdq0two
 ZOApiYdIV6uQOHB+V6RhsIT81X7VEQHHEo4zl0RJop9ZyXLzxVk7b00tQuwVNip4ClOXPqz1QOR
 Ku5EPYCaKsvr+tjU0629fNqR6Lk7fGXeU8F8e1qnzbntVjy7EQ3+rkKPJR6zOKHyKFGAzQgixXo
 9fCWMhx6uDi5PFwHBaDiXogdhwrd0p+pwjk4fciQpWTvw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora.lan (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id b01abdb8988f6c9c;
	Wed, 19 Aug 2026 17:15:01 +0000
X-Mizu-Trace-ID: b01abdb8988f6c9c
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: moosager <moosager90@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>
Subject: Re: [PATCH wireless] wifi: mt76: mt7921: check drv_pmctrl return in the PCIe reset path
Date: Wed, 19 Aug 2026 10:14:54 -0700
Message-ID: <20260819171454.21329-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <an23_8DALILoGLP6@fedora.fritz.box>
References: <20260809012309.43657-1-lucid_duck@justthetip.ca> <an23_8DALILoGLP6@fedora.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_101519_893506_DA2FAC50 
X-CRM114-Status: GOOD (  14.87  )
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


Thanks for testing it, and sorry for the slow reply.

If you're up for it, reply with this line and it'll get picked up:

Tested-by: moosager <moosager90@gmail.com>

Fair point on the 2022 one. The difference is Deren's had to be a goto
because napi was already torn down by then, mine returns before any of that
runs. Still doesn't tell you why the handshake fails though, you're right
there.

On the debugging, I instrumented the same failure on an MT7922 back in July.
Wedged, it read lpctl=0x00000004 and misc=0x00000003, and a scratch write of
0xa5a5a5a5 read back exactly. So on mine the bus is fine and the chip is
alive, it just won't give ownership up.

Yours reads 0xffffffff where mine reads 0x4, and that's the part I'd chase.
The same write test tells you which one you've got, no patch needed, and
nothing on the host side reads that register:

  echo 0x54000120 > /sys/kernel/debug/ieee80211/phy0/mt76/regidx
  echo 0xa5a5a5a5 > /sys/kernel/debug/ieee80211/phy0/mt76/regval
  cat /sys/kernel/debug/ieee80211/phy0/mt76/regval

Comes back 0xa5a5a5a5 and it's alive and latched like mine. Comes back
0xffffffff and it's off the bus, which is a different bug.

Your repro wedges an MT7922 here too, for what it's worth, not just your
laptop.

Devin

On 13 Aug 2026, moosager wrote:

> I would like to reiterate, though, that a more complete fix should be
> pursued by anyone who has more knowledge of the driver or firmware.
> Previously, a marginal improvement like this one was applied, but the
> issue persists to this day (see [1]).

On 4 Aug 2026, moosager wrote:

> and it expects to find 0x00000004 (which is PCIE_LPCR_HOST_OWN_SYNC).
> Instead, when the issue happens, it finds 0xffffffff, which does not
> change even after the driver attempts to write to it.
>
> I would like some guidance as to how I could debug the issue further,
> though ultimately the problem is likely in the firmware.

