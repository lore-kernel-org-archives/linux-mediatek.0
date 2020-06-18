Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B45C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 09:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F6B21548
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 09:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvYVFenO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yi/kPSWj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F6B21548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tmnOMqr3XI3zU9KB6ymGX5EjS2n7j3fCXuoJOFvSIiE=; b=rvYVFenOiQ0/HoRRccZ0ZBvXm
	zB5GjfTvRxhOSBHGSpeJdUVhUFMO4TNCXsqjYDbWZ6a/T945RutzpxwRXLRcOCCrsgkEZXC+vBPNC
	u2zgFqHHU5qnMdS1IRLO18QZYAWP4C5yrIrA8h5kItexjRVy/Gm0xkzpwyoN1NceUdUQd5EQZpbgK
	otG5jgAi/rE8hNohoQxKVesyaXyEMsNAHGwSs2BzswYWzR4MbhFz/SQ0mpbdOooAzUdtyeuXi79RI
	gpsYMs9Xs6etbj9DXu4CvzhU22bLGnkHXlqeasj2lTpROVlM4jel1Hmk6NfHi4YRvvMw4shcvLjNd
	3XqBusxvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlrC0-0005FQ-Jc; Thu, 18 Jun 2020 09:50:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlrBs-000564-2a; Thu, 18 Jun 2020 09:50:37 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9AD63204EA;
 Thu, 18 Jun 2020 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592473834;
 bh=F0mHrmIfDX6Kuk9+3Hgh9PYce9TZgz8bGDX3F2Xq7yg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yi/kPSWjPKq7vjvVPdM8ROse+MVAcIlqSfhz+akzk8JbIpIvCPW1iGgMM+7NoXyPa
 8fwS2TTiUIvUqGdjM06a5kgBR1T3PtM2KV2csFREIvvqP7w2ouLbekxclP/58tOMbD
 +YCsgdxEu5hx97TeLGI6/mPjfdZ8dgOfY6wBXmoY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jlrBp-0047dq-3G; Thu, 18 Jun 2020 10:50:33 +0100
MIME-Version: 1.0
Date: Thu, 18 Jun 2020 10:50:32 +0100
From: Marc Zyngier <maz@kernel.org>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: Security Random Number Generator support
In-Reply-To: <1591170857.19414.5.camel@mtkswgap22>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
 <1591169342.4878.9.camel@mtkswgap22>
 <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
 <1591170857.19414.5.camel@mtkswgap22>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <c3d5d4a79c7fe158cae117ff79ab332b@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: neal.liu@mediatek.com, jwerner@google.com, ardb@kernel.org,
 devicetree@vger.kernel.org, herbert@gondor.apana.org.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, robh+dt@kernel.org, linux-crypto@vger.kernel.org,
 mpm@selenic.com, matthias.bgg@gmail.com, Crystal.Guo@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Jose.Marinho@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_025036_135940_24AA058C 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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
 <devicetree@vger.kernel.org>, Julius Werner <jwerner@google.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jose.Marinho@arm.com,
 Sean Wang <sean.wang@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Crystal_Guo_=28=E9=83=AD?= =?UTF-8?Q?=E6=99=B6=29?=
 <Crystal.Guo@mediatek.com>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-06-03 08:54, Neal Liu wrote:

Hi Neal,

> Do you know which ARM expert could edict this standard?
> Or is there any chance that we can make one? And be reviewed by
> maintainers?

It appears that ARM just released a beta version of the spec at [1].

I'd encourage you (and anyone else) to have a look at it and provide 
feedback to ARM.

Thanks,

         M.

[1] 
https://developer.arm.com/-/media/Files/pdf/DEN0098-True_Random_Number_Generator_Firmware_Interface-1.0BET2.pdf
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
