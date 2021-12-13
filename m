Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9358C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHX8sEIPKKgXw2GfsfDq6WzVmnIeUISg5zLBAyatBeI=; b=LV9+oOPTcvpMwK
	vxQuPqN5HboqpOzM0P7eeoj4C9SYI9BoS9Fytgn34XRt5zG8Jd+ZXNH5F2czwTTJbn6zF3P0JH4I4
	btyc8pI04fXK6e9+77HnZloxUTjKzXseUFDtlHdVfv+HyCMhgSXEt3O08ztnu6LgtJeOfdQ+6o0D1
	0cc6UE1WUe3WZukV1sc2hy+Cj29qLACzP82WmxPJXaaQrS6OsC4AhMC2RixMIhfOrFi26AkT4bZN8
	WFhVZ9sJeHrKuZlDz4Mf0geNlCTHxpUve10+/mL/R+1H5Sb6frEGKTqVBU6EP6hmu0SJQWl5U+2tv
	gl7cuOaDSI3oJ8pZfpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwn5q-00AKNm-Gu; Mon, 13 Dec 2021 15:18:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwmoF-00AEYf-VQ; Mon, 13 Dec 2021 15:00:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54D256113E;
 Mon, 13 Dec 2021 15:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3526C34611;
 Mon, 13 Dec 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639407611;
 bh=WjcGELbu5JIKbGB4EMlOVci44ait6RcZ0lcliNjSfIA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=psYdtPJZOEQQuzAu/yovjNacJXoUwfT9h2sMTh8oPH0Jf45yQlcUfxbC+3uiYqdS8
 ePjf4HZhOZIBN4lIh4/i8m6yo9+ZcGptg15ajxDewsplStTINzNycAgDOhRlSpWXHM
 dBz9f3KjkZPs29f/WPyuate7otj9zYpTqXoV3lvwxcp0KSYr0bAUQuf8w748pFitbw
 HxIdShlgRuLvo52xBPL1BLObLnwk68393gpvcXPFqVyiNcQptIYdiBPlwaAMigJ3xt
 mAixPmPLMddJtMgSZmV5SDlcJp+cojEyvn17IDJ+1saDTnAAPbELCW1cdZGJvPTFLz
 SjZNMoTvw2Daw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D30D66098C;
 Mon, 13 Dec 2021 15:00:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next] mt76: remove variable set but not used
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163940761085.26947.2175837807635652318.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 15:00:10 +0000
References: <20211213095413.99456-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20211213095413.99456-1-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 nathan@kernel.org, ndesaulniers@google.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, abaci@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_070012_104409_0955BBF6 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIG5ldGRldi9uZXQtbmV4dC5naXQgKG1h
c3RlcikKYnkgRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PjoKCk9uIE1vbiwg
MTMgRGVjIDIwMjEgMTc6NTQ6MTMgKzA4MDAgeW91IHdyb3RlOgo+IFRoZSBjb2RlIHRoYXQgdXNl
cyB2YXJpYWJsZSBxdWV1ZWQgaGFzIGJlZW4gcmVtb3ZlZCwKPiBhbmQgIm10NzZfaXNfdXNiKGRl
dikgPyBxLT5uZGVzYyAtIHEtPnF1ZXVlZCA6IHEtPnF1ZXVlZCIKPiBkaWRuJ3QgZG8gYW55dGhp
bmcsIHNvIGFsbCB0aGV5IHNob3VsZCBiZSByZW1vdmVkIGFzIHdlbGwuCj4gCj4gRWxpbWluYXRl
IHRoZSBmb2xsb3dpbmcgY2xhbmcgd2FybmluZ3M6Cj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVk
aWF0ZWsvbXQ3Ni9kZWJ1Z2ZzLmM6Nzc6OTogd2FybmluZzogdmFyaWFibGUKPiDigJhxdWV1ZWTi
gJkgc2V0IGJ1dCBub3QgdXNlZC4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRo
IGxpbmtzOgogIC0gWy1uZXh0XSBtdDc2OiByZW1vdmUgdmFyaWFibGUgc2V0IGJ1dCBub3QgdXNl
ZAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy85M2Q1NzZmNTRl
MGYKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBh
IGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
