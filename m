Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37951C5DF97
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2026 04:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYHUvvosxIblggxt5IxGcMuRUG+plNbbzXWgQpj5Q1s=; b=Zr2p47w/8SPm1vtwcvhYW3NARd
	7MjuFrF61/1VEPRM6zd9uPpHdU2edu7kNF391WK9w2djvYVXAhZcf55kfs5bM6u2XKGPbUG6oKb+f
	MwudNqvososvFKDOkxR4KWMj1ZVFE7JymLTXVCo+bhkqhG405rVMtoHpxAvIzB7chMEATN4qT8yPR
	w3mLWXwzAtx9xF6jYw76Xe8aCErhEBrh2mhr/4bVqsABGlPK1KoUnIory3fvVmSFXAfkRy4NRi/Eb
	CBFHMkc/KFN8PjUjXHr+MqjLDZnpmEU4XAd43R8AsvxBZbdSqJaGe19+RdLiUjHhYpz5WcqGJUlZZ
	g/+/g+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxd9r-0000000EHJq-1l6I;
	Sat, 22 Aug 2026 04:16:39 +0000
Received: from out-204.mta0.migadu.com ([2001:41d0:1004:224b::cc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxd9n-0000000EHJV-0p8i
	for linux-mediatek@lists.infradead.org;
	Sat, 22 Aug 2026 04:16:37 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hYHUvvosxIblggxt5IxGcMuRUG+plNbbzXWgQpj5Q1s=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787372190; v=1; x=1787976990;
 b=go/dmsRQ7Mw+lVijlplkOo243DZPjS09QgkLe3JVmhC7vEN9sYcf8qf/i7v3xQiyhjVbuoWR
 1NF2e3/nKYd5xpwB3vSQ398MMtFCioH3L2YZIR85SZ0bLkC1fZE+hYJrxbhXh1VBWOh4kceUPRZ
 biVZje+vJmsHcRe5w5Q1/q1GgrB2VbV8qXQY3r0lVhI8qBW46Ppo3xYXelTBZZWgRaXYtAQW5yu
 FswkRUDBR02EqcqYo7vD4KUsPbPHP/4cCXow61Ke/FyKiGNhUwuyMdt8B3A99BXBgkR4Wp5+tTF
 n8ymq4de4C5BdC+ZwBIt6f1pnfcc+o33w42sfJBkM0JKg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id 7aca6eeae61922e9;
	Sat, 22 Aug 2026 04:16:20 +0000
X-Mizu-Trace-ID: 7aca6eeae61922e9
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
Date: Fri, 21 Aug 2026 21:16:17 -0700
Message-ID: <20260822041617.236931-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aocbq-_gRsXgFV94@fedora.fritz.box>
References: <aocbq-_gRsXgFV94@fedora.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_211636_560677_8D8647BA 
X-CRM114-Status: GOOD (  12.31  )
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

Thanks, tag will go on.

Interesting though, neither of your readings matches mine. Mine reads
the right value and takes a scratch write; both of yours refuse it. The
all-ones one is the card not answering at all by that point. The other
still has something on the end of it that just will not hand over. Two
different problems like you said, and your script is reproducing the
wrong one.

On the natural one, I would check whether the card is still on the bus
when it hangs. Anything from PCIe in dmesg, and whether lspci can still
see it.

Would not read too much into Windows, different driver, different reset
path.

Devin

On 20 Aug 2026, moosager wrote:

> So, when the issue happens on its own, your script (accessing register
> 0x54000120) outputs 0xffffffff, and even me attempting to write
> 0xa5a5a5a5 in a loop won't change anything.
>
> Instead, when the issue is triggered by my original script, your
> script
> outputs 0xffff0002; again, I cannot manage to manually write a
> different value to the register.
>
> We may be looking at two different issues after all, both mitigated by
> an error check that was missing anyway. I'm still inclined to say that
> it is not a hardware issue, since nothing similar happens on Windows.
>
> Tested-by: moosager <moosager90@gmail.com>

