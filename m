Return-Path: <SRS0=jy+D=E3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E8C388F9
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0489A2158C
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xDC3AlBi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E+4epdWz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="WQolZIuu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0489A2158C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tMCCKYFvtgaqcyu1em+w7ojg0DA/9IL16y+0yx8omIU=; b=xDC3AlBiTjVRHej1rRLnDV6RO
	3Hnn7nzhJ5bZIwZUx7msk81DrBmyvtBWbCvQ2/M3J+7ypDaNtcBlOYll7ssvMEJlrh0p28s4HY0No
	bi/eeT5r+AqWO+EudlB6hRiZGelRXyBqek/v+rRIxwy8HAgYvbFOdH8ivHCNUJj31JqHENBMof3wU
	B8S77RHbNdzzE/zwHEFhAY6sbFA4arsEJzFRhq4qmfzUtnyhQnu4sgQFDFSYPJt1drTpmC/qgA7Nm
	XGjL++H5NZHGZ1MEF+OmH07heCme7uZgegF8UrNI1b9I4ks/+w5na2N+jsYAWFaXShUPesOqLWS9K
	zgVB6uyVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgbjl-0005da-6A; Sat, 21 Nov 2020 22:52:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgbjg-0005cg-Fy
 for linux-mediatek@merlin.infradead.org; Sat, 21 Nov 2020 22:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5XWucgV8E35bUAw4aZcK+RdQSdGH0BbK0144kscnzcI=; b=E+4epdWzhHOovHpYSgsF7WctEz
 a3KOLCMplBUmvrcMY8YEcxuvwo2j/9o5ISsZlrw0OqGjnXVWkX6pTLAd4Nd2RVg8MpXjnwaxZg2Ib
 5qXifJENBM91ODdz2HndloDJlUta6mx8rU+WTkrPPA7q+lLjHFYc8B5El0j44ib3VpGHNQnvKThtB
 FocCR3isn8NjBZ21BFTk9UTK3f2qxVOwGl8cb+Hm9sb6T4riShvqT7e2ZL1RY8lgwb7wuPxARak3S
 coImuzuq/i6ZwbMzyT+C9gCsYiDIpSpw3E00ewhoE/21UEnzdXONADhEEJOSELUv63gnJcfT+R76b
 0fe7zqBA==;
Received: from mout.gmx.net ([212.227.15.18])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgVVo-00014q-TE
 for linux-mediatek@lists.infradead.org; Sat, 21 Nov 2020 16:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1605975168;
 bh=5XWucgV8E35bUAw4aZcK+RdQSdGH0BbK0144kscnzcI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WQolZIuuxEiDb/4MIogv7qWitrEDh9yZwc21+uMJ8+WIOE/ed1OKqJoypw6F/kbvl
 39WotD6bjU87mQ5cmeTjoXAKZPL+PjeUve69J1kCDVxTd/HqW77CA2MEvSXyNrz9AR
 /cCVn5tv+VYz93V1lWMNOrSuYpy4Y2N4jnQOLp24=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.75.72.182] ([185.75.72.182]) by web-mail.gmx.net
 (3c-app-gmx-bs42.server.lan [172.19.170.94]) (via HTTP); Sat, 21 Nov 2020
 17:12:48 +0100
MIME-Version: 1.0
Message-ID: <trinity-79472418-bec7-4097-9612-fa7a79c27620-1605975168396@3c-app-gmx-bs42>
From: Frank Wunderlich <frank-w@public-files.de>
To: Marc Zyngier <maz@kernel.org>
Subject: Aw: Re:  Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
Date: Sat, 21 Nov 2020 17:12:48 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <c63d8d7d966c1dda82884f361d4691c3@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
 <87o8ke7njb.fsf@nanos.tec.linutronix.de>
 <trinity-1d7f8900-10db-40c0-a0aa-47bb99ed84cd-1604508571909@3c-app-gmx-bs02>
 <87h7q4lnoz.fsf@nanos.tec.linutronix.de>
 <074d057910c3e834f4bd58821e8583b1@kernel.org>
 <87blgbl887.fsf@nanos.tec.linutronix.de>
 <c63d8d7d966c1dda82884f361d4691c3@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:0WIPfXZNx+COWrzO6EWqhIOYRhYsuaEetPZRHGICmDa5l4cTCVnVnw0NbFHdi/ukfb57B
 6Lxz2OgLXMSr5/sLZ9j0KeqQe9najHHMVgLiJavcBw1i28PIl+j0IgRbSTL8Th60ZpqaRZYhyRIK
 QjWgVE5drMTBYjDwVBLFA4kAa/3ZuKPVy1/qTV/Hh7g5rsFwX6y5eGEE+zxoF6Sv9oDXvsEC2oDj
 DZkqXXREa2aW5ClACLGG2C2cD7q4q7NS0LHGaoTWc8wnipzl4h9m3r17XTbZcvlS5ciH6UT3Hxwp
 Cc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:eADDipfb3v0=:KBRN9L8eDneVATspJUwmja
 XPTN2pmGNuR+KRj/6s7kAKPPo6YhEbChm8G0MtP+rjsnpBZCOXSjBbTUS+gE0zLVh3XhqGHRs
 gwQopYWXCPmE+LUThjau41VJI8mrH9VyebUy2hiWKLfCkoZiqQNAWiGi4X49zFS9+pY3pABs2
 FF1ikYXvw90kdUxYZnc1V0vli/ebkvfnAvX3Hy07dUbXZMoANVO8le7DL5x4jdLS3SR8Ffrcz
 x9DNglGD0SdwwoOWazBCLvBDD6Tiyk4a38OYvjStb777J3XegwXEBO/YCgKCLJK6W+LTtkIJZ
 TClV2KG0egtTMd5P0Wg7IsyHPvMd9+38wAcHJFTMnfC9u6pLpWZU1z4OY970dhJfTJFC1aGAK
 Caxwvu8Wp0aQ06xJdPvocBRh88WAOum2QjOQKnILjCi95/KaSZoWuCLKCDQAPVRbGADYhgPKh
 w7fpVLoH9BI4ThFZQ0Rdt5uro74R4XbRP8YtNonBHiND+KoLYdOBBRKVKZL8CZyrHC5+VGjGj
 cqRIhWV/R92vXLQcpvkuI+irJc576bjainFPKd+C6+xouBNIvH7my3NiJF+CRBwvegJ5kekcT
 7LSM9o73dxXyw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_161321_227015_5FB77428 
X-CRM114-Status: UNSURE (   5.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

any new state here?

last fix works, but i have not seen it approved by anyone for merge or sent as separate Patch

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
