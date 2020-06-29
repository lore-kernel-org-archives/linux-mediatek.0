Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:20:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF4525491
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkWpHbak";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="r0Dg6Oi9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BF4525491
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j71/9IiV4wpQjj82BFm8oimW9r8gkyJuYZnhiSMS6PE=; b=EkWpHbakBM7JIOiaXJoeQEGsK
	5UJdFwPr96JFBF0DpjMUlKNtUBzBxmu0bhKOnddTcj7+5rRFIQ5wXW2s/raSsaYw23qe9KRUdUhBi
	e5xR1jSgrwCzxT+ErVbgfoDpyUbOeg0ImaPrJKrhZjqQhxmpn8KRzaaxYcvnSWw8xruzBaUi6u+cw
	wyD4ORT0/XmuyreBNkuBhGwu3lfyrhL3PKbWLEJPm7tXo7KN1njbeYlhWwmkaCRmfAuOG0JCNjtC8
	Pf2X/mSi/f2JkSeuT3jgyLSwiM/8pXIq8KOlVkK5xcIDHqGsk1SENyblAU1WDrUys/RkjjwsdVpgy
	7SF2Dh55A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpwW8-00083f-N6; Mon, 29 Jun 2020 16:20:24 +0000
Received: from mout.web.de ([212.227.15.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpwVm-0007rr-3t; Mon, 29 Jun 2020 16:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593447583;
 bh=pioBlt+k9nGWRixLbuXdhL4vSY3ibRE8urYPEMcMLig=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=r0Dg6Oi9ay+K/qqANEIjrQ7xY7wpDMXMoFOhzIydA+Z7PKzO2nmvfFveqF9i/ccwX
 cVLt8nVUPzWoEFmo/G8l/wx8HBM5+K5+HAx+oGf78R0Jfm70AHAsk2E63tB0t30CfK
 8HUTyLocbOz/UWIsMPvTQ5vbtYE5n834+qM6lN00=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.123.16]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LoHKz-1jAY8k26Ab-00gF4W; Mon, 29
 Jun 2020 18:19:43 +0200
Subject: Re: Searching for initialisation of variables by function calls
 before null pointer checks
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Coccinelle <cocci@systeme.lip6.fr>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5b693ee0-0cb1-7ff3-b562-bac6bcb6aae8@web.de>
Date: Mon, 29 Jun 2020 18:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:MvjbbF8fHz31+atifBksu7NbJVe858VtHtK/6+a8RB2HWH7I2/5
 /x3sQNu8leNfSxDz6S5bcsx/2Z4QtVMIrtB3828HXtbFXJ1PILSSqnTUmycZgQBvGIeuz9s
 aZEUCtPMg3y/HViGEUOqNNA0OU5Z6Jekbq3Mcs8APDnc+aVdI71H8okJT3oH2ZMEDXASYJq
 /OpNfKLL7rR6h9GlJbwtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vqp19vBBAUI=:CVhkusB/dUeW6SJ7bOGu5e
 KPAry2ODcfT5T42TIAycXLGziF6WnoipSp/ybzSfrndwBICe3O37sY7vlaLNKOVnbPLkA6CYx
 4T6XMmZFRcIbmwZ21U6+H9L9mqCVtTU2nx4tzwMkrQYUtk8ZqQV0ChYtzX7bFEKxtA7rRPjNt
 XtL5KUYfgr9D89kgIyO6kNjrRiSxdhelxn3NaOp/Xs54O5SXsLxhSQqXudDldGAxntBxyz2W1
 7KGdyhxs6KyxMnydfy8O93rxrWI/FgEQAHjBR+77WGw6e7UblR2q7yTSRo/Q1gHT/AfYEv6Cq
 bC6Z2WzkoQN9ROIWsflA9Xjvf8pOHwJO80Ze98m/qibj4bBvz2GgAl3TFdCoMAwRUNJOYz4ne
 Rny3t5dO0G1U4vxTcOVsYY3Frtyg1uiioe01IASXola5JxcoMWsNvH/M62opQJHQfOpSG9qqL
 rYDbmk41QdGIUZ0EMIScOAjNPw9noTaeUSw7dWfZi0+QUHlkbJ4+aDHzfc177EjkODEs5qJsq
 KPmTgzUr+n5/ffsBGYzft1BAkMLdO5VP6we4wMDcj423j40mxp5kmUfHzGqk0a1nBYBZprnvz
 vivyhQaavEoDd6bQFp0GEw7mWY75TI9uhH5fPASWqVwFJfEkhyTaVTDYM0vGgYmCu/+xv4+dm
 ryF+LUujsoDjnhomVObO/7iZec1EqWPkrc733GvjefuSOx3tMW1IgTJYcBocmWsFT3LiEqUzT
 H1JRPlpITEX3s9oF45toSoo95UGVU4+YaCSGUjMcmX1vuXSD2R8Whnso2EkU6/vZrbKL7AsEE
 73TQFRqPqqbXk7cSMd5jTwmF89UOkcJoLBghkFS0O0zGM1hvy/xVTBK5Fid8FEAju9ERbtMss
 pmFzjHz+YcJUB8xkv3ck1E5GXvozGMekWdQexTIOiglqpMFliI7cn8exE/xP8LgJg9PSqa+Ag
 ROt+1KWvvpvbytzW72SKdZWi1E9mXz9iqGpAxF7qSMDRQDa05Pe0aptPusJM205nrLRdxVQly
 KV6et6GKkAqHOCsB5LIdqVH5gMm8VfSc9u38L/MCIJW3sT3cIxW9mEgE9JE6wcbxjfgQ9vqle
 cquH5/4CYT0Skv7eJdsekiQgWGqK3Hqm9oGtxHGxIpU8BYQcZv7aXH0khMQROA0TO00aNFB9F
 pkTlsSBKpHTxAGady8WWIeQ6R5lrWTvItViUMg0UvHec9jwvZ/xtSMcHvPOO9HnD60S2vrw3U
 0cJBaP7yVpznj85E/
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
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBTb21lIHBvaW50ZXJzIGFyZSBkZXJlZmVyZW5jZWQgYmVmb3JlIHN1Y2Nlc3NmdWwgY2hlY2tz
LgoKQSBzb3VyY2UgY29kZSBwbGFjZSBjYW4gYmUgcG9pbnRlZCBvdXQgaW4gYW4gYWNjZXB0YWJs
ZSB0aW1lIGZyYW1lIGZvcgphIHNpbmdsZSBmaWxlIGJ5IHRoZSBmb2xsb3dpbmcgc2NyaXB0IHZh
cmlhbnQgZm9yIHRoZSBzZW1hbnRpYyBwYXRjaCBsYW5ndWFnZS4KCgpAZGlzcGxheUAKZXhwcmVz
c2lvbiBhY3Rpb24xLCBhY3Rpb24yOwpleHByZXNzaW9uKiBwb2ludGVyMSwgcG9pbnRlcjI7Cmlk
ZW50aWZpZXIgcmVzdWx0MSwgcmVzdWx0MjsKc3RhdGVtZW50IGlzLCBlczsKdHlwZSB0MSwgdDI7
CkBACiB0MSByZXN1bHQxID0gPCsuLi4KKiAgICAgICAgICAgICBhY3Rpb24xKC4uLiwgcG9pbnRl
cjEsIC4uLikKICAgICAgICAgICAgICAuLi4rPjsKIC4uLiB3aGVuIGFueQogICAgIHdoZW4gIT0g
cG9pbnRlcjEKIHQyIHJlc3VsdDIgPSA8Ky4uLgoqICAgICAgICAgICAgIGFjdGlvbjIoLi4uLCBw
b2ludGVyMiwgLi4uKQogICAgICAgICAgICAgIC4uLis+OwogLi4uIHdoZW4gYW55CiAgICAgd2hl
biAhPSBwb2ludGVyMQogICAgIHdoZW4gIT0gcG9pbnRlcjIKKmlmICghcG9pbnRlcjEgfHwgIXBv
aW50ZXIyIHx8IC4uLikKICAgIGlzCiBlbHNlCiAgICBlcwoKCmVsZnJpbmdAU29ubmU6fi9Qcm9q
ZWt0ZS9MaW51eC9uZXh0LXBhdGNoZWQ+IHRpbWUgc3BhdGNoIC0tcHJvZmlsZSAtLW5vLWxvb3Bz
IGRyaXZlcnMvdXNiL210dTMvbXR1M19nYWRnZXQuYyB+L1Byb2pla3RlL0NvY2NpbmVsbGUvamFu
aXRvci9zaG93X3BvaW50ZXJfdXNhZ2VfYmVmb3JlX251bGxfY2hlY2sxMS5jb2NjaQrigKYKQEAg
LTMzMiwxNCArMzMyLDExIEBAIGVycm9yOgoKIHN0YXRpYyBpbnQgbXR1M19nYWRnZXRfZGVxdWV1
ZShzdHJ1Y3QgdXNiX2VwICplcCwgc3RydWN0IHVzYl9yZXF1ZXN0ICpyZXEpCiB7Ci0Jc3RydWN0
IG10dTNfZXAgKm1lcCA9IHRvX210dTNfZXAoZXApOwotCXN0cnVjdCBtdHUzX3JlcXVlc3QgKm1y
ZXEgPSB0b19tdHUzX3JlcXVlc3QocmVxKTsKIAlzdHJ1Y3QgbXR1M19yZXF1ZXN0ICpyOwogCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7CiAJaW50IHJldCA9IDA7CiAJc3RydWN0IG10dTMgKm10dSA9IG1l
cC0+bXR1OwoKLQlpZiAoIWVwIHx8ICFyZXEgfHwgbXJlcS0+bWVwICE9IG1lcCkKIAkJcmV0dXJu
IC1FSU5WQUw7CgogCWRldl9kYmcobXR1LT5kZXYsICIlcyA6IHJlcT0lcFxuIiwgX19mdW5jX18s
IHJlcSk7Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLQpwcm9maWxpbmcgcmVzdWx0Ci0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpNYWluIHRvdGFsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogMi4w
MzAyMDUgc2VjICAgICAgICAgIDEgY291bnQKTWFpbi5vdXRmaWxlcyBjb21wdXRhdGlvbiAgICAg
ICAgICAgICAgICA6IDEuNjQ4NTQyIHNlYyAgICAgICAgICAxIGNvdW50CuKApgpyZWFsCTBtMiwx
MjJzCnVzZXIJMG0xLDk3N3MKc3lzCTBtMCwwMzdzCgoKSSBoYXZlIHRyaWVkIHRoaXMgYW5hbHlz
aXMgYXBwcm9hY2ggb3V0IGFsc28gZm9yIHNvdXJjZSBmaWxlcyBmcm9tCnRoZSBzb2Z0d2FyZSDi
gJxMaW51eCBuZXh0LTIwMjAwNjI24oCdLgoKZWxmcmluZ0BTb25uZTp+L1Byb2pla3RlL0xpbnV4
L25leHQtcGF0Y2hlZD4gWFg9JChkYXRlKSAmJiBzcGF0Y2ggLS1uby1sb29wcyAtLXRpbWVvdXQg
MTIgLWogNCAtLWNodW5rc2l6ZSAxIC1kaXIgfi9Qcm9qZWt0ZS9MaW51eC9uZXh0LXBhdGNoZWQg
fi9Qcm9qZWt0ZS9Db2NjaW5lbGxlL2phbml0b3Ivc2hvd19wb2ludGVyX3VzYWdlX2JlZm9yZV9u
dWxsX2NoZWNrMTEuY29jY2kgPiB+L1Byb2pla3RlL0JhdS9MaW51eC9zY3JpcHRzL0NvY2NpbmVs
bGUvbnVsbC9uZXh0LzIwMjAwNjI2L3Nob3dfcG9pbnRlcl91c2FnZV9iZWZvcmVfbnVsbF9jaGVj
azExLmRpZmYgMj4gfi9Qcm9qZWt0ZS9CYXUvTGludXgvc2NyaXB0cy9Db2NjaW5lbGxlL251bGwv
bmV4dC8yMDIwMDYyNi9zaG93X3BvaW50ZXJfdXNhZ2VfYmVmb3JlX251bGxfY2hlY2sxMS1lcnJv
cnMudHh0OyBZWT0kKGRhdGUpICYmIGVjaG8gIiRYWCB8ICRZWSIKTW8gMjkuIEp1biAxMzo1NDo1
NCBDRVNUIDIwMjAgfCBNbyAyOS4gSnVuIDE3OjIyOjM3IENFU1QgMjAyMAoKClVuZm9ydHVuYXRl
bHksIGEgbG90IG9mIOKAnGV4Y2VwdGlvbmFs4oCdIGRhdGEgcHJvY2Vzc2luZyByZXN1bHRzIHdl
cmUgbG9nZ2VkIHRoZW4uCgplbGZyaW5nQFNvbm5lOn4vUHJvamVrdGUvQmF1L0xpbnV4L3Njcmlw
dHMvQ29jY2luZWxsZS9udWxsL25leHQvMjAyMDA2MjY+IGdyZXAgJ0VYTjogQ29jY2luZWxsZV9t
b2R1bGVzLkNvbW1vbi5UaW1lb3V0JyBzaG93X3BvaW50ZXJfdXNhZ2VfYmVmb3JlX251bGxfY2hl
Y2sxMS1lcnJvcnMudHh0IHwgd2MgLWwKNDU0CgoKV2lsbCBzdWNoIGEgdGVzdCBydW4gdHJpZ2dl
ciBhbnkgZnVydGhlciBkZXZlbG9wbWVudCBjb25zaWRlcmF0aW9ucz8KClJlZ2FyZHMsCk1hcmt1
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
