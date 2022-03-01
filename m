Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00940C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Vs36oO4XHzZ/qnpuiNgINj4ZZDm/6JxT+tWy1MiEy0=; b=Cs2a3WjdqcR8dE
	VJTzXjh0Xp6iVgcv1hnf6shWqMYEFKfGbeXYkGzjaK3fP4BExhshrK13eHkiTK5lUngpXu/vV6X19
	okLdem7sPMFxGJWnzJlw6cMnJnvH5T/gq3UcrU4I6I2DW4qYmao07jHP6yvk8be9VeyPX2wvyhj4I
	hAfIeZWz4RTtBhIhwYci3L5WrSZ46aT1TVyVrF0yzoEeHDDZVF4AK9FXqwJil5C2kgI4HCYRN5Muz
	aLaLpSCYkGONp64StjKW9wi6cJr5CWkz/WED4eYQSi93uNfGCmsKvg4kzMadWnN/78zt9lDaUuWdm
	V1BbZp+DDMfwBoKaZUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP44i-00HCAG-LI; Tue, 01 Mar 2022 15:06:04 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP44V-00HC61-Fl; Tue, 01 Mar 2022 15:05:53 +0000
Received: by mail-io1-xd31.google.com with SMTP id w7so18745555ioj.5;
 Tue, 01 Mar 2022 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=areHjwPGysvnbpVsoZF0cOugapxK1lEU7HKcuamtX6A=;
 b=EaUBkMaCFPcg6U+e7c23GSkWJ4eH1sHMTGMDwmkv3QB82oNgy4lejCt7rL4mjzJXDF
 boNexuNCpsRRgnAd/AR0KQ0vW2vSrRz+DKXTlw3iEsiJbMVnNSxYvteKZvfew7qQU8yv
 RgxiyTFf0E4HYL3GToo1j959ePXo6fOoJZfBu+3tEMhr+7lhNpiYQbcr2c+HgvDEFWfF
 DhBvRx1zmhAmeK8xlcRD3gu9fmZ/S56DNAr8OYyfHfIrUdD1M63qLiRB+Rk0ZW+EAOFJ
 yLhhg4tQvojL6OcUr1otM7IJMa7QymNuD/SFSkY44/5aqa2z5AxbLh8k9RWjL8j6G4+O
 U6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=areHjwPGysvnbpVsoZF0cOugapxK1lEU7HKcuamtX6A=;
 b=f7agsANwYoBwOMRam10F+eortgzQWyKjQ3EySNckbUw5pzidMQ2KSUC6cRMFU4RBzf
 WunWAv85Jlio3q//hkRDhA0uzQDP7JlGmomNq/pJo8Yq5il+fVICwbXLcPJgl7BRGXIM
 NxIqUau03TjbtfW5TQpA+JfHnS7I+8/MEOLrqho+BqkCxUXGVOnywOIe8esZUyZyiCs5
 hYXG5QKx+nt7X06pswAzAvvOjmoyb0pSW8jOliK+O7N5WVMHn1OjAIcmutAjkJVVQlqE
 vtWQ6EWBBPLu9V6kbL+Pwguj0u2FWZablMq8Bvp83ZO+V5N0gz2CMULEuxZmSSkMl/xd
 VsQg==
X-Gm-Message-State: AOAM530AMsnk3yasn1xuoNZDkszrLUccojdy1kAhSYLZhZnSGB1mkLZ3
 HIMHuYNQzVzMyZG1/Dd7cQo=
X-Google-Smtp-Source: ABdhPJwj37UszmrmIB4PuYFunLQjI1+FU8E9Mpwr/V5LoHc7/9XbZGFWbQFfZ3mMIufS0LidoKD/qA==
X-Received: by 2002:a02:9686:0:b0:315:af6:b12 with SMTP id
 w6-20020a029686000000b003150af60b12mr22580563jai.214.1646147150112; 
 Tue, 01 Mar 2022 07:05:50 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a056e0206cd00b002c23c551420sm7793582ils.36.2022.03.01.07.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 07:05:49 -0800 (PST)
Message-ID: <b6cd9478-7493-3f8b-144d-9f38b3ec6bdc@gmail.com>
Date: Tue, 1 Mar 2022 16:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.18
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
In-Reply-To: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_070551_552513_EF25A6F7 
X-CRM114-Status: GOOD (  20.94  )
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

SGksCgpPbiAwMS8wMy8yMDIyIDEwOjM4LCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOgo+IEhpIE9s
b2YgYW5kIEFybmQsCj4gCj4gUGxlYXNlIGhhdmUgYSBsb29rIG9uIHRoZSBTb0MgZHJpdmVyIHVw
ZGF0ZXMgZm9yIHY1LjE4Lgo+IEFzIHlvdSBjYW4gc2VlLCB3ZSBnZXQgcXVpdGUgc29tZSBzdXBw
b3J0IGZvciBTb0MgZGV2aWNlcyBiYXNlZCBvbiBtdDgxODYuCj4gCgpVbmZvcnR1bmF0ZWx5IHRo
ZSBicmFuY2ggaGFzIHNvbWUgaXNzdWVzLiBQbGVhc2UgaWdub3JlIHRoaXMgcHVsbCByZXF1ZXN0
IGZvciBub3cuCgpJJ2xsIHNlbmQgYSBuZXcgb25lIGFzIHNvb24gYXMgcG9zc2libGUuCgpSZWdh
cmRzLApNYXR0aGlhcwoKPiBSZWdhcmRzLAo+IE1hdHRoaWFzCj4gCj4gLS0tCj4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBlNzgzMzYyZWI1NGNkOTliMmNhYzhiM2E5YWVhYzk0
MmU2ZjZhYzA3Ogo+IAo+ICDCoCBMaW51eCA1LjE3LXJjMSAoMjAyMi0wMS0yMyAxMDoxMjo1MyAr
MDIwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAg
wqAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWF0dGhp
YXMuYmdnL2xpbnV4LmdpdC8gCj4gdGFncy92NS4xNy1uZXh0LXNvYwo+IAo+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byBlYjFiMDJiZWY1MmFlNTQ1ZDVlYjI0MTE2ZDVjMDk5ZjczOGQz
OWQ1Ogo+IAo+ICDCoCBkdC1iaW5kaW5nczogYXJtOiBtZWRpYXRlazogbW1zeXM6IGFkZCBzdXBw
b3J0IGZvciBNVDgxODYgKDIwMjItMDMtMDEgCj4gMDk6MjY6NTYgKzAxMDApCj4gCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IC0gYWRkIHBvd2VyIGRvbWFpbnMgc3VwcG9ydCBmb3IgbXQ4MTk1Cj4gLSBkaXNhYmxlIEFD
UCBvbiBtdDgxOTIKPiAKPiBtdDgxODY6Cj4gLSBhZGQgc3VwcG9ydCBmb3IgcG93ZXIgZG9tYWlu
cwo+IC0gYWRkIG1tc3lzIGFuZCBtdXRleCBzdXBwb3J0IG5lZWRlZCBmb3IgRFJNCj4gLSBhZGQg
cmVzZXQgY29udHJvbCBiYXNlZCBvbiBtbXN5cyBzdWJzeXN0ZW0KPiAtIGFkZCBwbWljIHdyYXBw
ZXIKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gQWx5c3NhIFJvc2VuendlaWcgKDEpOgo+ICDCoMKgwqDCoMKgIHNv
YzogbWVkaWF0ZWs6IG10ay1pbmZyYWNmZzogRGlzYWJsZSBBQ1Agb24gTVQ4MTkyCj4gCj4gQ2h1
bi1KaWUgQ2hlbiAoNyk6Cj4gIMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHBvd2VyOiBBZGQgTVQ4
MTk1IHBvd2VyIGRvbWFpbnMKPiAgwqDCoMKgwqDCoCBzb2M6IG1lZGlhdGVrOiBwbS1kb21haW5z
OiBBZGQgd2FrZXVwIGNhcGFjaXR5IHN1cHBvcnQgaW4gcG93ZXIgZG9tYWluCj4gIMKgwqDCoMKg
wqAgc29jOiBtZWRpYXRlazogcG0tZG9tYWluczogUmVtb3ZlIHVudXNlZCBtYWNybwo+ICDCoMKg
wqDCoMKgIHNvYzogbWVkaWF0ZWs6IHBtLWRvbWFpbnM6IE1vdmUgcG93ZXIgc3RhdHVzIG9mZnNl
dCB0byBwb3dlciBkb21haW4gZGF0YQo+ICDCoMKgwqDCoMKgIHNvYzogbWVkaWF0ZWs6IHBtLWRv
bWFpbnM6IEFkZCBzdXBwb3J0IGZvciBtdDgxOTUKPiAgwqDCoMKgwqDCoCBkdC1iaW5kaW5nczog
cG93ZXI6IEFkZCBNVDgxODYgcG93ZXIgZG9tYWlucwo+ICDCoMKgwqDCoMKgIHNvYzogbWVkaWF0
ZWs6IHBtLWRvbWFpbnM6IEFkZCBzdXBwb3J0IGZvciBtdDgxODYKPiAKPiBKb2huc29uIFdhbmcg
KDIpOgo+ICDCoMKgwqDCoMKgIHNvYzogbWVkaWF0ZWs6IHB3cmFwOiBhZGQgcHdyYXAgZHJpdmVy
IGZvciBNVDgxODYgU29DCj4gIMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBhZGQg
Y29tcGF0aWJsZSBmb3IgTVQ4MTg2IHB3cmFwCj4gCj4gUmV4LUJDIENoZW4gKDIpOgo+ICDCoMKg
wqDCoMKgIHNvYzogbWVkaWF0ZWs6IG1tc3lzOiBhZGQgbW1zeXMgcmVzZXQgY29udHJvbCBmb3Ig
TVQ4MTg2Cj4gIMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IGFybTogbWVkaWF0ZWs6IG1tc3lzOiBh
ZGQgc3VwcG9ydCBmb3IgTVQ4MTg2Cj4gCj4gWW9uZ3FpYW5nIE5pdSAoMik6Cj4gIMKgwqDCoMKg
wqAgc29jOiBtZWRpYXRlazogbW1zeXM6IGFkZCBtdDgxODYgbW1zeXMgcm91dGluZyB0YWJsZQo+
ICDCoMKgwqDCoMKgIHNvYzogbWVkaWF0ZWs6IGFkZCBNVEsgbXV0ZXggc3VwcG9ydCBmb3IgTVQ4
MTg2Cj4gCj4gIMKgLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1s
wqDCoMKgwqDCoCB8wqDCoCAxICsKPiAgwqAuLi4vYmluZGluZ3MvcG93ZXIvbWVkaWF0ZWsscG93
ZXItY29udHJvbGxlci55YW1swqAgfMKgwqAgMyArCj4gIMKgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL21lZGlhdGVrL3B3cmFwLnR4dMKgwqDCoMKgIHzCoMKgIDEgKwo+ICDCoGRyaXZlcnMv
c29jL21lZGlhdGVrL210ODE2Ny1wbS1kb21haW5zLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MTYgKy0KPiAgwqBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxNzMtcG0tZG9tYWlucy5owqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIyICstCj4gIMKgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTgz
LXBtLWRvbWFpbnMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzMiArLQo+ICDCoGRyaXZlcnMv
c29jL21lZGlhdGVrL210ODE4Ni1tbXN5cy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMTE1ICsrKysKPiAgwqBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxODYtcG0tZG9tYWlucy5o
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzNDQgKysrKysrKysrKysrCj4gIMKgZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXQ4MTkyLXBtLWRvbWFpbnMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0NCAr
LQo+ICDCoGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE5NS1wbS1kb21haW5zLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDYxMyArKysrKysrKysrKysrKysrKysrKysKPiAgwqBkcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstaW5mcmFjZmcuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MTkgKwo+ICDCoGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMiArCj4gIMKgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLW11dGV4LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQ1ICsr
Cj4gIMKgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxNyArLQo+ICDCoGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1k
b21haW5zLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICstCj4gIMKgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNzEgKysrCj4gIMKgaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9tdDgxODYtcG93ZXIu
aMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzMiArKwo+ICDCoGluY2x1ZGUvZHQtYmluZGluZ3Mv
cG93ZXIvbXQ4MTk1LXBvd2VyLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNDYgKysKPiAgwqBp
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9pbmZyYWNmZy5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxMzMgKysrKysKPiAgwqAxOSBmaWxlcyBjaGFuZ2VkLCAxNTU5IGluc2VydGlvbnMo
KyksIDE1IGRlbGV0aW9ucygtKQo+ICDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdDgxODYtbW1zeXMuaAo+ICDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdDgxODYtcG0tZG9tYWlucy5oCj4gIMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvc29jL21lZGlhdGVrL210ODE5NS1wbS1kb21haW5zLmgKPiAgwqBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9tdDgxODYtcG93ZXIuaAo+ICDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL210ODE5NS1wb3dlci5oCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
