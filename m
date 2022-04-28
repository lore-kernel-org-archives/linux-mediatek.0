Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F382C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPKZitLNa4fKDIoMlbVuLog0Y4BGCnfPtJBRsorPX/M=; b=ekRpszm3G3u09T
	ZyhoLBW9OObtt4s/zwET7FwPZO/6NTLcutYkUe9roDEEKNeX9WAYQEWZaw8iXNbzrETPSmHjdhbWj
	U4Ke1a4xIIQ0/9QzevZYhJzxKVgdWLzXJWH7V5EIbC7dJUm9hsp8IyVzU02NeGxkmplL16uI9jpiq
	Kw16z/LVPP9XiTQJ8hk5gWj8wumOzpa0t7iUpMP+rzVO4kMvIPY8aKNNNCcnwYfEP9AMevMgcCB5K
	jZAT6cFCTBytFnjWNFws2A+3VLN9GlOR/4DOy8QH9vWLFkSPuyEFQHRTIuzrQr20sbw9Q9ZybEVXX
	Im+YlkQ7karGqTSuOqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk43q-006ynC-6C; Thu, 28 Apr 2022 13:19:58 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk415-006xKg-L6; Thu, 28 Apr 2022 13:17:10 +0000
Received: by mail-oi1-f171.google.com with SMTP id e4so5309766oif.2;
 Thu, 28 Apr 2022 06:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2KX0k1wrXX43D5TeLkqocszqE72U0xXm9eQIEdaCUbE=;
 b=rKSGVMcef+MT5mYfPIvRM1Et+BPkV+0Zybx66hJN1i3vDoIdYGAADTex33KGWvxfay
 Weu+wfHI7z3J/cXOnJT4m77NL6hqe1VUZpjPPCizfoF45HQExl0n7nHyI8mZzWc5p54a
 2kjbK7P02UEMA2XWDNj4mJAzFH1PtPCCtwbvGFnK01Q3sNCj5PbDBakU7Sx7ds99y3H+
 wWQjzp038D7EmMrn/Bm3qNo34NeR13at0FTrduF+HVjmneVlEBVOdo54hwmnVrk/BS7p
 9cW0346j2gCUZJ1LBS65YH7Xw3ijfLvGHaUuVogrvlSglBZnc5dfCbwU82AeuM8zekgy
 NYFA==
X-Gm-Message-State: AOAM530I2cZJN/jKbo8FzdigUw9Jd0IOjZxKszID+QbsuqBdrzi5VtTN
 fixQsez+R9oBQ6VBkE/EXw==
X-Google-Smtp-Source: ABdhPJz/d8BYWGUSJp+sBgndd/ngWTLW1+V3dbP8Dggh5IlPgtUXaU65s/zWtk3vrKBC101akso2uw==
X-Received: by 2002:a05:6808:2021:b0:322:ba69:53d2 with SMTP id
 q33-20020a056808202100b00322ba6953d2mr19985135oiw.22.1651151823956; 
 Thu, 28 Apr 2022 06:17:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dt48-20020a0568705ab000b000e686d13875sm1825089oab.15.2022.04.28.06.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 06:17:03 -0700 (PDT)
Received: (nullmailer pid 2082134 invoked by uid 1000);
 Thu, 28 Apr 2022 13:17:02 -0000
Date: Thu, 28 Apr 2022 08:17:02 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, krzysztof.kozlowski+dt@linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 devicetree <devicetree@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, ChiYuan Huang <cy_huang@richtek.com>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: Add bindings for the Mediatek MT6360
Message-ID: <YmqTzlrVL5KaVPuz@robh.at.kernel.org>
References: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
 <20220427080330.40136-3-gene.chen.richtek@gmail.com>
 <YmmQpg/Hh6qTNhj2@robh.at.kernel.org>
 <CAE+NS34SawC_pdTm=eDmp6zq1zLZgEaA+_s_xZOc4LuFHDV1iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS34SawC_pdTm=eDmp6zq1zLZgEaA+_s_xZOc4LuFHDV1iQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_061707_778537_395C5F2F 
X-CRM114-Status: GOOD (  20.22  )
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

T24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDU6MzA6MzhQTSArMDgwMCwgR2VuZSBDaGVuIHdyb3Rl
Ogo+IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIy5bm0NOaciDI45pelIOmA
seWbmyDkuIrljYgyOjUx5a+r6YGT77yaCj4gPgo+ID4gT24gV2VkLCBBcHIgMjcsIDIwMjIgYXQg
MDQ6MDM6MzBQTSArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4KPiA+ID4gQWRkIGJpbmRpbmdzIGZvciB0aGUg
TWVkaWF0ZWsgTVQ2MzYwCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2Vu
ZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9tdDYzNjAueWFtbCAgICAgICB8IDI1OCArKysrKysrKysrKysrKysrKysKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyNTggaW5zZXJ0aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvbXQ2MzYwLnlhbWwKPiA+
Cj4gPiBBcyBJIG1lbnRpb25lZCwgSSBhcHBsaWVkIHlvdXIgcHJldmlvdXMgdmVyc2lvbi4gUGxl
YXNlIHNlbmQgYSBwYXRjaCBvbgo+ID4gdG9wIG9mIGl0IGFkZGluZyB0aGUgY2hpbGQgbm9kZXMu
Cj4gPgo+ID4gUm9iCj4gCj4gSGkgUm9iLAo+IAo+ICAgICBJIHRyeSB0byBzeW5jIGxhdGVzdCBj
b2RlIGFuZCBjYW4ndCBmaW5kIHRoZSBtdDYzNjAgbGVkIGZpeGVkIHBhdGNoLgo+ICAgICBDb3Vs
ZCB5b3UgcGxlYXNlIHRlbGwgbWUgaG93IHRvIGdldCBhbmQgYXBwbHkgcHJldmlvdXMgdmVyc2lv
bj8KPiAgICAgQW5kIHNob3VsZCBJIGFkZCBhIHRhZ3MgaW4gY29tbWl0IG1lc3NhZ2UgdG8gdGVs
bCB3aGljaCBwcmV2aW91cwo+IGNvbW1pdCBJIGJhc2VkIG9uPwoKVGhlIGxlZCBmaXggaXMgaW4g
bXkgZHQvbGludXMgYnJhbmNoIGFuZCB0b2RheSdzIGxpbnV4IG5leHQuCgpUaGUgbWZkIHBhdGNo
IGlzIGluIG15IGR0L25leHQgYnJhbmNoLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
