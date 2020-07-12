Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E6FC433E2
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 23:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2820206F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 23:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XqsE7l8o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFOpIko9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2820206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SB1AmLkaTvRSiXnJE++ZuNkE9KUQs/TNTVUroXZw1Cg=; b=XqsE7l8oUx66R/MMtDtMYKkXn
	jW0oYV0o6sh7AFvbTiO8uzmQJ+sZMwFN+4O1tpsvu5A6BqHP3gm3mF/Ua/rk2LIKVYlcEOAi7xdGT
	UZ9FI7G3MtfkaFZUHCQK8h6YNYgf8rlkpT1uBDZPpmuOrBJdSyvQg4x54QOhO5T+tmjAudIki10LI
	EyEzvXhw8v7jlIpCp8bLpGc1WJHEKFOUhAL6Oc9uJsWZwzBE1El1FyMwJvRXlqO+i3/VLwpjn/ToN
	FGdtE4tChE6LaIkCq8C2Z/n8nriB9A5813w0NhVtFgVsiIt5a40EYQbMOyMjRvx5xturHk+l6tlWT
	oZC5sDmkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1julBJ-0006B6-10; Sun, 12 Jul 2020 23:14:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1julBE-00069q-RY; Sun, 12 Jul 2020 23:14:45 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F08E0206F0;
 Sun, 12 Jul 2020 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594595683;
 bh=JJcu9UGyZSmnY8MG9Tb8lOo8zhSv3HDqhkH2NhNsK9k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nFOpIko9y3x8JaPjoj5+5x2bHF0GjI/PiZtHtJWFV9YMbHsEhhZjIGrO8VJ/o00u5
 ZDL1vzgPDibwrFtdZkOQTxdeDzTYESo772+A/vB2VLhG6sfH6imgPzMi9oOv/Gadsl
 41SEsGk4sQ2hxJ5baQ1oJsZTSX8bxb2Vd0BQkwSg=
Received: by mail-ed1-f45.google.com with SMTP id b15so10379552edy.7;
 Sun, 12 Jul 2020 16:14:42 -0700 (PDT)
X-Gm-Message-State: AOAM532M1va/AiHWU5SxOGAHjT1oIAoPgF+Ite18jIRF2WHSdI6RQrqE
 C33OhrHoiftFQQqp+SfhM25QVSVp3DnoalfZXA==
X-Google-Smtp-Source: ABdhPJwWEw89a3TPBeDtbrMxC83/9R66XtgjlsU1MmE822OJ1v3FtQUjP7YI/JkTftCHfeXxfej+3oDaYrfbYHp9aP8=
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr87628185edr.148.1594595681551; 
 Sun, 12 Jul 2020 16:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
In-Reply-To: <20200708104023.3225-2-louis.kuo@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Jul 2020 07:14:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY__fRjytz9w4zA6rOoYKzjyRH-j=ASFqNMVNShBYGd6-5Q@mail.gmail.com>
Message-ID: <CAAOTY__fRjytz9w4zA6rOoYKzjyRH-j=ASFqNMVNShBYGd6-5Q@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To: Louis Kuo <louis.kuo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_191445_032387_AD795F5B 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 laurent.pinchart+renesas@ideasonboard.com,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= <Jerry-ch.Chen@mediatek.com>,
 Tomasz Figa <tfiga@chromium.org>, keiichiw@chromium.org,
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIExvdWlzOgoKTG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDfmnIg45pelIOmAseS4iSDkuIvljYg2OjQx5a+r6YGT77yaCj4KPiBUaGlzIHBhdGNoIGFkZHMg
TWVkaWF0ZWsncyBzZW5zb3IgaW50ZXJmYWNlIGRyaXZlci4gU2Vuc29yIGludGVyZmFjZQo+IGRy
aXZlciBpcyBhIE1JUEktQ1NJMiBob3N0IGRyaXZlciwgbmFtZWx5LCBhIEhXIGNhbWVyYSBpbnRl
cmZhY2UgY29udHJvbGxlci4KPiBJdCBzdXBwb3J0IGEgd2lkZWx5IGFkb3B0ZWQsIHNpbXBsZSwg
aGlnaC1zcGVlZCBwcm90b2NvbCBwcmltYXJpbHkgaW50ZW5kZWQKPiBmb3IgcG9pbnQtdG8tcG9p
bnQgaW1hZ2UgYW5kIHZpZGVvIHRyYW5zbWlzc2lvbiBiZXR3ZWVuIGNhbWVyYXMgYW5kIGhvc3QK
PiBkZXZpY2VzLiBUaGUgbXRrLWlzcCBkaXJlY3Rvcnkgd2lsbCBjb250YWluIGRyaXZlcnMgZm9y
IG11bHRpcGxlIElQIGJsb2Nrcwo+IGZvdW5kIGluIE1lZGlhdGVrIElTUCBzeXN0ZW0uIEl0IHdp
bGwgaW5jbHVkZSBJU1AgUGFzcyAxIGRyaXZlciwgc2Vuc29yCj4gaW50ZXJmYWNlIGRyaXZlciwg
RElQIGRyaXZlciBhbmQgZmFjZSBkZXRlY3Rpb24gZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPgo+IC0tLQoKW3NuaXBdCgo+ICsKPiAr
ZW51bSBDRkdfQ1NJX1BPUlQgewo+ICsgICAgICAgQ0ZHX0NTSV9QT1JUXzAgPSAweDAsICAgLyog
NEQxQyAqLwo+ICsgICAgICAgQ0ZHX0NTSV9QT1JUXzEsICAgICAgICAgLyogNEQxQyAqLwo+ICsg
ICAgICAgQ0ZHX0NTSV9QT1JUXzIsICAgICAgICAgLyogNEQxQyAqLwo+ICsgICAgICAgQ0ZHX0NT
SV9QT1JUXzBBLCAgICAgICAgLyogMkQxQyAqLwo+ICsgICAgICAgQ0ZHX0NTSV9QT1JUXzBCLCAg
ICAgICAgLyogMkQxQyAqLwo+ICsgICAgICAgQ0ZHX0NTSV9QT1JUX01BWF9OVU0sCj4gKyAgICAg
ICBDRkdfQ1NJX1BPUlRfTk9ORSAgICAgICAvKmZvciBub24tTUlQSSBzZW5zb3IgKi8KPiArfTsK
PiArCj4gK2VudW0gUElYRUxfTU9ERSB7Cj4gKyAgICAgICBPTkVfUElYRUxfTU9ERSAgPSAweDAs
Cj4gKyAgICAgICBUV09fUElYRUxfTU9ERSAgPSAweDEsCj4gKyAgICAgICBGT1VSX1BJWEVMX01P
REUgPSAweDIsCj4gK307Cj4gKwo+ICtlbnVtIFNFTklORl9JRCB7Cj4gKyAgICAgICBTRU5JTkZf
MSA9IDB4MCwKPiArICAgICAgIFNFTklORl8yID0gMHgxLAo+ICsgICAgICAgU0VOSU5GXzMgPSAw
eDIsCj4gKyAgICAgICBTRU5JTkZfNCA9IDB4MywKPiArICAgICAgIFNFTklORl81ID0gMHg0LAo+
ICsgICAgICAgU0VOSU5GX05VTSwKPiArfTsKPiArCgpbc25pcF0KCj4gKwo+ICtzdGF0aWMgaW50
IHNlbmluZl9saW5rX3NldHVwKHN0cnVjdCBtZWRpYV9lbnRpdHkgKmVudGl0eSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtZWRpYV9wYWQgKmxvY2FsLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1lZGlhX3BhZCAqcmVtb3Rl
LCB1MzIgZmxhZ3MpCj4gK3sKPiArICAgICAgIHN0cnVjdCB2NGwyX3N1YmRldiAqc2Q7Cj4gKyAg
ICAgICBzdHJ1Y3QgbXRrX3NlbmluZiAqcHJpdjsKPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRl
djsKPiArCj4gKyAgICAgICBzZCA9IG1lZGlhX2VudGl0eV90b192NGwyX3N1YmRldihlbnRpdHkp
Owo+ICsgICAgICAgcHJpdiA9IHY0bDJfZ2V0X3N1YmRldmRhdGEoc2QpOwo+ICsgICAgICAgZGV2
ID0gcHJpdi0+ZGV2Owo+ICsKPiArICAgICAgIGlmICghKGZsYWdzICYgTUVESUFfTE5LX0ZMX0VO
QUJMRUQpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICBpZiAobG9j
YWwtPmZsYWdzICYgTUVESUFfUEFEX0ZMX1NPVVJDRSkgewo+ICsgICAgICAgICAgICAgICBwcml2
LT5tdXhfc2VsID0gbG9jYWwtPmluZGV4IC0gQ0FNX01VWF9JRFhfTUlOOwo+ICsgICAgICAgfSBl
bHNlIHsKPiArICAgICAgICAgICAgICAgLyogU2VsZWN0IHBvcnQgKi8KPiArICAgICAgICAgICAg
ICAgcHJpdi0+cG9ydCA9IGxvY2FsLT5pbmRleDsKCkkgZG9uJ3QgdW5kZXJzdGFuZCBWNEwyIG11
Y2gsIGJ1dCB0aGUgcG9ydCBkZWZpbml0aW9uIGlzIGluc2lkZSB0aGlzCmZpbGUsIGhvdyBkb2Vz
IHRoZSBjYWxsZXIga25vdyB3aGF0IHRvIHBhc3MgdG8gaGVyZT8gQ291bGQgeW91IGV4cGxhaW4K
aG93IGRvZXMgaXQgd29yaz8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAgICAgICAg
ICBpZiAocHJpdi0+cG9ydCA+PSBOVU1fU0VOU09SUykgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAicG9ydCBpbmRleCBpcyBvdmVyIG51bWJlciBvZiBwb3J0c1xuIik7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgICAg
ICAgIH0KPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
