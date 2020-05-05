Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D43CC47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16EE20737
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NjS4tgyj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BN6Cy/3H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16EE20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCE3TRGZaDWsV94B1bBFgea8q5HsMxCGfK7qXYv9NYY=; b=NjS4tgyjmJtqVP
	MIiX/VYjUYv7uxNjKOsHZzT4dS4sFBUy8fEaAUUwBZVuzXYPJ0eHWnf8b/rGi3yyniBISvhXGY8Pk
	bTtsy5yPfI0MZAcRzqCdqR4XH+Ks2eFHMmj84LflatA66WeugNoRoGq24L00IoUhPigi84PHWMeSV
	F22B+LIF4PQPW9vEy511Ngx0UT+KY/UlPtPGbVxpMVLQfm4SPMkwyAFpI+oP23n41pOlkq6SP4G/m
	aMdh+Wsu55ZzPGajw+twWY5P/w9wjYkyKknKyuCfn4eyXPAOl8gzBh1e+AK9G0VthVjabKEnBvNdb
	YVX+DeLhh7jVccNfnpPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVosd-0000UP-0C; Tue, 05 May 2020 04:08:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVosO-0000JY-Lt; Tue, 05 May 2020 04:08:13 +0000
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E8CE2075E;
 Tue,  5 May 2020 04:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588651690;
 bh=uzzMCgqE/O5IIYjUlJGPkxkNrxePxpFGbx62v87B1yk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BN6Cy/3HpCwbAGqGdvC+qqnnmWcpBeTMOV+avy7c5MqADF8o2RkgcRkJzIQXdsCsk
 1Afk3jIt/KQM3TnQcStiKfqzuLsewX65wxQohWJds/+9oXyCCJshgXhqgUpXBb3dvp
 Pj9E/11iNOGPIQykmHB/KEKg0M4b5I2GMOZkNt/o=
Received: by mail-ot1-f53.google.com with SMTP id g19so573527otk.5;
 Mon, 04 May 2020 21:08:10 -0700 (PDT)
X-Gm-Message-State: AGi0PubU+SP5SF8IO2yFaAdilkn5SRvXTWArqDfvJIGY+ELZxAch16C/
 G+3Fd5z/9KfSmcVFkTYCDP9wZ3GnlNQ04AIhaA==
X-Google-Smtp-Source: APiQypKr0Hhrl0+e44U31hazXs0o4bScaIuGYf4nCgkUWwDdJ4zYt2nRLPemlwjIE7S1TGeNHXWRAj+I7RpOjlh+8dk=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr690540otn.107.1588651689440;
 Mon, 04 May 2020 21:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <967df5c3303b478b76199d4379fe40f5094f3f9b.1588584538.git.mchehab+huawei@kernel.org>
 <20200504174522.GA3383@ravnborg.org>
 <20200504175553.jdm7a7aabloevxba@pengutronix.de>
In-Reply-To: <20200504175553.jdm7a7aabloevxba@pengutronix.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 May 2020 23:07:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJuRrhEtt5uxaQ=7WvDKiF_2v025GiYUvrrFE5jxBr-Xg@mail.gmail.com>
Message-ID: <CAL_JsqJuRrhEtt5uxaQ=7WvDKiF_2v025GiYUvrrFE5jxBr-Xg@mail.gmail.com>
Subject: Re: [PATCH] docs: dt: fix broken links due to txt->yaml renames
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_210812_759554_D5688D5A 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Olivier Moysan <olivier.moysan@st.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Jyri Sarha <jsarha@ti.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgNCwgMjAyMCBhdCAxMjo1NiBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhpIFNhbSwKPgo+IE9uIE1vbiwg
TWF5IDA0LCAyMDIwIGF0IDA3OjQ1OjIyUE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+
IE9uIE1vbiwgTWF5IDA0LCAyMDIwIGF0IDExOjMwOjIwQU0gKzAyMDAsIE1hdXJvIENhcnZhbGhv
IENoZWhhYiB3cm90ZToKPiA+ID4gVGhlcmUgYXJlIHNvbWUgbmV3IGJyb2tlbiBkb2MgbGlua3Mg
ZHVlIHRvIHlhbWwgcmVuYW1lcwo+ID4gPiBhdCBEVC4gRGV2ZWxvcGVycyBzaG91bGQgcmVhbGx5
IHJ1bjoKPiA+ID4KPiA+ID4gICAgIC4vc2NyaXB0cy9kb2N1bWVudGF0aW9uLWZpbGUtcmVmLWNo
ZWNrCj4gPiA+Cj4gPiA+IGluIG9yZGVyIHRvIHNvbHZlIHRob3NlIGlzc3VlcyB3aGlsZSBzdWJt
aXR0aW5nIHBhdGNoZXMuCj4gPiBXb3VsZCBsb3ZlIGlmIHNvbWUgYm90IGNvdWxkIGRvIHRoaXMg
Zm9yIG1lIG9uIGFueSBwYXRjaGVzIHRoYXQgY3JlYXRlcwo+ID4gLnlhbWwgZmlsZXMgb3Igc28u
Cj4gPiBJIGtub3cgSSB3aWxsIGZvcmdldCB0aGlzIGFuZCBpdCBjYW4gYmUgYXV0b21hdGVkLgo+
ID4gSWYgSSBnZXQgYSBib3QgbWFpbCB0aGF0IG15IHBhdGNoIHdvdWxkIGJyb2tlIGEgbGluayBJ
IHdvdWxkCj4gPiBoYXZlIGl0IGZpeGVkIGJlZm9yZSBpdCBoaXRzIGFueSB0cmVlLgoKSSBjYW4g
cHJvYmFibHkgYWRkIHRoaXMgdG8gd2hhdCBJJ20gYWxyZWFkeSBjaGVja2luZy4gTm90IGNvbXBs
ZXRlbHkKYXV0b21hdGVkIHRob3VnaCBhcyBpdCBkZXBlbmRzIG9uIG1lIHRvIHJldmlldyBiZWZv
cmUgc2VuZGluZy4KCj4gV2hhdCBhYm91dCBhZGRpbmcgYSBjaGVjayB0byBjaGVja19wYXRjaD8K
ClRoYXQgd291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIGdldCBzdWJtaXR0ZXJzIHRvIGRvIHRoaXMu
CgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
