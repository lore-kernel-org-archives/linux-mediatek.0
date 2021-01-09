Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5E1C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 23:18:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EAFC23998
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 23:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EAFC23998
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XVFdOtWvHZzvcL3UN4+AmzFUPtJbR/SYC80QQ7dRoBw=; b=dot1UMGC9y7q7+tPGm2HJtGsA
	Sr/bLab2Qp0qHBOLzEq0gU26b5a1SGTM6UyUSF8juJRzYaHN8/r16xVNfxP85MW95zhGKXs9hn/u+
	GY3oymThg2zgHRWoZhZH+mCE9scrO3QrmSS/d84WxnhOZz1KlnipFZ/xaAx+1hXD/TbZeUES8iP/d
	ZtfKLd6HXssJLIknDP+brSNhDzQLAK1IlbpAI6pgZSulJrGX3b0O8yZicnjtrV0o9UXDw4IbTR+V5
	IeBMqqeWogILWOZBqdISOHSALVTBhhI7XX5wxBioiDlSUqlsbPl9zoAzaFosjo2cDddoIK81xWbej
	iJEPBXCrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyNUw-0001P8-Rp; Sat, 09 Jan 2021 23:18:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyNUk-0001IL-2w; Sat, 09 Jan 2021 23:18:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5957A23A01;
 Sat,  9 Jan 2021 23:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610234284;
 bh=ZFBoTC2mgipz/tgDN/qvYeH+VFW/sGoZi+34KvlR5+k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I0KT9ebP3JYEkZCpjp8Yn4cMRbh/Feck/qXNCJS+aTmq9tumgUGPUtVvSAqLFKqvD
 E2ODj/RkFLRTFUetrLComg+T4uVqjtxWfn4z9xXYalgujMJkCsAWkl+NvtnNvQVeVW
 +v9vBnNirkqWBynaUflKvMnVGPYT7LNA4xspiEH/xJmHgqvoYUGc0hcAh+qMT8+3j/
 o1H9f0Wc9Z5S8s3+cKA51+IvA+/vqX0fEpK7LJsavQjgz96MXieGlia/z0RdNtrVjy
 JgJ69hstuGTzFpWOP3RV+Vq2jQeb7CbUixMTF9VMwIgBzuORKsLSMunbrNOrHL/a1k
 BYA4pZm0yJGhw==
Received: by mail-ej1-f45.google.com with SMTP id ga15so19530955ejb.4;
 Sat, 09 Jan 2021 15:18:04 -0800 (PST)
X-Gm-Message-State: AOAM530AxY94WvFkTFn7zx+WcdHde8JmFkXad9uWZgY3VYou7WIIdzdf
 nrDiQkY8MbdivU9mXOZhwvGP0R7ntVeK7KhMJQ==
X-Google-Smtp-Source: ABdhPJyEdhJ/KO2Xrmr62wf3DDgLFM9nN3Ypr87VG4/eQLxzqqdHSDQinUf89iOl+Vr/SOlXv2uOuoYRofTdbtYL3xI=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr6745897ejy.63.1610234282909; 
 Sat, 09 Jan 2021 15:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20201027160631.608503-1-fparent@baylibre.com>
 <20201030191714.GA4171611@bogus>
In-Reply-To: <20201030191714.GA4171611@bogus>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 10 Jan 2021 07:17:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LwVDxZnSQAdK7mS8MAFZ1y_0EnSzj3UqeCxq-Tc5FuQ@mail.gmail.com>
Message-ID: <CAAOTY_8LwVDxZnSQAdK7mS8MAFZ1y_0EnSzj3UqeCxq-Tc5FuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mmsys: add mt1867 binding
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_181806_289908_8D7A7314 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQx
MOaciDMx5pelIOmAseWFrSDkuIrljYgzOjE35a+r6YGT77yaCj4KPiBPbiBUdWUsIDI3IE9jdCAy
MDIwIDE3OjA2OjI5ICswMTAwLCBGYWJpZW4gUGFyZW50IHdyb3RlOgo+ID4gQWRkIGJpbmRpbmcg
ZG9jdW1lbnRhdGlvbiBmb3IgTVQ4MTY3IFNvQy4KCkV2ZW4gdGhvdWdoIHRoZSB0aXRsZSBuZWVk
IHRvIGNoYW5nZSB0byAnbXQ4MTY3JywgdGhpcyBwYXRjaCBsb29rcwpnb29kIHRvIG1lLiBIb3cg
ZG8geW91IHRoaW5rIGFib3V0IHRoaXMgcGF0Y2g/IE9uZSBkcm0gcGF0Y2ggWzFdCmRlcGVuZCBv
biB0aGlzIHBhdGNoLCBpZiB5b3UgbGlrZSB0aGlzIHBhdGNoLCBjb3VsZCB5b3UgYXBwbGllZCB0
aGlzCnBhdGNoIGZpcnN0PwoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIwMTAyMzEzMzEzMC4xOTQxNDAtNi1mcGFyZW50QGJh
eWxpYnJlLmNvbS8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnR4dCAgICAgICAg
ICB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPgo+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
