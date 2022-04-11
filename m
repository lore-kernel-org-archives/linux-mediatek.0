Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F82C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZK8kGN346pHar9tKJ/tNT+9RSdFehAEVr9ip8qGqO4=; b=EhVbAemKAmTeEN
	xQCMyzRS1XwbfZSOVNaLNJexAJb42G0J5+kXNNJJbgeOEP5/QLrX55YexkTNTTUkw84Zj4T3OsTkW
	4xzOeTOq1Svu5D9tsjc3cKvqw2Dk6JXMRV2KC4BrGxH4VTnJfvCDQ7wm1noz8aA3Bf3FpfKV+mzse
	ZyMbmsR5O878cPQVEeKGLCIZfL0LR2YPiioG72vZYr5OcVvBBYUTtolBmiPMwjL3eniM3X/JOhl+L
	7R0Vt6J5fkFnZtL5IEdaFnZok+1894RtnyEq4uoxmuES4NHgcS0hM+mRO1F4oDj8k+ZwSS/vInoG5
	F1U74l4rDaEcS70InrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoNU-007Ayl-R8; Mon, 11 Apr 2022 07:22:24 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoNH-007AsT-Ec; Mon, 11 Apr 2022 07:22:12 +0000
Received: by mail-qk1-x72e.google.com with SMTP id c199so8238209qkg.4;
 Mon, 11 Apr 2022 00:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cle8K5S6vVtn1JXrhhTeWuHVXYaRfpQzQC3UXOxjSXQ=;
 b=Y6h0WBWvhdDrbLDKkIlt6BolxlUasB2v7HT2X+21KUGqBKjhk1WZuiBYUSN8BfVhOp
 GaqIaIM8k3tsr4V0pLaDITzBcEuIq6aCgmETg4vEt4ivazuNeB+lGHrgekpApesOOFQy
 NnMjkWHqqW05oMFKsnFutvWZD9q9T0JZi9YDUFddgGk7h2L4teMediK1sFIGpXJqguLH
 Jp9V/NxmQ5x4HfvZrjzL6RsyKWVBLjZKmA5vbu2uDu9eyUkKNP84a8XhyW2JBv0vIS8M
 3/l4Qvg9LXXmyZayEaK0PH9PiN1+OUGeei5LRrVjGw2kYr9S1vXTIlMB59DTEokwdXw+
 brbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cle8K5S6vVtn1JXrhhTeWuHVXYaRfpQzQC3UXOxjSXQ=;
 b=4HCHVCfnclLDi3PRQ1Tzdm5ryF6F+N6QQwYMOXCJWCpIGpqu+/H9Q5KzsfFnETxtiG
 662gYVhy5m+Sn+YSSgluT0J73oT+/z1KLQO5E+7dxGL4nkuHt8gL8IaqYdaNasVx/Hqz
 U7OxhjhA7GmNaY2MuITLSv0E/JLv1VltargEcZFmw4f2ONcSuG3SO40NKt/JIAs5Gryk
 hUjkRoudfRS9uXO7Y4RvzQC4r1sL+gee0ugoUayIHmfH2eOOspcUMk1zullSJ+aYoipH
 8y3dQIsJz+GBk6I422ZeHoXgw7zzMTsehAMIG4B1Ker2qTq4bY+TAE8klH3yxtK9d2Al
 o3qQ==
X-Gm-Message-State: AOAM530MWMBQQKyT5GgFGIToObWNHotvRs7/omNFp7ip/8t1hZ/bLAGS
 mq6MU3OPxU8kdCc7UQLKYB974pNSjAoGJ+Nkcxk=
X-Google-Smtp-Source: ABdhPJxLRWIxX+ylSeHh5gNn/W0febTp1WSbgiRGPMA2M0haLGbHDuacQuJmqW/SsTB2vLUtNxHD7kryu35rr91PuUU=
X-Received: by 2002:a05:620a:bd5:b0:67d:15ed:2fcd with SMTP id
 s21-20020a05620a0bd500b0067d15ed2fcdmr21096563qki.81.1649661728137; Mon, 11
 Apr 2022 00:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220410203138.22513-1-arinc.unal@arinc9.com>
 <20220410203138.22513-3-arinc.unal@arinc9.com>
In-Reply-To: <20220410203138.22513-3-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 11 Apr 2022 09:21:57 +0200
Message-ID: <CAMhs-H9yu-DS_7jHitHg4=0qQusQMN0LqA++k0nJFt0q7z-GzA@mail.gmail.com>
Subject: Re: [PATCH 3/3] mips: dts: mt7621: remove binding for defining gpio
 function for pin groups
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_002211_538888_7446BA0D 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBBcHIgMTAsIDIwMjIgYXQgMTA6MzIgUE0gQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5h
bEBhcmluYzkuY29tPiB3cm90ZToKPgo+IEFsbCBwaW4gZ3JvdXBzIGZ1bmN0aW9uIGFzIGdwaW8g
dW5sZXNzIHNldCBvdGhlcndpc2UuIFRoZXJlZm9yZSwgcmVtb3ZlCj4gdGhpcyB1bm5lY2Vzc2Fy
eSBiaW5kaW5nLgo+Cj4gVGVzdGVkIG9uIFVuaUVsZWMgVTc2MjEtMDYtMTZNIG9uIE9wZW5XcnQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+
Cj4gLS0tCj4gIGFyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzEu
ZHRzIHwgMTIgLS0tLS0tLS0tLS0tCj4gIGFyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIx
LWdudWJlZS1nYi1wYzIuZHRzIHwgMTIgLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MjQgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8u
cGFyYWN1ZWxsb3NAZ21haWwuY29tPgoKVGhhbmtzLAogICBTZXJnaW8gUGFyYWN1ZWxsb3MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
