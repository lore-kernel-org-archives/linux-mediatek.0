Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E72C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 12:44:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729ED2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 12:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wg2NzNq9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRz/bP0l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729ED2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M5IgwmpbC0VtG7pgzlbgz/ZmTuGFOveqTUvQmGm/F40=; b=Wg2NzNq9qMzljTRgecDxqITgQ
	ETntUfgSIfp2w7LLeArjSp/1PSiuuZBcjVVuCgeN6LO7jgYmpMpMkh8xJRUQFEbSMto3y5M6cDNrJ
	3eIDwdExfTthcwqbnqP1EDXzdi8BY/Ow+a4dNxHzvy2HiqbbYNIfm6sYNOao+KIcvP2Boi7ttHU9d
	QddsC7SHVxdfABTp7T3mHa8LK4zjrCWEG1OdVeRBi54PtkruWgGByQpBygxl99QOnXCKJALw4J3Vv
	zuCuuEMhJQNl6XHDbdm8+OxsOtNhunFHy7CFUtxuEnijyrcrHJLdPKd8UUgqx7KkouvZcj63AAoT7
	AKS1APAYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7eUW-00072Q-FD; Mon, 17 Aug 2020 12:43:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7eUP-0006yp-EP; Mon, 17 Aug 2020 12:43:50 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FE342072D;
 Mon, 17 Aug 2020 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597668228;
 bh=jVzU+QI/ys+RIOWMYaLR4j+zEZXuCKR6ULaqdtkwbiM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NRz/bP0lJDXOQpw3C0MOSAVz/meHd71Q/Bj/trpsWtNq3haGujLAVHpSZWOiroKYE
 3d/XHZeBjT/9FFL6y6+gMRAof/ypmIDKfv1aKzYZ13yBOlmrDo70HwCa0Y52DRwWmI
 nMLyA7zFyko0EJlsoSemO/W4+bQtbiXsRD+PrZ7w=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k7eUL-003ZBx-P4; Mon, 17 Aug 2020 13:43:45 +0100
MIME-Version: 1.0
Date: Mon, 17 Aug 2020 13:43:45 +0100
From: Marc Zyngier <maz@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: mainline/master bisection: baseline.login on mt8173-elm-hana
In-Reply-To: <e1e21bc9-75a8-e0f7-7b87-57b147962115@collabora.com>
References: <5f391c17.1c69fb81.ef475.be70@mx.google.com>
 <e1e21bc9-75a8-e0f7-7b87-57b147962115@collabora.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <d9b04fa244fb2b3e4db64e6b833bcdb6@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guillaume.tucker@collabora.com, hanks.chen@mediatek.com,
 saravanak@google.com, kernelci-results@groups.io, jason@lakedaemon.net,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, enric.balletbo@collabora.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_084349_686337_F36E0279 
X-CRM114-Status: GOOD (  15.85  )
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
Cc: Saravana Kannan <saravanak@google.com>, kernelci-results@groups.io,
 Hanks Chen <hanks.chen@mediatek.com>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-17 11:20, Guillaume Tucker wrote:
> Please see the bisection report below about a boot failure.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
> 
> The log doesn't appear to be showing anything from the kernel, so
> it's likely to be crashing very early.  Please let us know if you
> need some help with investigating this issue, to try booting with
> earlyprintk or anything.
> 
> Hope this helps.
> 
> Thanks,
> Guillaume
> 
> On 16/08/2020 12:44, KernelCI bot wrote:
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>> * This automated bisection report was sent to you on the basis  *
>> * that you may be involved with the breaking commit it has      *
>> * found.  No manual investigation has been done to verify it,   *
>> * and the root cause of the problem may be somewhere else.      *
>> *                                                               *
>> * If you do send a fix, please include this trailer:            *
>> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
>> *                                                               *
>> * Hope this helps!                                              *
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>> 
>> mainline/master bisection: baseline.login on mt8173-elm-hana
>> 
>> Summary:
>>   Start:      a1d21081a60d Merge 
>> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>>   Plain log:  
>> https://storage.kernelci.org/mainline/master/v5.8-13249-ga1d21081a60d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
>>   HTML log:   
>> https://storage.kernelci.org/mainline/master/v5.8-13249-ga1d21081a60d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
>>   Result:     f97dbf48ca43 irqchip/mtk-sysirq: Convert to a platform 
>> driver

Please have a go at this[1] patch, which should solve the issue.

Thanks,

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/irqchip-next&id=7828a3ef8646fb2e69ed45616c8453a037ca7867
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
