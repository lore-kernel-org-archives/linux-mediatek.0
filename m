Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE46CC4742C
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 09:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D20520B1F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 09:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xydVWvAU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Qph9UCxa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="k8LTIGIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D20520B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmvMKTdaNk+Zhj5hc79fjpYbqf/igG0oECmMWeo63eo=; b=xydVWvAUz7CZCoTB6pwn3ybDDt
	EuPLqyAry34UCoHVZifQP3te6k0sBaINxNdJY3S19X6jMhnDOT3pql2zIV/0GPXOO9TgHAo6RyQOu
	y2chTtoLcAJdFq0PAyvbRAnreNhj86nAcSmxuQLwjGIIqCNx/r38v3OQeXYTcqzkKmTz6GQeZEcco
	A6VvTU32tLMWoHehiURk+NhuqnBNRs5/Ubi2JeLkkKraduZzoGvgNpHTlLEQ2DGlZmhPaFbHUC2y9
	dA/gR2nyM4BTh+iniUoS/5mfTH3da4MAIOXw238C7MdBI+DPwx6siKie0K+8lX5N1OQKOSZOEVnER
	k5mlHihg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZ9cE-00075n-58; Sun, 01 Nov 2020 09:25:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZ9cD-00075V-C4
 for linux-mediatek@merlin.infradead.org; Sun, 01 Nov 2020 09:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=JIBHuKWhwwmsOaLOSFETE8/UYlSNB3NgVVXdwGZnc6M=; b=Qph9UCxa67K9qThPDmR5JTH5Wn
 PgSlEHHKR/Ud5SVHTihALJv7fmgBiFySPzl+osPvurd9EzJLoUbkfyL08p5ODCojkPorOxxe5Qe3p
 9nZlx0XGhZ5/Cgw6d62Tnnr0R2c59fU9H27TFNzDLZ70fMkuDGOXEGGAFN3YqQJ6JXtiv46/8B7dN
 HVVS5AhwQn7eITk5DNiK90aVqPXhfISU+GPWz6Nfkt+gEW5E+LXq7ucsb4FRnIJvB6XomaPV+p4Ea
 0d3keYb02PU3Ctm02QOink7vm8gfS0DvpZ8DZqStDeqlR+F7a/DqJmajKAFb5eGVw5HDM/oz+YiCV
 Dli42tzQ==;
Received: from mout.gmx.net ([212.227.17.21])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZ9c7-0006Mu-HU
 for linux-mediatek@lists.infradead.org; Sun, 01 Nov 2020 09:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604222710;
 bh=JIBHuKWhwwmsOaLOSFETE8/UYlSNB3NgVVXdwGZnc6M=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=k8LTIGIckeMVV8gBX7N/5nNed+O7Q8AFXvGE5QGs37yBb423avg1qzzaB7wwsOEbq
 ouV4Qt5rp61kNApvz8tXA+v7dRRKLchEAGc+gt6doRM0bDn34wfEKccSqb19HFhW+5
 RMp+EgSZshMC8Gw3imwZrPSirY+db2gsbZIlwgAM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.144.204]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1kukuz1JXn-00ViHR; Sun, 01
 Nov 2020 10:25:10 +0100
Date: Sun, 01 Nov 2020 10:25:04 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <878sbm9icl.fsf@nanos.tec.linutronix.de>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: Re: [PATCH] pci: mediatek: fix warning in msi.h
To: linux-mediatek@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Frank Wunderlich <linux@fw-web.de>, linux-kernel@vger.kernel.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
X-Provags-ID: V03:K1:W6EnW92w+ArEgBh+BB8a6rj90e8Gy6EqneVfb46i9qAv1hNwajV
 lkdUk84Ms3SRyCqv2RCerc0vyi0poyoXgKgGddY79UnQ1ce9nC/d/aXtLH3ij7Ei7s25FFs
 rkYCr8HpBS22b1rMdOt6CL/GfdAJTPlxM5P249uJEacL3h/GIk0aL6RahkjzPrUcDXj3/hg
 qEfP5bTB0aUiSDKKn5ZjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qt5NkYmRQRc=:+NAP1v9GNfIFoarELyaFs2
 UVl+6Mfw0F8+u9XxzC0fvTlmLvTdBX/c+qu7yVu9n+xCSsGDbvJrookTiAKlfVkaY5ZRCIn9Y
 wGA7o4zf0nA5BVfGemZiyvZsLeDgMQlHtShqatsdKygSZfMMkh6hXVWUsXnE1lwKgOo3SWp8Q
 jNBE9K6S7wbCZG2CgnZINv7rN6083A0vl3UUr/JoTkXjuujaCn9LABNem2emjgcUR/tYRb5bu
 05S/B5I3Whfz0nahEZ2vQUiAtCZxAp6QtxJ3QN/HiAuqan7V+cYAB3Ru4xX9bJvfp+aPb4i5z
 F9ipAjX/yIn4OHK2fpvHWftqYtLyC6v0xRjUCGVPa7vKqFQI2xE+UUdswwMFiG5f68wkFQh+L
 fcsMrhVnrE6EAi9dQPfE8BMknvqnFMOPGEhnD5NE2iTqqJAudNw6km3WD7UbRRbdkl8ub9+Do
 vKP1LS00A1V3KYkxWDOv6dW/9GrboXb1/aRn3ls3kNxdR0+80Dgv4YOrNFyPTQbrAE2YpPTZY
 RJ4FDSvyCI7i2yRR8nIhbWFrTn/7ghc1c9Uv+JiOPg3PvA9jaT4PQYBmIY9soqlWiQQvfddCi
 FYT9QHl4eMhoLNvEoXf1RUeleq17KCAk6E/h2J983xejXNTyXgr/s+ymhcqSYC7ZM+G6zCDVZ
 UDv2Nz5SdJOjT7oJTHW/jxXa0gtCJ4jnT2pE4XJQ2xT6p5kx8bZpQz7o3UbYFlybhcm8qD1bk
 L6gZn6tzQQHTkBwsH+I0kjlH7PsC1JXv9vYCQlclhcEJeRE1dSiYSZtOnxa5NiZ+WxUfbN7V4
 cBSo7S4DUzKeCBoG5SNnulA5FKHMA01zhdBc964CkIbCa7NjnRDaQ+ANz0hxAjEq5boVXosjz
 SIRVUdII2GArg0O9zrmK6uNBcRi1o2kcSdGwXXNoE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_092528_303551_145D00DD 
X-CRM114-Status: UNSURE (   5.96  )
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
Reply-To: frank-w@public-files.de
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 31. Oktober 2020 22:49:14 MEZ schrieb Thomas Gleixner <tglx@linutronix.de>:

>That's not a fix. It's just supressing the warning.

Ok sorry

>So it needs to be figured out why the domain association is not there.

It looks like for mt7623 there is no msi domain setup (done via mtk_pcie_setup_irq callback + mtk_pcie_init_irq_domain) in mtk pcie driver.

https://elixir.bootlin.com/linux/v5.10-rc1/source/drivers/pci/controller/pcie-mediatek.c#L1204

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
