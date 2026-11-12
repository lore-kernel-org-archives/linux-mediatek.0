Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEF606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qsGIjbIw;
	dkim=pass (2048-bit key) header.d=thregr.org header.i=@thregr.org header.a=rsa-sha256 header.s=v1 header.b=D4kRu29O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FQEToc/tllkwE/usKVnhOlAx/N0Rs4tX+3kATA9NrBg=; b=qsGIjbIwlc8Jlnv5o60O4hddX/
	PDfpC7u0+ZY2Hte9jxqnOucI+T/wgxed3RQ981Z5A/PYmOLqH7FTBAn1Dha1k/Hd1QDZUdPol4JAJ
	OLkrlsxpaku2FZIClY9aGWhTVMfHRXcxVLbcdj+NcJE85YVyc7kZELCxt1WtyDH1E5PpvOLF82hDP
	YOo6luEtz1EefjxeAZ3z00G/UAyKQO04bZS5JYPrpEwFFm0LR8UMoGh6sWrcej7XBHUpyf63yM+Z4
	wq/28dsInJ7My5rx00QR0kM1fprIy/vagb97JRdUBpjaCRvjiEHrKMqpGY5oiwjldyvDzLhS+8z4L
	Fks+YrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVE5-0000000A9H6-04io;
	Thu, 12 Nov 2026 13:52:29 +0000
Received: from erc.corrupted.graphics ([2a0d:f302:114:5502::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVE3-0000000A9FF-0m40
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 13:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thregr.org;
	s=v1; h=Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	In-Reply-To:References; bh=FQEToc/tllkwE/usKVnhOlAx/N0Rs4tX+3kATA9NrBg=; b=D4
	kRu29O30nTECC5LmTvTWsDx4JUKUycz8dJgYWoujzhtzkwE+ZjdA72hEsh5NOpT4WGKVXbEEvzIOA
	rU89YQcFSWufak38uTi0NxTCb778gooTUJZxtLytRtXbCYvy+SQJXIaycxv8vQRvzV3HciEqkpPtf
	euPuo5iH7Mb+u1jX7loAa1gYaO91qBeClx5o7uvJ+5npYZvOQuDtyOqM0JANVRNjA2+WlVG6aCFYt
	WMhvTQNIrQHgvxVmsiIrPXCkPDKhn6CtV+G9swZLWwsKTwDt+cNRglqUizrGQmDjp7z4oh8xKr+Mb
	6Dt/SObMyG8TYLVmdO0kFyzLWSv8EsJg==;
Received: from 78-213-86-123.subs.proxad.net ([78.213.86.123] helo=localhost)
	by erc.corrupted.graphics with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:SECP256R1)
	id 1xRVDx-00000000ASf-4B8d (envelope-from <wavexx@thregr.org>);
	Thu, 12 Nov 2026 14:52:22 +0100
From: Yuri D'Elia <wavexx@thregr.org>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
    Ryder Lee <ryder.lee@mediatek.com>,
    Shayne Chen <shayne.chen@mediatek.com>,
    Sean Wang <sean.wang@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>,
    Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>,
    linux-mediatek@lists.infradead.org
Subject: mt7925e: TX throughput collapses without RX traffic
User-Agent: mu4e 1.14.5-pre1; emacs 32.0.50
Date: Thu, 12 Nov 2026 14:52:16 +0100
Message-ID: <874idm2m3z.fsf@wavexx.thregr.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_055227_256218_F5F0C4C0 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I'm using an ASUS ProArt PX13 with an MT7925 that performs randomly.
Sometimes it has decent throughput, sometimes drops to a crawl.

TX throughput collapses whenever the host is not also receiving traffic.
RX is fine.

I'm on 2.4 GHz 802.11n/HT 20 MHz, MCS7 both ways.
The peer I'm testing against is another client on the same AP.

I did a UDP test with 1200 byte packets, sending at 5 to 40 Mbit/s:

  MT7925 -> peer:
     0.6-1.0 Mbit/s received at any sending rate, 1-2 s queueing
  MT7925 -> peer, while peer sends ~200 pkt/s to MT7925:
     5.0-5.8 Mbit/s received, ~0.13 s queueing
  peer -> MT7925:
     all received up to ~20 Mbit/s, no loss

Same result on:
- kernels 6.18.62, 7.3.3, 7.4-rc1
- MT firmware 20260605184805, 20260813113118, 20261016233029

The following had no effect:
- ASPM L1/L1.1/L1.2 off, runtime-pm and deep-sleep off, power_save off
- AQL off
- TX A-MPDU sessions kept stopped
- IOMMU group switched to identity
- Bluetooth rfkill-blocked

What I see in the driver:
- Without RX traffic, frames go out in bursts of ~48 (the UDP socket
  buffer), then nothing until the next TX-free report, up to ~1 s.
- I sampled WFDMA registers through regidx/regval during a stall
  (~7 samples/s, ~20 s): RX ring 2 DMA index always matches the
  driver tail within one sample, the RX data interrupt was always
  enabled, and HOST_INT_STA has nothing pending. Ring 2 advances by
  only ~13 entries while ~1180 frames were sent.
- Wi-Fi IRQs: ~2.6/s idle, ~82/s during the stall.

So the driver processes ring 2 quickly. The firmware seems to write
TXRX_NOTIFY only about once per second when there is no RX traffic,
and sooner when RX traffic arrives, which would explain the seemingly
"random" performance.

There are several reports of poor MT7925 throughput on linux-wireless,
the kernel bugzilla and the openwrt/mt76 tracker, but I didn't find
any that points to this.

Is there a firmware setting for the TX-free report interval or
threshold that mt7925 should send at init? I can test patches and
provide more data.

Thanks

