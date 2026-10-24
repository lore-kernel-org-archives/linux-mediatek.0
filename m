Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D9B606A31A
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rDOrEA/m;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=MhhjmJFK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XG6cnRAbbHNvFhEVqHFZ79h+iqHopMF6Uylvq+7tYkA=; b=rDOrEA/mSHNS2/
	Dd53GEKHyi5ZhTOeDHWPFEPSTopUd6Dw8XkrkqvA/IDDeQDDCpccWhz7GuA4TcYtW5CzPyV+Nx5dn
	Tq3ndT9TVrDFm0QDAiZSXM7etE7dLEdVfGQ0nI73QFyqcoxbXHFLhfWOQlT6wpoSDnu8q8teFXsnq
	0vMLl2Kwo8wApiB9TWdNO1LMn2D78zstbvM6t5OjI5RCPDF7psHCXRfAMuRr1sBYywUkSxNO15t2d
	O/V/RE3p1Yo/6zkO9z8wPX+u0LSIUK6O7V6JD7b85utr1/ywJU8NfEiMKZ3In1mewuwj/3nWz7cBo
	vEPaTXhBOsNHe6gdiISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKfdQ-00000000P4M-3pFb;
	Sat, 24 Oct 2026 17:34:24 +0000
Received: from out-96.mta0.migadu.com ([2001:41d0:1004:224b::60] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKfdN-00000000P43-0CWG
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 17:34:23 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IOdnh/iOpzPwwmVekHNpQuVJzZXM5PNT/QMupjWWisY=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792863257; v=1; x=1793468057;
 b=MhhjmJFKIuoLLaETQEoU/49g4bght+FitduSMCfamFv5OpM5DLHq7oSmXucvtPsD4u1LUg1l
 uIfZ6CQuoMmLLpjNTwe3KIhKkJBPSl1bvkPvIsPLutiEojV5SEel2nP0REvAH0VIBFBgLzSl30N
 5A//vwCCH/IRrGIDPrOQwiX1H2c0GOtsCkzwJxHRrWio5Fp1fgUS+6s4nInEMJHoTpyQU7mNEra
 YpY5tCBTK5ReOvjMWqhgjJ72PXn6LGfyC6RPr4Sbur5Ud82fluKHH2HkhSjBH/w0IQ4rSldHKNc
 uJVAtcaQPuUSb33GcXkXq+yKtViInxuKz3BzTzjrAAAMA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6ffce3468e7d6d81;
	Sat, 24 Oct 2026 17:34:17 +0000
X-Mizu-Trace-ID: 6ffce3468e7d6d81
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
Date: Sat, 24 Oct 2026 10:34:14 -0700
Message-ID: <20261024173414.10559-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com> <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_103421_822856_440BBB21 
X-CRM114-Status: UNSURE (   8.50  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Chris wrote:
> One thing on offset 20: in monitor mode it doesn't look like all of
> rx.

You're right, it isn't all of rx. Your numbers made me curious, so I
tried it here with an A9000 as a 20 MHz monitor next to an Alfa. It
seems to come down to how strong the signal is. Share of the time:

                                         offset 20   decoded frames
  one strong neighbour (-22 dBm)            2.3%          2.0%
  only weak neighbours (-73 dBm or less)    0.0%          3.6%
  my upload, monitor on a side channel     54.6%          7.5%

Strong signals land in 20 even when the monitor can't decode them,
including spill from the next channel, and weak ones are left out.
That would fit what you saw on 5 GHz and on channels 2 to 4.

As a station the A9000's own downlink does show up in 20, so I'd keep
it as the receive time.

Thanks for the long run against the Wi-Spy, and for the Tested-by.

Devin

