Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5BFC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 08:28:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1E52075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 08:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KvtGlmSs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="wmyW81Ja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A1E52075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+UPiD51RW9XCf0HMIIEDOvYyLMZFm2/G3m6nmy0/po=; b=KvtGlmSsVMgRdm
	cCZdRyZZVDi/scc7Wu34Z4ULNwZg8IrQveHH8UgsoqQAjUQYtUsuMklgtmIOFCUOLdUz1yMZK+rSA
	aIE5M7neDhzTVIgarPNU8bEovTijYGWhx6ibFdEc8iO6rQymY3tkUPZwjM3pnVlfCyrGM5HsK8m6H
	JUVUc6Op8nsnpMH2qBL4Rl8oQtPUMV7LFMxOx/A1uoZqED+gYETRid5ZJpwZcjkD/dwwdSuShZvlY
	4GZd0S7ykFeFPvdr7nGh6MQgiQ+E8xLNUtXDn9Uqg+fHM0dIyaRZSQISdQtvEVhHAj1/vAYiGdVpP
	PB7QpZAxyiZZbOW/ot/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeaN1-0002Be-Vb; Fri, 29 May 2020 08:28:03 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeaMy-00029S-CR
 for linux-mediatek@lists.infradead.org; Fri, 29 May 2020 08:28:01 +0000
Received: by mail-io1-xd44.google.com with SMTP id q8so1436108iow.7
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3d129KIQl0F/HD1hAf9TNqbvJlvdS5cc8KsVfjCHT5Q=;
 b=wmyW81JabzxHJmyCKMgZjhesXeaxlHAgtiSlQtfNNLqtFcCrytSXj05vrtsugNI+4e
 cfEaRb4P/p456XvH6fTzAvynFbm1j8iN/KG5+cIDq8dpjbfm1pMTjOf60KV8RWik3/de
 1eaGl0ZLxmBp0eYX6Oh3hGpLro16xeOKrrUwZLm/j4wIIVouEbL6btDd3cWH6rTNnWWM
 yItf/W3AGeYP32m8aYT1kn81XaPibh0YxX9TkvEfkjFoKK/hOH21th+HLU9QeZvS7qMP
 wxJZLuvTclR/UhJOiystbHeZen80bdCUIz+slilZhz2xIv7VNwGFp8WcxCZcr7rDbe87
 TR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3d129KIQl0F/HD1hAf9TNqbvJlvdS5cc8KsVfjCHT5Q=;
 b=uCS6DTvcTPtFVIv7o0Zy0dVXW8kdKtjttU10XJD/8Q0SW1MmG6rKvllCAA3tXjtTcy
 DY76YDtTIlu2ZUrdprXMz8qQ9G0iQyZ9nZ3FfzFRpoSdXaNZhFoB4eBZsWFYtNBWZAfw
 soy3c/5z2UDpo+tSQDIHxQMi1l8sASxgW9tk6ITks1Z8ba70ZemcFMAK5jIfMWa0MqWe
 /c2xE2S1/+OZyEBqFYv+HrkprfnsnLRkZtSBy5INXnQpYKbIkVE4fhLmg7NmLFE/Jh+P
 tIZXYEX3iaKhw1tuM1NHBBeA9/541tTDzefbqSpKdARuFk29S62j+LgUMruaOyu4bytR
 BbNg==
X-Gm-Message-State: AOAM531NI6StXCZr7eTOx2uFMtPfbXvoLLhLSwubUsJQrrpLmxlPTNp9
 UFiMlpIqHZlIIHdbYFeH75Zhubt4kIlmlsIr7hkEhw==
X-Google-Smtp-Source: ABdhPJwA8vRDCN9N0HPnWhWtdnh8yznfwlfh5vLhi00vaN8ZbQ3tavDm+I4SrAQgg7Tnm8hKYE5T5eYY2+qznSroVnY=
X-Received: by 2002:a5d:9e55:: with SMTP id i21mr5656308ioi.130.1590740878066; 
 Fri, 29 May 2020 01:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200529082648.19677-1-brgl@bgdev.pl>
In-Reply-To: <20200529082648.19677-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 May 2020 10:27:47 +0200
Message-ID: <CAMRc=Md+KMpa-6f2rpd=fbR-xmCzaR3QypAk3FvMHpeyNzUX=g@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: remove unused variable
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_012800_418343_92A21C79 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: kbuild test robot <lkp@intel.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cHQuLCAyOSBtYWogMjAyMCBvIDEwOjI2IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYu
cGw+IG5hcGlzYcWCKGEpOgo+Cj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3
c2tpQGJheWxpYnJlLmNvbT4KPgo+IFRoZSBkZXNjIHBvaW50ZXIgaXMgc2V0IGJ1dCBub3QgdXNl
ZC4gUmVtb3ZlIGl0Lgo+Cj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPgo+IEZpeGVzOiA4YzdiZDVhNDU0ZmYgKCJuZXQ6IGV0aGVybmV0OiBtdGstc3Rhci1l
bWFjOiBuZXcgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
Z29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9t
ZWRpYXRlay9tdGtfc3Rhcl9lbWFjLmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9t
dGtfc3Rhcl9lbWFjLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfc3Rhcl9l
bWFjLmMKPiBpbmRleCA4NTk2Y2EwZTYwZWIuLjdkZjM1ODcyYzEwNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfc3Rhcl9lbWFjLmMKPiArKysgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfc3Rhcl9lbWFjLmMKPiBAQCAtNzQ2LDE1ICs3
NDYsMTIgQEAgbXRrX3N0YXJfcmluZ19mcmVlX3NrYnMoc3RydWN0IG10a19zdGFyX3ByaXYgKnBy
aXYsIHN0cnVjdCBtdGtfc3Rhcl9yaW5nICpyaW5nLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3N0YXJfcmluZ19kZXNjX2RhdGEgKikpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBtdGtfc3Rhcl9yaW5nX2Rlc2NfZGF0YSBkZXNjX2RhdGE7Cj4g
LSAgICAgICBzdHJ1Y3QgbXRrX3N0YXJfcmluZ19kZXNjICpkZXNjOwo+ICAgICAgICAgaW50IGk7
Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBNVEtfU1RBUl9SSU5HX05VTV9ERVNDUzsgaSsr
KSB7Cj4gICAgICAgICAgICAgICAgIGlmICghcmluZy0+ZG1hX2FkZHJzW2ldKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Cj4gLSAgICAgICAgICAgICAgIGRlc2MgPSAmcmlu
Zy0+ZGVzY3NbaV07Cj4gLQo+ICAgICAgICAgICAgICAgICBkZXNjX2RhdGEuZG1hX2FkZHIgPSBy
aW5nLT5kbWFfYWRkcnNbaV07Cj4gICAgICAgICAgICAgICAgIGRlc2NfZGF0YS5za2IgPSByaW5n
LT5za2JzW2ldOwo+Cj4gLS0KPiAyLjI2LjEKPgoKQ3IqcCBJIGZvcmdvdCB0byB0YWcgaXQgZm9y
IG5ldC1uZXh0LiBEYXZpZCBsZXQgbWUga25vdyBpZiB5b3Ugd2FudCBtZQp0byByZXNlbmQgaXQu
CgpCYXJ0b3N6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
