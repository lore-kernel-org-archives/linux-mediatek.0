Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D57C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 21:49:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CE721D20
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 21:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwhNG+7t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d12x+teJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1CE721D20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vf+vOk8StoCskfPajU9kGY78k5Wj3C26lSYb0HWVooE=; b=mwhNG+7t2WmJCPBbDnX6tlto3
	HLDGrljLV/mWtx+cJb9Ny6QESv7CWPDqUjL4nWAKQjCOKnizDhsIXLahUGN1tLs91gimxPABBNEvJ
	oxxD74zh+zc+cP0v/mtd+W4PibfsmKM1CurrGp2dLEcAeudGUbrzauU+X9wAL9zI4AjtjyinjbVh5
	kojSTy2m7+4u5S/eojrTVBHVMjabCJloLy8vkkHQKIkAEvC2QA5vY2xziOywSXRnR4IF2XepvQUKW
	DoPpePgSuUIb6FUe/f8NcmdPyS2D2WXOigK/U/RRbg/fD3uYvdSbTkXp/W7QyepWQz4XeAwyzC4Xg
	qARFdmIqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLZ7S-00075I-HZ; Thu, 24 Sep 2020 21:49:38 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLZ7Q-00074f-6D; Thu, 24 Sep 2020 21:49:37 +0000
Received: by mail-ed1-x541.google.com with SMTP id n22so443717edt.4;
 Thu, 24 Sep 2020 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zIlU+zToQaAHqNEqYrQAGg0nqDkaUEztkKgkJGCqUco=;
 b=d12x+teJeyi0XVXstH/DEx5oV2emff1Oy2ZIr8CqaFOiFg+j+A7zkSR8BIy5nypzZ9
 WwfPzUUyKLMwfyDqN68CPC0kbQFRQB9WF4LE47A4dq7myeEEYTpukuMWxRHR6JO0YwT9
 znVkv+0TaVdV1M0y4KcXWm5TfN1hm2FMzgOKgD3vDRmxoXNG5C61UZRzHGp6Gr6xoiM3
 B5b3/oCfhJTwuBJHBhCiP1fukxo1g1covphWInSoHzQ9D+dbqOYjPEW9+vQ8z1ULJTSu
 Lf6QTqoPzzJGfe+PENfE/LvJlKuLx/TBaB0gpCv37Va5IHwQe9CrtOwjztuGTn42Epeg
 wf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zIlU+zToQaAHqNEqYrQAGg0nqDkaUEztkKgkJGCqUco=;
 b=jaOdS6iVxjiVNWmjXWyv1OWKmCsbP8VgPaDyAj6fgGVZHL+VCY9ZQ7P2O+Pp6ospA3
 76+mR2l+t+hCcxC+ZIYe+Aorzwf41bLazsKoK4zY0GQjVDLOYkFHs+s909eXHJpzbl4f
 dIv2ZBSTWeRCSeS2JccqKUz3SNIWMXyrKFKpAw/MDNrK0PRP6WF/PioNfAlfdOtK7v/D
 SsYFJr9vHe9d1V5+EdtN7Cn6suMN7r3lwIFhkrtgbJtVV7GgHPeNIQBlz0pjUypTuQDq
 EcmsXOlgJu37FP3EB2IcRDuk6oihgy9kDkkKu5ov/VRchj4iGlyubCkBTL+m26OROQzz
 zQKg==
X-Gm-Message-State: AOAM5300Q0R1OTPbks4MBGU2SWGsCk/1pqbqlADqbHm7ziL4mBVR3AoH
 0GLMhcRhWit6M1YaaSx8Mcg=
X-Google-Smtp-Source: ABdhPJxVW8jdAPuRbEprN28aAWCKRwi1/0OWvpvwnX1Rlub7Co7a3kMpuv5eRcFM0Tjszg2Rivgypg==
X-Received: by 2002:a05:6402:1d03:: with SMTP id
 dg3mr802579edb.249.1600984171457; 
 Thu, 24 Sep 2020 14:49:31 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d922:8747:4a19:cf92?
 ([2a01:110f:b59:fd00:d922:8747:4a19:cf92])
 by smtp.gmail.com with ESMTPSA id u26sm475777ejj.11.2020.09.24.14.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 14:49:30 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-3-git-send-email-gene.chen.richtek@gmail.com>
 <e82fd413-8343-5115-150e-02d96eecf6e8@gmail.com>
 <CAE+NS35BwgGD3GjKv5E08ECqKCortJxB-yHP9-kteqPiKm9edQ@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a24c797d-c8be-3cf6-d825-6ff368c570ec@gmail.com>
Date: Thu, 24 Sep 2020 23:49:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS35BwgGD3GjKv5E08ECqKCortJxB-yHP9-kteqPiKm9edQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_174936_232340_CC6C7A03 
X-CRM114-Status: GOOD (  29.97  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gOS8yNC8yMCA4OjIxIEFNLCBHZW5lIENoZW4gd3JvdGU6Cj4gSmFjZWsgQW5hc3pld3NraSA8
amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0OeaciDI05pelIOmAseWbmyDk
uIrljYg1OjQ55a+r6YGT77yaCj4gCj4+Cj4+IEhpIEdlbmUsCj4+Cj4+IFRoYW5rIHlvdSBmb3Ig
dGhlIHVwZGF0ZS4gSSBoYXZlIHNvbWUgbW9yZSBjb21tZW50cyBiZWxvdy4KPj4KPj4gT24gOS8y
My8yMCAyOjUwIFBNLCBHZW5lIENoZW4gd3JvdGU6Cj4+PiBGcm9tOiBHZW5lIENoZW4gPGdlbmVf
Y2hlbkByaWNodGVrLmNvbT4KPj4+Cj4+PiBBZGQgTVQ2MzYwIExFRCBkcml2ZXIgaW5jbHVkZSAy
LWNoYW5uZWwgRmxhc2ggTEVEIHdpdGggdG9yY2gvc3Ryb2JlIG1vZGUsCj4+PiBhbmQgNC1jaGFu
bmVsIFJHQiBMRUQgc3VwcG9ydCBSZWdpc3Rlci9GbGFzaC9CcmVhdGggTW9kZQo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+Pj4gLS0tCj4+
PiAgICBkcml2ZXJzL2xlZHMvS2NvbmZpZyAgICAgICB8ICAxMSArCj4+PiAgICBkcml2ZXJzL2xl
ZHMvTWFrZWZpbGUgICAgICB8ICAgMSArCj4+PiAgICBkcml2ZXJzL2xlZHMvbGVkcy1tdDYzNjAu
YyB8IDcwNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
ICAgIDMgZmlsZXMgY2hhbmdlZCwgNzE3IGluc2VydGlvbnMoKykKPj4+ICAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2xlZHMvbGVkcy1tdDYzNjAuYwo+Pj4KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2xlZHMvS2NvbmZpZyBiL2RyaXZlcnMvbGVkcy9LY29uZmlnCj4+PiBpbmRleCAxYzE4
MWRmLi41NTYxYjA4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9sZWRzL0tjb25maWcKPj4+ICsr
KyBiL2RyaXZlcnMvbGVkcy9LY29uZmlnCj4+PiBAQCAtMjcxLDYgKzI3MSwxNyBAQCBjb25maWcg
TEVEU19NVDYzMjMKPj4+ICAgICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3Ig
b24tY2hpcCBMRUQgZHJpdmVycyBmb3VuZCBvbgo+Pj4gICAgICAgICAgTWVkaWF0ZWsgTVQ2MzIz
IFBNSUMuCj4+Pgo+Pj4gK2NvbmZpZyBMRURTX01UNjM2MAo+Pj4gKyAgICAgdHJpc3RhdGUgIkxF
RCBTdXBwb3J0IGZvciBNZWRpYXRlayBNVDYzNjAgUE1JQyIKPj4+ICsgICAgIGRlcGVuZHMgb24g
TEVEU19DTEFTU19GTEFTSCAmJiBPRgo+Pj4gKyAgICAgZGVwZW5kcyBvbiBWNEwyX0ZMQVNIX0xF
RF9DTEFTUyB8fCAhVjRMMl9GTEFTSF9MRURfQ0xBU1MKPj4+ICsgICAgIGRlcGVuZHMgb24gTUZE
X01UNjM2MAo+Pj4gKyAgICAgaGVscAo+Pj4gKyAgICAgICBUaGlzIG9wdGlvbiBlbmFibGVzIHN1
cHBvcnQgZm9yIGR1YWwgRmxhc2ggTEVEIGRyaXZlcnMgZm91bmQgb24KPj4+ICsgICAgICAgTWVk
aWF0ZWsgTVQ2MzYwIFBNSUMuCj4+PiArICAgICAgIEluZGVwZW5kZW50IGN1cnJlbnQgc291cmNl
cyBzdXBwbHkgZm9yIGVhY2ggZmxhc2ggTEVEIHN1cHBvcnQgdG9yY2gKPj4+ICsgICAgICAgYW5k
IHN0cm9iZSBtb2RlLgo+Pj4gKwo+Pj4gICAgY29uZmlnIExFRFNfUzNDMjRYWAo+Pj4gICAgICAg
IHRyaXN0YXRlICJMRUQgU3VwcG9ydCBmb3IgU2Ftc3VuZyBTM0MyNFhYIEdQSU8gTEVEcyIKPj4+
ICAgICAgICBkZXBlbmRzIG9uIExFRFNfQ0xBU1MKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xl
ZHMvTWFrZWZpbGUgYi9kcml2ZXJzL2xlZHMvTWFrZWZpbGUKPj4+IGluZGV4IGMyYzdkN2EuLjU1
OTY0MjcgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2xlZHMvTWFrZWZpbGUKPj4+ICsrKyBiL2Ry
aXZlcnMvbGVkcy9NYWtlZmlsZQo+Pj4gQEAgLTY2LDYgKzY2LDcgQEAgb2JqLSQoQ09ORklHX0xF
RFNfTUlLUk9USUtfUkI1MzIpICAgKz0gbGVkcy1yYjUzMi5vCj4+PiAgICBvYmotJChDT05GSUdf
TEVEU19NTFhDUExEKSAgICAgICAgICArPSBsZWRzLW1seGNwbGQubwo+Pj4gICAgb2JqLSQoQ09O
RklHX0xFRFNfTUxYUkVHKSAgICAgICAgICAgKz0gbGVkcy1tbHhyZWcubwo+Pj4gICAgb2JqLSQo
Q09ORklHX0xFRFNfTVQ2MzIzKSAgICAgICAgICAgKz0gbGVkcy1tdDYzMjMubwo+Pj4gK29iai0k
KENPTkZJR19MRURTX01UNjM2MCkgICAgICAgICAgICArPSBsZWRzLW10NjM2MC5vCj4+PiAgICBv
YmotJChDT05GSUdfTEVEU19ORVQ0OFhYKSAgICAgICAgICArPSBsZWRzLW5ldDQ4eHgubwo+Pj4g
ICAgb2JqLSQoQ09ORklHX0xFRFNfTkVUWEJJRykgICAgICAgICAgKz0gbGVkcy1uZXR4YmlnLm8K
Pj4+ICAgIG9iai0kKENPTkZJR19MRURTX05JQzc4QlgpICAgICAgICAgICs9IGxlZHMtbmljNzhi
eC5vCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL2xlZHMtbXQ2MzYwLmMgYi9kcml2ZXJz
L2xlZHMvbGVkcy1tdDYzNjAuYwo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAw
MDAwMDAuLjFjMzQ4NmUKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2RyaXZlcnMvbGVkcy9s
ZWRzLW10NjM2MC5jCj4+PiBAQCAtMCwwICsxLDcwNSBAQAo+Pj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPj4+ICsKPj4+ICsjaW5jbHVkZSA8bGludXgvZGVsYXku
aD4KPj4+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9pbnRl
cnJ1cHQuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+PiArI2luY2x1ZGUgPGxp
bnV4L2xlZC1jbGFzcy1mbGFzaC5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPj4+
ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4
L3Byb3BlcnR5Lmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+Pj4gKyNpbmNsdWRl
IDxtZWRpYS92NGwyLWZsYXNoLWxlZC1jbGFzcy5oPgo+Pj4gKwo+Pj4gK2VudW0gewo+Pj4gKyAg
ICAgTVQ2MzYwX0xFRF9JU05LMSA9IDAsCj4+PiArICAgICBNVDYzNjBfTEVEX0lTTksyLAo+Pj4g
KyAgICAgTVQ2MzYwX0xFRF9JU05LMywKPj4+ICsgICAgIE1UNjM2MF9MRURfSVNOSzQsCj4+Cj4+
IE9uZSBxdWVzdGlvbiBhYm91dCB0aGVzZSBJU0lOS3MgLSBob3cgYXJlIHRoZXkgZXhwbG9pdGVk
IGluIHlvdXIgZGV2aWNlPwo+PiBBcmUgdGhlc2UgTEVEcyB1c2VkIHRvIGluZGljYXRlIGNhbWVy
YSBhY3Rpdml0eSBvciBpdCBpcyBvbmUgUkdCIExFRAo+PiBmb3Igc3RhdHVzPyBBbmQgd2hhdCBm
dW5jdGlvbmFsaXR5IGhhcyB0aGUgcmVtYWluaW5nIGFtYmVyIG9uZSAoc3RpY2tpbmcKPj4gdG8g
dGhlIG5hbWluZyBmcm9tIHlvdXIgRFQgYmluZGluZ3MpPwo+Pgo+PiBDYW4geW91IHNoYXJlIGhv
dyB0aGUgZG9jdW1lbmF0aW9uIGZvciB0aGlzIGRldmljZSBkZXNjcmliZXMgdGhlIHB1cnBvc2UK
Pj4gb2YgdGhlc2Ugc2lua3MsIGlmIGl0IGRvZXMgaXQgYXQgYWxsPwo+Pgo+PiBJIGdvdCBwcm9i
YWJseSBtaXNsZWFkIGJ5IHlvdXIgbmFtaW5nIGluIHRoZSBkcml2ZXIgYW5kIGdvdCBmaXhlZCBv
bgo+PiB0aGVpciBmdW5jdGlvbiBhcyBjYW1lcmEgYWN0aXZpdHkgaW5kaWNhdG9ycywgZm9yIHdo
aWNoIFY0TDIgaGFzCj4+IHN1cHBvcnQuIElmIHRoYXQgaXMgbm90IHRoZSBjYXNlLCB0aGVuIHlv
dSdkIGJldHRlciBzd2l0Y2ggdG8gdXNpbmcKPj4gbXVsdGljb2xvciBmcmFtZXdvcmsgZm9yIGFs
bCBmb3VyICJpbmRpY2F0b3IiIExFRHMuCj4+Cj4gCj4gSXQncyBvbmUgUkdCIExFRCBmb3Igc3Rh
dHVzLCBub3QgZm9yIGNhbWVyYS4KPiAKPiBUaGUgTVQ2MzYwIGludGVncmF0ZXMgYSB0aHJlZS1j
aGFubmVsIFJHQiBMRUQgZHJpdmVyLCBkZXNpZ25lZCB0bwo+IHByb3ZpZGUgYSB2YXJpZXR5IG9m
IGxpZ2h0aW5nIGVmZmVjdHMgZm9yIG1vYmlsZSBkZXZpY2UgYXBwbGljYXRpb25zLgo+IFRoZSBS
R0IgTEVEIGRyaXZlciBpbmNsdWRlcyBhIHNtYXJ0IExFRCBzdHJpbmcgY29udHJvbGxlciwgYW5k
IGl0IGNhbgo+IGRyaXZlIDMgY2hhbm5lbHMgb2YgTEVEcyB3aXRoIGEgc2luayBjdXJyZW50IG9m
IHVwIHRvIDI0bUEuIFRoZQo+IGRlZmF1bHQgc2V0dGluZyBvZiBSR0JfSVNJTksxIGlzIGF1dG8g
bW9kZSBmb3IgVEEgY2hhcmdpbmcgaW5kaWNhdG9yLAo+IGFuZCBSR0JfSVNJTksxIGFsc28gc3Vw
cG9ydHMgc29mdHdhcmUgbW9kZS4gSXQgcHJvdmlkZXMgdGhyZWUKPiBvcGVyYXRpb24gbW9kZXMg
Zm9yIHRoZSBSR0IgTEVEczogZmxhc2ggbW9kZSwgYnJlYXRoIG1vZGUsIGFuZAo+IHJlZ2lzdGVy
IG1vZGUuIFRoZSBkZXZpY2UgY2FuIGluY3JlYXNlIG9yIGRlY3JlYXNlIHRoZSBicmlnaHRuZXNz
IG9mCj4gdGhlIFJHQiBMRURzIHVwb24gY29tbWFuZCB2aWEgdGhlIEkyQyBpbnRlcmZhY2UuIFRo
ZSBSR0JfSVNJTks0Cj4gcHJvdmlkZSBtb3JlIHNpbmsgY3VycmVudCB1cCB0byAxNTBtQSwgd2hp
Y2ggd2UgY2FuIG1vb25saWdodCBtb2RlLgo+IAo+IERvIHlvdSBtZWFuIHdlIHNob3VsZCByZW1v
dmUgImlzaW5rIHJlZ2lzdGVyIHY0bDIgZGV2aWNlLCBvbmx5IG5lZWQKPiByZWdpc3RlciBsZWRj
bGFzcyBkZXZpY2UiPwoKSSdkIHNheSB0aGF0IGluIGFkZGl0aW9uIHRvIHRoZSBMRUQgZmxhc2gg
Y2xhc3MgZGV2aWNlLCB5b3Ugc2hvdWxkCmFsbG93IGZvciByZWdpc3RlcmluZyBMRUQgbXVsdGlj
b2xvciBkZXZpY2UgY29tcHJpc2luZyBSR0IgTEVEcywKYW5kIG9uZSBMRUQgY2xhc3MgZGV2aWNl
IGZvciBJU0lOSzQgKHlvdSBjb3VsZCBldmVuIGFkZApMRURfRlVOQ1RJT05fTU9PTkxJR0hUIGZv
ciBpdCkuCgpJIHdvbmRlciB3aGF0IG90aGVycyB0aGluay4KClsuLi5dCj4+PiArc3RhdGljIGlu
dCBtdDYzNjBfbGVkX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiArewo+
Pj4gKyAgICAgc3RydWN0IG10NjM2MF9wcml2ICpwcml2Owo+Pj4gKyAgICAgc3RydWN0IGZ3bm9k
ZV9oYW5kbGUgKmNoaWxkOwo+Pj4gKyAgICAgc2l6ZV90IGNvdW50Owo+Pj4gKyAgICAgaW50IGkg
PSAwLCByZXQ7Cj4+PiArCj4+PiArICAgICBjb3VudCA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9j
b3VudCgmcGRldi0+ZGV2KTsKPj4+ICsgICAgIGlmICghY291bnQgfHwgY291bnQgPiBNVDYzNjBf
TUFYX0xFRFMpCj4+Cj4+IFBsZWFzZSBhZGQgZGV2X2VycigpIGhlcmUuCj4+Cj4gCj4gZGV2X2Vy
cigmcGRldi0+ZGV2LCAiTm8gY2hpbGQgbm9kZSBvciBub2RlIGNvdW50IG92ZXIgbWF4IGxlZCBu
dW1iZXIKPiAlZFxuIiwgY291bnQpOwoKSWYgd2Ugd2lsbCBleHBsb2l0IGFsc28gTEVEIG11bHRp
Y29sb3IgY2xhc3MgdGhlbiBEVCBiaW5kaW5ncyB3aWxsCmxvb2sgZGlmZmVyZW50LCBzbyBsZXQn
cyBkaXNjdXNzIHRoaXMgZGV0YWlsIGxhdGVyLgoKLS0gCkJlc3QgcmVnYXJkcywKSmFjZWsgQW5h
c3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
