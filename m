Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E227BC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 16:18:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E89E64E25
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 16:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E89E64E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YX4ba9BTK3fVB201vk/or2Uq955bQSHfmHaT5DO+I6M=; b=DY1zNR/e6F0iQ1boT5yulIsOA
	4ugY4CY4QxsIs4e0m8ClUDovo8iV/07bKuEOem+J7sdXqVAYwjRSTQGpkU4484cwN2jGS4GCWVFUm
	qPuABThHkJglo2y6YUI0Bm6VDPaUauSu9lIVbFhoM4/75a8XsRs9lPGCG22ivzsfc6HK5GW+CXvFO
	jgVQ2pO7sEsadOFbstMSyAurqb+7oh8REhiz8hoHZGUA3+XZqZdlxQwPEUgpPEJ154b9xfEPtL2T2
	9B1jjFt29du73IAMcWCNlSh7kxc6x6L/a7LcZZNUNiY4eYrqZKNm02Y3n5JXWR1Nx8xjl6rzkteTY
	4eHjBb/+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6FQL-0006uL-1n; Sun, 31 Jan 2021 16:18:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6FQE-0006th-EC; Sun, 31 Jan 2021 16:18:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5C8364E13;
 Sun, 31 Jan 2021 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612109875;
 bh=SLExLloaQHg8aAztENFeD4DPqTJOOVkN1xkooO51MKY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S1N4yKVAuzT67ghfz9iaEkisy6wIcplQKLSJykvCF1vxUaTR60vtwUN0qlGOeaaxv
 qYi6Wf35OebyDoEq+j+9W3pFJDUY+BSiEDeUW5W/bCca0Cb/MKGd2094wD5IdwXSY4
 zvErZPnu72+6WdDT7oAG5o0RlDiWWfbamM6F/fQ77vbHAJIT5UWCSQfOZGwSbASjGI
 fNcW4uZ/3uj8Di0g1rUWEwOvsaR70xCKeNRuwHcHNTOgzEx/Inrii9riPWetCFPsOu
 Oko01N8MKOJB5TxvoYgT+GuGfZx61vANMOK0zHWPXbcr8YgD2hJQEaJW3H6iq863ng
 Zt2KMc9ZyXTEg==
Received: by mail-ed1-f45.google.com with SMTP id q2so1361234edi.4;
 Sun, 31 Jan 2021 08:17:54 -0800 (PST)
X-Gm-Message-State: AOAM532lyzcRXgWLQ1bsYJVQb7xTi60KG5tLtjLTWf4VdG3ovnE4hsCW
 eEz+knWmhzko4Og/G+X555tbW7VR5fph3lZsfg==
X-Google-Smtp-Source: ABdhPJz6JbI/+F9sbSqhGvMI5wQZjvWeoB9uH3xyHKaHkyL/f4fcZP0zOLo9GmhA5DfUFjPs2UhHGxbjcjjUpOEmRps=
X-Received: by 2002:aa7:d88e:: with SMTP id u14mr14630109edq.72.1612109873568; 
 Sun, 31 Jan 2021 08:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20210131101726.804-1-matthias.bgg@kernel.org>
In-Reply-To: <20210131101726.804-1-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 1 Feb 2021 00:17:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_87TfpnScL+t624+FbdixosNpfoEkuMi8Y+h_RXttA7Tg@mail.gmail.com>
Message-ID: <CAAOTY_87TfpnScL+t624+FbdixosNpfoEkuMi8Y+h_RXttA7Tg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: Fix GCE include path
To: Matthias Brugger <matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_111758_555877_85D16B2C 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <mbrugger@suse.com>, DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDHmnIgz
MeaXpSDpgLHml6Ug5LiL5Y2INjoxN+Wvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWJydWdnZXJAc3VzZS5jb20+Cj4KPiBUaGUgaGVhZGVyIGZpbGUgb2YgR0NFIHNob3VsZCBi
ZSBmb3IgTVQ4MTgzIFNvQyBpbnN0ZWFkIG9mIE1UODE3My4KPgoKUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPiBGaXhlczogOTFmOWM5NjNjZTc5
ICgiYXJtNjQ6IGR0czogbXQ4MTgzOiBBZGQgZGlzcGxheSBub2RlcyBmb3IgTVQ4MTgzIikKPiBS
ZXBvcnRlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPgo+IC0tLQo+Cj4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE4My5kdHNpCj4gaW5kZXggNWI3ODJhNDc2OWU3Li44MGU0NjZjZTk5ZjEgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQo+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKPiBAQCAtNiw3ICs2
LDcgQEAKPiAgICovCj4KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE4My1jbGsu
aD4KPiAtI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2djZS9tdDgxNzMtZ2NlLmg+Cj4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9nY2UvbXQ4MTgzLWdjZS5oPgo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZW1v
cnkvbXQ4MTgzLWxhcmItcG9ydC5oPgo+IC0tCj4gMi4zMC4wCj4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
