Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9573C47082
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 01:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C296120F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 01:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73C296120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57QOJrvbWYe8CPde4xBkulKYC5cLcBk94qPgXNe5PfA=; b=JbOAAh49QorKuJ
	z+4OEod41vRPeYnQ281jJ4+jVCHgB3f69F0CeQShK85FMyPrdKBn0hEB1Oi1OFtn/ez5+SXUX1XNO
	Iv5VjsRe6RDi5qi3P/kOY705J/pe4QgC/XvSrp7NE9Hh8GnfGxz4bK8OQDOZzhHVKpI3oOEXjAiqF
	ydw68ILQlkLxULmdGnuEdVAXtKEC3BeD1hBFaGduGM99CLgINOVi9RRuniQqQaOUIeuexT4G39xOb
	4Qx0jN/SMYo7MLSkVVut2jXnnyVydBFdI3A5KPPaCkRhd8cVPZ3hlJXUozzZXall8sqiUUmTf03Xz
	YTt95FS+2ZgzqAvPbE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loyG9-00B6AT-3g; Fri, 04 Jun 2021 01:04:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loyFv-00B68N-G3; Fri, 04 Jun 2021 01:04:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 819B76120F;
 Fri,  4 Jun 2021 01:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622768650;
 bh=l5yYOLt53DtZ7JqLyg7mT/GGJahw6tz3rKT8zzg2gQ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=anSV0Ox8mgv2AQd6aPZovUXvAyDJWN7zwYddRLCE5/2nulr5oqBkdD5ZsfvlXYkmi
 VHI2U2kdwKD77tGNxO7hjvIQErCdQ6WyxZWp8tG5d6Or5nhgGOIsMAWCvx8aj/r1qF
 97a+Ur72XCvsPmyN/7zrpEvIKZA71ecXAcMlRrza/uiUOIUWQQux11fjLJdXkRKYMg
 8emu3l/sIXwayKy5NAZFwr+n8m0+9MKj53XTkLH3ZIGztK0dbDvNNWIXq5o3EN1Rp+
 YO82Mny3wu9Jvz5MSMiAIs4LzN60ADFRna9Rtv88zZtEsMRgOQ7YYCKAHCvWFeKKk5
 F2OEs5qf58P6g==
Received: by mail-ej1-f41.google.com with SMTP id b9so11877046ejc.13;
 Thu, 03 Jun 2021 18:04:10 -0700 (PDT)
X-Gm-Message-State: AOAM533CRSAbnjVMcXOryzTl3bqTbtJmARUIJwP/4HCPpX40N8eT95Ds
 W2nKwXNFHwGulBc52iijxvUqnty5dBc8/W5qjg==
X-Google-Smtp-Source: ABdhPJxer8gjIEGn3TOCrAdEk57FxI38GSPQm8Wp2vKQJjgd6J8CtpXQyqAafZh7oMz3+6B59LNg4FnKxVIxXoDbH1w=
X-Received: by 2002:a17:906:3d9:: with SMTP id
 c25mr1792745eja.63.1622768649092; 
 Thu, 03 Jun 2021 18:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210526085219.7582-1-rex-bc.chen@mediatek.com>
In-Reply-To: <20210526085219.7582-1-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 4 Jun 2021 09:03:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-huV+QqUsLF5PwXA_7OMfJn3X9=9kUM-aY-_thn54kSg@mail.gmail.com>
Message-ID: <CAAOTY_-huV+QqUsLF5PwXA_7OMfJn3X9=9kUM-aY-_thn54kSg@mail.gmail.com>
Subject: Re: [v5,PATCH 0/3] mt8183 dpi supports dual edge
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_180411_576338_C7483F25 
X-CRM114-Status: GOOD (  11.74  )
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

SGksIFJleDoKCkZvciB0aGlzIHNlcmllcywgYXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBb
MV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KClJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5j
b20+IOaWvCAyMDIx5bm0NeaciDI25pelIOmAseS4iSDkuIvljYg0OjUy5a+r6YGT77yaCj4KPiB2
NToKPiBSZW1vdmUgZGRyX2VkZ2Vfc2VsIGFuZCB1c2Ugb3V0cHV0X2ZtdHMgdG8gZGV0ZXJtaW5l
Cj4gd2hpY2ggZWRnZSB0byBiZSBzZXQuCj4KPiB2NDoKPiBVc2Ugb3V0cHV0X2ZtdHMgdG8gZGV0
ZXJtaW5lIHdoZXRoZXIgaXQgaXMgZHVhbCBlZGdlLgo+IFJlYmFzZSB0byB2NS4xMy1yYzEKPgo+
IHYzOgo+IE1vZGlmeSBjbG9jayByYXRlIGZvciBkdWFsIGVkZ2Ugc2V0dGluZy4KPiBBZGQgbW9y
ZSBicmlkZ2UgZnVuY3Rpb24uCj4KPiB2MjoKPiBNb2RpZnkgdW51c2VkIGNvZGUKPgo+IHYxOgo+
IERQSSBjYW4gc2FtcGxlIG9uIGZhbGxpbmcsIHJpc2luZyBvciBib3RoIGVkZ2UuCj4gV2hlbiBE
UEkgc2FtcGxlIHRoZSBkYXRhIGJvdGggcmlzaW5nIGFuZCBmYWxsaW5nIGVkZ2UuCj4gSXQgY2Fu
IHJlZHVjZSBoYWxmIGRhdGEgaW8gcGlucy4KPgo+IFJleC1CQyBDaGVuICgzKToKPiAgIFt2NV0g
ZHJtL21lZGlhdGVrOiBkcGkgZHVhbCBlZGdlIHNhbXBsZSBtb2RlIHN1cHBvcnQKPiAgIFt2NV0g
ZHJtL21lZGlhdGVrOiBjb25maWcgZHJpdmVyIGRhdGEgdG8gc3VwcG9ydCBkdWFsIGVkZ2Ugc2Ft
cGxlCj4gICBbdjVdIGRybS9tZWRpYXRlazogZHBpOiBhZGQgYnVzIGZvcm1hdCBuZWdvdGlhdGlv
bgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAxMzAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjE4LjAKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
