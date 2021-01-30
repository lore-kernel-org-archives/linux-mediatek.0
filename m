Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B370C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 01:56:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D0764E0A
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 01:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D0764E0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:From:Date:Message-ID:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tJh1EJd8MUZGVAZ4VW0ZRseV8jx2kNnQzqvTlo9/7dU=; b=INqUFFoVLPOef604JSbTkCo2pT
	Fokx9IRSBl2N2huW7LCLdXdVHMm5rY+CJFqWlIiaQziXPquoUYoIQZLYEt7JQE9p4QPYECg0zNuKR
	Wwnu4eNbBLdt8N5Z+KkNkmOlsiJtCjdiKOekvKnVx/q4sI21gR1fKjzH0bYdsKLUP7komtQ8jb4WI
	kZrKm3ZDpMHO+MSOX5p5Fgxpmaa/lJjD4zM2zFhOU7lPSfvmO4tSVIQjM4vxend5f7RNs5WHt0Y3C
	PEPVJIAnxDFMaecWK4IQMQzadFY19/FQA0Sjw2b3l3RYB71J6WNMwg8fV6OK5mK/faX2Il767kagO
	n6Uibtrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5fUc-0004n0-TH; Sat, 30 Jan 2021 01:56:06 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5fUZ-0004mR-Vf
 for linux-mediatek@lists.infradead.org; Sat, 30 Jan 2021 01:56:05 +0000
Received: by eu-shark1.inbox.eu (Postfix, from userid 2004)
 id 2B2FB6C0074C; Sat, 30 Jan 2021 03:55:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1611971758; bh=qjBuWTSfP8xq+dGVw7irquA1cYBpkKO8XE7q/8a4XoM=;
 h=Date:From:Subject:To;
 b=e4743ab+zD3NTJWMRG6qncpPwe/3uHnUx5l8yc0EWAKUSMvGsJTow4buVH6sRfSwH
 HhanzE8jgNI/xT1WOu89qcXzgsXNNEDH3kG1KZqW+zL7z4a3lKTynt+/Ea24QfBAej
 oixrnB18j1Nv1IdCM7cVXSr+AQtV1JmeylVUsqSg=
Received: from eu-w4.inbox.eu (eu-w4 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id D951A6C00700
 for <linux-mediatek@lists.infradead.org>; Sat, 30 Jan 2021 03:55:57 +0200 (EET)
MIME-Version: 1.0
X-HTTP-USER-AGENT: Mozilla/5.0 (Windows NT 10.0; Win64; x64)
 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4346.0 Safari/537.36
 Edg/89.0.731.0
Message-ID: <1611971757.6014bcadd6ece@posti.mail.ee>
Date: Sat, 30 Jan 2021 03:55:57 +0200
From: "Boris Lysov" <arzamas-16@mail.ee>
Subject: [RFC] Question about contributing mt6577 support but SMP doesn't work
To: linux-mediatek@lists.infradead.org
User-Agent: Mail.ee Webmail
X-ESPOL: +dBm4e9TfTq68yDTPBPAcGMr01Q+UZib54XO3RxclX34OSqAeksRI3S6/XAUPnG5okZr7UE26UBKC2W2QFu3n7jIZlHMuQYc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_205604_253683_7A4B8FF2 
X-CRM114-Status: UNSURE (   7.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello! I'm working on bringing the initial support for mt6577 into
the mainline kernel. I've got the base set of hardware to work: timers,
and few interrupt controllers, and all 4 UARTs, and PL310 cache
controller. My test device boots mainline successfully and runs stable!

I'm having issues with getting SMP to work. mt6577 is a dual-core SoC,
and broken SMP means half of the processing power is unavailable. I
tried to use the existing SMP bring-up code located in
arch/arm/mach-mediatek/platsmp.c , but it didn't work albeit all
specified registers were correct. I also tried porting the SMP init
code from the downstream mediatek kernel, but it never worked either.

My question is: could I still contribute my device support patches
despite literally 50% of the CPU not working? I *strongly* doubt they
would be accepted because of it, but on the other hand devices with
mt6577 (and other compatible SoCs like mt8317) are still able to boot
and run bare mainline kernel on a single core. I ran out of ideas on
how to make that pesky 2nd core come up online with my poor knowledge.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
