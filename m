Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FECC61DA3
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 23:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCgRQJTBlWi1Yd4fnNx2Zag8znO/0MFpz2KultT2Nms=; b=31aTde2UmsxTQ3FdU/uirRAQq8
	BFkiciy7hvDRpRb9xXhQJ1MsEhwtyq7MuFRy4c/QKO/KkAZu6koittXNzncL2DZGXQ+wbrjMaFpEE
	+aOqWzhgZT3eSAJeDiY3Qbz+yhRLRfRNnYP3sEeEfo3SqENyBIVeK2+UMXn3SYP0J7ideraVaSkrd
	hLLkp7B/SRlMO4LkTcHL60H1E7gH+jU2G/Kejq+GmZSznXmWNzJ7Huetf8FS8HGXRE5A7BudNdUd0
	MpJkrWASup5PSQ6+FIPZDKdNm2QGxZSReeuwHZMn1j2fTWP04vEcIq8F4qlwu1+AGvzSS/C36D83s
	dZLJm41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUG30-005zTm-46; Mon, 20 Feb 2023 23:58:18 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUG2x-005zSt-CE; Mon, 20 Feb 2023 23:58:16 +0000
Received: by mail-ot1-f50.google.com with SMTP id v17-20020a0568301bd100b0068dc615ee44so503179ota.10;
        Mon, 20 Feb 2023 15:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCgRQJTBlWi1Yd4fnNx2Zag8znO/0MFpz2KultT2Nms=;
        b=GgZWLS8LQ0In2et4pDVa8i1A4F0lKKEHFyR2iL0RB3rlI+tw7p2XUraqf0alfjTDxu
         ltnmxYld+RJMUC8cmBm1MGb/zr8xe9PBsEF4uA0EJmUseeti4tfc9MmTK1XWMKKBUpJL
         cwtSHLhJWcdMk7m3ETJTmVqyDxyNd7ZWRWOlrbf1fR/jbunGUud7fHFZFvH/N6T9hjRp
         N5z81Z4x4yu/09H2IwZMtBpLQtQYZCnj2bpQLaY1NdCCXUlUH5B1FhPbaCPGYNUcOiIn
         qYi+JHFBCmY2oCFlAbGWQaLrpiDtkv3AWae9AOFO1PKJvUuvPRLHfMtERwnX+d0/Sgm9
         +ZiQ==
X-Gm-Message-State: AO0yUKX6TSYzBe+FJkSzNOUsr3Eot/oZG3BYDYxVmaN0aXSzAUR1aBZn
	I4iSHl29eDspiysw6CNobg==
X-Google-Smtp-Source: AK7set/ebZ6kCRAGQAD+8rbgMi+1rZ7DLJecjwosBYMsBWpui1bnG4ZpMGNH6QRcvJB8UsnAjVoalA==
X-Received: by 2002:a05:6830:34a:b0:690:d50a:9b48 with SMTP id h10-20020a056830034a00b00690d50a9b48mr1156987ote.11.1676937492989;
        Mon, 20 Feb 2023 15:58:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q19-20020a9d6313000000b0068bcd200247sm5380338otk.75.2023.02.20.15.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 15:58:12 -0800 (PST)
Received: (nullmailer pid 637656 invoked by uid 1000);
	Mon, 20 Feb 2023 23:58:11 -0000
Date: Mon, 20 Feb 2023 17:58:11 -0600
From: Rob Herring <robh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Conor Dooley <conor.dooley@microchip.com>, Mingming Su <Mingming.Su@mediatek.com>, linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwrng: add driver for MediaTek TRNG SMC
Message-ID: <20230220235811.GA618419-robh@kernel.org>
References: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
 <84de90f5-da77-d3f2-c14a-d2e5c53bbf1c@collabora.com>
 <0d5d5d00-8569-a642-cca7-798c8d24a986@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d5d5d00-8569-a642-cca7-798c8d24a986@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_155815_455726_22E38BAA 
X-CRM114-Status: GOOD (  35.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 16, 2023 at 12:32:10PM +0100, Matthias Brugger wrote:
> 
> 
> On 16/02/2023 11:03, AngeloGioacchino Del Regno wrote:
> > Il 15/02/23 14:27, Daniel Golle ha scritto:
> > > Add driver providing kernel-side support for the Random Number
> > > Generator hardware found on Mediatek SoCs which have a driver in ARM
> > > TrustedFirmware-A allowing Linux to read random numbers using a
> > > non-standard vendor-defined Secure Monitor Call.
> > > 
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > 
> > Hello Daniel,
> > 
> > incidentally, I've also done some research on this one some months ago, when
> > I was deep in adding support for the Helio X10 SoC (MT6795) on Xperia M5.
> > 
> > The rng-v2 is simply the same rng but hypervised by the TF-A... and the only
> > difference is, well, as you're also pointing out, that we're using secure
> > monitor calls instead of direct MMIO handling.
> > 
> > There's also not much more than what you've implemented here and the only kind
> > of addition that we will ever see on this one will be about changing the SIP
> > command (as some older SoCs use a different one)... so...
> > 
> > ...I don't think that adding an entirely new driver is worth the noise, hence
> > I propose to simply add handling for the Secure RNG to mtk-rng.c instead: it's
> > shorter and we would only need to address one if branch on that probe function
> > to set a different callback.
> > 
> > The clock should then be optional for *some* of those "v2 handling" devices,
> > as if I recall correctly, some do need the clock to be handled from Linux
> > anyway... otherwise this v2 driver will be "soon" looking bloody similar to
> > the "v1", adding a bit of code duplication around.
> > 
> > What do you think?
> > 
> 
> That was exactly what I was thinking as well when I had a look at the
> driver. I propose to add it to mtk-rng.c. I don't see any value having a
> second driver for this.

Or fix the firmware to use the already defined SMC TRNG interface...

In any case, like the SMC TRNG, you don't need a DT binding. The 
firmware interface is discoverable. Try the SMC call and if it succeeds, 
you have a TRNG.

Rob

> 
> Regards,
> Matthias
> 
> > Regards,
> > Angelo
> > 
> > > ---
> > >   MAINTAINERS                         |  1 +
> > >   drivers/char/hw_random/Kconfig      | 16 +++++++
> > >   drivers/char/hw_random/Makefile     |  1 +
> > >   drivers/char/hw_random/mtk-rng-v2.c | 74 +++++++++++++++++++++++++++++
> > >   4 files changed, 92 insertions(+)
> > >   create mode 100644 drivers/char/hw_random/mtk-rng-v2.c
> > > 
> > 

