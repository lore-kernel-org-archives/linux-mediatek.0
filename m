Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C89C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:14:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844DA205CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0UpxATVi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lxHh7Cij";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="WsiYYj97"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 844DA205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8KVnBHMkAVJS4Suq9X5U/C3za4AtecyWk8m0L6wBDpY=; b=0UpxATViQnQ+y+ln8Av3K9ayB
	Za/jzXXfiHh9CLyOD9KT1PxpP7leALgXVeeoxRNEOr1xGtRDec2IbxrVW0qGKEV4yMs0lEFjqdJW6
	O/4/v5f0xHzoJMHC6g1ebmMmNeI5cz4ExYRDKC0kD+mqaxJtfM6WONbxG5872Mm0V5ydNsoQJ82+x
	/ZFFhiIfwJY826Y7d7Em/jpRXkn+gRU/rBJOMLCoTjOnUHIG0BiMCOTFptT7lT9jyWH/Ydj/8Nxd7
	dkpdDO59IYoKcocmfA4o92E1V5K3W1KAo0bbJDcfn/91kSpmfeCp1e3jRgYGvYUWHzXKmVfduc8aM
	AxHWhVtXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7gps-0003sA-Ko; Mon, 17 Aug 2020 15:14:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7gpr-0003rx-Ff
 for linux-mediatek@merlin.infradead.org; Mon, 17 Aug 2020 15:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Tetm6JInZyBDPvWpZyx4Zp5MeGuNToXdO2B+0rlr2c0=; b=lxHh7CijzOla3SfxptQ2j+DEzJ
 F6KdHVLVBOcJ8aHPhwYp98eMPfCtpXjl7QWy1yVXXyzc15jGT8AR4EJT83ROHY2+ewhdA2ytchxD9
 23NLEu3imBPy1M5bILb6G85CKDIRsjvd1cTkizRKkp0DsVKBl0QYCV3SsZZNY3b7Cx95lHlMu0ban
 s7XXvGLPPo5Jlop0neK+gBSO+Ux97zIUWnUoir0dQhXKw48I5KPU7EE7BHxyFsA1k8vBEzjXdtLLD
 PGQDBs6puvOwEQB1KCUV8xPdpgJIs0BqyTbB57IwYHjBCILkfspeSwcR6U2VZvKn9he16Hdoi1DML
 au2MfhFA==;
Received: from mout.gmx.net ([212.227.15.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7gpn-00085E-Tm
 for linux-mediatek@lists.infradead.org; Mon, 17 Aug 2020 15:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597677239;
 bh=Tetm6JInZyBDPvWpZyx4Zp5MeGuNToXdO2B+0rlr2c0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WsiYYj9782pqjySzpiQAix/q3YAZxXLPeLMAnt0aHNesBCHDYREt1J50HscDU0PyB
 PhqvfP0dSFXmUx/F1VBtx7+FmSiMaVszFV47BMLrc+BUG1vkXCHGeJ2aOXCnAtdFkJ
 FFvZpZtgGhgGsMPAyJyt+tZlKDrsiW3USyZmK32I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.148.252] ([217.61.148.252]) by web-mail.gmx.net
 (3c-app-gmx-bs07.server.lan [172.19.170.56]) (via HTTP); Mon, 17 Aug 2020
 17:08:31 +0200
MIME-Version: 1.0
Message-ID: <trinity-6aabe11a-b5c2-40ef-b51a-8ec7df0ceeab-1597676911685@3c-app-gmx-bs07>
From: Frank Wunderlich <frank-w@public-files.de>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Aw: Re: [BUG] 5.9-rc1 broken bootup on mt7622/mt7623
Date: Mon, 17 Aug 2020 17:08:31 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAFqH_510ykRd=79hUKbK5k8fqWzt=wri6=-Mv1zvV8inquPmPg@mail.gmail.com>
References: <trinity-e15639c2-d077-4b70-b351-a5888543688c-1597675629284@3c-app-gmx-bs07>
 <CAFqH_510ykRd=79hUKbK5k8fqWzt=wri6=-Mv1zvV8inquPmPg@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:HMLEtvM6sRxHZoQ2yEJ+S/HCggZRutCRqRB3gWpNs9fNkRRhnce6wVt0k1ubkP7P7J0H0
 L0UGHovEALXabrUq5hA1ErKMeGadAW4cewhQ+fJ7RpuetY0QH+5VOcszl3Z1YePqGzwaeslRjQfi
 FCQElwZxnaIpFHnMeTE9Biwzx4lVdE+WuH6THYA55Bc2xRmRM1N5k7HdJhPWtWWynXvT4l1ZnZqo
 s3eu9KU5f8+O5OtlhX28P2+ptXhFWKtRhD/ipo78Dp2LgpDXcJH5C4kJsatFQ1tS7YpagjrJ6OnW
 tQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:oBar/HLU1Oc=:Mpuhp6p++5fpONjcWsB+hG
 APPRj1QDmI24AbtIQ+DPUMnt96WNFFn6qIoLswm3NkuHzNzz84wy4Lhnj0TgC9ArQCVSqmYDv
 Maph+PFC/P0SDZ1gJ0NPmDZeQbpJromIWtXZ/4wu2Zy7j6BRMv/DhnOojTmmZbm19mtIwEXxh
 aHh47l1uxuOw4AJlSN5n4NOvpJTamGeIz2MfyJ2sMZ1fZyYyx4IYSNHY+ZdcfdN32kANyLtV3
 yJMLoCKvSzeRuRzwe+FULXUjsXlefckNr0kab+WpPsfUa/dJm8/nJepCquik2zJV6SWW4uQAx
 sZQt7DVRCSdoCIAN8l1A8tcYH0g7M8MOTFMpoUyEMoL0jT8sXThU5sg24uMslG4E14FR1wCPS
 4pOzRnj0XVnm75Ybb4kyNNYdNgaYmbGBJwX+/iidW29l5jDfvbF21CJwRN/d7Ixwv+J8DUiRG
 jPPt2Mj2GC/wZPV/eCxy7izHwIf/yQIfFpadKuCEtuzKxUXrAWF3jhK/Sg50U0FcwCQJDd9/k
 tbItoFRQnvbmmAcrqnRiaYvWqDCOAbo5Y53eGBSCYB0fFzAlRyubtWtfKeJRIFRJHk7m0kkSU
 S/EVobXe256V5lsWoG6OV57HeRDCIQV19iLyA3k2EKgF+1JC7acjhc9KBTGC5XpNufk/YLdeT
 nIVm0kAF1ek/EG0eLTLFeMRLi+hTBnwWh1RionAhUY/1IktXP5UhmY3BfUn4giKwWRV8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_161404_301952_1E05C0E2 
X-CRM114-Status: UNSURE (   7.05  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Enric

> Gesendet: Montag, 17. August 2020 um 16:56 Uhr
> Von: "Enric Balletbo Serra" <eballetbo@gmail.com>
> Looks like all Mediatek devices are broken, you should try if this [1]
> fixes the issue for you. It fixes for me.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/irqchip-next&id=7828a3ef8646fb2e69ed45616c8453a037ca7867

This seems to fix the issue on my 2 devices too

Thank you

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
