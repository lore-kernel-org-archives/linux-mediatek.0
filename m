Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE284C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 18:04:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591DD22AAF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 18:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 591DD22AAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IwtmDfG3KCTIzEB7zIVLqOlHbvTX7GLTBoe3kWj+kz8=; b=cy3dhzGcjzSdCE029YRA1j+0H
	LTPLcCxEqygVFqBn8fOeuApP26YhyceIRSZeS9gzJkoGsB2yVSAynUTn1Djlzp6fsF6ZDn+VgJi3o
	NyYN+kplQCHbKzJgjjZ/3Q6l7zDu0LdbW1zthfIuFS3JnSfY5y6wZbRyrJN38pyCc4nUAsK2C/UIZ
	Fqx5E5qTg8zNlEMpP0eGKzP9XrzX0lo+mEAvfIER6xUdENQOjQlBtfeLO5i/AJsjM0JCP60TcmSQ8
	IuTw/YIzZTigFueYMCk6fbD2q13TPHWiD+VixDTFvRCJA4y8hL47MSXX3dq1RrvUIEye7CIWl+aY4
	VUyPenofQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klFRk-0007Sw-Hg; Fri, 04 Dec 2020 18:04:44 +0000
Received: from aposti.net ([89.234.176.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klFRf-0007Re-Ux; Fri, 04 Dec 2020 18:04:41 +0000
Date: Fri, 04 Dec 2020 18:04:19 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
To: Arnd Bergmann <arnd@kernel.org>
Message-Id: <77UTKQ.VC4AUEXP1CN21@crapouillou.net>
In-Reply-To: <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
References: <20201203222922.1067522-1-arnd@kernel.org>
 <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
 <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_130440_138398_8E03363B 
X-CRM114-Status: GOOD (  17.00  )
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
 Chun-Hung Wu <chun-hung.wu@mediatek.com>, linux-mmc@vger.kernel.org,
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

Hi,

Le ven. 4 d=E9c. 2020 =E0 15:14, Arnd Bergmann <arnd@kernel.org> a =E9crit =

:
> On Fri, Dec 4, 2020 at 11:02 AM Ulf Hansson <ulf.hansson@linaro.org> =

> wrote:
>>  On Thu, 3 Dec 2020 at 23:29, Arnd Bergmann <arnd@kernel.org> wrote:
> =

>>  > -#ifdef CONFIG_PM
>>  >  static void msdc_save_reg(struct msdc_host *host)
>> =

>>  Shouldn't msdc_save|restore_reg() be turned into "__maybe_unused" =

>> as well?
> =

> There is no need since the compiler can figure that out already when =

> there
> is a reference to the function from dead code.
> =

>>  >
>>  > -static int msdc_resume(struct device *dev)
>>  > +static int __maybe_unused msdc_resume(struct device *dev)
>>  >  {
>>  >         return pm_runtime_force_resume(dev);
>>  >  }
>>  > -#endif
>>  >
>>  >  static const struct dev_pm_ops msdc_dev_pm_ops =3D {
>> =

>>  You may also change this to a __maybe_unused, as long as you also
>>  assign the .pm pointer in the mt_msdc_driver with
>>  pm_ptr(&msdc_dev_pm_ops).
>> =

>>  Ideally the compiler should drop these functions/datas entirely =

>> then.
> =

> I don't see a lot of other instances of that yet, and it's fairly new.
> Maybe we should fix it before it gets propagated further.
> =

> I would suggest we redefine pm_ptr like
> =

> #define pm_ptr(_ptr) (IS_ENABLED(CONFIG_PM) ? (_ptr) : NULL)
> =

> and remove the __maybe_unused annotations on those that we
> already have. This also has the effect of dropping the unused
> data from the object, but without having to an an #ifdef or
> __maybe_unused.
> =

> Adding Paul and Rafael to Cc for clarification on this.

I didn't think about that. That's smarter and much more elegant.

Cheers,
-Paul



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
