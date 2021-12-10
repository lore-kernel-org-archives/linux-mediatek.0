Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D76EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DIY3/S0xLCi7uqDwWldu3zeA4GwpoDNsX8Ah1fwy40=; b=aIU6W+acKKeJB+
	3BYGzAIrx7rwJUvMHcLSZrfmgmWHsIXCP+i0p6ciKyMST4QCincvAYq7xLZ6qOuZjsl43wUzEaUi4
	dYb1MsKo6ghNfx4Aq2+9B6rusilNWgx4nNx6N0HZNxgCRitBwArcbNMpn8b5nPuN8fZCs0/hyV7hY
	sLPkcfeIbMEYxDfp44bOBbramexwgrZ76YurWNYhC4sMkmnfip+8Gi0XZ7lBuSLPymb587ssYVoaH
	UeSTIGFdbwCk+s846Gxqfj/irU1JlbFP9kzdS2M6s3fxMjvsdkV6TrWQbi3I5wJfPxniPeqi+dwcR
	5rgsMFtmFzsD8I/aIljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvii1-002aPY-6K; Fri, 10 Dec 2021 16:25:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvihn-002aMI-DD; Fri, 10 Dec 2021 16:25:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22002B82828;
 Fri, 10 Dec 2021 16:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5076C00446;
 Fri, 10 Dec 2021 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639153504;
 bh=m3sNyHFjcFUZW2r34fX9cAwltyg7xeL6h5eHyuCWzc4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mWwUyTKW264z65sOqSYC/iiPuFC4pgTsRw2Nv2Vr+QPmA5ZZXMoefaHV0+E67YHDI
 ciWrze29aTI0xBazMBfMlW5fZfUXXbv2UtWeNkYENARzWIaSM/0pN50RFVxL07Pt1T
 SdxzRBbDiMFXTUd+r26ZH9o4THHV29LKtQPKli6TQdWVy3PosrMQO11yEx2+Ar7zaj
 EpKpVEWWGGuy61IjcD0x9AQeJxNho4+UkPvcycL1btrQKK9R7ortvlDyr5123Kt5Ms
 +hxZokg5fj3Eo/tQKLgWdmMGMvfL5EVmU/dflmdVCeloPRQVpsJnXXkIiUnhsb+v+g
 +qGRQ65bWWfkA==
Received: by mail-ed1-f53.google.com with SMTP id y12so30854391eda.12;
 Fri, 10 Dec 2021 08:25:04 -0800 (PST)
X-Gm-Message-State: AOAM533Y+MJfRWho6+MeSLqoMQdBnIg+Pe+sXshRkLRwH/1fy4GXKuEL
 KgyfmiOJqPiPjG8kA2j5/NLDPh+6E3ToX+44kw==
X-Google-Smtp-Source: ABdhPJxjCxliga8nYVwXlovtAcHvS7Ku6/w30eyy8A3Q8G61IMUB7ZV9QEDabmdc5s/EneEMAablKoa97VrdPvtzkX8=
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr40538337edd.250.1639153498690; 
 Fri, 10 Dec 2021 08:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-2-jitao.shi@mediatek.com>
 <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
 <ad925a6c1438b78f3c79b37fd0a545c9eb153a59.camel@mediatek.com>
In-Reply-To: <ad925a6c1438b78f3c79b37fd0a545c9eb153a59.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 11 Dec 2021 00:24:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY__hcWKT=DTkKyb6J1N2bnpuP1rpqUHivhg-syaetCgNBQ@mail.gmail.com>
Message-ID: <CAAOTY__hcWKT=DTkKyb6J1N2bnpuP1rpqUHivhg-syaetCgNBQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] drm/dsi: transer dsi hs packet aligned
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_082507_759123_13248254 
X-CRM114-Status: GOOD (  24.76  )
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

SGksIERhdmUgJiBEYW5pZWw6CgpUaGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUsIGhvdyBkbyB5
b3UgdGhpbmsgYWJvdXQgaXQ/CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKSml0YW8gU2hpIDxqaXRh
by5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDEx5pyINOaXpSDpgLHlm5sg5LiK5Y2IMTE6
Mzblr6vpgZPvvJoKPgo+IEhpIHNpcnMKPgo+IFBscyBoZWxwIHRvIHJldmlldyB0aGlzIGNoYW5n
ZS4KPgo+IEJlc3QgUmVnYXJkcwo+IEppdGFvLgo+Cj4gT24gVHVlLCAyMDIxLTEwLTA1IGF0IDA3
OjUzICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIEppdGFvOgo+ID4KPiA+IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQ55pyIMTbml6Ug6YCx
5ZubIOS4iuWNiDY6MzHlr6vpgZPvvJoKPiA+ID4KPiA+ID4gU29tZSBEU0kgZGV2aWNlcyByZXFp
cmUgdGhlIGhzIHBhY2tldCBzdGFydGluZyBhbmQgZW5kaW5nCj4gPiA+IGF0IHNhbWUgdGltZSBv
biBhbGwgZHNpIGxhbmVzLiBTbyB1c2UgYSBmbGFnIHRvIHRob3NlIGRldmljZXMuCj4gPiA+Cj4g
Pgo+ID4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
Pgo+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsu
Y29tPgo+ID4gPiAtLS0KPiA+ID4gIGluY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oIHwgMiArKwo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKPiA+ID4gYi9pbmNsdWRlL2RybS9kcm1f
bWlwaV9kc2kuaAo+ID4gPiBpbmRleCBhZjdiYTgwNzFlYjAuLjhlODU2Mzc5MjY4MiAxMDA2NDQK
PiA+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKPiA+ID4gKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX21pcGlfZHNpLmgKPiA+ID4gQEAgLTE3Nyw2ICsxNzcsNyBAQCBzdHJ1Y3QgbWlw
aV9kc2lfZGV2aWNlX2luZm8gewo+ID4gPiAgICogQGxwX3JhdGU6IG1heGltdW0gbGFuZSBmcmVx
dWVuY3kgZm9yIGxvdyBwb3dlciBtb2RlIGluIGhlcnR6LAo+ID4gPiB0aGlzIHNob3VsZAo+ID4g
PiAgICogYmUgc2V0IHRvIHRoZSByZWFsIGxpbWl0cyBvZiB0aGUgaGFyZHdhcmUsIHplcm8gaXMg
b25seQo+ID4gPiBhY2NlcHRlZCBmb3IKPiA+ID4gICAqIGxlZ2FjeSBkcml2ZXJzCj4gPiA+ICsg
KiBAaHNfcGFja2V0X2VuZF9hbGlnbmVkOiB0cmFuc2ZlciBkc2kgaHMgcGFja2V0IGVuZGluZyBh
bGlnbmVkCj4gPiA+ICAgKi8KPiA+ID4gIHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugewo+ID4gPiAg
ICAgICAgIHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0Owo+ID4gPiBAQCAtMTg5LDYgKzE5MCw3
IEBAIHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugewo+ID4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
bW9kZV9mbGFnczsKPiA+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIGhzX3JhdGU7Cj4gPiA+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBscF9yYXRlOwo+ID4gPiArICAgICAgIGJvb2wgaHNfcGFja2V0
X2VuZF9hbGlnbmVkOwo+ID4gPiAgfTsKPiA+ID4KPiA+ID4gICNkZWZpbmUgTUlQSV9EU0lfTU9E
VUxFX1BSRUZJWCAibWlwaS1kc2k6Igo+ID4gPiAtLQo+ID4gPiAyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
