Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40735C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 07:59:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E212D2145D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 07:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HvyG8z0C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E212D2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1MGM8GDo9XRAdgccNOqAV9hkI/p+tqHGAKrX+V4NwWs=; b=HvyG8z0CwU3Zg0bT6xgVym7hj
	VL674tV/Km2XCwnfUwmIfirXtl4AtKZqWgdub5bECWJL46zTRY3XHLRJ6rZ1RQ9EDZiqepjzF62k2
	XBW515Kp1kNSsJ1WMzJhR7hwFLx1PXaTiIPcF2FOQH832d+cw+OAfhZw09vrb8rKU/oVJHhgetaPX
	UnEoptmYX/rG0M3eFpC2PIh9imPbSQRBFdPNHYsIuDy10FqeKqwusY7Nx9x0faFxXYDuXgpTra39r
	znbZgT4kbW02fZH9yWS9acX+E8OMrMtABegdI3V22Zy5RUfL2ab4ueqINdXh0u9xz8XNF1jfM1b8r
	fZyRRCtzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtVF-000630-Gl; Thu, 01 Oct 2020 07:59:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtVA-000608-GT; Thu, 01 Oct 2020 07:59:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 7B4B129D23B
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To: Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com>
 <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
 <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
 <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
 <CACRpkdYga6XttmMnQ6r--_7wtfebirY5Z58D6xhBkRRDrf98ZQ@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6a04c7b7-dd70-10c2-fc69-08b6b6c33d03@collabora.com>
Date: Thu, 1 Oct 2020 09:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYga6XttmMnQ6r--_7wtfebirY5Z58D6xhBkRRDrf98ZQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_035944_651528_0374EB98 
X-CRM114-Status: GOOD (  16.12  )
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
 lkml <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 1/10/20 9:58, Linus Walleij wrote:
> On Wed, Sep 30, 2020 at 6:33 PM Sean Wang <sean.wang@kernel.org> wrote:
>> On Wed, Sep 30, 2020 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:
>>>
>>>> v2 seems the same with v1 or I was missing something.
>>>>
>>>> I just thought we call devm_ioremap_release to explicitly to free
>>>> resource when a certain failure occurs after
>>>> devm_ioremap_resource?
>>>
>>> What is the semantics around mtk_build_eint()?
>>>
>>
>> mtk_build_eint is to add external interrupt function to the
>> corresponding bound pins.
>> mtk pinctrl driver still can work (than means probe() successfully) to
>> keep pinctrl functional even with there is an error in mtk_build_eint.
>> So the patch is used to explicitly free those data on failure in
>> mtk_build_eint to let unused data is being free:ed immediately.
> 
> OK then we need a v3 of this that will call *release
> explicitly, indeed.
> 

Yes, don't really know what happened with v2. I'll send a v3 ASAP.

> Thanks Sean!
> Linus Walleij
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
