Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0264DC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:46:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8668206F8
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUesPE/h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnkVdp/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8668206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCyKRXZPeU/IQGFTMFiZNeqKGSxgJsxfckkrV4caLPM=; b=NUesPE/h0HbG7a
	KPTHvVyzTW11qMrmMIdAP4fi+Gek+GZVE4kTFpwqCiw6B42hiJn5KESMJ9+B7r7COVhRfror8b5IE
	+i9Q67qTi6omrnPDIeRcQoJ37Necd6zP/CH30T7Ln/9/TlFDTROSoKcIagwCCmVgwP7MLqNg6EJqT
	z7lw4isQdLUsv/nammjNaqfSDWQRnDPCTdvowBn3UQglLl+R5bt3tlblF+7E+K/bdvy4KWShpdysd
	u/+y2+4fQFm+JAu51P4T05aYYaB+N4UDzHZWfZZ95HCMaTRNMotKqULYK7ce+qr63MEX0zRK8YjwS
	hIa76alCM83RXDbkk/SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKkzp-0004XO-IF; Sat, 04 Apr 2020 15:46:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKkzf-0004Q3-TY; Sat, 04 Apr 2020 15:46:01 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B09F72076C;
 Sat,  4 Apr 2020 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586015159;
 bh=GMu0zk+p8QMuMWjCbtVqePXwGuMgSxIWxR0r1z6lvyU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QnkVdp/gyG8TvuSAYeRWfvp6TyOcb4HR3RmfcuKqMH+f51o15YIulJtAIOimkVXun
 lAkaRQGi24mhZheUSivFH7sPHMPFRyCwRPc6V5Sc4XQQ/dSbFnV/ak09dKTThtR2JU
 8FXui4qMBZLm8E/PiEFXSePCnrYYtPldWwwD1+Js=
Received: by mail-ed1-f50.google.com with SMTP id v1so13089597edq.8;
 Sat, 04 Apr 2020 08:45:58 -0700 (PDT)
X-Gm-Message-State: AGi0PubOaQvcXN6/pDR+WpUnMSM0NR768bLkxs2zjnbQVG/eGvzQzDH3
 5yQR72Y/t68B0VvehOKYXu1x/idRLjG7zjh9iQ==
X-Google-Smtp-Source: APiQypKX48tTaJ6RxCfGLNPptu/cJWdbVnwRtToRHot3QHJ2YgdHABiYCkH652IzhRi38qOA2XH03CE7gPBlBXCImT4=
X-Received: by 2002:a50:af85:: with SMTP id h5mr12733695edd.300.1586015157107; 
 Sat, 04 Apr 2020 08:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200331082725.81048-1-jitao.shi@mediatek.com>
 <20200331082725.81048-2-jitao.shi@mediatek.com>
In-Reply-To: <20200331082725.81048-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Apr 2020 23:45:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-77zLp1W=29oxdFbPWzdiUbk-dJfEmUU16CJoLxC8FMg@mail.gmail.com>
Message-ID: <CAAOTY_-77zLp1W=29oxdFbPWzdiUbk-dJfEmUU16CJoLxC8FMg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_084559_978623_07D51416 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDPmnIgzMeaXpSDpgLHkuowg5LiL5Y2INDoyOOWvq+mBk++8mgo+Cj4gQWRkIGEgcHJvcGVydHkg
dG8gY29udHJvbCBtaXBpIHR4IGRyaXZlIGN1cnJlbnQ6Cj4gImRyaXZlLXN0cmVuZ3RoLW1pY3Jv
YW1wIgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
PgoKPgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkc2kudHh0ICAgIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiBpbmRleCBhMTlhNmNj
Mzc1ZWQuLmQ3OGI2ZDZkOGZhYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHNpLnR4dAo+IEBAIC0zMyw2ICszMywxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtICNj
bG9jay1jZWxsczogbXVzdCBiZSA8MD47Cj4gIC0gI3BoeS1jZWxsczogbXVzdCBiZSA8MD4uCj4K
PiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArLSBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcDogYWRq
dXN0IGRyaXZpbmcgY3VycmVudCwgc2hvdWxkIGJlIDMwMDAgfiA2MDAwLiBBbmQKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aGUgc3RlcCBpcyAy
MDAuCj4gKwo+ICBFeGFtcGxlOgo+Cj4gIG1pcGlfdHgwOiBtaXBpLWRwaHlAMTAyMTUwMDAgewo+
IEBAIC00Miw2ICs0Niw3IEBAIG1pcGlfdHgwOiBtaXBpLWRwaHlAMTAyMTUwMDAgewo+ICAgICAg
ICAgY2xvY2stb3V0cHV0LW5hbWVzID0gIm1pcGlfdHgwX3BsbCI7Cj4gICAgICAgICAjY2xvY2st
Y2VsbHMgPSA8MD47Cj4gICAgICAgICAjcGh5LWNlbGxzID0gPDA+Owo+ICsgICAgICAgZHJpdmUt
c3RyZW5ndGgtbWljcm9hbXAgPSA8NDYwMD47Cj4gIH07Cj4KPiAgZHNpMDogZHNpQDE0MDFiMDAw
IHsKPiAtLQo+IDIuMjEuMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
