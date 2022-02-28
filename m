Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA116C43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 22:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQdqgcNS3NIGFy7lP84vsjOfrmV7JGmLBmVlsjr6Uo4=; b=E5R0BG+8XSkSwT
	L4mLExcEuI2QuQVNHOvyMrEeE0qLIHFoDdP0xwDqLsGstGLJqV3msH/v4MctQWssuvwsjZ61efoMQ
	9NwqKMEGD04Eis2Ze27iSkSPs+rsrWAS9vfzzbxJydhB95roB0bsRDtAgGzKSA902AgfBuf2BH2+w
	EhveC/KDe6XkSguZ07POApxr87N5e8cEgdxCuJDEkoJjc8NehntPDU6ZMqNbLUZicluwuafXF722D
	JYiLWCRauSIgB6+C8lRKFF28dctBlpv/IR3lm36m6R6BGomsnWKlfiNhnOHKbrXDB2Uu6jyPlt2tt
	fedyPjyQGSCZq4lNjgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOoqP-00EKix-Ar; Mon, 28 Feb 2022 22:50:17 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOoqM-00EKi0-3W; Mon, 28 Feb 2022 22:50:15 +0000
Date: Mon, 28 Feb 2022 22:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1646088609;
 bh=EcotLxkQaYgY6ajZYic/GfxM/AoG16BTcQ37oNetF9g=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=cBGwkD0dY6C6UZ8ZjhjHcbwM06BMDKF9S/uxRi+rS2UvdSsFLFOG1HSm6qlJyiCUO
 uC1XgssvVNSFSsxdHJ1aOl5NwIA18vjg17jCvCkv13dOUO+5hOt3OCcfXLX2AxvryX
 lsXEg4vAoBljMT4ewAP2cK1EUDuyezakLW8pnSEAczd9xFJNkZ4Y3ZLxhFb22yslY3
 3xdTS3cTZ9GeOv+wrf2xTPfY4Kamc1tDDmDy3yCaRm+7b1f1xP0Y+5xR0FjORV+5kM
 cK85iRo45YcxaJSZ64KqeuDyrCIZDsEiDwE78vJR0ycrL/ZWpMTXDPzJnBHTv4Qo8t
 TiTx0AcdTLM/g==
To: James Bottomley <James.Bottomley@HansenPartnership.com>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jakob Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org,
 linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net, 
 bcm-kernel-feedback-list@broadcom.com, Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List
 <linux-f2fs-devel@lists.sourceforge.net>, tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Ax76nlte5gO6McgVlkdlM8SHBdfYoG0hb6pFO3MJ6iEg3VCk3kzPWFQ6HS2uVDB8eeyLSr4ku62pXF-FrsROsQvF_VDAW1I5lXTFZTkkMfk=@protonmail.com>
In-Reply-To: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_145014_336302_FD4AB225 
X-CRM114-Status: GOOD (  10.26  )
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
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkKCgoyMDIyLiBmZWJydcOhciAyOC4sIGjDqXRmxZEgMjM6Mjgga2VsdGV6w6lzc2VsLCBKYW1l
cyBCb3R0b21sZXkgw61ydGE6Cj4gWy4uLl0KPiBXZWxsLCB5ZXMsIGJ1dCBteSBvYmplY3Rpb24g
aXMgbW9yZSB0byB0aGUgc2l6ZSBvZiBjaHVybiB0aGFuIHRoZQo+IGRlc2lyZSB0byBkbyBsb29w
IGxvY2FsLiAgSSdtIG5vdCBldmVuIHN1cmUgbG9vcCBsb2NhbCBpcyBwb3NzaWJsZSwKPiBiZWNh
dXNlIGl0J3MgYWx3YXlzIGFubm95ZWQgbWUgdGhhdCBmb3IgKGludCBpID0gMDsgLi4uICBpbiBD
KysgZGVmaW5lcwo+IGkgaW4gdGhlIG91dGVyIHNjb3BlIG5vdCB0aGUgbG9vcCBzY29wZSwgd2hp
Y2ggaXMgd2h5IEkgbmV2ZXIgdXNlIGl0LgoKSXQgaXMgYXJndWFibHkgb2ZmLXRvcGljIHRvIHRo
ZSBkaXNjdXNzaW9uIGF0IGhhbmQsIGJ1dCBJIHRoaW5rIHlvdSBtaWdodCBiZQp0aGlua2luZyBv
ZiBzb21ldGhpbmcgZWxzZSAob3IgbWF5YmUgaXQgd2FzIHRoZSBjYXNlIGluIGFuIGFuY2llbnQg
dmVyc2lvbiBvZiBDKyspCmJlY2F1c2UgdGhhdCBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgY2FzZS4g
SWYgaXQgd2VyZSwKCiAgZm9yIChpbnQgaSAuLi4pIHsgLi4uIH0KICBmb3IgKGludCBpIC4uLikg
eyAuLi4gfQoKd291bGQgaGF2ZSB0byB0cmlnZ2VyIGEgcmVkZWNsYXJhdGlvbiBlcnJvciwgYnV0
IHRoYXQgaGFwcGVucyBuZWl0aGVyIGluIEMrKyBub3IgaW4gQy4KVGhlIHZhcmlhYmxlIGlzIGFs
c28gaW5hY2Nlc3NpYmxlIG91dHNpZGUgdGhlIGxvb3AuCgoKPiBbLi4uXQoKClJlZ2FyZHMsCkJh
cm5hYsOhcyBQxZFjemUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
