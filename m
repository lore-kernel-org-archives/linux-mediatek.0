Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1728EC79F83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d3i5vsIWrW0LnXkTIgLG8qH4rN5A0QE4fwZ0GUTw5k=; b=e8kFUpEYcz5RsULanWBkcMWtY0
	xSyrJGL7tacXYDGr7wMMuyWSS3wtCOS5aRWQSwoLmkFVXXGRPfvBr8DP6zQ+/0lRS+WGBOAD25m8d
	1SqKc1TExRT2I/6zXBX7xJjXtjsWqVDTuP8iiVhWjbSy121wlR9jDanxfS75ZHGq0NJdh4lzL9PBY
	tSmrzrS2jrF3ESp6OmsdR+Pyw6waRqAuJcdxI4Q4+VhQJMKhuL++cnmz+xtLPPQjmsQ2DYIuCb4Mc
	dzHMSLLPAR8XAt/mTi9tgqkerSlhUWX5GJ63cuRFFnNizO96bUX0G3Kf6tEsL7E/F1d5yUracZxtH
	7KzTfzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NZv-000000019JS-1EYC;
	Fri, 04 Sep 2026 06:39:11 +0000
Received: from out-5.mta0.migadu.com ([2001:41d0:1004:224b::5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NZs-000000019Id-0eWQ
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 06:39:09 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YGvx98Tz2FML0LvjF/Dg0WhaeyNHH+kTPvoeQxEpaqE=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788503946; v=1; x=1789108746;
 b=t9uZ1IAPZDFqe1UQyWDPG0VoXwWLzSyJv0Y6ZqOswUvN+VdGUMPD2KZ8r82NiYGeCUtqxON1
 hxZxyOgfZVt9x32Y2vZiPXFoVtxQ4sVZn6VU8uFAWWqRKPCoZdjm7li1zk5/cl0VcoeGzASQ9i0
 vK2O2OZ1927KifoOoBrl46emPhyadgdHsT/BVCM16mWb1gb7kMal0ku0f7RzKz6uEYTUp5ghvvS
 9rYPb09M7i/Qql50yCI49Of7v4erppoVX/WUyCKPgfNRp2mKrolOFgKfuwBvlBcQOpqMNVam89c
 9qnVTn3JqN1YUuMN8TOd3Pbgay0YAg4S3N4h0fkRgVBgw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a199b6197a3cee6e;
	Fri, 04 Sep 2026 06:39:06 +0000
X-Mizu-Trace-ID: a199b6197a3cee6e
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Mario Stanski Jr <mario@getscale.com.br>
Cc: linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	regressions@lists.linux.dev,
	jb.tsai@mediatek.com,
	jwboyer@kernel.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com
Subject: Re: [REGRESSION] mt7925e: firmware 20260813113118 causes severe low-RSSI 5 GHz loss
Date: Thu,  3 Sep 2026 23:38:57 -0700
Message-ID: <20260904063857.55152-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAJe=AAkCeK=-pVve0Ffw_k0UBp4_AiO5BwQ1d2yG-pVe8B0U4Q@mail.gmail.com>
References: <CAJe=AAkCeK=-pVve0Ffw_k0UBp4_AiO5BwQ1d2yG-pVe8B0U4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_233908_530308_13CE416C 
X-CRM114-Status: UNSURE (   8.44  )
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

Thanks for the A/B, and for publishing the hashes. They made this quick
to set up on my side.

Unfortunately, try as I might, I cannot reproduce it. Same ASIC revision
79250000 and HW/SW 0x8a108a10 as yours, both firmware pairs hash-matched
to the SHA-256s you gave, 5 GHz at -70 to -79 dBm against a WPA2 AP on
5765.

Eight arms: two in-tree kernels, an out-of-tree mt76 from 30 August so
the driver is 7.3 era, power save off to match yours, idle and loaded,
and a ten minute soak with a continuous pull underneath.

  gateway packet loss   0% in every arm, roughly 1000 packets
  gateway rtt           11 to 121 ms average
  1 MB HTTPS probes     3 of 3 completed in every arm
  25 MB pull            1.4 to 2.05 MB/s

None of that argues with your result. You held everything but the blobs
and got a clean separation, and I would trust that over my negative.

What it does suggest is that the firmware on its own is not enough on
this silicon at this signal, so the rest of it is in what I could not
match. Your board is an AMD RZ717, 14c3:0717, where mine is an AzureWave
14c3:7925. Your regulatory domain is BR, where mine is pinned to CA by
the AP's country IE. Your link is VHT40 on 5805 and mine is HE on 5765.

If anyone else on an RZ717 has seen this, that would narrow it quickly.

Devin

