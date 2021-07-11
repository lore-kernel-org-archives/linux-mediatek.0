Return-Path: <SRS0=zHGV=MD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E586C07E9C
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 01:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B9F61278
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 01:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B9F61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouRD7sILNLLDqRvuy+3azAqPhk2SYscPGY8vBdf+W3w=; b=RBOpVx7s5QwQmV
	YRYdyerxS9/biUUToYxOKqtLq6uMUmrc2eRmYvt/g3WA32PTuk3gCjZIewvxUmket5+YEvUMsmnoo
	VGF5aQuWIGecNXUp9pPVEvgOpQDbbIUCKGjsSXLTq8kNuH+NLP0tWLRXEKxAv2gT83YcdPCeJtCRd
	OFla5zpClsAJ0Ip5/HYxWzHG+ogMJaPgwNTl/4JbFcvJnI3Ots+gS/JElQfpJw10XGumRm0D+ApX6
	ryeNScsIs4PJyrQqvQtufqKgm693DO9cENhucaIAfBtBeNVZnltryryOVpqYY+bBwOwbo0l22Z5oB
	SDPFLnxO7vIGQFU5VYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2OAb-004S2K-DR; Sun, 11 Jul 2021 01:22:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2OAO-004RzS-Py; Sun, 11 Jul 2021 01:21:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C50D61278;
 Sun, 11 Jul 2021 01:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625966516;
 bh=QhKIvsISN8hyL/+WZ9H4vzKMikWnonQ+QXSUoi2Lhuk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RR3JaOiFJePPWksG5U+Zyu0yWD9nxB08n8GeHdUngBmGLviYB3A8vVr44lR7JzzE2
 a7tSA3NLmAVboXmx3VGXz9cwAzFfbpzP38PqPzgSzSj4LHp+bW3EyXdRFNLCW8Dy2b
 oq/ALjaB70Hz3AfL46EqNBVPhiW8OMDcWJAqeHHBAYI9Y7qip2L3p7Ew1qQtA6iqQZ
 bPCUhEGEX6z+oIKVXDON7m0e5CiVug7zda5YWAJWcfLbuL8LwBpShOcWsVVZHDJf+J
 ZoZId1KqZ6QVyfE3nl6QWMl+3qSdswyGS3ivoBG27m/icpYwpCFn+jJIi3Zuf+sqho
 sLAshVw33zQoA==
Received: by mail-ej1-f50.google.com with SMTP id b2so25112306ejg.8;
 Sat, 10 Jul 2021 18:21:56 -0700 (PDT)
X-Gm-Message-State: AOAM530hkcHtmeng6BlFWHCeuJA5QqtyX+1nfL38Y7IkNkTQO+xT0sdM
 jGLX66gbxG85CRTSLBeABIPLikgXvhIuFGCSxA==
X-Google-Smtp-Source: ABdhPJy89g97s6wTbgS+qttKFO6l2FwtdlkzBAGJwuMC27WthxsMpFpER+vqI3hYjY0vWhFLELnUOPXxck/pAyiT85Y=
X-Received: by 2002:a17:906:4745:: with SMTP id
 j5mr25862247ejs.75.1625966515074; 
 Sat, 10 Jul 2021 18:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <20210710113819.5170-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210710113819.5170-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 11 Jul 2021 09:21:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-FS_wWgyo7gZu_qPxqhNOQsp+q172Y=d=dttEi_LVT9Q@mail.gmail.com>
Message-ID: <CAAOTY_-FS_wWgyo7gZu_qPxqhNOQsp+q172Y=d=dttEi_LVT9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: mediatek: add definition for mt8195
 display
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, fshao@google.com, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_182156_921382_9A7AC686 
X-CRM114-Status: GOOD (  16.52  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDfmnIgxMOaXpSDpgLHlha0g5LiL5Y2INzozOOWvq+mBk++8mgo+Cj4gQWRkIGRlZmlu
aXRpb24gZm9yIG10ODE5NSBkaXNwbGF5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogamFzb24tamgubGlu
IDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCAgICAgICAgICB8IDkgKysrKysrKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IGluZGV4IGZiYjU5YzlkZGRhNi4uZGU2
MjI2ZDRiY2EzIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
PiBAQCAtMzcsNiArMzcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxv
Y2tzKToKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiICAgICAgICAgICAgICAt
IGFkYXB0aXZlIGFtYmllbnQgbGlnaHQgY29udHJvbGxlcgo+ICAgICAgICAgIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLWdhbW1hIiAgICAgICAgICAgIC0gZ2FtbWEgY29ycmVjdGlvbgo+ICAgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLW1lcmdlIiAgICAgICAgICAgIC0gbWVyZ2Ugc3RyZWFtcyBm
cm9tIHR3byBSRE1BIHNvdXJjZXMKPiArICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1kc2Mi
ICAgICAgICAgICAgICAtIERTQyBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHNjLnlhbWwKCllv
dSBhZGQgZHNjIGJpbmRpbmcgZG9jdW1lbnQgaW4geWFtbCBmb3JtYXQsIHNvIEkgd291bGQgbGlr
ZSB5b3UgdG8KY2hhbmdlIHRoaXMgYmluZGluZyBkb2N1bWVudCB0byB5YW1sIGZvcm1hdC4KClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXBvc3Rt
YXNrIiAgICAgICAgIC0gY29udHJvbCByb3VuZCBjb3JuZXIgZm9yIGRpc3BsYXkgZnJhbWUKPiAg
ICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1zcGxpdCIgICAgICAgICAgICAtIHNwbGl0IHN0
cmVhbSB0byB0d28gZW5jb2RlcnMKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC11Zm9l
IiAgICAgICAgICAgICAtIGRhdGEgY29tcHJlc3Npb24gZW5naW5lCj4gQEAgLTQ0LDcgKzQ1LDcg
QEAgUmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gICAgICAgICAi
bWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAgLSBEUEkgY29udHJvbGxlciwg
c2VlIG1lZGlhdGVrLGRwaS50eHQKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRl
eCIgICAgICAgICAgICAtIGRpc3BsYXkgbXV0ZXgKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1vZCIgICAgICAgICAgICAgICAtIG92ZXJkcml2ZQo+IC0gIHRoZSBzdXBwb3J0ZWQgY2hp
cHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE2NywgbXQ4MTczLCBtdDgxODMgYW5k
IG10ODE5Mi4KPiArICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMywgbXQy
NzEyLCBtdDgxNjcsIG10ODE3MywgbXQ4MTgzLCBtdDgxOTIgYW5kIG10ODE5NS4KPiAgLSByZWc6
IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBmdW5jdGlvbiBibG9jayBy
ZWdpc3RlciBzcGFjZQo+ICAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1cHQgc2lnbmFsIGZyb20g
dGhlIGZ1bmN0aW9uIGJsb2NrIChyZXF1aXJlZCwgZXhjZXB0IGZvcgo+ICAgIG1lcmdlIGFuZCBz
cGxpdCBmdW5jdGlvbiBibG9ja3MpLgo+IEBAIC02MCw3ICs2MSw3IEBAIFJlcXVpcmVkIHByb3Bl
cnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOgo+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1k
aXNwLW92bCIKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1yZG1hIgo+ICAgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLXdkbWEiCj4gLSAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUg
bXQyNzAxLCBtdDgxNjcgYW5kIG10ODE3My4KPiArICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBt
dDI3MDEsIG10ODE2NywgbXQ4MTczIGFuZCBtdDgxOTUuCj4gIC0gbGFyYjogU2hvdWxkIGNvbnRh
aW4gYSBwaGFuZGxlIHBvaW50aW5nIHRvIHRoZSBsb2NhbCBhcmJpdGVyIGRldmljZSBhcyBkZWZp
bmVkCj4gICAgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9tZWRpYXRlayxzbWktbGFyYi55YW1sCj4gIC0gaW9tbXVzOiBTaG91bGQgcG9pbnQg
dG8gdGhlIHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sgd2l0aCBtYXN0ZXIgcG9ydCBhcwo+IEBAIC0y
MTcsMyArMjE4LDcgQEAgb2RAMTQwMjMwMDAgewo+ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwm
c2Nwc3lzIE1UODE3M19QT1dFUl9ET01BSU5fTU0+Owo+ICAgICAgICAgY2xvY2tzID0gPCZtbXN5
cyBDTEtfTU1fRElTUF9PRD47Cj4gIH07Cj4gKwo+ICtkc2MwOiBkaXNwX2RzY193cmFwQDFjMDA5
MDAwIHsKPiArICAgICAgIC8qIFNlZSBtZWRpYXRlayxkc2MueWFtbCBmb3IgZGV0YWlscyAqLwo+
ICt9Owo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
