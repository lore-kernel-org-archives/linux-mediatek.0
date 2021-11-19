Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E15C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HIGH8cPl3NZ9kk/cTgojM0pXJgP1HGbXwQ/vIRWe6U=; b=TDU5zqus1UkFvm
	JrKDncwzY8v48f1IAxRci6iVtcylZbYhqUM5dbx9ram5T/226qj/Fz9yvFOVLYXblVG84f29cd97l
	4TxRpI+1Vbf1Cz7zYBdkwjfM4ZxjEZtIRrDf/MeWwqkeyjK/9qs8lZSqA0Agh5NCkdKko0YUrJjLE
	qFKEK5TrYYwCdtUXAh2jvuLoKSZwJYSPl8zqRECp28pju9wmmJ3hX3ulA/sdifAeRkIf8Ns3h3Z/Y
	flwFlNNdICOqaXSZ3wXGhS01p6jl0peKhZisk0w45YdlZRAa3/AkM4GTADtJsDNBnL+BEq2wP1aGn
	rugdU/yujlfu4IQG3+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCcA-00Bij0-Oc; Fri, 19 Nov 2021 22:44:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCby-00Biha-Di; Fri, 19 Nov 2021 22:44:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E767E611F0;
 Fri, 19 Nov 2021 22:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1637361841;
 bh=/8D+DWwiOLrMlIDqL9IKYgJ9r6bICMktA9e46Vj/SXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fw4+VpZGxF2/jqYJa04GV+BNGu9xw9HBBPZSNzLAGos4KZWJpmip59Je0jxAguAHA
 lGVIxlfSXZE3iZaIE0AJcoLifsIh2Wb4yXmDAhfOW77+nF4jjZXBNx5gGEikmxE3Eb
 JF+3PlpsYq6suO/cIx4EmS3D0NdLfHwdV51o30Cg=
Date: Fri, 19 Nov 2021 14:43:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chinwen Chang (=?UTF-8?Q?=E5=BC=B5=E9=8C=A6=E6=96=87?=)
 <chinwen.chang@mediatek.com>, Nicholas Tang (=?UTF-8?Q?=E9=84=AD=E7=A7=A6?=
 =?UTF-8?Q?=E8=BC=9D?=) <nicholas.tang@mediatek.com>, James Hsu (
 =?UTF-8?Q?=E5=BE=90=E6=85=B6=E8=96=B0?=) <James.Hsu@mediatek.com>, Yee Lee
 (=?UTF-8?Q?=E6=9D=8E=E5=BB=BA=E8=AA=BC?=) <Yee.Lee@mediatek.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 kasan-dev <kasan-dev@googlegroups.com>, <kuan-ying.lee@mediatek.com>
Subject: Re: [PATCH] kmemleak: fix kmemleak false positive report with HW
 tag-based kasan enable
Message-Id: <20211119144359.b70d2fde7631bd14cd9652e3@linux-foundation.org>
In-Reply-To: <c5cfd0c41dee93cd923762a6e0d61baea52cec8d.camel@mediatek.com>
References: <20211118054426.4123-1-Kuan-Ying.Lee@mediatek.com>
 <754511d9a0368065768cc3ad8037184d62c3fbd1.camel@mediatek.com>
 <CA+fCnZddknY6XLychkAUkf9eYvEW4z9Oyr8cZb2QfBMDkJ23zg@mail.gmail.com>
 <c5cfd0c41dee93cd923762a6e0d61baea52cec8d.camel@mediatek.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_144402_521988_B792DF7D 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, 19 Nov 2021 23:12:55 +0800 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:

> > > > Call sequence:
> > > > ptr = kmalloc(size, GFP_KERNEL);
> > > > page = virt_to_page(ptr);
> > > > kfree(page_address(page));
> > > > ptr = kmalloc(size, GFP_KERNEL);
> > 
> > How is this call sequence valid? page_address returns the address of
> > the start of the page, while kmalloced object could have been located
> > in the middle of it.
> 
> Thanks for pointing out. I miss the offset.
> 
> It should be listed as below.
> 
> ptr = kmalloc(size, GFP_KERNEL);
> page = virt_to_page(ptr);
> offset = offset_in_page(ptr);
> kfree(page_address(page) + offset);
> ptr = kmalloc(size, GFP_KERNEL);

I updated the changelog to reflect this.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
