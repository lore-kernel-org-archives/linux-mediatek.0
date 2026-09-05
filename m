Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A9C624DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2026 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fM+j7norTYR8QsxEnlvpOJCJBRRwrvQfTaZrlOY6bi0=; b=MeLfI9Q1+8JtZt/XtkZGPQ8e4m
	TEBcdu2wm+DKfmJv3ME4OElKjkH4JqLY171sPyKGuMAQa8vSiZrYQbF0JSmIAYs/nD/c1cv2VLfUo
	eZcQcO2iIrEDmrMFqGcR+HVtBT56zkb6rj2P735diQBYj+lRa8xqRque0Re7IDgvzBjEOgIXx60a8
	cMXEsau4vJ4qFR+tgDTTKYIIiaqqIPjRFlhmahNcS5+xsp24/ScoDygdFn3KSGRoKRIbgcsBiSGo5
	RK1BX+c/QllKkWtujJ/hv0k3ueQuEPX+3e0tYpcaNpWMmiEqPgGIP84PUAt9H+WEnMVLPkm54WYTK
	TyMCCaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mEB-00000003tL0-2QhX;
	Sat, 05 Sep 2026 08:58:23 +0000
Received: from enxio.de ([91.210.227.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mE9-00000003tKI-0osn
	for linux-mediatek@lists.infradead.org;
	Sat, 05 Sep 2026 08:58:22 +0000
Received: from [95.157.48.181] (helo=roja.toh.cx)
	by enxio.de with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <thomas.hilber@enxio.de>)
	id 1x2mE3-00000009MnK-1uz5;
	Sat, 05 Sep 2026 10:58:15 +0200
Received: from localhost ([127.0.0.1])
	by roja.toh.cx with esmtp (Exim 4.94.2)
	(envelope-from <thomas.hilber@enxio.de>)
	id 1x2mE2-00FPKC-S9; Sat, 05 Sep 2026 10:58:14 +0200
From: Thomas Hilber <thomas.hilber@enxio.de>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: linux-wireless@vger.kernel.org,
	ath9k-devel@qca.qualcomm.com,
	linux-mediatek@lists.infradead.org
Subject: Re: AP drops STA data frames for ~130-170ms after 4-way handshake
 completes (ath9k_htc, mt76; not brcmfmac)
Date: Sat, 05 Sep 2026 10:49:46 +0200
Message-ID: <20260905084946.3643161@enxio.de>
In-Reply-To: <178842137902.19372.6968639520035628037@justthetip.ca>
References: <20260827074442.826644@enxio.de>
	<20260829232532.29622-1-lucid_duck@justthetip.ca>
	<20260830104236.521389@enxio.de>
	<20260830190028.20209-1-lucid_duck@justthetip.ca>
	<20260831054740.1543875@enxio.de>
	<178842137902.19372.6968639520035628037@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_015821_239783_112E2AAE 
X-CRM114-Status: GOOD (  19.83  )
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

On Thu, 2026-09-03 at 00:42 -0700, Devin Wittmayer wrote:
> So the measurement worth making is your key install.

Measured. It is not the key path.

Both tracepoints, paired by pid, taken during the same 150s window in which
the stall was being measured on the station side, so these are the same
associations and not a separate run:

                          station side              ath9k_htc set_key
                                                 (drv_set_key -> return)
  nohwcrypt=0   5.01 attempts, 134.4 ms      median 0.418 ms, max 0.663 ms
                n=183 cycles, 98% >1 attempt      n=394, none over 50 ms

  nohwcrypt=1   1.01 attempts,   3.8 ms      median 0.001 ms
                                                  (driver barely involved)

394 key installs, not one above 0.7 ms, while every association in the same
window was losing 134 ms. That is about 320x short of accounting for it, so
by your test the two-mechanisms reading holds.

One caveat I cannot close from here. ath9k_htc is a USB part and set_key
ends in a WMI write, so "drv_set_key returned" is only the driver call
returning. If that write were queued rather than acknowledged, the number
above would be measuring the queueing and not the install. Against that:
0.418 ms is about what a USB control round trip costs, and it is far too
slow to be a memory write, which is what it would look like if nothing went
out to the chip. So I think the key really is in the part when set_key
returns - but I have not read the WMI path to confirm it is synchronous,
and if someone who knows ath9k_htc says otherwise, this measurement is
worth nothing.

You are right about my 22.2 ms and I should not have offered it. Timing
first-frame delivery at the netdev can only ever time the frames that
survived, so it cannot distinguish deaf from slow. It was not evidence,
and I have dropped it.

Your induced window is a much better instrument than anything either of us
had before, and it is worth saying what it does and does not settle. It
shows that a slow key install produces this signature. It does not show
that a slow key install is what produces it on hardware where the install
is fast - and on ath9k_htc it now looks like it isn't. Both can be true.

Thanks also for the retraction on the reorder window; that saved me from
building on it. For what it is worth, my TID 7 sessions still show your
exact mismatch, declared SSN never arriving in about 97% of them - but at
the same rate in the arm with no stall, so it is a real pattern here that
simply does not track the symptom either.

Where that leaves ath9k_htc: association completes, the 4-way handshake
completes, hostapd authorizes the port, the key reaches the chip in under a
millisecond, the block-ack window opens on a sequence the station does send
- and the station's first several frames still do not come back. I am out
of hypotheses that I can test from outside the driver. If anyone on the
ath9k side wants a specific tracepoint or a debug patch exercised, I have a
bench that reproduces this on demand, roughly 250 associations per two
minutes, and I will run whatever you like.

Thomas

