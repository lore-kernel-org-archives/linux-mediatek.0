Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 01:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fX9d2cz3IKVzVjXFONeNtbWSOPnW+I+493KcUL3a+TY=; b=AUj11G+cL6RJN0
	wtzGginVipfdSzMekpcObwA6EMbRH+U8sElYg5Bf6gNu8ADSsZeOKOgj6RDurFCtEBlPgs/Cc+zvX
	LnEaUKAKbgoxIiXYqyc9wyrUtSgYnY+/k6EYHwn72JPeB6cH7kfdVzThWW4uxArLh10MHgEp2G3HP
	nB04Ib+XikZhlhm/fvmX3DI0DZNfXlsMFrezrBec+47KlzG6PofIn9IraE7gW9UNVFPWQH/fOtbey
	lXgKLlvUkedLCUYsrpdYcmdS8OnpKoAjngfH3zH8UvG8awL7qNemw+ZRoh62mDqj2o6sxs31D0Kez
	a498UtV89OUUkkg5VlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Bez-007Q0h-JN; Fri, 14 Jan 2022 01:45:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Bem-007PzO-Er; Fri, 14 Jan 2022 01:45:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9228861CEB;
 Fri, 14 Jan 2022 01:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E127FC36AEA;
 Fri, 14 Jan 2022 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642124731;
 bh=pBKJYbtzsoBjwRvqujAPXh3tzGQAMKSejZM0stQ83b4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hdjP56UUNvO45mGOQaKBcLVqzkJfvtq0DUQypiH85brKACUYo979cnumocERQ5wKB
 uBybsQ0cOaixYOVUZtj/jEioEUDwgMyq5Jn+azextgjrlQi/OpRJJBTMBaTpghPJrJ
 as6vL4p6Rrr5J0waI3G0pdrE7hcjG75JCOfpopBqRPdPE98aH6n8AqbpYViQV+noXY
 Ix9Zs0WNaTofDOHNc7MSGH6tkcCTEzzwRNqQ48+MBKlYmpb8fON3t8yqPD3Q+0juHH
 dZCH022DEYwKYvKboOvnm6oJOlrAaRnKVpEJ2K6fWLxYXPBpMV70wgbLrbpecD2Vg3
 s3azhKSOCELOA==
MIME-Version: 1.0
In-Reply-To: <20220107182451.139456-1-jose.exposito89@gmail.com>
References: <20220107182451.139456-1-jose.exposito89@gmail.com>
Subject: Re: [PATCH RESEND v2] clk: mediatek: Fix memory leaks on probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, ikjn@chromium.org, chun-jie.chen@mediatek.com,
 weiyi.lu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 mturquette@baylibre.com
Date: Thu, 13 Jan 2022 17:45:29 -0800
User-Agent: alot/0.9.1
Message-Id: <20220114014530.E127FC36AEA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_174532_572431_95D8985A 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
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

UGxlYXNlIENjIHRoZSBjbGsgbWFpbGluZyBsaXN0IG9uIGNsayBkcml2ZXIgcGF0Y2hlcy4KClF1
b3RpbmcgSm9zw6kgRXhww7NzaXRvICgyMDIyLTAxLTA3IDEwOjI0OjUxKQo+IEhhbmRsZSB0aGUg
ZXJyb3IgYnJhbmNoZXMgdG8gZnJlZSBtZW1vcnkgd2hlcmUgcmVxdWlyZWQuCj4gCj4gQWRkcmVz
c2VzLUNvdmVyaXR5LUlEOiAxNDkxODI1ICgiUmVzb3VyY2UgbGVhayIpCj4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgRXhww7NzaXRvIDxqb3NlLmV4cG9zaXRvODlAZ21haWwuY29tPgo+IFJldmlld2Vk
LWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4KPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
