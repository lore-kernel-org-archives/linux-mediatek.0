Return-Path: <SRS0=p0H4=GU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D2FC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 22:22:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8429E222B3
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 22:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8429E222B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLL1U4nOnnGlyiRZ9NtU9i2JWRUESjiq+OnV1vnIwBA=; b=cR7qfDqk504xz6SryQ6rPSjxbN
	6QVTtdX2PTCJYuUWV2yKir6/R5BslkH06Q+xxCXCznc4gfLtfy5U40hITf06NqL1mv91+ers/BR1Q
	ZGweZBJT+D7XrXU3GjqYDaMXeGiJcpwP5sglBHEBzpA/sSvkodxDVSnQp1o03Ed6AWpSJmuLciipK
	RSDi4eRPRpq0rLuQv+dy4yNEoIsOlNLfrCIfjSL4JimlJBf214t2EjJa7l8wZMqV6hwHAxPCunIkl
	uBRMsHPijSlW6b8Dd5uRwEsC+0EkJWu02pQZaAjs9f/ZsAeXcdv6oh3C5634Dxn35fV9pvHGtzrh/
	ttIjSERg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1GQq-0007r2-9v; Sun, 17 Jan 2021 22:22:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1GQn-0007qK-2B
 for linux-mediatek@lists.infradead.org; Sun, 17 Jan 2021 22:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610922112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1Q/nirjyd353laCSIcUJdblTkIhaVs8AOQO2AamTKH0=;
 b=YT2htPgRh3IjSkrigGvxEeBTkLV+rJ8Mmx+1YJXQw7kNz78OUrwTK44vUzqH92aqunqF2m
 i+1BoDAwmwb0OpgcOwrqzW9jM8fWojC1XQGToM9YeCotec/JVn3hp3sWdmhNaAcP4rWXOI
 JovaZnIVj7ki5I6XzZKBrNUJVBiJbpI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Nq1glw0-NLGZbvQnWQw1hA-1; Sun, 17 Jan 2021 17:21:50 -0500
X-MC-Unique: Nq1glw0-NLGZbvQnWQw1hA-1
Received: by mail-qv1-f72.google.com with SMTP id k16so14561410qve.19
 for <linux-mediatek@lists.infradead.org>; Sun, 17 Jan 2021 14:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Q/nirjyd353laCSIcUJdblTkIhaVs8AOQO2AamTKH0=;
 b=VAwvdu2HVsyxiYAkq7x9t3Rwqxyl7gSFdmJNmE5x9lb6k4x+mOlnJsIHw9z7FwyMoB
 RiZ+GkB9BX4zL/APGP+WCejcDWvFju0mKFeS7DqIbnlWlYuoro9I0VfKOqfEs2pVUZhc
 HHvguB4jgJB1oaYky4WX2SKhMNDP/lllI+1D2xfKdU9JgSKLRHsywn/Cr6DUvUN7FLu8
 ln5rm87S9NeACfbge6ccwRb7aSh9l44dQ8uqHmcCLQZ+xsF/fbpT2j4Dj1ya/V4kJvlJ
 sGV6iI2LwVAvPVkBHQo3zi1jDn76XCeqgOndm5rShf+2q/AFQlq5dC1jucmn06FkQEIb
 Jr4g==
X-Gm-Message-State: AOAM533/aDtPLnsJMzVjoYnL5UfmEs+zD8boNiGraSkGy6gn8E+YkxPL
 ub7LmB3oGklHsv9008mFsASpUTaKKSd/ZBKxXmKigxIhzumsYgJ7h0iAmThV32PZ5Tref7KHYiw
 Y6zKyVOvFcHg5OXghN359zZo5iL4qnu0n
X-Received: by 2002:a0c:9e50:: with SMTP id z16mr21356532qve.13.1610922110404; 
 Sun, 17 Jan 2021 14:21:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLfAViRBC01RcVQ97+1PHfTVCqF3ZzkhqNaMPivdg097DavcqB1qB4Ni4JYwm+u1ckPY0Qnw==
X-Received: by 2002:a0c:9e50:: with SMTP id z16mr21356516qve.13.1610922110196; 
 Sun, 17 Jan 2021 14:21:50 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id d25sm9674480qkl.97.2021.01.17.14.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 14:21:49 -0800 (PST)
From: trix@redhat.com
To: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
 acourbot@chromium.org
Subject: [PATCH] media: mtk-vcodec: fix argument used when DEBUG is defined
Date: Sun, 17 Jan 2021 14:21:38 -0800
Message-Id: <20210117222138.551147-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_172157_146186_937C01C8 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: Tom Rix <trix@redhat.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPgoKV2hlbiBERUJVRyBpcyBkZWZpbmVkIHRo
aXMgZXJyb3Igb2NjdXJzCgpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19lbmNfZHJ2LmM6MzA2OjQxOgogIGVycm9yOiDigJhp4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogIG10a192NGwyX2RlYnVnKDIsICJyZWdbJWRdIGJhc2U9
MHglcCIsIGksIGRldi0+cmVnX2Jhc2VbVkVOQ19TWVNdKTsKClJldmlld2luZyB0aGUgb2xkIGxp
bmUKCgltdGtfdjRsMl9kZWJ1ZygyLCAicmVnWyVkXSBiYXNlPTB4JXAiLCBpLCBkZXYtPnJlZ19i
YXNlW2ldKTsKCkFsbCB0aGUgaSdzIG5lZWQgdG8gYmUgY2hhbmdlZCB0byBWRU5DX1NZUy4KRml4
IGEgc2ltaWxhciBlcnJvciBmb3IgVkVOQ19MVF9TWVMuCgpGaXhlczogMGRjNGIzMjg2MTI1ICgi
bWVkaWE6IG10ay12Y29kZWM6IHZlbmM6IHN1cHBvcnQgU0NQIGZpcm13YXJlIikKU2lnbmVkLW9m
Zi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMKaW5kZXggZGZi
NDJlMTliZjgxLi5iZTM4NDJlNmNhNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYworKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMKQEAgLTMwMyw3ICszMDMsNyBA
QCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAkJcmV0ID0gUFRSX0VSUigoX19mb3JjZSB2b2lkICopZGV2LT5yZWdfYmFzZVtWRU5DX1NZ
U10pOwogCQlnb3RvIGVycl9yZXM7CiAJfQotCW10a192NGwyX2RlYnVnKDIsICJyZWdbJWRdIGJh
c2U9MHglcCIsIGksIGRldi0+cmVnX2Jhc2VbVkVOQ19TWVNdKTsKKwltdGtfdjRsMl9kZWJ1Zygy
LCAicmVnWyVkXSBiYXNlPTB4JXAiLCBWRU5DX1NZUywgZGV2LT5yZWdfYmFzZVtWRU5DX1NZU10p
OwogCiAJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfSVJRLCAw
KTsKIAlpZiAocmVzID09IE5VTEwpIHsKQEAgLTMzMiw3ICszMzIsNyBAQCBzdGF0aWMgaW50IG10
a192Y29kZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJCXJldCA9IFBU
Ul9FUlIoKF9fZm9yY2Ugdm9pZCAqKWRldi0+cmVnX2Jhc2VbVkVOQ19MVF9TWVNdKTsKIAkJCWdv
dG8gZXJyX3JlczsKIAkJfQotCQltdGtfdjRsMl9kZWJ1ZygyLCAicmVnWyVkXSBiYXNlPTB4JXAi
LCBpLCBkZXYtPnJlZ19iYXNlW1ZFTkNfTFRfU1lTXSk7CisJCW10a192NGwyX2RlYnVnKDIsICJy
ZWdbJWRdIGJhc2U9MHglcCIsIFZFTkNfTFRfU1lTLCBkZXYtPnJlZ19iYXNlW1ZFTkNfTFRfU1lT
XSk7CiAKIAkJZGV2LT5lbmNfbHRfaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAxKTsKIAkJ
aXJxX3NldF9zdGF0dXNfZmxhZ3MoZGV2LT5lbmNfbHRfaXJxLCBJUlFfTk9BVVRPRU4pOwotLSAK
Mi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
