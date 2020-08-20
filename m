Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62120C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 07:57:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C17B2076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 07:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TekU3Wgs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVWTd0wl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C17B2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l4mc+nC0mgJ+U/pjQ4MI3R2VKjpx94Mw9Cyy9Q13nqg=; b=TekU3Wgs1kf1aAaFDeqNvp2wF
	veF8SIruU5q77eTrEtc6eeTVVHCwIp5/LwoWkoCP8lJQuB3dzT5zWC4tiIFFxVEmAFQmK1d0I1C7D
	YOnYswI1av93yjbqsWxrQr7KQflj8i8In2SZ8/vZ57HxLWaPdLI8BMTeIFkzQG7pXnUsk2wJY0B50
	9JCe9wUnEo4UHwov3F51mtyeuED5Ye5gI8x9Qe5/hCCsvE5JjRR2BSqY58nxwvHjkbZ2vDkZNZOMc
	phCOfu4Syer9abpVBL1rFUfU9WK2lZmvlznWsow10UBY7Mb0ECNiu6Dcsg2wfGm3r/hWsUIPDCuYD
	ps7ooQrGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8fRL-0001Tv-Jr; Thu, 20 Aug 2020 07:56:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8fR7-0001MC-IQ; Thu, 20 Aug 2020 07:56:38 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73FCA2076E;
 Thu, 20 Aug 2020 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597910196;
 bh=1PlDm4wRWcH/RTMBQxxaAC1lHTDc0CkhAaxyMr2dXR4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rVWTd0wlUfO5Sdto2s314fZMXF0ky7uxabFPMbo9OLG22jZ6Qrj9eVZO5WKUnhcnJ
 GYUkApm3MI93J/dR2lUZ0BkF5dYu/b6+/9yH7s0EtrawaSNutAm+4EeyN4h/h5iA/U
 FGqRQT/2QB4hndYu6UQlbGKAnPEzfYh2H0HSGD1c=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k8fR4-004S5S-Vb; Thu, 20 Aug 2020 08:56:35 +0100
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 08:56:34 +0100
From: Marc Zyngier <maz@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
In-Reply-To: <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
 <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: saravanak@google.com, wichtig@fw-web.de,
 enric.balletbo@collabora.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux@fw-web.de, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org, hanks.chen@mediatek.com,
 jason@lakedaemon.net, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_035637_786162_0AA3A65B 
X-CRM114-Status: GOOD (  15.89  )
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
 Jason Cooper <jason@lakedaemon.net>, Hanks Chen <hanks.chen@mediatek.com>,
 Frank Wunderlich <wichtig@fw-web.de>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-19 19:51, Saravana Kannan wrote:
> On Wed, Aug 19, 2020 at 9:52 AM Frank Wunderlich <wichtig@fw-web.de> 
> wrote:
>> 
>> hi,
>> 
>> does the fix you've linked to my revert [1] not work in your case?
>> 
>> [1] https://patchwork.kernel.org/patch/11718481/
> 
> Thanks for pointing it out Frank. Also, might want to avoid top
> posting in the future.
> 
> Enric, Can you please try that other fix and see if that solves your 
> issue?

I think Enric was clear that the driver does probe correctly
(meaning that he has the fix in his tree). It is everything else
that breaks, because none of the drivers on the platform are
equipped to defer their own probing.

I think we need to change this works right now, meaning that we can't
blindly change the behaviour of *built-in* drivers. I'll see if I can
come up with something quickly, but I'll otherwise take Enric patch.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
