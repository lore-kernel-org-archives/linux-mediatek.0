Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62092C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEWHl8yc0Wt0PP5upAIOmntfhFNY6C48S2iIK3sjxLU=; b=NDuhnips7pRgr/
	CqbgK7tib3GBIomM1WBfSvV0aHUa7pftFszO0rO28Aru7OtilA/lOFfz05JOhNloS4L64Y2QWlFnO
	W18aCr+b349XklgPvu6mnf3e7iwgnqc0qk34GpVnd4iQghWMuqV4pMK1/HCswAWP2TQuoPCef356F
	ENpi/ULkwrRJUOY3AaVUlYbOURI9WzVwaZAFaZvoATD1S441lJGG2x1OvvWxdiSrqARQscbgBB34o
	cKCmDkd4NhpexCFUsRRJIa7DtdgAQ38g23oG4aceEjAhAQ5lZGSa+aXnmpjq+dWZieMrWBKbHNJQv
	coNAHIMRbpflgL/xHeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1mcs-00GTml-Vb; Mon, 27 Dec 2021 09:49:07 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1mcp-00GTkr-OP
 for linux-mediatek@lists.infradead.org; Mon, 27 Dec 2021 09:49:05 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id f9so45814692ybq.10
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Dec 2021 01:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2/s/0zUXPBGLVHErZUBzoV050NvcmNk97HBxw5/MD3c=;
 b=bmmovsQBj/98WoE3AqYW1lOIBjsH1owbD61HidQJtFX7NWro+0wc+iM9BbjkNZsQet
 LTZA9Edo/pkSGOBTDcoteozF0XsJJxXEzY67eWgpEfaf9oIcJj2/f4tN0Q6nX5e7yBLI
 gyZiYJ3FYymEjMwVgXBp51fgixXfpT27ib55lgf4B1HnyLLerlxcbsIXOLLAQ9jFpnWy
 fp42nfD5JdpCbQ/PwlZdwOp/kT4JjISgBUXMQgTBP7+kXMK10GSzE0712FDEfr1vECLs
 RTKVBvrt1DOpEmXG9LmQSKB7PENODTZKWawTibXlONibD+6Blk88ljEBvt4Z5ZWRd1JG
 nfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2/s/0zUXPBGLVHErZUBzoV050NvcmNk97HBxw5/MD3c=;
 b=Vk33nP7ZmDQ0leEA3JcJQALT/Ttkrj21VChmZHWK/Sb4Egx+XyzbdKWdKZ8N7gkK1B
 ne0iLgiFsMi4LLH3eFsFSSiYbrG5idKTUsJ0HSNTJofv8V6qJOoKCL/4X2vlSVqypbuG
 OKplhvQM88mzyf1eQRITrln80iBx3hfWovsgOWHKv+o/35QAoyvqilbNylEOhEFUegqP
 XOn4D5Obe5cu5wiyNQ9n74npnt7NOOEvOTpwSEZ9BGLbdwNXQAQU/6YPBAscAF/4/fJB
 BxfFXBMWWCvXDtNuUkrwz3dyYUsvfkLTqaZxRArjoovrIA0E/VW1yCs1GgU8sE/mM3f3
 JW5g==
X-Gm-Message-State: AOAM532qfQKx1jCa2IsLIJCKTibewma6LyMkzWRjAvjvnwHC5kptchnQ
 qZQP4KCFxf/cIGtNXyUa8k1N/FY/+HDD7s1gJkg=
X-Google-Smtp-Source: ABdhPJzn0HJIvjTUU/CUSRqZWFzvaJKX3y8/hhjvirA0++lwA3VBHq/kRnfI/u1Ijlt0n/Bd/RbddGV5kj66gxlMSrI=
X-Received: by 2002:a25:3454:: with SMTP id b81mr736903yba.723.1640598542245; 
 Mon, 27 Dec 2021 01:49:02 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMx0kMruMNfAv-Os1VSrgfg2vyKv17uDVq-QqB1Szwu+1w@mail.gmail.com>
 <PS1PR0302MB25246AD196EE479F8CE6CB238E429@PS1PR0302MB2524.apcprd03.prod.outlook.com>
 <SG2PR03MB4567AFFAE972CE00FE4073F692429@SG2PR03MB4567.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB4567AFFAE972CE00FE4073F692429@SG2PR03MB4567.apcprd03.prod.outlook.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 27 Dec 2021 10:48:51 +0100
Message-ID: <CAKXUXMxzUf6OSaz6JD+XkLcko71Chc+upAaKK6--iEgXELrGWw@mail.gmail.com>
Subject: Re: Config REGULATOR_MTK_DVFSR depends on the non-existing config
 MTK_DVFSRC
To: =?UTF-8?B?RGF3ZWkgQ2hpZW4gKOmMouWkp+ihmyk=?= <Dawei.Chien@mediatek.com>
Cc: =?UTF-8?B?SGVucnlDIENoZW4gKOmZs+W7uuixqik=?= <HenryC.Chen@mediatek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_014903_843994_F3E51BBD 
X-CRM114-Status: UNSURE (   7.98  )
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

T24gTW9uLCBEZWMgMjcsIDIwMjEgYXQgMTA6MzggQU0gRGF3ZWkgQ2hpZW4gKOmMouWkp+ihmykK
PERhd2VpLkNoaWVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBEZWFyIEx1a2FzLAo+IFBsZWFz
ZSB1bmRlcnN0YW5kIHRoYXQgd2UgYWxyZWFkeSBhZGRlZCBhIGZ1cnRoZXIgY29uZmlnIE1US19E
VkZTUkMsIHBsZWFzZSByZWZlciB0bwo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC1tZWRpYXRlay9jb3Zlci8yMDIxMDgxMjA4NTg0Ni4yNjI4LTEtZGF3ZWkuY2hp
ZW5AbWVkaWF0ZWsuY29tLwo+ICwgc28gcGxlYXNlIGRvbid0IGRyb3AgdGhpcyBkcml2ZXIuIFdp
dGggYWJvdmUgZHJpdmVyLCB0aGUgY2xpZW50IGRyaXZlciBjb3VsZCBjb250cm9sbGVyIERWRlNS
QyByZWd1bGF0b3IgYnkgcmVxdWVzdCwgdGhhbmsgeW91Lgo+CgpPa2F5LCBzbyBJIHdpbGwgaG9w
ZSB0aGF0IHRoaXMgZHJpdmVyIGlzIGZpbmFsbHkgZ29pbmcgdG8gbGFuZCBpbgpsaW51eC1uZXh0
IHNvb24uCgpMdWthcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
