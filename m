Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA04C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 14:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81EEA613C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 14:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81EEA613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez17VSu0OjZcRKAVGykw4V/wVpws0tmOTwNL2urn8Dc=; b=3a1/kzpLjSp+n9
	C7cnt5gb0poaHv/tj9tiQRqtyJDL37PEBht8dgsze6oyRaUaheQU+FVs7st1L9gMtKUePy7Pb3ZC/
	cqI1tN2suJzZs4W0OYodZJGjKkIqYjSY4mSfjZYx8ZZAXeCGsupB2xQ4lBWPS1xgdCi3jJ9QMhBWm
	m0JQ6u6Ej4AckEvEpENDsBnZB9Ik8pXNv4DYMHeUO65bEI26j2IuubKQB9wpzBK4+y/lZl0RKk2vJ
	3xXvZNu1ao+r+WdczvfRxJrNVtLNDW2EAGSq4j+9eu1WDjcCzTz3YEKPucMes8r3zdSg2lJc24GiR
	DjONmwpxIakIQj0N383Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fzX-00DrJA-AC; Wed, 14 Jul 2021 14:36:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fzK-00DrFG-8c; Wed, 14 Jul 2021 14:35:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82CA8613CB;
 Wed, 14 Jul 2021 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626273349;
 bh=M3HjJVm0txCIX2c2GAG6GyVimWezeOrVUPEb3tzfzGY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XQn3x5e1Q9qEHi79IweZ0O0/41jRm8IcUHnzO53PMGkMLfY7G+FWMiISzzKVaOnMM
 qFmt/dbo9871iRZkbxrNZf/KAl54DtLB1zAEWx1kPxHdMYuWpFRBhJEPgLXORO/tvb
 csUPzFDwK8bGA/bF+WKQ77KbEcsWt6kL1Y62J0fDPjq+gGqJc6PNLxw0dE3EAvO0y9
 tSJddHNzXGvk7tvTSH6hS6Q2R9n9M8WX3U9aiRmx+lb0rxNff7unYXEQMyxBJwloH4
 uM6dINpLi9S+swiq7F2GcXvwfUBBr9z3gsZy6AMYPTqCqSf4pdQt61tW6wvbrLnyfc
 nDE9ayNZm+MAw==
Received: by mail-ej1-f47.google.com with SMTP id dp20so1807467ejc.7;
 Wed, 14 Jul 2021 07:35:49 -0700 (PDT)
X-Gm-Message-State: AOAM532nHlTShB5FLQ7rTyVnTib+iZd914tI6t5BVGsdah+fZtTwJrLW
 pnZZ+QBpi9/AT5JRYi1SmL2zKTDbv6ZLewAEPg==
X-Google-Smtp-Source: ABdhPJymfAgJfY2wCBGWNtXmuwg4agIU3K1RR96RYccGqz81ewoSZFhIn4O5wGRSm5qYhoaOeb28aOuzSwDvWj0M0Wc=
X-Received: by 2002:a17:906:aaca:: with SMTP id
 kt10mr12662752ejb.127.1626273348048; 
 Wed, 14 Jul 2021 07:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <20210710113819.5170-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20210710113819.5170-8-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Jul 2021 22:35:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LW0VSLL7P2qWOWngPF36FzzJvhdk6_0wGvkaWH3R1ZA@mail.gmail.com>
Message-ID: <CAAOTY_8LW0VSLL7P2qWOWngPF36FzzJvhdk6_0wGvkaWH3R1ZA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] drm/mediatek: add mediatek-drm of vdosys0 support
 for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, fshao@google.com, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_073550_384231_17B0BD71 
X-CRM114-Status: GOOD (  15.46  )
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
MjAyMeW5tDfmnIgxMOaXpSDpgLHlha0g5LiL5Y2INzozOOWvq+mBk++8mgo+Cj4gQWRkIGRyaXZl
ciBkYXRhIG9mIG10ODE5NSB2ZG9zeXMwIHRvIG1lZGlhdGVrLWRybSBhbmQgdGhlIHN1YiBkcml2
ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMg
fCAgNiArKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICB8
IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3BfcmRtYS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+IGlu
ZGV4IDcyOGFhYWRmZWE4Yy4uMDBlOTgyN2FjZWZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gQEAgLTM1NSw2ICszNTUsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2RhdGEgbXQ4MTgzX3JkbWFfZHJpdmVyX2RhdGEgPSB7Cj4g
ICAgICAgICAuZmlmb19zaXplID0gNSAqIFNaXzFLLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2Rpc3BfcmRtYV9kYXRhIG10ODE5NV9yZG1hX2RyaXZlcl9kYXRhID0gewo+ICsg
ICAgICAgLmZpZm9fc2l6ZSA9IDE5MjAsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBtdGtfZGlzcF9yZG1hX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ICAgICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1yZG1hIiwKPiAgICAgICAg
ICAgLmRhdGEgPSAmbXQyNzAxX3JkbWFfZHJpdmVyX2RhdGF9LAo+IEBAIC0zNjIsNiArMzY2LDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2Rpc3BfcmRtYV9kcml2ZXJf
ZHRfbWF0Y2hbXSA9IHsKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX3JkbWFfZHJpdmVyX2Rh
dGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1yZG1h
IiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTgzX3JkbWFfZHJpdmVyX2RhdGF9LAo+ICsgICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1yZG1hIiwKPiArICAgICAg
ICAgLmRhdGEgPSAmbXQ4MTk1X3JkbWFfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAge30sCj4gIH07
Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19kaXNwX3JkbWFfZHJpdmVyX2R0X21hdGNo
KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IGluZGV4IGI0NmJkYjg5
ODVkYS4uZDZmNmQxYmRhZDg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMKPiBAQCAtMTQ3LDYgKzE0NywxOSBAQCBzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2Nv
bXBfaWQgbXQ4MTgzX210a19kZHBfZXh0W10gPSB7Cj4gICAgICAgICBERFBfQ09NUE9ORU5UX0RQ
STAsCj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IGVudW0gbXRrX2RkcF9jb21wX2lkIG10ODE5NV9t
dGtfZGRwX21haW5bXSA9IHsKPiArICAgICAgIEREUF9DT01QT05FTlRfT1ZMMCwKPiArICAgICAg
IEREUF9DT01QT05FTlRfUkRNQTAsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX0NPTE9SMCwKPiAr
ICAgICAgIEREUF9DT01QT05FTlRfQ0NPUlIsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX0FBTDAs
Cj4gKyAgICAgICBERFBfQ09NUE9ORU5UX0dBTU1BLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9E
SVRIRVIsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX0RTQzAsCj4gKyAgICAgICBERFBfQ09NUE9O
RU5UX01FUkdFMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfRFBfSU5URjAsCgpXaGVyZSBpcyB0
aGUgZHBfaW50ZiBkcml2ZXIgaW4gdGhpcyBzZXJpZXM/CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoK
PiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10
MjcwMV9tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5tYWluX3BhdGggPSBtdDI3MDFf
bXRrX2RkcF9tYWluLAo+ICAgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDI3MDFfbXRr
X2RkcF9tYWluKSwKPiBAQCAtMTg2LDYgKzE5OSwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxODNfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAg
ICAuZXh0X2xlbiA9IEFSUkFZX1NJWkUobXQ4MTgzX210a19kZHBfZXh0KSwKPiAgfTsKPgo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxOTVfdmRvc3lzMF9k
cml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5tYWluX3BhdGggPSBtdDgxOTVfbXRrX2RkcF9tYWlu
LAo+ICsgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDgxOTVfbXRrX2RkcF9tYWluKSwK
PiArfTsKPiArCj4gIHN0YXRpYyBpbnQgbXRrX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RybV9wcml2YXRlICpwcml2YXRlID0g
ZHJtLT5kZXZfcHJpdmF0ZTsKPiBAQCAtNDEwLDYgKzQyOCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG10a19kZHBfY29tcF9kdF9pZHNbXSA9IHsKPiAgICAgICAgICAgLmRh
dGEgPSAodm9pZCAqKU1US19ESVNQX1JETUEgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTgzLWRpc3AtcmRtYSIsCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilN
VEtfRElTUF9SRE1BIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5
NS1kaXNwLXJkbWEiLAo+ICsgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfUkRNQSB9
LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC13ZG1hIiwK
PiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX1dETUEgfSwKPiAgICAgICAgIHsg
LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRpc3AtY2NvcnIiLAo+IEBAIC00NDgsNiAr
NDY4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RkcF9jb21wX2R0
X2lkc1tdID0gewo+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfTVVURVggfSwK
PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRpc3AtbXV0ZXgiLAo+
ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfTVVURVggfSwKPiArICAgICAgIHsg
LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtbXV0ZXgiLAo+ICsgICAgICAgICAu
ZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfTVVURVggfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQyNzAxLWRpc3AtcHdtIiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAq
KU1US19ESVNQX0JMUyB9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
NzMtZGlzcC1wd20iLAo+IEBAIC00NjgsNiArNDkwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbXRrX2RybV9vZl9pZHNbXSA9IHsKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4
MTczX21tc3lzX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTgzLW1tc3lzIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTgzX21tc3lzX2RyaXZl
cl9kYXRhfSwKPiArICAgICAgIHsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtdmRvc3lz
MCIsCj4gKyAgICAgICAgIC5kYXRhID0gJm10ODE5NV92ZG9zeXMwX2RyaXZlcl9kYXRhfSwKPiAg
ICAgICAgIHsgfQo+ICB9Owo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfZHJtX29mX2lk
cyk7Cj4gLS0KPiAyLjE4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
