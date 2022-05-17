Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95997C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlwgjumrQvWBgwTyw/Fesa0eTVSM1uwrZX08jEb4sAo=; b=ySSaKFf1kg9vOG
	NryNmr+/CWMzCMTY8RPV/eou4VVuIqSRJGsoOYPF1euEQUztKz0Vya3TZm+qZcpmMIJ40kTUamnAX
	NsDjyL9iCE4lt8I3SW9gKde0V1qzA2Jmr0m8JBhXhiV/9pFJSF6Tt3cDW9MCvLoe6H9cYoiGEAZ5M
	AGuqj61CLmkPDHeBx7FIsizPTKYHHy7FIrdsOr1I/nk5YCovj7Hn63qeryGeLcRUVry2950LWuFcu
	UQA79nYiBOa60/Zt3lf1UcAMAY4jUKaCt0bR2pLKwE0g27GJYeu5Kt2IMKI1IX5a33J09/fAdoZsI
	PfZImBw3p3gBLYiOxbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtMK-00Chnv-TB; Tue, 17 May 2022 09:19:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtM3-00Cheo-3M; Tue, 17 May 2022 09:19:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso1007165wmh.2; 
 Tue, 17 May 2022 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dF32UB4o24SEGA28gcaOp4TCwrJXmpV9PUTvVLdg0J4=;
 b=BZwlrbpmJ8zOdGxjTeCtczfI1ZQYklBVK8c74MaVj1WY7Y9o4Aqd5kP2tukaQ//Ajn
 L9FoT95VSj7Sz1ZIjxgaID8c7SLDINhsjeco4wxhWbi9KlANWpFAiaNajD4UnlSPvANy
 GixXJY6sCLTLXVIMJLw82bL8A4Q1zlgGWikn8SRbn4R0BgaFXxzvHEcr5q4trKK+xo9K
 zyi8q1Gtzgm42QpK2FUXsRx8F/lGCaAu4zLfURfBL2odsfy3MjAMKAxGsluxwPaH9/Yd
 kuZQfnCpfsyXZkoOfnEy930Zh+sTpqqmCoCHhAvE6I/iExZzyWApPBnrw1gZYJXDMwTk
 5LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dF32UB4o24SEGA28gcaOp4TCwrJXmpV9PUTvVLdg0J4=;
 b=S/pPgsECB2I0vm+tAnSTUPtxngKGJbx1h56PDpLeaTB3REx5mPQIHgtvXF24Wkf+MT
 rvPMoJjM6jaI4EdxnfTNEj3JMHGArR2swiSzA5As8wLZdurwWws9KgaeM+ONhulzUe3l
 SQQegnPziFtt+nFswuQhP3M6UYbsRDyhtREU9R2a6yXJEgTbuIfZLiYdERKpyhBL1Iy1
 XILxic3SPA3ZjS5sotAUaL1DyjMlV8eqdKEVgX1ysQgaavTJwbKwP21azwpeeCsqrbrf
 erB4rGtTxdIWwJuxW7mBDmY5m+aNpl/ug3vrL+72TJb6Ix2pg03rb93RwotaSpyVysi0
 Iplg==
X-Gm-Message-State: AOAM531ozFuLiJS6Yer3/px+m1VMeYz+gJOeL6ihGfdN2PIf4JS2tajm
 +/Zpwt+gw9zOwoQo5wSJ0ug=
X-Google-Smtp-Source: ABdhPJz9/ND0sjG0FG/5GKRjuvvp1OlseQo5NsUhcDFerQCp7aM3NgAUNbyM6QtWMQSe0E0mLLpHDg==
X-Received: by 2002:a7b:ce8f:0:b0:394:46ae:549e with SMTP id
 q15-20020a7bce8f000000b0039446ae549emr20844385wmj.54.1652779136830; 
 Tue, 17 May 2022 02:18:56 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p26-20020adfa21a000000b0020c61af5e1fsm11469542wra.51.2022.05.17.02.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:18:56 -0700 (PDT)
Message-ID: <ad736290-2e01-f867-d2ec-867a4385005a@gmail.com>
Date: Tue, 17 May 2022 11:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/5] soc: mediatek: pwrap: Move and check return value
 of platform_get_irq()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
 <20220516124659.69484-4-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220516124659.69484-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_021859_200363_1A7BEED7 
X-CRM114-Status: GOOD (  23.31  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxNi8wNS8yMDIyIDE0OjQ2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
PiBNb3ZlIHRoZSBjYWxsIHRvIHBsYXRmb3JtX2dldF9pcnEoKSBlYXJsaWVyIGluIHRoZSBwcm9i
ZSBmdW5jdGlvbgo+IGFuZCBjaGVjayBmb3IgaXRzIHJldHVybiB2YWx1ZTogaWYgbm8gaW50ZXJy
dXB0IGlzIHNwZWNpZmllZCwgaXQKPiB3b3VsZG4ndCBtYWtlIHNlbnNlIHRvIHRyeSB0byBjYWxs
IGRldm1fcmVxdWVzdF9pcnEoKSBzbywgaW4gdGhhdAo+IGNhc2UsIHdlIGNhbiBzaW1wbHkgcmV0
dXJuIGVhcmx5Lgo+IAo+IE1vdmluZyB0aGUgcGxhdGZvcm1fZ2V0X2lycSgpIGNhbGwgYWxzbyBt
YWtlcyBpdCBwb3NzaWJsZSB0byB1c2UKPiBvbmUgbGVzcyBnb3RvLCBhcyBjbG9ja3MgYXJlbid0
IHJlcXVpcmVkIGF0IHRoYXQgc3RhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4K
PiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJv
cmEuY29tPgo+IFRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bj
b2xsYWJvcmEuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3Jh
cC5jIHwgNSArKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13
cmFwLmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13cmFwLmMKPiBpbmRleCA4NTI1
MTQzNjZmMWYuLjMzMmNiY2FiYzI5OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG1pYy13cmFwLmMKPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13
cmFwLmMKPiBAQCAtMjIwNCw2ICsyMjA0LDEwIEBAIHN0YXRpYyBpbnQgcHdyYXBfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlpZiAoIXdycCkKPiAgIAkJcmV0dXJuIC1F
Tk9NRU07Cj4gICAKPiArCWlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gKwlpZiAo
aXJxIDwgMCkKPiArCQlyZXR1cm4gaXJxOwo+ICsKPiAgIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCB3cnApOwo+ICAgCj4gICAJd3JwLT5tYXN0ZXIgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2Rh
dGEoJnBkZXYtPmRldik7Cj4gQEAgLTIzMTYsNyArMjMyMCw2IEBAIHN0YXRpYyBpbnQgcHdyYXBf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlpZiAoSEFTX0NBUCh3cnAt
Pm1hc3Rlci0+Y2FwcywgUFdSQVBfQ0FQX0lOVDFfRU4pKQo+ICAgCQlwd3JhcF93cml0ZWwod3Jw
LCB3cnAtPm1hc3Rlci0+aW50MV9lbl9hbGwsIFBXUkFQX0lOVDFfRU4pOwo+ICAgCj4gLQlpcnEg
PSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwoKRm9yIGJldHRlciByZWFkYWJpbGl0eSBvZiB0
aGUgY29kZSBJJ2QgcHJlZmVyIHRvIGtlZXAgcGxhdGZvcm1fZ2V0X2lycSBuZXh0IHRvIApkZXZt
X3JlcXVlc3RfaXJxLiBJIHVuZGVyc3RhbmQgdGhhdCB5b3UgZGlkIHRoaXMgY2hhbmdlIHNvIHRo
YXQgeW91IGRvbid0IGhhdmUgCnRvIGNvZGUKaWYgKGlycSA8IDApIHsKICAgICByZXQgPSBpcnE7
CiAgICAgZ290byBlcnJfb3V0MjsKfQoKT3IgZG8gSSBtaXNzIHNvbWV0aGluZz8KClJlZ2FyZHMs
Ck1hdHRoaWFzCgo+ICAgCXJldCA9IGRldm1fcmVxdWVzdF9pcnEod3JwLT5kZXYsIGlycSwgcHdy
YXBfaW50ZXJydXB0LAo+ICAgCQkJICAgICAgIElSUUZfVFJJR0dFUl9ISUdILAo+ICAgCQkJICAg
ICAgICJtdC1wbWljLXB3cmFwIiwgd3JwKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
