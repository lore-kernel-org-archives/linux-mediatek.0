Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FEAC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:09:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 594BA214F1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJmQ9i0u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlWD9hqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 594BA214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LXhXzEF5X233qAPU2lazgbpVla8hXsGCBETQAl7+xFk=; b=TJmQ9i0u3xUMUtN381cWkcJzj
	JUlgaZdwZxO/GrXGfTU3ccYmvpy8SkGHP/90XsWAJgR9uCUAPvQ7XaHPRAHQ5ylwIlWnTDoERxjcG
	m35N3ducjM1elaXSnyOA+wRMkE29/rgrL7Em617xPasJsAyImZ4q46bIzdbbJNeKU9wv886QhOA0V
	GT1belrV0HvKj5a/P1PG/7zBODKcgRkmi7n7+z3SLYEsBaCMG1owIQNGpKyLWSYgSRqxKqZAw4X6K
	GkKXYc1uoqBYbuqGmvEoWWZoYOmUWhXoBJW7yLLWb2ZPjaOzwGgJRTx1HIu+QRktp0CIGb9isIzCq
	UKT7BZnWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8hh-0004gu-EQ; Sat, 27 Jun 2020 11:09:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8h8-0004Ty-IE; Sat, 27 Jun 2020 11:08:27 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFAB621532;
 Sat, 27 Jun 2020 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593256105;
 bh=IvkYD8vvMsO8UUZWc8OESQ8D1oIdB2bt3FlKlWN+/PM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YlWD9hqR3pco/94yNhfdc/ExIZvtqMLuXkBsjsGDuOB+CytlR2Y2D/RTGXPi/DaAg
 WWn8z8v/DgGvTE6nTAWVKx2+K9USPwkPqDEJZcOaVGLeDgMvXGSZfs61chB7hrEmVz
 b9FTMA/c2JF/K5qX2Ug0Y0zoeA4oTbAREutVMAFk=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jp8h6-006s0z-8F; Sat, 27 Jun 2020 12:08:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Tero Kristo <t-kristo@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>
Subject: Re: [PATCH 1/3] irqchip/ti-sci-inta: Remove dead code in
 ti_sci_inta_set_type()
Date: Sat, 27 Jun 2020 12:08:06 +0100
Message-Id: <159325548742.93134.4456384570058657240.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1591437017-5295-1-git-send-email-yangtiezhu@loongson.cn>
References: <1591437017-5295-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, matthias.bgg@gmail.com, brgl@bgdev.pl,
 tglx@linutronix.de, yangtiezhu@loongson.cn, t-kristo@ti.com,
 lokeshvutla@ti.com, nm@ti.com, ssantosh@kernel.org,
 andrew.perepech@mediatek.com, linux-mediatek@lists.infradead.org,
 stephane.leprovost@mediatek.com, linux-arm-kernel@lists.infradead.org,
 pedro.tsai@mediatek.com, bgolaszewski@baylibre.com, fparent@baylibre.com,
 linux-kernel@vger.kernel.org, lixuefeng@loongson.cn
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 6 Jun 2020 17:50:15 +0800, Tiezhu Yang wrote:
> In the function ti_sci_inta_set_type(), the statement "return -EINVAL;"
> out of switch case is dead code, remove it.

Applied to irq/irqchip-5.9:

[1/3] irqchip/ti-sci-inta: Remove dead code in ti_sci_inta_set_type()
      commit: 3d21f0b4126650a92f2df531a5f3a2d27aa9a09f
[2/3] irqchip/ti-sci-inta: Fix return value about devm_ioremap_resource()
      commit: 4b127a14cb1385dd355c7673d975258d5d668922
[3/3] irqchip/ti-sci-inta: Fix typo about MODULE_AUTHOR
      commit: ef6b0bf43be5c17790a14a8ed806d7d8fe0a25be

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
