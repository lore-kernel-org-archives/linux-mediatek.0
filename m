Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B53C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:12:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46191613A7
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46191613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5gwQBtPf+2jgx6j4koG65iBzUcJ189JhUL33eN/P8gs=; b=lENGMOWC1MmVyJkaGe9X5jXgp
	mQ6k/Tka/i1GHkDdELYIsWEXj1aeFKJQ2u/zmGe55UUw7ETTEUu2rvffp/GvuYGtNNXejIBxAbFE7
	rOpX+cX1LbywACWHshwlksqKmzEo4JVv5gVyKM8imUalWACIb0bP9+PmXI8l7V3pQlLa+jsi8SQOT
	5ve/dLjweANxTrEY6ZsPIxessvK6VAEE4+VYBIbMcfh/zpgv67eFA3Bq4aJU8qCvTU+qJVVnbIs4o
	c3n9DQCxt72pnnpAJUmTKKwwXWKiChIbGvFklJI06DxHwNH/Q48C4DTBEE7xmWgm63Sov4VJT/kEH
	0L2d9aTew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTmR1-002o3G-Ol; Tue, 06 Apr 2021 14:12:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTmQq-002o2U-Lp; Tue, 06 Apr 2021 14:11:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id a12so4633274wrq.13;
 Tue, 06 Apr 2021 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a8N9uRf0Gjt1ZkH3EJX3OJhZkFtTCvTIIVUHYY2V8io=;
 b=kQ7gxb22p7W63SgC8m84/3xihthhDA1ahIEqalSfzZ00zH4G37Vm/jLGrYo+JCAc+l
 zW9LLcEWxNEReq/qn3RI9aL16LueImTpT7Mk9cCUWhFLeJQGr8EVi20lHdUeb4e003OX
 4fGKisRr8FjA4BeF5+dxN0Y61uzSEqikSIA8NazOI4N26MiKjmK1abdM9ameEov6LnO7
 1OnA8sieoOmZtHbsJxrX0kaCjzoZSJS+Aejkue1t3093T2PTUiqiErb061T44ampTbrz
 JWKXivMcAl7WKDeia366irfAGCowP6n/EglnMIWjREtIbs806zlOQgGYyWopxumGKvx8
 DwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a8N9uRf0Gjt1ZkH3EJX3OJhZkFtTCvTIIVUHYY2V8io=;
 b=g493K97KZTnhF3eMCQAnCyIOk9eltKhI3GWWhobUh4x7xy0U9WazdBclozUXBC+Y55
 ti4GkZ7ih6iT0rencOntXzesHQZqWV+DIZT6c7wkka3vGtRSD5bbp2UHBA+1xoh+BfGA
 PbFboC+IwYdfck8TL2g+dUKwcX/iRhlvIk27GyEpPykejGO9f2cBd9387LrdOrEJ5rPw
 4QWg5BRqDU5YqPeRYrDvOxg1GybvhQdjfBv9UeJOO5PUwdoH2ZXuUoG9xJcVTfLJ/QNh
 7oNKH/PFtyabTTkxWHAD8XX7WqlG/LoiagU9UsMvcbocnirzPzJrcEN5Xi7aSa7FneSo
 05DA==
X-Gm-Message-State: AOAM532CiqFF7et5Wy+cFVy8NlEQIGaHEJcArIhs+dI6cxSESUe7GtUL
 13mmic6NtmrCs1+jnj/O8B5oRfFNlsuYeg==
X-Google-Smtp-Source: ABdhPJymDec9IWKkYg2+xGqRr36VN4uhMN4N4sqp4Q1yp30rw9mejaDx1vJZTyQOQUnYrXOqaMhRPw==
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr11674740wrn.409.1617718311352; 
 Tue, 06 Apr 2021 07:11:51 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c2sm3043611wmr.22.2021.04.06.07.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 07:11:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mmsys: add mt1867 binding
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20201027160631.608503-1-fparent@baylibre.com>
 <20201030191714.GA4171611@bogus>
 <CAAOTY_8LwVDxZnSQAdK7mS8MAFZ1y_0EnSzj3UqeCxq-Tc5FuQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <0038ac16-4ffe-b141-a417-3639857a2998@gmail.com>
Date: Tue, 6 Apr 2021 16:11:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAOTY_8LwVDxZnSQAdK7mS8MAFZ1y_0EnSzj3UqeCxq-Tc5FuQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_151152_816644_1ECBBEC4 
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

SGkgQ2h1bi1LdWFuZywKCk9uIDEwLzAxLzIwMjEgMDA6MTcsIENodW4tS3VhbmcgSHUgd3JvdGU6
Cj4gSGksIE1hdHRoaWFzOgo+IAo+IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0MTDmnIgzMeaXpSDpgLHlha0g5LiK5Y2IMzoxN+Wvq+mBk++8mgo+Pgo+PiBPbiBUdWUs
IDI3IE9jdCAyMDIwIDE3OjA2OjI5ICswMTAwLCBGYWJpZW4gUGFyZW50IHdyb3RlOgo+Pj4gQWRk
IGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgTVQ4MTY3IFNvQy4KPiAKPiBFdmVuIHRob3VnaCB0
aGUgdGl0bGUgbmVlZCB0byBjaGFuZ2UgdG8gJ210ODE2NycsIHRoaXMgcGF0Y2ggbG9va3MKPiBn
b29kIHRvIG1lLiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRoaXMgcGF0Y2g/IE9uZSBkcm0gcGF0
Y2ggWzFdCj4gZGVwZW5kIG9uIHRoaXMgcGF0Y2gsIGlmIHlvdSBsaWtlIHRoaXMgcGF0Y2gsIGNv
dWxkIHlvdSBhcHBsaWVkIHRoaXMKPiBwYXRjaCBmaXJzdD8KPiAKPiBbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjAxMDIzMTMz
MTMwLjE5NDE0MC02LWZwYXJlbnRAYmF5bGlicmUuY29tLwo+IAoKSSBqdXN0IHB1c2hlZCB0aGUg
bGF0ZXN0IHZlcnNpb24gWzFdIG9mIHRoaXMgdG8gdjUuMTItbmV4dC9zb2MtMgoKSSdsbCB0cnkg
dG8gZ2V0IHRoaXMgaW4gZm9yIHY1LjEzLCBpZiBub3QgcG9zc2libGUgd2UgY2FuIHN5bmMgYWdh
aW4gb24gaG93IHRvCmZpeCB0aGlzLgoKUmVnYXJkcywKTWF0dGhpYXMKClsxXQpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA0MDUy
MDAzNTQuMjE5NDkzMC0xLWZwYXJlbnRAYmF5bGlicmUuY29tLwoKPiBSZWdhcmRzLAo+IENodW4t
S3VhbmcuCj4gCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBi
YXlsaWJyZS5jb20+Cj4+PiAtLS0KPj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVk
aWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0ICAgICAgICAgIHwgMSArCj4+PiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pgo+Pgo+PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4+IExpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
