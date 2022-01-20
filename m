Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D94C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UU4ojE6G2tB62Ub9STyvHjFWjW0+HbTaSjzN8LtnnLI=; b=uk0GAZ8phDEGC0
	OQOmqcOTYEk99KLazgsvlHcVxdkSputkqU9jFcAATlv5pQtdvFCEWuQwlShwhEzfqSU51gtP5tmhW
	nEdAvMqao9OwxrchmEAdPTTF/t5ATRho2yCrXtLaWqd4jpCO4CciMbnZWytorWG+IX0t+6cnvO04M
	pBzI+r6MFqX4u+O15+8hA4WRoYtM2gHOdKYaLUYJ6QZU2yLxbT94PNhuJxBwQmXl3D7nHG5y8MklT
	M2fj2xnVbtIN+/CmEDwyanZSTww0JKo6gJeUR9QCjLfHcg3JVZ5CimX78GMpXsewWKOSUeNXDWzxE
	qd2mzKy8rDTa4i0pbaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATzW-00AKhR-8n; Thu, 20 Jan 2022 09:44:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATzI-00AKdb-50; Thu, 20 Jan 2022 09:44:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7AE2CCE202E;
 Thu, 20 Jan 2022 09:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A840BC340E5;
 Thu, 20 Jan 2022 09:44:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fssD5vvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642671844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G1vhBKyxUeexYoEpFA7C2RgBVPR3wFJ965AiyzZ7d1Y=;
 b=fssD5vvDonTjf+Ob+Bpl1G3vPKMhEseK8iREJoFAg6ynOzq+BSSo6lVquWfZvAcYlh6Lvu
 bkC7lhUCYYe16qmc0QIe3GrcAbiqnG1eqnXBufblVHz5zhcqCzPLluqfWpy6rtBhSxckFH
 s+P22Zx6skyLld3jyUnagQF/dm3ahQs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dc7f3180
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 20 Jan 2022 09:44:04 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id m1so16053013ybo.5;
 Thu, 20 Jan 2022 01:44:03 -0800 (PST)
X-Gm-Message-State: AOAM531Dl7czNfriOtHYI8QORkoPU/YRVXHTlQiWFY5U86YKf9x1mctv
 j4qPb+2ruPlPmImgVwBaHGHcpJEDoxR/+M4umnk=
X-Google-Smtp-Source: ABdhPJzg1g/gym62qyvrV0DrQk1jKs3WkH/OEe7OV9zyQPzVSRgVDI0hITqpB3HjmG/WYqbbT3zIOQtxb62GLCP4W9k=
X-Received: by 2002:a25:854f:: with SMTP id f15mr45690101ybn.121.1642671843070; 
 Thu, 20 Jan 2022 01:44:03 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Thu, 20 Jan 2022
 01:44:02 -0800 (PST)
In-Reply-To: <YeiPn8Mo1AM7X9Ud@archlinux-ax161>
References: <CAHmME9qVMomgb53rABKsucCoEhwsk+=KzDdEcGKtecOXuahTZw@mail.gmail.com>
 <20220119135450.564115-1-Jason@zx2c4.com> <YeiPn8Mo1AM7X9Ud@archlinux-ax161>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Jan 2022 10:44:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9rPy=T=0Ddbw+01bFycXNPfuxgMm+U80DzDSLy0Cdh_Gg@mail.gmail.com>
Message-ID: <CAHmME9rPy=T=0Ddbw+01bFycXNPfuxgMm+U80DzDSLy0Cdh_Gg@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: avoid indirect calls to compression
 function for Clang CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miles Chen <miles.chen@mediatek.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_014412_414761_AC68645C 
X-CRM114-Status: GOOD (  11.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/19/22, Nathan Chancellor <nathan@kernel.org> wrote:
> On Wed, Jan 19, 2022 at 02:54:50PM +0100, Jason A. Donenfeld wrote:
>> blake2s_compress_generic is weakly aliased to blake2s_generic. The
>
> Isn't it the other way around?

Thanks. Changed that 'to' to a 'by'.

Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
