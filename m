Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C2AC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 15:38:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75063233F8
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 15:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75063233F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3DpQxHICAby8jeGqLE7H6/sakOGAJe0zC9rCSbi/dJw=; b=h9yLSJjCcXAaP3bjfG5BSkRzd
	SH1F43FOO0bTIY9xu/2y4IE518jfkP0ZKWcV+j825XRYXf7WEl+T40Ul9q+GU3uLvpf+sZ2d+sV1I
	jWE8O9EhHABuM6/F/HgtpPBDZizw3IbalSPaKaBt0GmtXuXFEIbljgGTfA8ytBlr06E8k9ly07Cta
	+6MNDQ8ZFjkMtyG7hV2zjEgaIO50sT+uVILxu+ooMrDhPDE8IiY8bh0pK2K+VbedQeAGC28gsjxze
	vyrMIqhl0XPojW/BDamtDSeRmWlceX59g2R9BPLC+WaGyEyo0BOGaJbQu4p6at+lzYvA2IsxnZ2ah
	FsDMUx0fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmf4Y-0007ar-Ht; Tue, 08 Dec 2020 15:38:38 +0000
Received: from aposti.net ([89.234.176.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmf4U-0007ZE-0o; Tue, 08 Dec 2020 15:38:34 +0000
Date: Tue, 08 Dec 2020 15:38:14 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
To: Arnd Bergmann <arnd@kernel.org>
Message-Id: <Q321LQ.JCBWCTTZDHME3@crapouillou.net>
In-Reply-To: <CAK8P3a21gkBsb3rcNvzH3XA_0GRRKPgnsrynTTO=EZVwy6DC+g@mail.gmail.com>
References: <20201203222922.1067522-1-arnd@kernel.org>
 <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
 <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
 <IVYYKQ.T5GFS8Z1QTP2@crapouillou.net>
 <CAK8P3a21gkBsb3rcNvzH3XA_0GRRKPgnsrynTTO=EZVwy6DC+g@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_103834_177887_02F643CA 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yong mao <yong.mao@mediatek.com>, Amey Narkhede <ameynarkhede03@gmail.com>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Le mar. 8 d=E9c. 2020 =E0 15:04, Arnd Bergmann <arnd@kernel.org> a =E9crit =

:
> On Mon, Dec 7, 2020 at 1:33 PM Paul Cercueil <paul@crapouillou.net> =

> wrote:
>>  Le ven. 4 d=E9c. 2020 =E0 15:14, Arnd Bergmann <arnd@kernel.org> a =

>> =E9crit
> =

>>  By the way, as I'm ending up doing the same in a different context, =

>> I
>>  think it would be useful to have a IF_ENABLED() macro defined like =

>> this:
>> =

>>  #define IF_ENABLED(_cfg, _ptr) (IS_ENABLED(_cfg) ? (_ptr) : NULL)
>> =

>>  Then the pm_ptr(_ptr) macro could be defined like this:
>> =

>>  #define pm_ptr(_ptr) IF_ENABLED(CONFIG_PM, _ptr)
> =

> I like that. Do you just want to go ahead and start with adding
> IF_ENABLED() to your own branch then?

Sure. I'll send a patch later today and Cc you (and linux-arm?).

Cheers,
-Paul



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
