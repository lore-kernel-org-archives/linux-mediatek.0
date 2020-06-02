Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51724C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 13:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2888B20663
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 13:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="im6WWM6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2888B20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=misterjones.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bjN+r0BvwfDObE88KMG1TrTx9ZsISXgggatA+x2VySI=; b=im6WWM6EjzV/J7KgOHO4+k6O+
	btJjbYR+Rqhl2fsXgwSqmDKiJIA+6yr/x57qlIU1SKXYSSpO5xcajNVeuFg4v1JfJZrdSMIjpVziE
	abdrmMnNqjwo873PPU+9JyO642xtPiUtDz1pXoh1/jnmtOXBUN0qvprRfZRKYaV9m7LbDQKfVy0wq
	mNKaiV9a37gPfEPLJd49DGQiOoQzXZJMBZdQAqZC1lhs8NHyXlvkZ0lWHE0dB3nGDCZMJUBA/JxiH
	CSYlulCG650i89V+8TmTKWQrHGOY0Azp/IbW2HQnIzhVqCVA6ghhYy/COuugIyAxlPPvR9hkoawoV
	lauuatSQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg6ZX-0001uo-3V; Tue, 02 Jun 2020 13:03:15 +0000
Received: from disco-boy.misterjones.org ([51.254.78.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg6ZU-0001uH-Jh; Tue, 02 Jun 2020 13:03:14 +0000
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@misterjones.org>)
 id 1jg6Z5-00HBxM-LQ; Tue, 02 Jun 2020 14:02:47 +0100
MIME-Version: 1.0
Date: Tue, 02 Jun 2020 14:02:47 +0100
From: Marc Zyngier <maz@misterjones.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: Security Random Number Generator support
In-Reply-To: <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
X-Sender: maz@misterjones.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: ardb@kernel.org, neal.liu@mediatek.com,
 devicetree@vger.kernel.org, herbert@gondor.apana.org.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, sean.wang@kernel.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 mpm@selenic.com, matthias.bgg@gmail.com, Crystal.Guo@mediatek.com,
 linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_060312_645149_548C4111 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 wsd_upstream@mediatek.com, Crystal Guo <Crystal.Guo@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-06-02 13:14, Ard Biesheuvel wrote:
> On Tue, 2 Jun 2020 at 10:15, Neal Liu <neal.liu@mediatek.com> wrote:
>> 
>> These patch series introduce a security random number generator
>> which provides a generic interface to get hardware rnd from Secure
>> state. The Secure state can be Arm Trusted Firmware(ATF), Trusted
>> Execution Environment(TEE), or even EL2 hypervisor.
>> 
>> Patch #1..2 adds sec-rng kernel driver for Trustzone based SoCs.
>> For security awareness SoCs on ARMv8 with TrustZone enabled,
>> peripherals like entropy sources is not accessible from normal world
>> (linux) and rather accessible from secure world (HYP/ATF/TEE) only.
>> This driver aims to provide a generic interface to Arm Trusted
>> Firmware or Hypervisor rng service.
>> 
>> 
>> changes since v1:
>> - rename mt67xx-rng to mtk-sec-rng since all MediaTek ARMv8 SoCs can 
>> reuse
>>   this driver.
>>   - refine coding style and unnecessary check.
>> 
>>   changes since v2:
>>   - remove unused comments.
>>   - remove redundant variable.
>> 
>>   changes since v3:
>>   - add dt-bindings for MediaTek rng with TrustZone enabled.
>>   - revise HWRNG SMC call fid.
>> 
>>   changes since v4:
>>   - move bindings to the arm/firmware directory.
>>   - revise driver init flow to check more property.
>> 
>>   changes since v5:
>>   - refactor to more generic security rng driver which
>>     is not platform specific.
>> 
>> *** BLURB HERE ***
>> 
>> Neal Liu (2):
>>   dt-bindings: rng: add bindings for sec-rng
>>   hwrng: add sec-rng driver
>> 
> 
> There is no reason to model a SMC call as a driver, and represent it
> via a DT node like this.

+1.

> It would be much better if this SMC interface is made truly generic,
> and wired into the arch_get_random() interface, which can be used much
> earlier.

Wasn't there a plan to standardize a SMC call to rule them all?

         M.
-- 
Who you jivin' with that Cosmik Debris?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
