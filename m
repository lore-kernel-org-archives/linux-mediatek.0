Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3450FC56201
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 22:24:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DF02076E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 22:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nNOEkvft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DF02076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KKaZQZmHElDZlBVqrEaAQ38OyslE4bLcwOMR1F71MXc=; b=nNOEkvftf6LZVj1V/0Cn0e6IZ
	SW5YPX88VtvCjBSL9FnJJMmUu6W69QYgBxFlq2VxOpNra3cHk0ak90UXL9ChSv2tZphH0B46J1KeZ
	GctEpviVaN+0BL6ZYSOkmvGWmQke2/k0vOv4/88eaFfm6cT7gxzJ3FC1nNy6P/gC5VJUroMS7lcYG
	XW3VA1s/spVOVwOL3d6zpNSBtT3mA2gzo/JeJS4yRgZTKuY+lyifqM4bPyEI/Rc7TtJzE1ZEt5fec
	3h6QWPMQ89ngHOi/H/N2SdnY4eVAbWpFWQEs3hSkQqpmE6zLH2Lr91VwAguEiSjBhELNP61hD5wT1
	BY7vGpAUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khgjS-0000Dm-M6; Tue, 24 Nov 2020 22:24:18 +0000
Received: from kvm5.telegraphics.com.au ([98.124.60.144])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khgjO-0000Bv-Gb; Tue, 24 Nov 2020 22:24:15 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 8A96E22AD6;
 Tue, 24 Nov 2020 17:24:09 -0500 (EST)
Date: Wed, 25 Nov 2020 09:24:08 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
In-Reply-To: <202011241327.BB28F12F6@keescook>
Message-ID: <alpine.LNX.2.23.453.2011250859290.15@nippy.intranet>
References: <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_172414_589838_88C45691 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
 target-devel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-rdma@vger.kernel.org, oss-drivers@netronome.com,
 linux-atm-general@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
 linux-mmc@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-geode@lists.infradead.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
 nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, x86@kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 24 Nov 2020, Kees Cook wrote:

> On Mon, Nov 23, 2020 at 08:31:30AM -0800, James Bottomley wrote:
> > Really, no ... something which produces no improvement has no value at 
> > all ... we really shouldn't be wasting maintainer time with it because 
> > it has a cost to merge.  I'm not sure we understand where the balance 
> > lies in value vs cost to merge but I am confident in the zero value 
> > case.
> 
> What? We can't measure how many future bugs aren't introduced because 
> the kernel requires explicit case flow-control statements for all new 
> code.
> 

These statements are not "missing" unless you presume that code written 
before the latest de facto language spec was written should somehow be 
held to that spec.

If the 'fallthrough' statement is not part of the latest draft spec then 
we should ask why not before we embrace it. Being that the kernel still 
prefers -std=gnu89 you might want to consider what has prevented 
-std=gnu99 or -std=gnu2x etc.

> We already enable -Wimplicit-fallthrough globally, so that's not the 
> discussion. The issue is that Clang is (correctly) even more strict than 
> GCC for this, so these are the remaining ones to fix for full Clang 
> coverage too.
> 

Seems to me you should be patching the compiler.

When you have consensus among the language lawyers you'll have more 
credibility with those being subjected to enforcement.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
