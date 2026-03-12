Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7250A106ACD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoEyDsrNn1sJQQOf4n4C8gB9lLJkwHU+ONbuO6JKHL4=; b=M3p0HR9DfOEBSzwHhKk9Pr7ihV
	JsuEZkcNnMjez3xxEhLTTrUrBfDzN7Oj0E30Op0UULzWf8c4sVw0HYZozUqBtAIuEs8uLQvwaGGlV
	QLPVa3C+erJy34rQmMclCOlAU4kmkKrcErgwfQ9ul+OPaYFR6vHOTOLXiL79vBUgkhQDfKnNB97+j
	L+iVYa/tSnqn+9EWmBeaq4daXBAsQFCHBm/iH5GQtT49RbI9OaMzTDtrr7clmu0sDIuNxLkNmtkcC
	bcRVChdfGyLoRlc6XfpGnoMtWyitFCOfavgIwZXF9+og19ChdNyaEnalPN+yCchW/8l6G5XV5bpsX
	SQbi8fug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jzz-0000000EkPB-1PHJ;
	Thu, 12 Mar 2026 17:39:03 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jzw-0000000EkH2-2owB
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 17:39:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1773337101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QoEyDsrNn1sJQQOf4n4C8gB9lLJkwHU+ONbuO6JKHL4=;
	b=xCQvY7ulUNj8rywydE9yTLNU1Ziq9y607ZEFkqt8/TvGNJ8RbsnH6lflbODqueNGkpjJye
	wwh1Ar2lim4h2NIGcosX0wykE/MBz2hAfWJXTk0x6QtNUiD4ULAPmJxF9zlE4jokGEaM2U
	9uNTU+08bXfwZK8Cs/d3ZozijpDxJft1z37NXVv8tiwvte+OAY9iwvMJo6RanQZNrLVTSW
	l7V2NYKCvwMJaDCa6M7mZh4bY0sqnEolmLOH21pjWShJ6ZuwFMxR/DDpJgu6QFyJoWlc2o
	stjFXKAuEyo5nqY34fR4OkwCUBWkXQp6s2zzlXIoUJKh2znvBOwrCwU8zekzBw==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: bryam vargas <bryamestebanvargas@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mt76: mt7921: add mt7921-specific get_txpower callback
Date: Thu, 12 Mar 2026 10:38:12 -0700
Message-ID: <20260312173812.169961-1-lucid_duck@justthetip.ca>
In-Reply-To: <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
References: <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_103901_056686_92B5E0B2 
X-CRM114-Status: UNSURE (   8.88  )
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

Hi Bryam, Sean,

I tested this on my MT7921AU USB adapter (Alfa AWUS036AXML, Fedora,
kernel 6.18.16, ISED/Canada). The callback itself is clean and with
one fix it gives correct values on all three bands, stable across a
full gauntlet. Nice work.


chanctx channel source (affects all mt7921 phy->chandef readers)
-----------------------------------------------------------------

This one bit me during testing and is worth flagging because it
affects more than just the callback. mt7921 uses the chanctx model,
and mt7921_add_chanctx() stores the context in dev->new_ctx without
updating phy->chandef. So phy->chandef.chan stays stuck on whatever
channel the firmware scanned at probe time -- channel 229 (6 GHz) on
my system. I confirmed via debugfs: "Tx power table (channel 229)"
while actually connected to 2.4 GHz ch6.

Because the callback reads phy->chandef.chan->max_power, it returns
12 dBm on every band. mt76_get_power_bound() has the same issue
internally since it also reads phy->chandef.chan.

The fix that worked for me: read the channel from the VIF chanctx
(falling back to phy->chandef.chan when unassociated) and inline the
SAR + delta math to avoid get_power_bound:

    rcu_read_lock();
    ctx = rcu_dereference(vif->bss_conf.chanctx_conf);
    chan = ctx ? ctx->def.chan : phy->chandef.chan;
    rcu_read_unlock();

    if (!chan)
        return mt76_get_txpower(hw, vif, link_id, dbm);

    n_chains = hweight16(phy->chainmask);
    delta = mt76_tx_power_path_delta(n_chains);
    tx_power = mt76_get_sar_power(phy, chan, chan->max_power * 2);
    tx_power -= delta;
    tx_power = mt76_get_rate_power_limits(phy, chan, &limits, tx_power);
    *dbm = DIV_ROUND_UP(tx_power + delta, 2);


A note on Sean's rate power loop direction
-------------------------------------------

Sean's feedback on both our patches points toward deriving the
reported value from mt76_connac_mcu_rate_txpower_band() -- the loop
that computes per-rate power limits before sending SKU tables to
firmware. That would sidestep the chanctx issue entirely since
txpower_cur gets written at configuration time rather than computed
at query time.

Looking at the code, mt7915 already does this (mt7915/mcu.c:3396):

    tx_power = mt76_get_rate_power_limits(...);
    mphy->txpower_cur = tx_power;

The connac equivalent calls mt76_get_rate_power_limits() in the same
loop but discards the return value. If that were fixed to match
mt7915, the existing mt76_get_txpower() would report correctly
without a per-driver callback.

That approach would also cover user txpower limits for free --
`iw dev set txpower fixed 1500` currently succeeds but the callback
reports the regulatory ceiling because it starts from chan->max_power.
The rate power loop already reads 2 * phy->hw->conf.power_level
(mt76_connac_mcu.c:2162), so user limits would be reflected
automatically.

Either way, happy to help test whatever direction v3 takes.


Test results (chanctx fix applied)
------------------------------------

Alfa AWUS036AXML (MT7921AU, USB, 2x2 MIMO)
Kernel 6.18.16-200.fc43.x86_64, ISED/Canada

    Per-band (10 runs each):
      2.4 GHz ch6:   30.00 dBm  (ISED: 30)   10/10 PASS
      5 GHz ch100:   26.00 dBm  (ISED: 26)   10/10 PASS
      6 GHz ch5:     12.00 dBm  (ISED: 12)   10/10 PASS

    Band switching:           18/18 correct
    Rapid cycling (20/band):  60/60 PASS
    Regdomain (CA/US/CA):     9/9 PASS (5 GHz: 26->24->26)
    60-min soak (5 GHz):      61/61 PASS, zero drift
    USB torture (module reload, monitor cycling, assoc interrupt):
                              20/20 PASS
    Kernel errors:            zero across all phases

Tested-by: Lucid Duck <lucid_duck@justthetip.ca>

