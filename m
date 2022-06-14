Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B489AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8fGWhb9wX9+6FEzJM70pOibY4l/BzvU3iErMdWAyM0=; b=l74KE/F6MA4wTW
	qoW+UT8fHfEb0TzHeCAMP1wq7OpyMjiF35Rpw5vWdPID3fO75jsLpx4klrH4/7qRyPdYWJMtliSsw
	vL5NriPukeznHEBRdenEMZgrXHsONdZ14vqHpjxUtxVGPjZfdj1crF+Jw/VqSqdeQWLvCvo+Xh9wz
	hlqW9NpHvF8scnrZcSvEjSM2fEcm23ls9VjgDrE2KFKVj9jh+pUZ93lKGpjcmWTKQHE6Q/vP0xjew
	c/oQRYpURHhu7Rhnb/0oiTvEh17cORffg0EIyvMBR0WgC+vQQ6rNCAGJMmkSk24ajkd9I+c2/aH4c
	P2+m6EMtpR6QpRB+oTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AcJ-00AcAj-2q; Tue, 14 Jun 2022 17:46:15 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AcF-00Ac8D-Gt
	for linux-mediatek@lists.infradead.org; Tue, 14 Jun 2022 17:46:13 +0000
Received: by mail-qt1-x831.google.com with SMTP id x16so6608336qtw.12
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jun 2022 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Xn5U6yTCivKcEB2CQHYVzvugp+BfiT1C9G92C8VTcFE=;
        b=613RfUCkNkGQMLtU7V2MbO04fhnH0mtvC5dKJO2n7m5TCcstyJMNMqLu5YY/jKx85W
         WqQMLAi27pfXea2pgAxcenjo+QPeoTl9CYin1epFcZK/vTqiQCqBD1EYkVVK5uDXlJOk
         /REj65VNDa+2mfoDGydpq55FH9UXhemjGynB7O4/KvsjpjTKj3iXzE5se/WNWb3HwcDQ
         Qm8tyvsIiyWLkoQC0YSKGsXgM6jbVZQWXTcSfHhc7xpqFpsgqnP3lP5KbJsA0tnl+2AB
         IlaRWg/QdubW8ftDo3KKzJL3UuG4GA8jNRl6v8rVtjb0Mt6ik6HtmbEE25xxiVEQixz1
         wZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Xn5U6yTCivKcEB2CQHYVzvugp+BfiT1C9G92C8VTcFE=;
        b=MED+pThT2bM2JiF5WJ0fwjmeXRl7X5lVVapRfgMUdqqJKGq8AEQxcc0IpuwUaRTgyN
         yRxPd9MpIM8OQmjRalwWH2gahFliSqX9KJI9UUNdvPIgnO0Y0z61O0dzA4ldKEjBXmTT
         5gNBcy1m4zfcNxr8phEYcwkoQnjwLadV6wiYd/Az08HHYs+6htfQQJkB5iYmpGtzcD29
         W4qwaK7EV01AEqA/cm9mQLqiUCj2SlrM6JuIbtkE3tNJNHhKrjmrccw30gAC7S9oa4A5
         s0wEPaZ5nkd4Gvq3HzUHBP/bf8BiBWxqdeu5eqQSfPsiGfodyaF9m3Xyi5ghzNAJ5JzW
         mTMA==
X-Gm-Message-State: AOAM530wK8ndJpoyxi0NyVIpvjedhC9PKRAuEmP/XIkqENOhODZ8Bsh0
	MuFOR+zzwXCc2Dt9XGRKIpfTig==
X-Google-Smtp-Source: ABdhPJyz6Dah76Tro/nBusft/e8MUMRJGJMekMTnnVzKmUelFUurRZI3FxaqFWMN0HWssy5n6ZNO1g==
X-Received: by 2002:ac8:5a42:0:b0:305:222b:8ec9 with SMTP id o2-20020ac85a42000000b00305222b8ec9mr5296612qta.214.1655228768303;
        Tue, 14 Jun 2022 10:46:08 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id q12-20020a05622a030c00b00304dd83a9b1sm8255216qtw.82.2022.06.14.10.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 10:46:07 -0700 (PDT)
Message-ID: <5316234cef174e49110f949991ef71c578a3478e.camel@ndufresne.ca>
Subject: Re: [PATCH v4, 0/3] add h264 decoder driver for mt8186
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,  dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Tue, 14 Jun 2022 13:46:06 -0400
In-Reply-To: <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
	 <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_104611_841403_DF17039F 
X-CRM114-Status: GOOD (  19.26  )
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

TGUgbHVuZGkgMTMganVpbiAyMDIyIMOgIDE2OjEwIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIGEg
w6ljcml0wqA6Cj4gTGUgamV1ZGkgMTIgbWFpIDIwMjIgw6AgMTE6NDYgKzA4MDAsIFl1bmZlaSBE
b25nIGEgw6ljcml0wqA6Cj4gPiBGaXJzdGx5LCBhZGQgbXQ4MTg2IGNvbXBhdGlibGUgYW5kIHBy
aXZhdGUgZGF0YSwgdGhlbiBhZGQgZG9jdW1lbnQgZm9yCj4gPiBjb21wYXRpYmxlICJtZWRpYXRl
ayxtdDgxODYtdmNvZGVjLWRlYyIuIEZvciBtdDgxODYgaXMgc2luZ2xlIGNvcmUKPiA+IGFyY2hp
dGVjdHVyZSwgbmVlZCB0byBhZGQgbmV3IGludGVyZmFjZSBmb3IgaDI2NCBoYXJkd2FyZSBkZWNv
ZGVyLgo+IAo+IFdvdWxkIGJlIG5pY2UgdG8gdGFrZSB0aGUgaGFiaXQgb2Ygc2hhcmluZyBmbHVz
dGVyIHNjb3JlIGZvciB0aGlzIG5ldyBIVywgSQo+IHdvdWxkIGV4cGVjdCBubyBsZXNzIHRoZW4g
d2hhdCB0aGUgbnVtYmVycyB5b3UnZCBnZXQgZnJvbSBydW5uaW5nIG92ZXIgTVQ4MTk1IG9yCj4g
OTIsIHJlbWFpbnMgbmljZSB0byBkZW1vbnN0cmF0ZSB0aGF0IHRoaXMgd2FzIHRlc3RlZCBhbmQg
ZG9jdW1lbnQgYW55IG9vcHMgYWxvbmcKPiB0aGUgd2F5Lgo+ID4gCj4gPiBQYXRjaGUgMSBhZGQg
bXQ4MTg2IGNvbXBhdGlibGUgYW5kIHByaXZhdGUgZGF0YS4KPiA+IFBhdGNoZSAyIGFkZCBtdDgx
ODYgY29tcGF0aWJsZSBkb2N1bWVudC4KPiA+IFBhdGNoZSAzIGFkZCBoMjY0IHNpbmdsZSBjb3Jl
IGRyaXZlci4KPiA+IC0tLQo+ID4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uICJzdXBwb3J0IGZvciBN
VDgxOTIgZGVjb2RlciJbMV0KPiA+IAo+ID4gWzFdICBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvY292ZXIvMjAyMjA1MTIwMjE5NTAuMjkwODctMS15
dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20vCgpJIGZvcmdvdCBlYXJsaWVyLCBidXQgSSBzdXBwb3Nl
IHRoaXMgd2lsbCBhbHNvIGRlcGVuZHMgb24gYW4gc2NwLmltZyBmaXJtd2FyZSA/CklmIHNvLCBh
bnkgbGludXgtZmlybXdhcmUgc3VibWlzc2lvbiB0byBsaW5rIHRvID8KCj4gPiAtLS0KPiA+IGNo
YW5nZWQgd2l0aCB2MzoKPiA+IC0gZml4IF9faW9tZW0gbm90IHJlYXNvbmFibGUsIGFsaWduIHNo
YXJlIG1lbW9yeSB0byBkcmFtLgo+ID4gY2hhbmdlZCB3aXRoIHYyOgo+ID4gLSBmaXggc3BhcnNl
IGFuZCBzbWF0Y2ggY2hlY2sgZmFpbCBmb3IgcGF0Y2ggMwo+ID4gY2hhbmdlZCB3aXRoIHYxOgo+
ID4gLSByZWJhc2UgZHJpdmVyIHRvIHRoZSBsYXRlc3QgbWVkaWFfc3RhZ2UuCj4gPiAtLS0KPiA+
IFl1bmZlaSBEb25nICgzKToKPiA+ICAgZHQtYmluZGluZ3M6IG1lZGlhOiBtZWRpYXRlazogdmNv
ZGVjOiBBZGRzIGRlY29kZXIgZHQtYmluZGluZ3MgZm9yCj4gPiAgICAgbXQ4MTg2Cj4gPiAgIG1l
ZGlhOiBtZWRpYXRlazogdmNvZGVjOiBTdXBwb3J0IE1UODE4Ngo+ID4gICBtZWRpYTogbWVkaWF0
ZWs6IHZjb2RlYzogYWRkIGgyNjQgZGVjb2RlciBkcml2ZXIgZm9yIG10ODE4Ngo+ID4gCj4gPiAg
Li4uL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sIHwgICA0ICstCj4g
PiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5oIHwgICAxICsK
PiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jICAgICAgfCAgIDQg
Kwo+ID4gIC4uLi92Y29kZWMvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMgICAgICAgICB8ICAx
OSArKwo+ID4gIC4uLi92Y29kZWMvdmRlYy92ZGVjX2gyNjRfcmVxX211bHRpX2lmLmMgICAgICB8
IDE3NyArKysrKysrKysrKysrKysrKy0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDIwMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
