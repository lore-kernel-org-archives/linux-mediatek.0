Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4235C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:23:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F7C21D1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F7C21D1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OoarOHOWdjezEmPFPrhKhiE4E0kFLpNwGYB6r96mfPs=; b=wY7H8uqQLFn7R2jFJYFntN2L1
	s3OLMm+PP9G9xj/J8qSWhvigK+mM9PVqB5CoaEwtkO5SmpWJNMuv5+FZOn7+u6h4U4tVc72lZrFNE
	JqqJ9pn2umO3aAmXYTg/3unz1CoFuZNZa0O4CNQrlPMpFgFZSmFGzHINaQFfp89GIHeqvR/CCetjK
	A5zb/8byHuEEM4s2EYEhqjT8ix+BIkPfGYZaMJZmHVqfu4aGizMv3Kbp+Eh2W3r8ns9RP3/eSbZUc
	tiI6CNh92MrlQUPGapJ+BibveICSktqUaYNkYKzGeUE198Vbqyc7MVgLmJga01u0Bn7miADq7TIFi
	1ZdrxQxMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuGqh-0006AL-Nw; Tue, 29 Dec 2020 15:23:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuGqc-000680-10; Tue, 29 Dec 2020 15:23:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0266F21D1B;
 Tue, 29 Dec 2020 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609255421;
 bh=X6TWp8dtmGsNefHM5i1nqwfEHyC2PBReZvmW2bXfzjs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YiK96+qPYqPeQfZbYUCC5myl9I5msotfpsB1XpSD0MI3yAeOItyLc1a5So/p06XLw
 kZ1YsdWfBEOra1Q9hlC9D5BgTeYrox5JqgXx9iw6iF7uULCPEFQE5TPC+6FAFKK0jC
 lDxtiPcDu5rkv2zFo1TRIt1nQ4PhU9Pkg25Oj4MW6ZSN1yJe/yvxlyTuhgSxFqpHwV
 /+PqbfhSUOCGFXKXQh4XOv6RYJ/u7+KPX8eGhIWWGdO9T5xXTZlL8Tvc87aRVV5kYq
 pM9w49egp49Lr0BxicP+ofmhSLy+rD0ocGxjFpZ6f92653v8iMSOKzAfVHFN2QGgzk
 Z4+X63LZTOIHA==
Received: by mail-wm1-f51.google.com with SMTP id 3so2504992wmg.4;
 Tue, 29 Dec 2020 07:23:40 -0800 (PST)
X-Gm-Message-State: AOAM532MGr4h9v7OWSZ95pE6SW6qqeSXKmCewKpRfhk7ETHdEOMlPEvl
 wP0VP4GXJTJmoUc0WaM1Gz1BlDFqQAD5qvsMxA==
X-Google-Smtp-Source: ABdhPJzqoSYiS8eONYJzh10hdAnaMFldS8v6+IVw1T9bzfQwd+ZdVmWEddSO/Y3HQ64cIJxjddzsuEn54GHCRRPwA2w=
X-Received: by 2002:a1c:790f:: with SMTP id l15mr3965420wme.188.1609255419668; 
 Tue, 29 Dec 2020 07:23:39 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-5-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 23:23:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
Message-ID: <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
Subject: Re: [PATCH v3, 4/8] soc: mediatek: mmsys: add component OVL_2L2
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_102342_171851_5C6584F7 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjjml6Ug6YCx5LiAIOS4i+WNiDQ6Mzflr6vpgZPvvJoKPgo+IFRo
aXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBPVkxfMkwyCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5n
IE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1tbXN5cy5oIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1t
bXN5cy5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBpbmRleCA0
YjZjNTE0Li40MjQ3NmMyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVr
L210ay1tbXN5cy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmgKPiBAQCAtMjksNiArMjksNyBAQCBlbnVtIG10a19kZHBfY29tcF9pZCB7Cj4gICAgICAgICBE
RFBfQ09NUE9ORU5UX09WTDAsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDAsCj4gICAg
ICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDEsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX09WTF8y
TDIsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTDEsCj4gICAgICAgICBERFBfQ09NUE9ORU5U
X1BXTTAsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX1BXTTEsCj4gLS0KPiAxLjguMS4xLmRpcnR5
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
