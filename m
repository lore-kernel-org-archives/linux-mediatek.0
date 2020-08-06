Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D3CC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 20:31:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B21221E3
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 20:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pSpeINWc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ziD/DCjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B21221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dfXyLgg1LmY169x2c55CQBDI5O+SOmDq9Hj/++TwDhM=; b=pSpeINWcA9JR//BkL0MIs+c70
	cQvE1OiRfdNhqcxmWqJ6MrNC98D8f1mN8/MO2p8T7gIOaehGO+KXIHj7FHGwUmtF5p/W8toV2QPlq
	MQd+5BTYWQvlL91/eTIFOOxL57jb/K7gypkyPzFYXjR93XsIXnDwYxhzwiXkxRwvcdwX30plk1p3Q
	PoVniOA3AxMLzCLY2CUUsPGm/uiBWIni9oUqJosgggUeBgWjyAAwsH0bCQPpoFyLBoTVNofuEogDb
	kbe/2sVlIyDpQTUH9DqfjvOD2hqIEMQbq2xa7X06DQL6l/qSFs23LtmdI8VwS3jDy7Hjfwol9R78f
	0eyU5R9Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3mXc-000831-K8; Thu, 06 Aug 2020 20:31:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3mXY-00080o-Eh; Thu, 06 Aug 2020 20:31:05 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BD7620855;
 Thu,  6 Aug 2020 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596745863;
 bh=F4AtrtRO9qwW/JfWMr8YyqALJC/wmxeoK0pMEZzq7Hk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ziD/DCjCAm6/8RP+Os8tyl7Pjhc+IhZ/+KJZNdOmtc8xt0MQoKUjHbTZ93QLIu8V6
 PffbS3Ag2oN3S8rv2RneDQxmak9pUkTtCNF11RA2IEKrp6A8UXavZbbxAZt6Wya05H
 5PxzdWZHxj2pG65AYFYnDlO0Lhj01VgVg+5ok6kU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k3mXV-000N83-Lh; Thu, 06 Aug 2020 21:31:01 +0100
MIME-Version: 1.0
Date: Thu, 06 Aug 2020 21:31:01 +0100
From: Marc Zyngier <maz@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
In-Reply-To: <CALAqxLUhit4Zz27Uce7gPGVRmkDJ_2UTC2fyk8NkOfgqR8diHQ@mail.gmail.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
 <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
 <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
 <4d79a3e9c8c24f8adb6f7ade97d5a9c6@kernel.org>
 <CALAqxLUhit4Zz27Uce7gPGVRmkDJ_2UTC2fyk8NkOfgqR8diHQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <c5e73672a123ee6a920bdd0c3d6023c4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: john.stultz@linaro.org, saravanak@google.com,
 tglx@linutronix.de, jason@lakedaemon.net, matthias.bgg@gmail.com,
 agross@kernel.org, bjorn.andersson@linaro.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 hanks.chen@mediatek.com, cc.hwang@mediatek.com, loda.chou@mediatek.com,
 steev@kali.org, uceenpe@ucl.ac.uk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_163104_722329_19B17714 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Nial Peters <uceenpe@ucl.ac.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-06 21:09, John Stultz wrote:
> On Thu, Aug 6, 2020 at 12:59 PM Marc Zyngier <maz@kernel.org> wrote:
>> OK, thanks for confirming. It would have been good if these patches
>> had seen a bit more testing.
> 
> Yes, again, my apologies for that!

I would say this should be the job of the patch author, before
anyone else. Yes, silly bugs happen. In this occurrence, it
could have been avoided by just boot-testing it, though.

Oh well. At least it was caught early.

>> > I'm assuming you'll put up the patch yourself. Please let me know if
>> > you need me to send one.
>> 
>> I have queued this [1] in -next.
>> 
>> It'd be good if someone (John?) could give a Tested-by.
> 
> Just validated. Tested-by: John Stultz <john.stultz@linaro.org>

Thanks for your patience, the reporting and testing.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
