Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D52BC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 12:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5C5205CB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 12:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJL97RxY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yl/i7Qiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5C5205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jq8EYdHMtkc/5Rk83LsNStHUQPQ5TuEz36iDSLS1+WU=; b=WJL97RxYcw5Csz
	I8p9TCDxiWN/5hm4n0HaadBCCX+UccCiKoISiSUwjvewu39VHw66vrK26BM9BQ1UhxTbgGJQ1rhSn
	aQEJHGUA/93Tgb1qUKDtcBSfyz0wpypp42WamjKsJDiXp1EK0woPYkCKT43a+I/aWbTLdF70E6YQf
	VZlH8K2NJ9mZEsg46TeSs0iW4q3BsrOoFYT2mbwknQllH3iwfVtykkCaFraK5rD9EbucFcmnbjf7/
	2tjc8UkPd9D41c5SPJjskslkl/O2o6f3KLnH7TcdyWNa1p/2JTHH1E9r7jsmDWwxshbzi/uEL8DSe
	qxNb2nksk7n0ORDxtCLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg5oj-0002ZK-Kl; Tue, 02 Jun 2020 12:14:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg5oc-0002S6-Gf; Tue, 02 Jun 2020 12:14:47 +0000
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97B8C207ED;
 Tue,  2 Jun 2020 12:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591100085;
 bh=hS7g9g/aSqZzPJBPg66kKL88fBvDX9aRfUs29YzvkBs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yl/i7Qiqq7UoiHmOVqVo+SEn4KgETDEedHdFCdNCuS9f2E2SQng2voWzPfHPcO6YE
 8CF1FQSd08KxkT7RlTX59097gDyqNuMBxG3McsUgXYZn1n9qp24KE+RNxGUKVpsrLE
 /QrUIwIAtq/wHHtTJJMYo7XfANI0AplH+lQth1YE=
Received: by mail-oi1-f177.google.com with SMTP id z9so11813146oid.2;
 Tue, 02 Jun 2020 05:14:45 -0700 (PDT)
X-Gm-Message-State: AOAM5338H3/BikY/5quvch8X8gQTPVDhUAknAJ9Lb81FU4B1ai0BTFMo
 Gn2FvXAgS56v41i+5B6o+EIWWrZ1ao+aJWpoy5c=
X-Google-Smtp-Source: ABdhPJxW1sEkwPq7K4sRBd1zGPvt9cMm19769d1cEMMvHkLmv/96Zuuq0m9uCjS+3j1U8+rNjcP1B0egOpse0Ai0JB0=
X-Received: by 2002:aca:b707:: with SMTP id h7mr2899814oif.174.1591100084934; 
 Tue, 02 Jun 2020 05:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 2 Jun 2020 14:14:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
Message-ID: <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
Subject: Re: Security Random Number Generator support
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_051446_593852_CE8B45CB 
X-CRM114-Status: GOOD (  15.92  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 wsd_upstream@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo <Crystal.Guo@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2 Jun 2020 at 10:15, Neal Liu <neal.liu@mediatek.com> wrote:
>
> These patch series introduce a security random number generator
> which provides a generic interface to get hardware rnd from Secure
> state. The Secure state can be Arm Trusted Firmware(ATF), Trusted
> Execution Environment(TEE), or even EL2 hypervisor.
>
> Patch #1..2 adds sec-rng kernel driver for Trustzone based SoCs.
> For security awareness SoCs on ARMv8 with TrustZone enabled,
> peripherals like entropy sources is not accessible from normal world
> (linux) and rather accessible from secure world (HYP/ATF/TEE) only.
> This driver aims to provide a generic interface to Arm Trusted
> Firmware or Hypervisor rng service.
>
>
> changes since v1:
> - rename mt67xx-rng to mtk-sec-rng since all MediaTek ARMv8 SoCs can reuse
>   this driver.
>   - refine coding style and unnecessary check.
>
>   changes since v2:
>   - remove unused comments.
>   - remove redundant variable.
>
>   changes since v3:
>   - add dt-bindings for MediaTek rng with TrustZone enabled.
>   - revise HWRNG SMC call fid.
>
>   changes since v4:
>   - move bindings to the arm/firmware directory.
>   - revise driver init flow to check more property.
>
>   changes since v5:
>   - refactor to more generic security rng driver which
>     is not platform specific.
>
> *** BLURB HERE ***
>
> Neal Liu (2):
>   dt-bindings: rng: add bindings for sec-rng
>   hwrng: add sec-rng driver
>

There is no reason to model a SMC call as a driver, and represent it
via a DT node like this.

It would be much better if this SMC interface is made truly generic,
and wired into the arch_get_random() interface, which can be used much
earlier.


>  .../devicetree/bindings/rng/sec-rng.yaml      |  53 ++++++
>  drivers/char/hw_random/Kconfig                |  13 ++
>  drivers/char/hw_random/Makefile               |   1 +
>  drivers/char/hw_random/sec-rng.c              | 155 ++++++++++++++++++
>  4 files changed, 222 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/sec-rng.yaml
>  create mode 100644 drivers/char/hw_random/sec-rng.c
>
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
