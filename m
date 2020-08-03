Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EB3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF92220781
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gUi2iSF/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnHBA9xd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF92220781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bNohIKYG88vPndSMvYfFHKNadhee2k7yU6AZSnK/00E=; b=gUi2iSF/k5193UKAQj5ZclmxP
	Uezro18cWlHcqjv+KlkdF096RJxEt23j8dVva6maPuS1J9CDm2eVHcM5Pz4u4RaI++LtsXK/lgq9r
	erkse3xeHes/+iChRaHmbxQmHI4+EOSsG7eEO6bbn82iEvnrRKpJlaQnBqsQWsQCjHurWa65M0uEI
	5QlESq4WsvtdUfRr4uuP21XqHTmbeLFrPkJ6hF0N9WWcfjMnVIGWZoCCmVDNYL5aFODZvNWU8BBAm
	4vWu0SzgVc9xSiPIT8yrrfhGQgBP7cH2F1syzpvz95S8Pc0rBcQJbTY/cuFEa+66N9gmzkeZ8YfXl
	UzvMlUh7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2cXj-0002MI-QT; Mon, 03 Aug 2020 15:38:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2cXf-0002Kx-D4; Mon, 03 Aug 2020 15:38:24 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0D3B20825;
 Mon,  3 Aug 2020 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596469101;
 bh=VGGeypM3Y8d4rW8Akt3xtmhJwtC3U7dVg9Cx0Njqevg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bnHBA9xdak5xVzRtj3mef6+e9O94ASl36qSTita6naBdF9kMcVi3RNQ++4uCLdl80
 Yz8t2JPWlX5BwtJC6vMB0R6oIZWToN4hJRTlYFVAUJq0Y4RN63f5DAXRCGacOmqbVs
 301r9XETkpwTTP0spPAt8ZA3NpkXgnnKT97BFu/s=
Received: by mail-ej1-f49.google.com with SMTP id d6so25254933ejr.5;
 Mon, 03 Aug 2020 08:38:21 -0700 (PDT)
X-Gm-Message-State: AOAM53390MHDPplt3wptwKxRMWicPiywyDhZAea5VGGgt9xCaDlhLwO0
 YxVVyKLFvembatFc8rWoWJwYjDwLnkNi5uUUfg==
X-Google-Smtp-Source: ABdhPJx0djev732p1WU9SALM5bkMkTGBFI5wI7IhthD/RGPTy0cqLYgXOMTgB1GPtG3Sq1pVIonzpFw17wCZyky8cuc=
X-Received: by 2002:a17:906:f14f:: with SMTP id
 gw15mr16562338ejb.245.1596469100238; 
 Mon, 03 Aug 2020 08:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-RMT-1+-5aPxqhgLbk74j0MH8U78mibBZppt_OPPQrJA@mail.gmail.com>
 <1596427546.22971.23.camel@mtkswgap22>
In-Reply-To: <1596427546.22971.23.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Aug 2020 23:38:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Jc2eGCA6JqYnLCZCTYz40GBmyhiZqzMxTfj9F9xTdoQ@mail.gmail.com>
Message-ID: <CAAOTY__Jc2eGCA6JqYnLCZCTYz40GBmyhiZqzMxTfj9F9xTdoQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_113823_502851_9401B560 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, devicetree@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ45pyIM+aXpSDpgLHk
uIAg5LiL5Y2IMTI6MDXlr6vpgZPvvJoKPgo+IEhpIENodW4tS3VhbmcsCj4KPiBPbiBTdW4sIDIw
MjAtMDgtMDIgYXQgMDc6NTAgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBIaSwgTmVh
bDoKPiA+Cj4gPiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyOeaXpSDpgLHkuIkg5LiL5Y2INDoyOeWvq+mBk++8mgo+ID4gPgo+ID4gPiBNZWRpYVRlayBi
dXMgZmFicmljIHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0IGFuZCBkYXRhCj4g
PiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1
bmV4cGVjdGVkCj4gPiA+IG1hc3RlcnMuCj4gPiA+IFRoZSBzZWN1cml0eSB2aW9sYXRpb24gaXMg
bG9nZ2VkIGFuZCBzZW50IHRvIHRoZSBwcm9jZXNzb3IgZm9yCj4gPiA+IGZ1cnRoZXIgYW5hbHlz
aXMgb3IgY291bnRlcm1lYXN1cmVzLgo+ID4gPgo+ID4gPiBBbnkgb2NjdXJyZW5jZSBvZiBzZWN1
cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50ZXJydXB0LCBhbmQKPiA+ID4gaXQgd2ls
bCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBUaGUgdmlvbGF0aW9uCj4gPiA+IGlu
Zm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0aGUgbXVyZGVyZXIuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+Cj4g
PiA+IC0tLQo+ID4KPiA+IFtzbmlwXQo+ID4KPiA+ID4gKwo+ID4gPiArc3RydWN0IG10a19kZXZh
cGNfY29udGV4dCB7Cj4gPiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4gPiArICAg
ICAgIHUzMiB2aW9faWR4X251bTsKPiA+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKmRldmFwY19w
ZF9iYXNlOwo+ID4KPiA+IFRoaXMgaXMgZGV2YXBjIGNvbnRleHQsIHNvIHByZWZpeCAnZGV2YXBj
JyBpcyByZWR1bmRhbnQuCj4gPiBBbmQsIHdoYXQgZG9lcyAncGQnIG1lYW4/Cj4KPiAncGQnIG1l
YW5zIHBvd2VyIGRvd24uIE9mIGNvdXJzZSB3ZSB3b3VsZCBhbHNvIHJlbW92ZSBpdCBhcyB3ZWxs
Lgo+IEkgc3VnZ2VzdCB0byBjaGFuZ2UgaXQgYXMgJ2luZnJhX2Jhc2UnLgoKVGhpcyBpcyBPSyBm
b3IgbWUuCgo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPiArICAg
ICAgIHN0cnVjdCBtdGtfZGV2YXBjX3Zpb19pbmZvICp2aW9faW5mbzsKPiA+ID4gKyAgICAgICBj
b25zdCBzdHJ1Y3QgbXRrX2RldmFwY19wZF9vZmZzZXQgKm9mZnNldDsKPiA+ID4gKyAgICAgICBj
b25zdCBzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncyAqdmlvX2RiZ3M7Cj4gPiA+ICt9Owo+ID4g
PiArCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
