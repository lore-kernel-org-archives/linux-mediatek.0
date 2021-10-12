Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8617C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 00:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F7E60F11
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 00:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85F7E60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYYBEnRFvW3uythhUGK7HJNt6xgnXpn1+cJU2LurPm4=; b=i+sCs15omeuEvH
	chPt3wAAl0TcAQw3a+1cA+va3BB3ROJlNLFwoH4VajCB8Md76o/5cAHwrHM/J/yBOyrhQ5QZpLgBP
	z5jETQ3Db9Lhp17Bnl/xNixWR0WL+sEFqAOl1OvoDGXrlISuxfRvHHNwOvQFDJ6ekHQ7lnaU5gOqc
	swL5q15DSMYJUcCrKPy5gpc7m0JugrUWVUw32Z8KN4WhV4lsWiWWDDY93sHYWhXCGb+91c1s7gFjF
	8GxZPqHgF2Q9IATFxaRZ8Dn2K8/Ag+2qXm9lC2ouX+has2rlGf54LlXLA/f9eZcWeQcvW2xRmXEUT
	cbo6mQwyR0vDKuAihYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma5QJ-00B449-5G; Tue, 12 Oct 2021 00:13:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma5QG-00B43J-EN
 for linux-mediatek@lists.infradead.org; Tue, 12 Oct 2021 00:13:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A128B60F38
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Oct 2021 00:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633997614;
 bh=OXUvi6G050AJQ4OPBek0ufw7ZKzRxTQhHX/0FYRiCE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q4UGSzvjtHyHLu68/g1K/x33KNDmpnLBws9RDs38WRclHkjTS2eXTjUQobHqxsZz5
 XM/G1BYUiNJZ/BT734m29NFQFGzFXy7mrx6mMkOinz/a0ns30M5jxUppddo6Tr3Ueg
 kDfXJghO5wfm5cfqUCAhextUwZIMBqPzGV6crlIWf4Gvgk1O/4cHHqAtvYMJpJd5bv
 0swnGclMpgVPdoVN26pC1p50IML2YtHe6ZiRDbwLKm3vHzBKVW0RwN+YQXsSno9EeN
 LtKWWPmOcpOTNp2IzPQht/gsYxYEf+e715BXi/Sqr55fMoIjGPRN1d304snEK6iwWG
 bqd3Eu9KQuRSg==
Received: by mail-ed1-f51.google.com with SMTP id d9so50073998edh.5
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Oct 2021 17:13:34 -0700 (PDT)
X-Gm-Message-State: AOAM5336ZIwiFDYfkHnMqFHSQWM7cgmfR3ntOPJ7oidxFrpYn7lDfyE9
 ww8l/kl3ozL4cs+zEg4keuypQXExIw2ZvOjdsg==
X-Google-Smtp-Source: ABdhPJy4tjjmTrFlejaCRoODEcML/sZ2dFjPaUPpY/JaPn4e9sT6cT9XzsRs7SGjmICTqvgKEJcCe3ia86anOYl+97Y=
X-Received: by 2002:a17:906:f85b:: with SMTP id
 ks27mr30575894ejb.430.1633997612955; 
 Mon, 11 Oct 2021 17:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
 <CAFqH_51hO2efxbQkkbzNHSk92zOZGeFJBu4Ocijk_cpxFDJ2fw@mail.gmail.com>
In-Reply-To: <CAFqH_51hO2efxbQkkbzNHSk92zOZGeFJBu4Ocijk_cpxFDJ2fw@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Oct 2021 08:13:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8L_Pd+EmPVw5yQeZPzLVPkJM681y_uQmCbZ79tfF92AA@mail.gmail.com>
Message-ID: <CAAOTY_8L_Pd+EmPVw5yQeZPzLVPkJM681y_uQmCbZ79tfF92AA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Revert series "CMDQ refinement of Mediatek DRM driver"
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_171336_524277_EB633691 
X-CRM114-Status: GOOD (  12.96  )
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

RW5yaWMgQmFsbGV0Ym8gU2VycmEgPGViYWxsZXRib0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0MTDm
nIg45pelIOmAseS6lCDkuIvljYg5OjMz5a+r6YGT77yaCj4KPiBIaSBDaHVuLUt1YW5nLAo+Cj4g
VGhhbmsgeW91IHRvIHRha2UgdGltZSB0byBzZW5kIHRoaXMsIGZvciBmdWxsIHNlcmllcwo+Cj4g
VGVzdGVkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJv
cmEuY29tPgo+Cj4gRGlzcGxheSBpcyBub3cgd29ya2luZyBhZ2Fpbi4KCkFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLWZpeGVzIFsxXS4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1k
cm0tZml4ZXMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gVGhhbmtzLAo+ICAgRW5yaWMKPgo+
Cj4gTWlzc2F0Z2UgZGUgQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IGRl
bCBkaWEgZHYuLCA4Cj4gZOKAmW9jdC4gMjAyMSBhIGxlcyAxOjUzOgo+ID4KPiA+IENvbW1pdCBj
MWVjNTRiN2I1YWYKPiA+ICgiZHJtL21lZGlhdGVrOiBVc2UgbWFpbGJveCByeF9jYWxsYmFjayBp
bnN0ZWFkIG9mIGNtZHFfdGFza19jYiIpCj4gPiB3b3VsZCBjYXVzZSBudW1lcm91cyBtdGsgY21k
cSBtYWlsYm94IGRyaXZlciB3YXJuaW5nOgo+ID4KPiA+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDAg
YXQgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYzoxOTgKPiA+IGNtZHFfdGFza19l
eGVjX2RvbmUrMHhiOC8weGUwCj4gPgo+ID4gU28gcmV2ZXJ0IHRoYXQgcGF0Y2ggYW5kIGFsbCB0
aGUgcGF0Y2hlcyBkZXBlbmQgb24gdGhhdCBwYXRjaC4KPiA+Cj4gPiBDaHVuLUt1YW5nIEh1ICg1
KToKPiA+ICAgUmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IENsZWFyIHBlbmRpbmcgZmxhZyB3aGVuIGNt
ZHEgcGFja2V0IGlzIGRvbmUiCj4gPiAgIFJldmVydCAiZHJtL21lZGlhdGVrOiBBZGQgY21kcV9o
YW5kbGUgaW4gbXRrX2NydGMiCj4gPiAgIFJldmVydCAiZHJtL21lZGlhdGVrOiBEZXRlY3QgQ01E
USBleGVjdXRpb24gdGltZW91dCIKPiA+ICAgUmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IFJlbW92ZSBz
dHJ1Y3QgY21kcV9jbGllbnQiCj4gPiAgIFJldmVydCAiZHJtL21lZGlhdGVrOiBVc2UgbWFpbGJv
eCByeF9jYWxsYmFjayBpbnN0ZWFkIG9mIGNtZHFfdGFza19jYiIKPiA+Cj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgMTU3ICsrKystLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxMzMgZGVsZXRpb25z
KC0pCj4gPgo+ID4gLS0KPiA+IDIuMjUuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
