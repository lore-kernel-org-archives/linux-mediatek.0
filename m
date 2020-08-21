Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216D2C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 14:04:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF71E20724
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 14:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H+SE8h1c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="Ttm+//iX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF71E20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LIcL7O7ReIjFZEw4lkCLVg9ml83va7/WNpzQYmizLA4=; b=H+SE8h1cyDqBfgH1o+LjOtgt3
	+3vcIObaPY3WVJibTCnAQ6NOdGuduKyQVbZ+uqeFvV+6MiIiyMavtQYQ5IZvM+2TPpGuYsY9LGlQg
	sLAOruvkaXpKWNlDvWBR8mHHgab/fTglR+JZSw96AxMu6a4aaIsWR35r8Kl6kP28vgvFnNVuZIpCO
	92/EUMI25GQp02TneYV0N8JjAXZzinww+9yd8JAvfZAA953kpHk2EgrHxg/mIP45xZqvrLHhTfznD
	nr27nHbt3IS5JnqBom0F17d99USTIh8p5AsOI6tvFKDzrNzrq6wwrh8PLXGXGxprNk2KsqUd5zwrK
	DkWzr9eFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k97eG-0006ZD-2N; Fri, 21 Aug 2020 14:04:04 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k97eC-0006Xd-63; Fri, 21 Aug 2020 14:04:01 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
 by mxout3.routing.net (Postfix) with ESMTP id 1F3BB600E3;
 Fri, 21 Aug 2020 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1598018629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uwhXQPwN7FPz65pMgdPSDnQeJydLmXsPIKMifEpXlY=;
 b=Ttm+//iX1eUjhmNpOhcZr0EJVANL4/aMV+hFs1aBFQHSZpxDImZst5eKj0kjJpGR1uqk3D
 bwvXJXQfHPOCXdAp4pBImBqdKOc5gDAH5rBYb26oi2pv0gyw6kq8ayn7NXtCifx3r7DcNb
 hCaFTQJTuDFXkgNB/5e7oyVERpc0jy0=
Received: from frank-s9 (fttx-pool-185.76.97.101.bambit.de [185.76.97.101])
 by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 53963402D3;
 Fri, 21 Aug 2020 14:03:48 +0000 (UTC)
Date: Fri, 21 Aug 2020 16:03:42 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <93debe6a0308b66d3f307af67ba7ec2c@kernel.org>
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
 <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
 <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
 <CAGETcx-NpRzzeXYN-UBP1eAsC3s_AofSQ9rXOEmCjhLhKLnxWg@mail.gmail.com>
 <14b8f4b9667d29ee25e25eb19c69e3f7@kernel.org>
 <95ae0ae3-7798-d6d5-fc37-391862a0b4ca@collabora.com>
 <93debe6a0308b66d3f307af67ba7ec2c@kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
To: Marc Zyngier <maz@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
From: Frank Wunderlich <linux@fw-web.de>
Message-ID: <C4270F76-C385-4D5B-96BF-F3B9DEB555E3@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_100400_468327_CCDF160C 
X-CRM114-Status: UNSURE (   7.85  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jason Cooper <jason@lakedaemon.net>, Saravana Kannan <saravanak@google.com>,
 Hanks Chen <hanks.chen@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 21. August 2020 12:17:36 MESZ schrieb Marc Zyngier <maz@kernel.org>:

>It'd be good if you could help with that, but I will definitely apply
>the revert (below for the revert list). Any change is too invasive to
>be added to this cycle.
>
>920ecb8c35cb irqchip/mtk-cirq: Convert to a platform driver
>f97dbf48ca43 irqchip/mtk-sysirq: Convert to a platform driver
>5be57099d445 irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER 
>helper macros

with Patch "irqchip: Fix probing deferal when using IRQCHIP_PLATFORM_DRIVER helper" i can boot my board, but i get these errors:

[ 0.014234] irq: no irq domain found for interrupt-controller@10200100 !
[ 0.020981] Failed to map interrupt for /timer@10008000
[ 0.026248] Failed to initialize '/timer@10008000': -22
[ 4.314126] hw perfevents: /pmu: failed to register PMU devices!

if i revert f97dbf48ca43009e8b8bcdf07f47fc9f06149b36 these are gone

So from my pov revert is best way at the moment

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
