Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85748C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BEIuXatP+S8yI8QVMWF3LrRrfwL+7mFykdd8vmgp6A=; b=SeVMz4zGm2GEEU
	AigIx9Gr309hnXrf+32kZMg5+TlHTH0fVA8cBOrsi68SE8Q7suQQNyL03vavd56wkdZfqmVgqev8m
	DjxzAQ+YW9EWDJ04aC04UVbrfWhV6LWl1mI3nUWvVV4eL3Mt7N5SoQuDBlXgER1XnG0Y/2wlJpO+X
	OcfqRhkUCQW92BfGee+dva8sDsttag7vY/wOp8QtuCcf2uk7cr6YyV64443DYWzeLf7HE88rlaXjN
	xr7PYqDDDqWMtV1i6ZsnBe8ebJRWDFa007/s099l7GX4VNQIcmehru5Ns2Ws3EJvc5+0Ntz2vIPFa
	IauOam3LVO0oCvbUp7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1BOW-00AmmN-6E; Tue, 14 Jun 2022 18:36:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1BOK-00Amko-Jz
	for linux-mediatek@lists.infradead.org; Tue, 14 Jun 2022 18:35:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id e11so9316250pfj.5
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jun 2022 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/BHxuvsblLJskDtY/Ztfk5dtjeHyzSHSV/rpTnqFptw=;
        b=lcoBGgDAY+q45GquTu+sVCB0NXJEi5szmJMRopFLtIAqeBX+DDMcbjxDxiFwpC6zuq
         SaP7ZnWqwKmm1ss9NYvk9GsPgjTWagLliMbiufb3MUDO2jPbOJcUZ5EaZ55OIlsxwLEF
         NkHIEPzarwZ0qK4KUQZJvUYA7rom3TlhIw+uiT5pGZDKFXtbOxbcntaM0B90E1sEpwNn
         vmAN8Vpw7zfFPSf81U2uSU2RKS3fkJdH+3VuIyFkmkuBoOoLImfiXvobBy8ahzbbR68Z
         xAGNn3t4qswNweXxmmwC5EB4Bhyi5ust0I8h6rtp+ELtY3a5nfz0XBBFbiLVxTplFWXT
         kehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/BHxuvsblLJskDtY/Ztfk5dtjeHyzSHSV/rpTnqFptw=;
        b=gaDhMNMeqmEQVkpwaf9uSwHuyUIoesbLvhU/Z1HxnLwphmXjIa63o64gU/VyeeTa4z
         VO2rn9BXylQwyTlSvF8rhxboRA4gYY58v7V/7l+KBAr271wc9OB8KOaaoV+JHSBRA4a+
         G84V3KpUBgaKbm3Rpsxxc2cyGX2hAgO3zuoeXRB7eNHXnWAVRoAH+mGyqIJhLMOMLcLE
         xwzSmEFdVTZUUfMI8o79j0r2mczGQZC7+GGFopupvOh+leL7urC+Rsinfy0koCZmhTKf
         +49l9hHboqxAEZ2pkjMr9l6tM331cDWARTGbXM2kiaaKZ64Z2TAgJE0BfViXxovIIWnD
         RgnQ==
X-Gm-Message-State: AOAM5308Vk1q798eZyem3fd4f7H8tJeTn31kdw5gvzp8mH+MJOOVpUiu
	Y9XuroSIsjKJocTBNzOf9rDwow==
X-Google-Smtp-Source: ABdhPJzDFH6QBQEGfpJxh/mQFjNzcSLTTlMIgYVW/e/UgH6wiLL/c2cBLAcoqjqL2X2p7IuRr9EweQ==
X-Received: by 2002:a63:d50f:0:b0:408:994a:96d5 with SMTP id c15-20020a63d50f000000b00408994a96d5mr5600253pgg.299.1655231749808;
        Tue, 14 Jun 2022 11:35:49 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id r21-20020a170902e3d500b0016393148c9esm7522489ple.110.2022.06.14.11.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 11:35:45 -0700 (PDT)
Message-ID: <277ec646-b709-4a4a-8216-49d528d0e43e@linaro.org>
Date: Tue, 14 Jun 2022 20:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
 <20220613133819.35318-3-angelogioacchino.delregno@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220613133819.35318-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_113552_703710_9AD36CD5 
X-CRM114-Status: GOOD (  23.62  )
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

T24gMTMvMDYvMjAyMiAxNTozOCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4g
U29tZSBNZWRpYVRlayBwbGF0Zm9ybXMgd2l0aCBhIGJ1Z2d5IFRydXN0Wm9uZSBBVEYgZmlybXdh
cmUgd2lsbCBub3QKPiBpbml0aWFsaXplIHRoZSBBQXJjaDY0IFN5c3RlbSBUaW1lciBjb3JyZWN0
bHk6IGluIHRoZXNlIGNhc2VzLCB0aGUKPiBTeXN0ZW0gVGltZXIgYWRkcmVzcyBpcyBjb3JyZWN0
bHkgcHJvZ3JhbW1lZCwgYXMgd2VsbCBhcyB0aGUgQ05URlJRX0VMMAo+IHJlZ2lzdGVyIChyZWFk
aW5nIDEzTUh6LCBhcyBpdCBzaG91bGQgYmUpLCBidXQgdGhlIGFzc2lnbmVkIGhhcmR3YXJlCj4g
dGltZXJzIGFyZSBuZXZlciBzdGFydGVkIGJlZm9yZSAob3IgYWZ0ZXIpIGJvb3RpbmcgTGludXgu
Cj4gCj4gSW4gdGhpcyBjb25kaXRpb24sIGFueSBjYWxsIHRvIGZ1bmN0aW9uIGdldF9jeWNsZXMo
KSB3aWxsIGJlIHJldHVybmluZwo+IHplcm8sIGFzIENOVFZDVF9FTDAgd2lsbCBhbHdheXMgcmVh
ZCB6ZXJvLgo+IAo+IE9uZSBjb21tb24gY3JpdGljYWwgc3ltcHRvbSBvZiB0aGF0IGlzIHRyeWlu
ZyB0byB1c2UgdGhlIHVkZWxheSgpCj4gZnVuY3Rpb24gKGNhbGxpbmcgX19kZWxheSgpKSwgd2hp
Y2ggZXhlY3V0ZXMgdGhlIGZvbGxvd2luZyBsb29wOgo+IAo+ICAgICAgICAgICAgICBzdGFydCA9
IGdldF9jeWNsZXMoKTsKPiAgICAgICAgICAgICAgd2hpbGUgKChnZXRfY3ljbGVzKCkgLSBzdGFy
dCkgPCBjeWNsZXMpCj4gICAgICAgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cj4gCj4gd2hp
Y2gsIHdoZW4gQ05UVkNUX0VMMCBhbHdheXMgcmVhZHMgemVybywgdHJhbnNsYXRlcyB0bzoKPiAK
PiAgICAgICAgICAgICAgd2hpbGUoKDAgLSAwKSA8IDApICA9PT4gd2hpbGUoMCA8IDApCj4gCj4g
Li4uIGdlbmVyYXRpbmcgYW4gaW5maW5pdGUgbG9vcCwgZXZlbiB0aG91Z2ggemVybyBpcyBuZXZl
ciBsZXNzCj4gdGhhbiB6ZXJvLCBidXQgYWx3YXlzIGVxdWFsIHRvIGl0ICh0aGlzIGhhcyB0byBi
ZSByZXNlYXJjaGVkLAo+IGJ1dCBpdCdzIG91dCBvZiB0aGUgc2NvcGUgb2YgdGhpcyBjb21taXQp
Lgo+IAo+IFRvIGZpeCB0aGlzIGlzc3VlIG9uIHRoZSBhZmZlY3RlZCBNZWRpYVRlayBwbGF0Zm9y
bXMsIHRoZSBzb2x1dGlvbgo+IGlzIHRvIHNpbXBseSBzdGFydCB0aGUgdGltZXJzIHRoYXQgYXJl
IGRlc2lnbmVkIHRvIGJlIFN5c3RlbSBUaW1lcihzKS4KPiBUaGVzZSB0aW1lcnMsIGRvd25zdHJl
YW0sIGFyZSBjYWxsZWQgIkNQVVhHUFQiIGFuZCB0aGVyZSBpcyBvbmUKPiB0aW1lciBwZXIgQ1BV
IGNvcmU7IGx1Y2tpbHksIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gc2V0IGEgc3RhcnQgYml0Cj4g
b24gZWFjaCBDUFVYIEdlbmVyYWwgUHVycG9zZSBUaW1lciwgYnV0IGl0J3MgY29udmVuaWVudGx5
IGVub3VnaCB0bzoKPiAgIC0gU2V0IHRoZSBjbG9jayBkaXZpZGVyIChpbnB1dCA9IDI2TUh6LCBk
aXZpZGVyID0gMiwgb3V0cHV0ID0gMTNNSHopOwo+ICAgLSBTZXQgdGhlIEVOQUJMRSBiaXQgb24g
YSBnbG9iYWwgcmVnaXN0ZXIgKHN0YXJ0cyBhbGwgQ1BVWCB0aW1lcnMpLgo+IAo+IFRoZSBvbmx5
IHNtYWxsIGh1cmRsZSB3aXRoIHRoaXMgc2V0dXAgaXMgdGhhdCBpdCdzIGFsbCBkb25lIHRocm91
Z2gKPiB0aGUgTUNVU1lTIHdyYXBwZXIsIHdoZXJlIGl0IGlzIG5lZWRlZCwgZm9yIGVhY2ggcmVh
ZCBvciB3cml0ZSwgdG8KPiBzZWxlY3QgYSByZWdpc3RlciBhZGRyZXNzIChieSB3cml0aW5nIGl0
IHRvIGFuIGluZGV4IHJlZ2lzdGVyKSBhbmQKPiB0aGVuIHRvIHBlcmZvcm0gYW55IFIvVyBvbiBh
ICJDT04iIHJlZ2lzdGVyLgo+IAo+IEZvciBleGFtcGxlLCB3cml0aW5nICIweDEiIHRvIHRoZSBD
UFVYR1BUIHJlZ2lzdGVyIG9mZnNldCAweDQ6Cj4gLSBXcml0ZSAweDQgdG8gbWN1c3lzIElOREVY
IHJlZ2lzdGVyCj4gLSBXcml0ZSAweDEgdG8gbWN1c3lzIENPTiByZWdpc3Rlcgo+IAo+IFJlYWRp
bmcgZnJvbSBDUFVYR1BUIHJlZ2lzdGVyIG9mZnNldCAweDQ6Cj4gLSBXcml0ZSAweDQgdG8gbWN1
c3lzIElOREVYIHJlZ2lzdGVyCj4gLSBSZWFkIG1jdXN5cyBDT04gcmVnaXN0ZXIuCj4gCj4gRmlu
YWxseSwgc3RhcnRpbmcgdGhpcyB0aW1lciBtYWtlcyBwbGF0Zm9ybXMgYWZmZWN0ZWQgYnkgdGhp
cyBpc3N1ZQo+IHRvIHdvcmsgY29ycmVjdGx5LgoKV2h5IG5vdCBmaXggdGhlIEFURiA/CgoKCgot
LSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29r
LmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5h
cm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
