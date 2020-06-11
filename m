Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C304C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 21:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19A72073E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 21:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MN2WddRn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ejBFiBbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D19A72073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuhiU/aiI5pp4WjULOGik9UcOfxIPV5IKbVOODBHMtA=; b=MN2WddRnhRmgC/
	gc3qMy4+tyCQWrkKDZtdSxC4e7UhduSxVzID8R3xxXrIHHDjXuIruSxeTEDmaIc5FKz8GpvMJRxRw
	2TDe4p8tB1ctkbctmd9IbiUmGLnHCZxcQUoO588Tx8cRR5byrea4yeu0cmfgvJhd1jva1lOjfPc7x
	B7UVTptMVbXuiXEcJKpSgbbSZKlkyFUOZQE5w2Moyg/3wuujz42a1Mny8sgK1UaUEGeq0Vo1e352T
	qGjgm2uuMa8XzpC/HqCn/f1EHvLHwqVf8Z/D4pdkBsQ5rYuw6WNY7kOUi+jfv7GiF5Lurpwo5LlEw
	erghpMyolCykdU6PJZgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjUN9-0002Sd-9m; Thu, 11 Jun 2020 21:04:27 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjUN2-0002Kv-05
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 21:04:21 +0000
Received: by mail-io1-xd43.google.com with SMTP id r2so8002951ioo.4
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 14:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QOSq7LGEuq7joF0MKi0FZitcudqJi1UF8Oe0ZqqRITY=;
 b=ejBFiBbtcNieZodpXk84vlOp76dBFyUz0It9ZB89Bm0gwwgSkiQ3Ld3c+E4rAHn+tc
 Ky7P4kv0a3jv8tCtxGD7hbtix7zY1KY0C0+21gkKa3fwbxfDECedpuSWHULM6G/xucVO
 BkK4P2urYL+E7Ek3rsHbB85Lw//zCtmOX3CyO6UXC0FDaJLJUPp61MYlLa6BW3CeUIQv
 hz/3ghDmDm7MMNQwQC8ay46xt5gvI0xZrfxXiSLKUdIsvk2EZVb+fXb/dLexqaC4yak6
 md8V7tpMgcI/yfHTw1GC0foKLJdIws+xSr6EsZpUXE4GwjxSpG9CQxLixDptY57BDvQS
 6isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QOSq7LGEuq7joF0MKi0FZitcudqJi1UF8Oe0ZqqRITY=;
 b=Oe9ZzDY3UhkbslRVSGW6UssV6g/IszPmbwkfG7DL5FsxDBTB40WxpYMojbPCk2oO8O
 JVupGAF+ec0/I3J/PquiPG72Rd3bimxwJ/tKY+MB4mihgcSKD3a7mvOOXq9rDW4xJ7CC
 K5Tbe9wztVIghM3NDjaqj9895Q93dj5QVw2wVz8o5kaVB252jOTK4fq/JOa5f2Rn/OqC
 vg11XqJk55Zvp3EOGAB3jmxsBj2QVXh8I+pTNAXzR0jX/fU/lKix3dz2/67BCA7CjClN
 Bfsxpf06r7q9LiTvGXkoRD1Jp7VlOjsFXTQM0G2Guq0ZPK+dt/XlDmzt1OBcFtWscIyh
 uTKA==
X-Gm-Message-State: AOAM532iPig3inv3y/mEU9Ez8upRVDUCDTc0r1yAe3cpmLWZKpBEsqqU
 xFtJc515DZj0bSFw4yGu9yg1UTItiqSbjxoteih14g==
X-Google-Smtp-Source: ABdhPJyO4AzvzoVU07IvyqRN0BNwJCqq3fQQMT4qsrccrqgOXdW1x8Jpn2kXepafXKggJLeehXQ4LnD64mv/X7/NjJU=
X-Received: by 2002:a05:6638:b:: with SMTP id
 z11mr4888189jao.114.1591909457976; 
 Thu, 11 Jun 2020 14:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200611140139.17702-1-brgl@bgdev.pl>
 <20200611.125140.717118972991857444.davem@davemloft.net>
In-Reply-To: <20200611.125140.717118972991857444.davem@davemloft.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Jun 2020 23:04:07 +0200
Message-ID: <CAMRc=MdcW-FQecZViyAEevpJrkREGTc4Xr8zPTAW_QvqGm7P1w@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: simplify interrupt handling
To: David Miller <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_140420_109708_D6814FBA 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Y3p3LiwgMTEgY3plIDIwMjAgbyAyMTo1MSBEYXZpZCBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5u
ZXQ+IG5hcGlzYcWCKGEpOgo+Cj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rl
di5wbD4KPiBEYXRlOiBUaHUsIDExIEp1biAyMDIwIDE2OjAxOjM5ICswMjAwCj4KPiA+IFVuZm9y
dHVuYXRlbHkgYWZ0ZXIgdGhvcm91Z2ggdGVzdGluZyBvZiBjdXJyZW50IG1haW5saW5lLCB3ZSBu
b3RpY2VkIHRoZQo+ID4gZHJpdmVyIGhhcyBiZWNvbWUgdW5zdGFibGUgdW5kZXIgaGVhdnkgbG9h
ZC4gV2hpbGUgdGhpcyBpcyBoYXJkIHRvCj4gPiByZXByb2R1Y2UsIGl0J3MgcXVpdGUgY29uc2lz
dGVudCBpbiB0aGUgZHJpdmVyJ3MgY3VycmVudCBmb3JtLgo+Cj4gTWF5YmUgeW91IHNob3VsZCB3
b3JrIHRvIHBpbnBvaW50IHRoZSBhY3R1YWwgcHJvYmxlbSBiZWZvcmUgcHVzaGluZyBmb3J3YXJk
Cj4gYSBzb2x1dGlvbj8KCldoeSB3b3VsZCB5b3UgYXNzdW1lIEkgZGlkbid0PyBJJ3ZlIGJlZW4g
dHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhpcwpwcm9ibGVtIHNpbmNlIE1vbmRheSBidXQgc2luY2Ug
SSdtIG5vdCBzdXJlIGhvdyBtdWNoIHRpbWUgSSB3aWxsIGJlCmFibGUgdG8gc3BlbmQgb24gdGhp
cyBnb2luZyBmb3J3YXJkIGFuZCBkdWUgdG8gdGhlIGZhY3QgdGhhdCB0aGlzIGlzCm5vdyB1cHN0
cmVhbSAoYW5kIGJyb2tlbiksIEkgc2VudCB0aGlzIHBhdGNoLiBBcyBJIHNhaWQ6IGl0IGRvZXNu
J3QKaW1wYWN0IHBlcmZvcm1hbmNlIG5vciBpcyB0aGlzIHNvbHV0aW9uIGluaGVyZW50bHkgd3Jv
bmcgLSBtYW55CmRyaXZlcnMgZG8gaXQgdGhpcyB3YXkuCgpJIHdpbGwgY29udGludWUgd29ya2lu
ZyBvbiB0aGlzIGRyaXZlciBvbiBhbmQgb2ZmIHNvIEkgKmRvKiBpbnRlbmQgb24KZml4aW5nIGl0
IGFzIHdlbGwgYXMgZXh0ZW5kaW5nIGl0IHdpdGggbW9yZSBzdXBwb3J0LCBoZW5jZSB0aGUgRklY
TUUKYW5kIHByZXZpb3VzIFRPRE8uCgpCZXN0IHJlZ2FyZHMsCkJhcnRvc3oKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
