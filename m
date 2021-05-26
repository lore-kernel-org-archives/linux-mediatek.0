Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE7DC4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 00:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900A261429
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 00:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900A261429
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRZWXwK6ZIcl/Fi18C73dNkDFHglh1+U40ImMuXaa9c=; b=RJTruTwylLI16f
	kQGaWuTpucUHFPjXZ7kGm1rKZ7ceYZIS/LtYemHx7o+6aEJ8iE2P4oJMUouJorpIZP2P51g4BKd/A
	dI6bHQej2Xz1/nV+cPDDQSWrVbJIIZZN2plhsn+CisFATmVnwtEcLsADC/Kr1prSYql+0eeDv9OtF
	UEGxtbN7sD3XqxsZUSU0vdLgI4HwtBQ6zUHGOL5MJ86s9AToLhGWCiTLTR+qpRE2qHXDUeNOH+veG
	PmHmH9xyMfRypyNVCp7AXCu5lYaEwLqqjgOOAtwNCmChh5ekmc+uwB5fNKXcyM8TPzTPtWrzENVGN
	2PTCNu9XzisEmPeAc4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llhYt-009XQP-DV; Wed, 26 May 2021 00:38:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llhYf-009XL1-3D; Wed, 26 May 2021 00:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Ab9JQbg9jDzcFBKqs/pgF8X/X6FHmTnIekCbQ6jdbFw=; b=oIFcjvHRQ0UumqIPLnw9G7AClu
 D5uNnulAK+4PjMQJFRLYzeI0sgPlNk852xQksVA9Zlncy8ptayH+F0Blus2+UKxcmRcAeOPEleq/i
 enMWVTT3/7DXYh8/F6aSTNVbxEQNsLoyXFtlAG3jApdWrp74LrDqcy/SbZxq3OSa7HzBqhJZ2gsP5
 UTTYQtMmb3T0MNaZu4NSmYmIRPOn3paugj8Adm1WyB+1rrf84qDn2lYXTiA2fm4Ht48Iwa9vdtiq9
 jX0wyNcxmMc6T7zFCX9sTmwgpZgBMFEvChEQWEpOKYRH1D4UpITKOvaNnLomr6t7MClnPsjTRzynL
 RXfqTGKw==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llgzC-000O9m-QG; Wed, 26 May 2021 00:01:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB8B26142C;
 Wed, 26 May 2021 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621987283;
 bh=cMM7Bk50oz+P2FRsUKDbD7UktmnSmO7vUpLohfS5wTI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hDpQBCLj+QP9gqGVupCLadKq5svYg3I4rmWyMW7TxUaSHQ78Y7UWwGBra3RQvUl0r
 joGOn/Q2fHAhfFy/BS3KGwz959mnCOySCLMfhjeItWZmltokLa9n9qOsj9bfq6bAEh
 7NwR7C7Pfdx82TF4rd687hR2/rSlthcAheqSW9bI0tn3HP36G9kvuFxJMSgrMZSRWB
 c1Zz0+Ze9tyYBE6KkIL55QxgbmJUo0fT2GCzkseLOzhABZhaD3mqkzYyIxUm256w8a
 6lBFDegViAn5GEkazAN5c5H2NIUjO0+dhRZyaUmSWlKOT9CZjwOF7PdzljqzN5H4bO
 szodhiBh/7XXA==
Received: by mail-ed1-f41.google.com with SMTP id w12so30549783edx.1;
 Tue, 25 May 2021 17:01:23 -0700 (PDT)
X-Gm-Message-State: AOAM530FzdlY0hHBxx3eMbzsq8dXCuCTt/ARpvCszyvEt4VLOkF2QhLx
 Nhc+S97s/wndmNiwh0C28hZO71qCbAAi4UFFdw==
X-Google-Smtp-Source: ABdhPJy1oDnaYpLU8X/cl7NIOPaEIw45IshBooChnuh12l1QRQ8hL/Z2puieZJQRDPdggduT1yMK61LXcza2N49AtaQ=
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr34605470edc.38.1621987282361; 
 Tue, 25 May 2021 17:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210525121448.30075-1-rex-bc.chen@mediatek.com>
 <20210525121448.30075-2-rex-bc.chen@mediatek.com>
In-Reply-To: <20210525121448.30075-2-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 May 2021 08:01:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY__aasihVxC72f7b_R-=UcR85Z1G9M8TxUS9dBrad-aRxQ@mail.gmail.com>
Message-ID: <CAAOTY__aasihVxC72f7b_R-=UcR85Z1G9M8TxUS9dBrad-aRxQ@mail.gmail.com>
Subject: Re: [v4,PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_010130_870293_0EEF6CAE 
X-CRM114-Status: GOOD (  20.03  )
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

SGksIFJleDoKClJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+IOaWvCAyMDIx
5bm0NeaciDI15pelIOmAseS6jCDkuIvljYg4OjE15a+r6YGT77yaCj4KPiBEUEkgY2FuIHNhbXBs
ZSBvbiBmYWxsaW5nLCByaXNpbmcgb3IgYm90aCBlZGdlLgo+IFdoZW4gRFBJIHNhbXBsZSB0aGUg
ZGF0YSBib3RoIHJpc2luZyBhbmQgZmFsbGluZyBlZGdlLgo+IEl0IGNhbiByZWR1Y2UgaGFsZiBk
YXRhIGlvIHBpbnMuCj4gVXNlIG51bV9vdXRwdXRfZm10cyB0byBkZXRlcm1pbmUgd2hldGhlciBp
dCBpcyBkdWFsIGVkZ2UgbW9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8u
c2hpQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNo
ZW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
aS5jIHwgMTcgKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGlu
ZGV4IGJlYTkxYzgxNjI2ZS4uZDNiODgzYzk3YWFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jCj4gQEAgLTgzLDYgKzgzLDcgQEAgc3RydWN0IG10a19kcGkgewo+ICAgICAgICAg
c3RydWN0IHBpbmN0cmwgKnBpbmN0cmw7Cj4gICAgICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAq
cGluc19ncGlvOwo+ICAgICAgICAgc3RydWN0IHBpbmN0cmxfc3RhdGUgKnBpbnNfZHBpOwo+ICsg
ICAgICAgYm9vbCBkZHJfZWRnZV9zZWw7CgpJIHdvdWxkIGxpa2UgdG8ga2VlcCBvdXRwdXRfZm10
IGluc3RlYWQgb2YgZGRyX2VkZ2Vfc2VsLgpJbml0aWFsaXplIG91dHB1dF9mbXQgdG8gTUVESUFf
QlVTX0ZNVF9SR0I4ODhfMVgyNCBpbiB0aGlzIHBhdGNoLgoKPiAgICAgICAgIGludCByZWZjb3Vu
dDsKPiAgfTsKPgo+IEBAIC0xMjIsNiArMTIzLDggQEAgc3RydWN0IG10a19kcGlfY29uZiB7Cj4g
ICAgICAgICB1MzIgcmVnX2hfZnJlX2NvbjsKPiAgICAgICAgIHUzMiBtYXhfY2xvY2tfa2h6Owo+
ICAgICAgICAgYm9vbCBlZGdlX3NlbF9lbjsKPiArICAgICAgIGNvbnN0IHUzMiAqb3V0cHV0X2Zt
dHM7Cj4gKyAgICAgICB1MzIgbnVtX291dHB1dF9mbXRzOwoKTW92ZSB0aGVzZSB0byBuZXh0IHBh
dGNoLgoKPiAgfTsKPgo+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX21hc2soc3RydWN0IG10a19kcGkg
KmRwaSwgdTMyIG9mZnNldCwgdTMyIHZhbCwgdTMyIG1hc2spCj4gQEAgLTM4MSw2ICszODQsMTYg
QEAgc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdfY29sb3JfZm9ybWF0KHN0cnVjdCBtdGtfZHBp
ICpkcGksCj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBtdGtfZHBpX2R1YWxfZWRn
ZShzdHJ1Y3QgbXRrX2RwaSAqZHBpKQo+ICt7Cj4gKyAgICAgICBpZiAoZHBpLT5jb25mLT5udW1f
b3V0cHV0X2ZtdHMgPiAxKSB7Cj4gKyAgICAgICAgICAgICAgIG10a19kcGlfbWFzayhkcGksIERQ
SV9ERFJfU0VUVElORywgRERSX0VOIHwgRERSXzRQSEFTRSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEREUl9FTiB8IEREUl80UEhBU0UpOwo+ICsgICAgICAgICAgICAgICBtdGtfZHBp
X21hc2soZHBpLCBEUElfT1VUUFVUX1NFVFRJTkcsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkcGktPmRkcl9lZGdlX3NlbCA/IEVER0VfU0VMIDogMCwgRURHRV9TRUwpOwo+ICsgICAg
ICAgfQoKaWYgKGRwaS0+b3V0cHV0X2ZtdCA9PSBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0xF
KSB8fAogICAoZHBpLT5vdXRwdXRfZm10ID09IE1FRElBX0JVU19GTVRfUkdCODg4XzJYMTJfQkUp
IHsKICAgIG10a19kcGlfbWFzayhkcGksIERQSV9ERFJfU0VUVElORywgRERSX0VOIHwgRERSXzRQ
SEFTRSwgRERSX0VOIHwKRERSXzRQSEFTRSk7CiAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfT1VU
UFVUX1NFVFRJTkcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHBpLT5vdXRwdXRfZm10
ID09Ck1FRElBX0JVU19GTVRfUkdCODg4XzJYMTJfTEUgPyBFREdFX1NFTCA6IDAsIEVER0VfU0VM
KTsKfSBlbHNlIHsKICAgIG10a19kcGlfbWFzayhkcGksIERQSV9ERFJfU0VUVElORywgRERSX0VO
IHwgRERSXzRQSEFTRSwgMCk7Cn0KCj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG10a19kcGlfcG93
ZXJfb2ZmKHN0cnVjdCBtdGtfZHBpICpkcGkpCj4gIHsKPiAgICAgICAgIGlmIChXQVJOX09OKGRw
aS0+cmVmY291bnQgPT0gMCkpCj4gQEAgLTQ1NSw3ICs0NjgsOCBAQCBzdGF0aWMgaW50IG10a19k
cGlfc2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+ICAgICAgICAgcGxsX3Jh
dGUgPSBjbGtfZ2V0X3JhdGUoZHBpLT50dmRfY2xrKTsKPgo+ICAgICAgICAgdm0ucGl4ZWxjbG9j
ayA9IHBsbF9yYXRlIC8gZmFjdG9yOwo+IC0gICAgICAgY2xrX3NldF9yYXRlKGRwaS0+cGl4ZWxf
Y2xrLCB2bS5waXhlbGNsb2NrKTsKPiArICAgICAgIGNsa19zZXRfcmF0ZShkcGktPnBpeGVsX2Ns
aywKPiArICAgICAgICAgICAgICAgICAgICB2bS5waXhlbGNsb2NrICogKChkcGktPmNvbmYtPm51
bV9vdXRwdXRfZm10cyA+IDEpID8gMiA6IDEpKTsKCmlmIChkcGktPm91dHB1dF9mbXQgPT0gTUVE
SUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9MRSkgfHwKICAgKGRwaS0+b3V0cHV0X2ZtdCA9PSBNRURJ
QV9CVVNfRk1UX1JHQjg4OF8yWDEyX0JFKQogICAgY2xrX3NldF9yYXRlKGRwaS0+cGl4ZWxfY2xr
LCB2bS5waXhlbGNsb2NrICogMik7CmVsc2UKICAgIGNsa19zZXRfcmF0ZShkcGktPnBpeGVsX2Ns
aywgdm0ucGl4ZWxjbG9jayk7Cgo+ICAgICAgICAgdm0ucGl4ZWxjbG9jayA9IGNsa19nZXRfcmF0
ZShkcGktPnBpeGVsX2Nsayk7Cj4KPiAgICAgICAgIGRldl9kYmcoZHBpLT5kZXYsICJHb3QgIFBM
TCAlbHUgSHosIHBpeGVsIGNsb2NrICVsdSBIelxuIiwKPiBAQCAtNTE5LDYgKzUzMyw3IEBAIHN0
YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCj4g
ICAgICAgICBtdGtfZHBpX2NvbmZpZ195Y19tYXAoZHBpLCBkcGktPnljX21hcCk7Cj4gICAgICAg
ICBtdGtfZHBpX2NvbmZpZ19jb2xvcl9mb3JtYXQoZHBpLCBkcGktPmNvbG9yX2Zvcm1hdCk7Cj4g
ICAgICAgICBtdGtfZHBpX2NvbmZpZ18ybl9oX2ZyZShkcGkpOwo+ICsgICAgICAgbXRrX2RwaV9k
dWFsX2VkZ2UoZHBpKTsKPiAgICAgICAgIG10a19kcGlfY29uZmlnX2Rpc2FibGVfZWRnZShkcGkp
Owo+ICAgICAgICAgbXRrX2RwaV9zd19yZXNldChkcGksIGZhbHNlKTsKPgo+IC0tCj4gMi4xOC4w
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
