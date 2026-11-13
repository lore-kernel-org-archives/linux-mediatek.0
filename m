Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE95606A323
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iEqB0W4I;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=KD2+EhXU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VDLNECdA0FBaXHTSLIloAx4woCkfXU3kTb2oMb3EtF8=; b=iEqB0W4IeILAC1
	oU4eFJcTkaYagHgMs9Sv6HLE9dOgUM3ao/dlagGWmkxgEfccTjMwaygthKdW6r6YjuEpDw3u+TnjF
	fzLa5VkEO9oe1zwrLctiVwqTA6/cgQaBwKoSAjE8WLqLeGsf/8/BWJLNuh/sQfGiKyTzt0hCmumxV
	0RSUslDoLpdNSqfBSxM6AGqXfNUMY5s9ZszeYMw2KxaITiEjRIJfRs3ayk4Eul32JD8y19evjlmJc
	qaoEjuMuxGy+tp47xdKh/hWEZ3KuzKcwJwks49invx1eyxWEIdxt5cUBwg1esdN0Na1VYVzpLYOuL
	gwSKhI+HMkWYcEUb1ZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIN-0000000DZ6p-2bSw;
	Fri, 13 Nov 2026 16:38:35 +0000
Received: from out-200.mta0.migadu.com ([2001:41d0:1004:224b::c8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuII-0000000DZ6M-0Sl5
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 16:38:34 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DsGGhe6H+IGHcDdWBvpB1dyDTEzqyfLJyAsQ74U7qq4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794587906; v=1; x=1795192706;
 b=KD2+EhXUJBEmQl6/+gIYJutPhf02ryv4DR7JRL3c3U1kWcRRD2NPfpv1lpSFzsRFR/uhu1R0
 T0xadheyvZJljtSAEPzyqxMmAMRn6RjK75/oGlTEK5/YDHqaF22tdJhOJMEuwG/InJFIj1yXWXc
 xMTZwZaf/H0q3TaKso3he7Qa3WTO7vjYDhowtQe4COZrzEcFcHFgRwYNWDhQ1fCuv5awojd3s/B
 A5Lb5DK5YD0cgStSuvqhvNrAHhJHDcObb3CUSLoKeeqo8u7rVTq+ChPH8yG/EDf7IxPMXM6Da7T
 dpgjfw74BBnXJZe6V++OqaaguocDrgq8oCZ67Sdgs9RXA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b5216aaa9e58c90f;
	Fri, 13 Nov 2026 16:38:26 +0000
X-Mizu-Trace-ID: b5216aaa9e58c90f
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Chris <hoopyfrood42@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime from the firmware
Date: Fri, 13 Nov 2026 09:38:23 -0700
Message-ID: <20261113163823.8252-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com>
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com> <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com> <20261024173414.10559-1-lucid_duck@justthetip.ca> <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com> <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com> <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083830_523962_39422786 
X-CRM114-Status: GOOD (  12.20  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 11:30:19PM -0500, Chris wrote:
> Just checking in on this one. Is a v2 still planned? I’ve been running
> the RFC on a Netgear A9000 (MT7925U) since late October. Busy time now
> follows the channel, and the readings look right.

Yes, but it is on hold. With the A9000 at USB 2.0 the firmware is slow
to answer the query during a download, the query times out and the
chip gets reset. MediaTek's series for the same counters does it too.
I wrote that up here:

  https://lore.kernel.org/linux-wireless/20261113150048.5271-1-lucid_duck@justthetip.ca/

v2 has to get past that first.

> As I mentioned in my last reply, I take the busy, rx and tx deltas in
> 32 bits, since offset 19 wraps about every 72 minutes. Since then,
> about one reading a day still comes out near 2^64, so roughly 2^32 µs
> below the previous one, as if the counter stepped back. All but one
> were on 2412 MHz. I haven’t dug into it, but it may be worth a look
> before v2.

v2 takes all three differences in 32 bits, the way you suggested. With
a wrap forced early the RFC steps back by 2^32 us and v2 does not.
After that change the totals can only go up, so is your once-a-day
reading from the RFC as posted, or with the change in your driver?

Thanks for keeping it running.

Devin

