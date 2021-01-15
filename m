Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5D2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 03:55:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5F923B09
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 03:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5F923B09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TbuaGAJRRtTn7ppAS8iu36oWWMGShCnjWnBIIhGMoYg=; b=j1s1E6VlofXnXfrytIW4mUNfY
	VPGx7xI1Za5XxmhhfBY5kVhFOxTXRr+6X7nk3I8iBe1YCwbz7G4L7KwHnOVwc2jtP7aISC8qvlebb
	tMErKknRBLIgvjpY5wN8ToeS2eiTHyD9ibcdUXvW1vjOQF+jPOM9GaGL1G1SXRuE/lfqsEDluaari
	7HMF8uWfF8t51uep2nFVB2T9P3U4MQHvSMxos9QJDEiKtAO+wq0U57A0QbTVxmUlqrJLClcrfSQNF
	pL//hYEqlOp9llRhgg/MdS/r06DiEyIJEeaV+d1OTqUdR1ZULb0TsmsjdXjmzUXz9+WlhelouTG5/
	0PAQ7aviQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0GCk-00062h-S4; Fri, 15 Jan 2021 03:55:18 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0GCh-00061b-9C; Fri, 15 Jan 2021 03:55:16 +0000
Received: by mail-ot1-x32f.google.com with SMTP id o11so7373229ote.4;
 Thu, 14 Jan 2021 19:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P1pE3SlC44ai1ckIdueI94VlVgFy9zu5zhNWEKBjxuQ=;
 b=Tg1Uvl8gK/EKXgNwP6EqowAB4+ptGN9J8bRToi75GZ9OVHhY+DNTjWDgSnLve60V1W
 p4SBj67qBAcI5V7c1ECEXI9BADrVtA/kqdWUZ8wrmvkZLq80wPK1P9aOcxi9jP+t1o1Y
 KJr9TmA3Emi2eYjvaTNmfYa78wa2J7E/MtSKH1w0D1ZFiY9+trEAB+Lk/sB78j34+U6Q
 QByhUNBgx9QoaEVsdVJXJ9oc7L+Wzpj2rRZf3GGKLUd6e994kaH+aTmFouM/T+5YkMor
 B9vA+ZyssFr4nIV+q9jMInF47uDkXYY8FgOjmCO1Gda/s+Pg2GpJG7kq0nmsH76Du8lk
 AUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P1pE3SlC44ai1ckIdueI94VlVgFy9zu5zhNWEKBjxuQ=;
 b=Lv3B5uMyZFCKLdTN2r5x+enYGHnF8zwFtPfaumXoMSX/xkYBSoKDze6xPgc6TSQy05
 DMM3D9aDNS+j77tjHCQ/VsWgzzoB2bqH54AUsBecxhgkXqIrA9PUUbNlGcB6lPz2RTDL
 irtbWWnqEIvoRe3YrQn+HRfXVdcWxs1Nwvz0q0uIEpj/ZU4SmwYl4EkdKnkFPD9XTxc+
 +NzZAFshbvFPpXmQuM6AqqKjyMt+RhYVwGgrWImaqD8UDK6+kfzyO76DiGCaSMSDmNpp
 tFOrT7RXd9eU/04S6zGxMpub7L0O00aBNNe0pOP63dsy+VHPLModqe7jXH4GHJ/UmXrC
 ifNw==
X-Gm-Message-State: AOAM533lszAUAsQvNjnr4uRYW9iS3HOytlqmr15Vs5yU7k6fUn3Efqri
 LToy41k9e5zbkTevI6YNEwK1Cf7HpmHz2Wxyfag=
X-Google-Smtp-Source: ABdhPJycmwChvFy+e4H9mlLdITjI5zgt1vFrzcRWChV7FXDg5tJwdGl+uV3O3z94glc+CC6FWc8S3nIDWhJ/O4Ph/I0=
X-Received: by 2002:a05:6830:160f:: with SMTP id
 g15mr6975275otr.129.1610682911620; 
 Thu, 14 Jan 2021 19:55:11 -0800 (PST)
MIME-Version: 1.0
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
In-Reply-To: <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 15 Jan 2021 11:55:00 +0800
Message-ID: <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_225515_347676_4117E577 
X-CRM114-Status: GOOD (  16.19  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 linux-pm@vger.kernel.org, sre@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8IDIwMjHlubQx5pyI
MTLml6Ug6YCx5LqMIOS4i+WNiDg6MzLlr6vpgZPvvJoKPgo+Cj4KPiBPbiAxMi8xMS8yMDIwIDEx
OjM5LCBHZW5lIENoZW4gd3JvdGU6Cj4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNo
dGVrLmNvbT4KPiA+Cj4gPiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNvdXJjZXMgaW50byBt
dDYzNjAgcmVndWxhdG9yIHJlc291cmNlcwo+ID4gdG8gc2ltcGxpZnkgdGhlIHNpbWlsYXIgcmVz
b3VyY2VzIG9iamVjdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hl
bkByaWNodGVrLmNvbT4KPiA+IEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwgMTEg
KysrLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIv
ZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gaW5kZXggNjkyZTQ3Yi4uNTExOWU1MSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
bWZkL210NjM2MC1jb3JlLmMKPiA+IEBAIC0yNjUsNyArMjY1LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCByZXNvdXJjZSBtdDYzNjBfbGVkX3Jlc291cmNlc1tdID0gewo+ID4gICAgICAgREVGSU5F
X1JFU19JUlFfTkFNRUQoTVQ2MzYwX0ZMRUQxX1NUUkJfVE9fRVZULCAiZmxlZDFfc3RyYl90b19l
dnQiKSwKPiA+ICB9Owo+ID4KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2
MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2Ug
bXQ2MzYwX3JlZ3VsYXRvcl9yZXNvdXJjZXNbXSA9IHsKPiA+ICAgICAgIERFRklORV9SRVNfSVJR
X05BTUVEKE1UNjM2MF9CVUNLMV9QR0JfRVZULCAiYnVjazFfcGdiX2V2dCIpLAo+ID4gICAgICAg
REVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09DX0VWVCwgImJ1Y2sxX29jX2V2dCIp
LAo+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09WX0VWVCwgImJ1
Y2sxX292X2V2dCIpLAo+ID4gQEAgLTI3OCw5ICsyNzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHJlc291cmNlIG10NjM2MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4gICAgICAgREVGSU5FX1JF
U19JUlFfTkFNRUQoTVQ2MzYwX0xETzdfT0NfRVZULCAibGRvN19vY19ldnQiKSwKPiA+ICAgICAg
IERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE82X1BHQl9FVlQsICJsZG82X3BnYl9ldnQi
KSwKPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X1BHQl9FVlQsICJs
ZG83X3BnYl9ldnQiKSwKPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVz
b3VyY2UgbXQ2MzYwX2xkb19yZXNvdXJjZXNbXSA9IHsKPiA+ICAgICAgIERFRklORV9SRVNfSVJR
X05BTUVEKE1UNjM2MF9MRE8xX09DX0VWVCwgImxkbzFfb2NfZXZ0IiksCj4gPiAgICAgICBERUZJ
TkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPMl9PQ19FVlQsICJsZG8yX29jX2V2dCIpLAo+ID4g
ICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzNfT0NfRVZULCAibGRvM19vY19l
dnQiKSwKPiA+IEBAIC0yOTgsMTAgKzI5NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2Nl
bGwgbXQ2MzYwX2RldnNbXSA9IHsKPiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJt
ZWRpYXRlayxtdDYzNjAtY2hnIiksCj4gPiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLWxlZCIs
IG10NjM2MF9sZWRfcmVzb3VyY2VzLAo+ID4gICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwg
Im1lZGlhdGVrLG10NjM2MC1sZWQiKSwKPiA+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcG1p
YyIsIG10NjM2MF9wbWljX3Jlc291cmNlcywKPiA+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAs
IDAsICJtZWRpYXRlayxtdDYzNjAtcG1pYyIpLAo+ID4gLSAgICAgT0ZfTUZEX0NFTEwoIm10NjM2
MC1sZG8iLCBtdDYzNjBfbGRvX3Jlc291cmNlcywKPiA+IC0gICAgICAgICAgICAgICAgIE5VTEws
IDAsIDAsICJtZWRpYXRlayxtdDYzNjAtbGRvIiksCj4gPiArICAgICBPRl9NRkRfQ0VMTCgibXQ2
MzYwLXJlZ3VsYXRvciIsIG10NjM2MF9yZWd1bGF0b3JfcmVzb3VyY2VzLAo+ID4gKyAgICAgICAg
ICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IiKSwKPgo+IEFz
IGRpc2N1c3NlZCB3aXRoIHRoZSBNRkQgbWFpbnRhaW5lciBbMV0sIHRoZSByZWd1bGF0b3IgKGFu
ZCBwcm9iYWJseSBhbGwgY2VsbHMpCj4gc2hvdWxkbid0IGhhdmUgYSBEVCBiaW5kaW5nLgo+Cj4g
U28gcGxlYXNlIHNlbmQgYSBuZXcgdmVyc2lvbiB3aGljaCBmaXhlcyB0aGF0Lgo+Cj4gUmVnYXJk
cywKPiBNYXR0aGlhcwo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlh
dGVrLzIwMjEwMTExMTY0MTE4LkdFNDcyOEBzaXJlbmEub3JnLnVrLwo+CgpTaG91bGQgSSB1c2Ug
cGFyZW50J3MgZGV2aWNlIHRvIGZpbmQgc3ViLWRldmljZXMgb2Zfbm9kZSBpZiB3aXRob3V0CmNv
bXBhdGlibGUgbmFtZT8KSSB0cmFjZSB0aGUgZnVuY3Rpb24gbWZkX2FkZF9kZXZpY2UsCgppZiAo
SVNfRU5BQkxFRChDT05GSUdfT0YpICYmIHBhcmVudC0+b2Zfbm9kZSAmJiBjZWxsLT5vZl9jb21w
YXRpYmxlKSB7CiAgICAuLi4uLgogICAgcmV0ID0gbWZkX21hdGNoX29mX25vZGVfdG9fZGV2KHBk
ZXYsIG5wLCBjZWxsKTsKICAgIC4uLi4uCn0KCndoaWNoIGlzIGJpbmRpbmcgbWZkIHN1Yi1kZXZp
Y2Ugd2l0aCBjb21wYXRpYmxlLiBEb2VzIGl0IGJlIHJlbW92ZWQgaW4KdGhlIGZlYXR1cmU/Cgo+
ID4gICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC10Y3BjIiwgTlVMTCwKPiA+ICAgICAgICAgICAg
ICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtdGNwYyIpLAo+ID4gIH07Cj4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
