Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4109EC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:14:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D3B20829
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AbJZN4HT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2mGuoURq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D3B20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mzNZpLL2F8WYI8MmVl3MSEIVtiwp6Dbm1qYVvUO53BM=; b=AbJZN4HTeudfsbTC3h4sWXeS2
	tWg4uh28by6r/NlPQGBisjcC0AlUyS6gubjqXvmJJMjxYPyWnguqvQzMm3DYwWt/xazAfv3cF2uW3
	dO5q1K0txaukeYeBApnfH2I38/a0r0Z7M9DNw8Vd/4p/FMZ+EVMGIKzn5z4S3gcy8fKKqAvLt3nEQ
	eQNWeYDnJ9Bva7Zcqe/ooBFbVR0kww0Vs+p3UBrBjriYtv/h9JywpaoZcH9u7gLBzMowKBNpUOLSe
	YBCd0OrYSBWDtjEECp5pQhZU2xXjJrv5glnjgRLQy6JyfnvDZhb/dcQP+L8Se9EzGm3nZ8zN0T1Rc
	5BKQgMmMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1BCa-0002Dv-86; Thu, 30 Jul 2020 16:14:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1BCV-0002Cc-QX; Thu, 30 Jul 2020 16:14:36 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0BF720829;
 Thu, 30 Jul 2020 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596125674;
 bh=0aMZNuZZ87P262TCTl7JTgVhH1Sd45zJlDg8CK8T17s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2mGuoURqxS/zQp8v1Pb01wjIvfbt+VZJcXpkQ0bGkhTYpEcj4XQq8j2yWkUKOHSdg
 Lx7+k4W8VDmuDQKA96ofZVscxnrzE8zBS8S3zJ++oIbMUVkYf12Y14dHjk3UEy3NFH
 t0I4nF6e7XjPAEbArRIkPeqs4A9vy6BJeihCBcUs=
Received: by mail-ed1-f50.google.com with SMTP id l23so6658701edv.11;
 Thu, 30 Jul 2020 09:14:34 -0700 (PDT)
X-Gm-Message-State: AOAM530SBMZ3H1/v8lXxy/FgnFiUn4lsVzDoQvHkl1Mx4wnHPWF4743E
 yPYMI0V/N4TveG7gV3Q1rdRpHhbNCj4pHGIBzQ==
X-Google-Smtp-Source: ABdhPJwikWp3DYvBmgsqn1L0ZzeeaYzTNHPPSdjPh1WXVqu2um+iA+5qm3sBHbdE8aAs96kerq91GTmOIdCNqsF3R2I=
X-Received: by 2002:a05:6402:38c:: with SMTP id
 o12mr3509657edv.271.1596125673214; 
 Thu, 30 Jul 2020 09:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 31 Jul 2020 00:14:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9HXv+OsSRF7P9=cRy9AYZ0vwffgo3Kc8V=qQ6ce90uJw@mail.gmail.com>
Message-ID: <CAAOTY_9HXv+OsSRF7P9=cRy9AYZ0vwffgo3Kc8V=qQ6ce90uJw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_121436_000783_8ECB3922 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyOeaXpSDpgLHkuIkg5LiL5Y2INDoyOeWvq+mBk++8mgo+Cj4gTWVkaWFUZWsgYnVzIGZhYnJp
YyBwcm92aWRlcyBUcnVzdFpvbmUgc2VjdXJpdHkgc3VwcG9ydCBhbmQgZGF0YQo+IHByb3RlY3Rp
b24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4g
bWFzdGVycy4KPiBUaGUgc2VjdXJpdHkgdmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0
aGUgcHJvY2Vzc29yIGZvcgo+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLgo+
Cj4gQW55IG9jY3VycmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGlu
dGVycnVwdCwgYW5kCj4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBU
aGUgdmlvbGF0aW9uCj4gaW5mb3JtYXRpb24gaXMgcHJpbnRlZCBpbiBvcmRlciB0byBmaW5kIHRo
ZSBtdXJkZXJlci4KPgo+IFNpZ25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRl
ay5jb20+Cj4gLS0tCgpbc25pcF0KCj4gKwo+ICsvKgo+ICsgKiBkZXZhcGNfZXh0cmFjdF92aW9f
ZGJnIC0gZXh0cmFjdCBmdWxsIHZpb2xhdGlvbiBpbmZvcm1hdGlvbiBhZnRlciBkb2luZwo+ICsg
KiAgICAgICAgICAgICAgICAgICAgICAgICAgc2hpZnQgbWVjaGFuaXNtLgo+ICsgKi8KPiArc3Rh
dGljIHZvaWQgZGV2YXBjX2V4dHJhY3RfdmlvX2RiZyhzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0
ICpjdHgpCj4gK3sKPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBjX3Zpb19kYmdzICp2
aW9fZGJnczsKPiArICAgICAgIHN0cnVjdCBtdGtfZGV2YXBjX3Zpb19pbmZvICp2aW9faW5mbzsK
PiArICAgICAgIHZvaWQgX19pb21lbSAqdmlvX2RiZzBfcmVnOwo+ICsgICAgICAgdm9pZCBfX2lv
bWVtICp2aW9fZGJnMV9yZWc7Cj4gKyAgICAgICB1MzIgZGJnMDsKPiArCj4gKyAgICAgICB2aW9f
ZGJnMF9yZWcgPSBjdHgtPmRldmFwY19wZF9iYXNlICsgY3R4LT5vZmZzZXQtPnZpb19kYmcwOwo+
ICsgICAgICAgdmlvX2RiZzFfcmVnID0gY3R4LT5kZXZhcGNfcGRfYmFzZSArIGN0eC0+b2Zmc2V0
LT52aW9fZGJnMTsKPiArCj4gKyAgICAgICB2aW9fZGJncyA9IGN0eC0+dmlvX2RiZ3M7Cj4gKyAg
ICAgICB2aW9faW5mbyA9IGN0eC0+dmlvX2luZm87Cj4gKwo+ICsgICAgICAgLyogU3RhcnRzIHRv
IGV4dHJhY3QgdmlvbGF0aW9uIGluZm9ybWF0aW9uICovCj4gKyAgICAgICBkYmcwID0gcmVhZGwo
dmlvX2RiZzBfcmVnKTsKPiArICAgICAgIHZpb19pbmZvLT52aW9fYWRkciA9IHJlYWRsKHZpb19k
YmcxX3JlZyk7Cj4gKwo+ICsgICAgICAgdmlvX2luZm8tPm1hc3Rlcl9pZCA9IChkYmcwICYgdmlv
X2RiZ3MtPm1zdGlkLm1hc2spID4+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmlv
X2RiZ3MtPm1zdGlkLnN0YXJ0Owo+ICsgICAgICAgdmlvX2luZm8tPmRvbWFpbl9pZCA9IChkYmcw
ICYgdmlvX2RiZ3MtPmRtbmlkLm1hc2spID4+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdmlvX2RiZ3MtPmRtbmlkLnN0YXJ0Owo+ICsgICAgICAgdmlvX2luZm8tPndyaXRlID0gKChk
YmcwICYgdmlvX2RiZ3MtPnZpb193Lm1hc2spID4+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZpb19kYmdzLT52aW9fdy5zdGFydCkgPT0gMTsKPiArICAgICAgIHZpb19pbmZvLT5yZWFk
ID0gKChkYmcwICYgdmlvX2RiZ3MtPnZpb19yLm1hc2spID4+Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICB2aW9fZGJncy0+dmlvX3Iuc3RhcnQpID09IDE7Cj4gKyAgICAgICB2aW9faW5mby0+
dmlvX2FkZHJfaGlnaCA9IChkYmcwICYgdmlvX2RiZ3MtPmFkZHJfaC5tYXNrKSA+Pgo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+YWRkcl9oLnN0YXJ0OwoKCkkg
d291bGQgbGlrZSB0byBkZWZpbmUgdGhlIHR5cGUgb2YgY3R4LT52aW9faW5mbyB0byBiZQoKc3Ry
dWN0IG10a19kZXZhcGNfdmlvX2RiZ3MgewogICAgdTMyIG1zdGlkOjE2OwogICAgdTMyIGRtbmlk
OjY7CiAgICB1MzIgdmlvX3c6MTsKICAgIHUzMiB2aW9fcjoxOwogICAgdTMyIGFkZHJfaDo0Owog
ICAgdTMyIHJlc3Y6NDsKfTsKCnNvIHRoZSBjb2RlIHdvdWxkIGxpa2UgdGhlIHNpbXBsZSB3YXkK
CmN0eC0+dmlvX2luZm8gPSAoc3RydWN0IG10a19kZXZhcGNfdmlvX2RiZ3MpcmVhZGwodmlvX2Ri
ZzFfcmVnKTsKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsKPiArICAgICAgIGRldmFwY192aW9f
aW5mb19wcmludChjdHgpOwo+ICt9Cj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
