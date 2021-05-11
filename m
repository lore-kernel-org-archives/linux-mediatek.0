Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F163C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 18:55:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6048A611AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 18:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6048A611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TwD6fNWSyLnhoTKI86E8o86xX2Sca7yIXPGM9t0xtnA=; b=Pno1r9uhkjc7ePd99xSoM9GnG
	GIHP81l4HWbSLFEFf4r/oyWuw99YqSg9sKcSyIbSyt53dOpLiD2Oh437VeD5/SbyoZB5xLiy0J0MJ
	E4srJu97TFHJtELGjm0cCrRKo/gBSepcsPq7o8rnbMKjTblIpYI2QouQVKTPC+6l/+P83rOdom+0f
	ghLZP3h09cORyPTLHQQz6xRPEuSihBtOaZDcUWocU4SxAMwBJskF3gC2CbBEPqGngiEy9tFPNtQ6n
	oyU8EtBMAYwuJdGFc7XooelsbIZg/c+ZKaPs/0XelWp+DjmHiGTV+YfrAaZBB5smgDZxEGgCRdnFZ
	s3DJx3lwg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgXXM-0013Zz-T1; Tue, 11 May 2021 18:55:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgXXB-0013Yp-2S; Tue, 11 May 2021 18:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=45zpZEi3uWnaoxbve/2Atv3Y+btxOtqcAIeab35aQf8=; b=4hU/P6XPHyWzURA3kI1FeTUWkT
 U0OfM1MDWeUDUK0zKnj2ga+s9ni3NxCdut5YS7yAhjHjJGUuPpNAXoNNj9yYaBJt/rkUUhTSQ9Hdd
 5hEiyulYpY1Ssm01vcCeMm8Hc6wzlyPUwYYxNjDJI/KklK+uSEAtqXYajX891QDBfAQrj3pm/WVjw
 1JbvQOwhmukLGuIR2WiY+3n4WopXDEinm4uygTwq5V5hdUYjT/hqyWQkaIEygsenHDX2CgrVH2xt4
 yeMYQ61pjDy2tbT4IJq19kRl5ltvR+sKmZxZad7yFvcgnZkRNnbfsmX9oijIT3yfmqW9ZfYHWSAaF
 e47mq88A==;
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgXX8-009r9s-6Q; Tue, 11 May 2021 18:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1620759241;
 bh=WENqI3vsyBY6Che+sULK//xoiDEcerYKhusYaYmV+Jo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Wm7uyMFH3ntYOc7siUqnRWJyQKqP/L/GemZ32U41cZtFpWvRPGw8LRUeA5Wc8VxGv
 3lshu0OpGSbCZPFkc/z39jHh6HxlNPAyP64coKYwkRUqUwObUdhdz4GzqgVuo7XDYn
 Wq/zbHxl2T5QmIu9gnRtj6TSO4gUOC64b9OA36ps=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.149.187] ([217.61.149.187]) by web-mail.gmx.net
 (3c-app-gmx-bs62.server.lan [172.19.170.146]) (via HTTP); Tue, 11 May 2021
 20:54:01 +0200
MIME-Version: 1.0
Message-ID: <trinity-da507ec7-f0ec-4d64-b7fe-1c9d13dbead8-1620759241263@3c-app-gmx-bs62>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, peterz@infradead.org, Tetsuo Handa
 <penguin-kernel@I-love.SAKURA.ne.jp>, Peter Enderborg
 <peter.enderborg@sony.com>, Thomas Gleixner <tglx@linutronix.de>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Vitor Massaru Iha
 <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>, Wei Yang
 <richard.weiyang@gmail.com>, Cong Wang <cong.wang@bytedance.com>, Di Zhu
 <zhudi21@huawei.com>, Stephen Hemminger <stephen@networkplumber.org>,
 Francis Laniel <laniel_francis@privacyrequired.com>, Roopa Prabhu
 <roopa@cumulusnetworks.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upsream@mediatek.com, Rocco Yue <rocco.yue@mediatek.com>
Subject: Aw: [PATCH][v2] rtnetlink: add rtnl_lock debug log
Date: Tue, 11 May 2021 20:54:01 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210508085738.6296-1-rocco.yue@mediatek.com>
References: <20210508085738.6296-1-rocco.yue@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:vPtDeKS2EkjkBFhCI0MTeN8+oyPoFuj1CethO+QBiXE32fotLiQj3aR78hUsvSvNgQveJ
 5Vk3+k2e4Uy1jjeU113UmzFfxe+2rx6KN6XBpfqCkB2aytuVjsjTTNga6VErcNnELg1CQ2tSCdxH
 KGima4m2jsQu8qxpK4/EClBBlbyipfhQlCqZqJZ1wiC4nsYcoR2rZ+Y3X4csKHww9z/Q7kG7msZl
 T3OO17Vc+cXzSxBTGrm5dXMILZmPRsj0mJqFWC7z7z5sxY/vnfv7M/HLGOMmHmCGX8BIeSS07Khc
 kk=
X-UI-Out-Filterresults: notjunk:1;V03:K0:1dioUG1R8SQ=:hob++s0902VF7y5u+td1EZ
 sw+23yXRodDzF2z2T9xOFfVMS99mkk5kUjw2ux8ozYAMOs35z8M39epNx9J9VbRKRIaPSP9vE
 odEAjxv3m3HwWC4kCwBcweqwGrGMhevXTKfYJeZrORadT8yGabxSWTM8j39w44vc2UwEkukyo
 H96t6aPJsl4kOfyq1PoEIxCvcGZTjSNCWzg1dj9MJNP78FeKEoWsGRDDhd4KwTWpaCsrVSwhJ
 T45wYSxgtSphuJBiTny7xFz58TAVkVcyBb4ZPUuliO2Q0Hpg4UvS0b6XNWN6mDlru/DLH0oQ9
 nJgYOdNPc9Xl3bid/u8tmw191g2TASRi/iCiH78pnSu122f2/hpH4Ner3NVE7szdKNSNlnUAJ
 tBqMWemXG/dJ/Zsrg79lE1DWpmsUIuVnAyqtFZBBC0yIq7AxFL5m16U0eOt8PDJ1UsB1q03mA
 +VFI1Y4zUPixCP36Y34vWP05m3m7cmuXpbgn2bh4vOdO/4xoY2zljqRQg1+d24vUYO0tHll4c
 inj4eEY/7E593OGi1YF4Wf7cZnhahAwixwIeBmvVOSHYOxfHhTuGlzwxvdPop34zOQVlgBnA9
 2QW/ulESpmSg7iWOh36butorJGlClRm5XJjFEV7lufqTVugy4dcwjiKDQfVjufsb0Xj2XAON+
 K7XRKw0c1JzvvVwkVnHlHQLzWoAuc+leU341ft5AP5WxSqfpUUl9Lm1chzvxRLNnetxCZSiV2
 atf9H7D7tKjZ6JI8A0rXoN82Go9vyMk3Cv0v+re3DZLE/GgkGi20226pN5vErMKK2qBjWTwzL
 50PtqGKn12cVKtHlXt2X3mnUh2/FoYcdxDEbH0ZENbKng+A4Vjvy1ziAyBPrEmZVESV68p4L7
 BTPds5r/9pUmA3Lkbkv8lX3Zk/ViQ6+d7DuVRHwibja2JdicGhxrf8YiJLrrTOM0Nz11lvDk8
 sJqwim7iQ0w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_115506_589221_32CB9774 
X-CRM114-Status: UNSURE (   8.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Samstag, 08. Mai 2021 um 10:57 Uhr
> Von: "Rocco Yue" <rocco.yue@mediatek.com>
> Betreff: [PATCH][v2] rtnetlink: add rtnl_lock debug log

> <6>[   40.191481][    C6] rtnetlink: -- rtnl_print_btrace start --
> <6>[   40.191494][    C6] rtnetlink: RfxSender_4[2206][R] hold rtnl_lock
> more than 2 sec, start time: 38181400013
it would be good to have same time-format (seconds.nanosec)

> <6>[   42.181879][ T2206] rtnetlink: rtnl_lock is held by [2206] from
> [38181400013] to [42181875177]
same as above

> +static void rtnl_relase_btrace(void)
should this be release_btrace?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
