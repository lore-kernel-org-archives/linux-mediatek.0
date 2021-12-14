Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B258CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MqWsIbnBYEssdG0WTgMBHu/9q/HlVkL71Q0KRpfong=; b=FvQnw6VXJPIu40
	LoL0hSDXbpR7UoSDT6vehedB0FrSrMC9G59itf2wotoYaxNFXigbqgZmW35L7mrcqWODkNEiZqb0U
	xur3kV97lvgJPzLEHwQyH0Y6sOhF1mjx38DXPYuh2ox7G5Oh8lI7FK8bt9/cjotGqBlwPkBsrtyZE
	E4soG1pLoq9uXPrg08JdDD3UzIfvuqvJjojXbPAIt8mpUicm76GV3PSzqHqB4yLsCCqyXZJ4le1ZP
	j9Gneg8UmI+AaVflcwcTwaNw+b5BmYmIuyvNB9Nj2+X1kj6zIOdxu0wL35kjqwzK8KKFsW6/NVhOa
	v/puv962M/Ga9V0VG/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx2kD-00Cwmu-LX; Tue, 14 Dec 2021 08:01:05 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx2jx-00CwjR-6A; Tue, 14 Dec 2021 08:00:50 +0000
Received: by mail-oi1-x22c.google.com with SMTP id o4so26357089oia.10;
 Tue, 14 Dec 2021 00:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OCkr7HY+MiDuhLnjGtVsvlNgp0NXQsZibi1Zdq0qncY=;
 b=glmMjJdkrGF/acVp9UHcZrXP7qcNlr7RiSmA7oM+CWZaNFO5YcKOxuSFWy0MikeuNi
 qIhR//IQkvrFAwZ25DqbzH6TRE4vZUiaaVHH9ELQSr83ilpe1TByIHQMc7Q9b09ffsGo
 24vSMAh3rfzWqv4ea+bWQYPqC3yApQFjeNq8ebx754IrYtDchIeRLT4skAa4ckkuSkii
 DvMeQAEEZ4vB/kWjhtF+xWzohXL6vZHWpfzorzKc0yckajxf/vpEG2Nf9zBEtRjWAbMt
 S6irSXfR4h6hdN1IyEYXED98Lcp62pufptCNQgnVLiJ1hJB4jV9KS4xrBP59Q7zy38m8
 o/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OCkr7HY+MiDuhLnjGtVsvlNgp0NXQsZibi1Zdq0qncY=;
 b=VPhwdBeFoWPmnYCo9CSMijua+RWHVFr4KZJopOrh3b3wweD/HwilHVOV0faILZgYOu
 drXMBXwemQDTxecuWSvvQXPRaLJAMhcgDrZtADGjcPSZau+AD39ScuxZBRcwQ1nGGl0P
 hY4dZLH9ios5ufFzGmgdKnxLpHIjFieT1W2xdw2Top98SxM9F56NLxIhiZle5ZmZ6i3e
 EVwk5k54f26q0qMPbyiBb/2GKiceFH+2nIeHHyJUXjYIxUyAsZIrgZhXAZxq7pQvfYts
 O+X4qFLuKnwbK/5P+iSKsjaApqM6ii0O1V8wQHnzE34Tr/YeKbD/c+yrTMFlYiy9ZOAA
 SKjA==
X-Gm-Message-State: AOAM530S+jArPdK0/eMRQ/Kce2GbK1BaCR/rYrk7lpL3Y7yKF+cpO5SR
 WjKEYuXZHoBTw3cqToVNzyAuNR1RY6tzWB2kH1E=
X-Google-Smtp-Source: ABdhPJwerNovIcT3UKklATUbw5xH3MDbWq0GscSVhskXzn3PhXJIo9HoMhhC/WtJtkPiaSK+XxHTe2FfLfeAsoMlPXY=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr30718975oig.5.1639468846715; 
 Tue, 14 Dec 2021 00:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20211209072218.21651-1-chunfeng.yun@mediatek.com>
 <c448da77-f2f3-8b79-fc4b-b9dcff727c6e@linux.intel.com>
In-Reply-To: <c448da77-f2f3-8b79-fc4b-b9dcff727c6e@linux.intel.com>
From: Jun Li <lijun.kernel@gmail.com>
Date: Tue, 14 Dec 2021 16:00:35 +0800
Message-ID: <CAKgpwJXxtLwOjxjg3vFHiqS92j6rx_b1+C-bRwDnp+PBvXCMTg@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: skip re-check pending port event if hibernated
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux USB List <linux-usb@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 lkml <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, 
 Yun-Chien Yu <yun-chien.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_000049_265672_3C6A955A 
X-CRM114-Status: GOOD (  11.55  )
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

TWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+IOS6jjIwMjHlubQx
MuaciDEx5pel5ZGo5YWtIDAxOjU25YaZ6YGT77yaCj4KPiBPbiA5LjEyLjIwMjEgOS4yMiwgQ2h1
bmZlbmcgWXVuIHdyb3RlOgo+ID4gV2hlbiB4SENJIGNvbnRyb2xsZXIgaGliZXJuYXRlZCwgdGhl
IHJvb3QgaHViIGxvc3QgcG93ZXIsIGlmIGNvbnRyb2xsZXIKPiA+IHN1cHBvcnQgUG9ydCBQb3dl
ciBDb250cm9sIChQUEMpLCBQUCBpcyBub3Qgc2V0IGF0IHhoY2lfcmVzdW1lKCkgYW5kCj4gPiBz
ZXQgYnkgaHViX3Jlc2V0X3Jlc3VtZSgpIGxhdGVyLCBzbyBubyBuZWVkIGNoZWNrIHBlbmRpbmcg
cG9ydCBldmVudC4KPiA+IElmIFBQQyBpcyBub3Qgc3VwcG9ydGVkLCBkZXZpY2UgaXMgZGlzY29u
bmVjZWQsIHNlZW1zIGRvIG5vdCBzZW5kIG91dAo+ID4gVTMgTEZQUyB3YWtlIHNpZ25hbCwgbm8g
bmVlZCByZS1jaGVjayBhZ2FpbiBhbmQgZHJvcCAxMjBtcyBkZWxheSB0bwo+ID4gc2F2ZSByZXN1
bWUgdGltZS4KPiA+Cj4gPiBSZXBvcnRlZC1ieTogWXVuLUNoaWVuIFl1IDx5dW4tY2hpZW4ueXVA
bWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55
dW5AbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4KPiBUaGFua3MsIGFkZGluZwoKSGkgTWF0aGlhcywg
Q2h1bmZlbmcKCkkgaGF2ZSBhIHF1ZXN0aW9uIG9uIHRoaXMsIGlmIHRoZXJlIGlzIG5vIGFueSB1
c2IgZGV2aWNlcyBjb25uZWN0ZWQKYmVmb3JlIHN1c3BlbmQsIGRvIHdlIG5lZWQgdGhpcyAxMjBt
cyBkZWxheSB0byBjaGVjayBhZ2Fpbj8KU28gZG8gd2UgbmVlZCBvbmUgbW9yZSBjb25kaXRpb24g
dG8gbGltaXQgdGhpcyBsaWtlPwppZiAoIXBlbmRpbmdfcG9ydGV2ZW50ICYmICFoaWJlcm5hdGVk
ICYmIHhoY2lfaGFzX2NoaWxkX2RldmljZSgpKQoKdGhhbmtzCkxpIEp1bgo+Cj4gLU1hdGhpYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
