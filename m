Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5B9C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 293B860525
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 293B860525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8QjlcVpOsCqPuBY5mJG0xgWYAuCya2+S1dpGtnLAVY=; b=JZhcGXobMGoOEc
	sMMaMVgyUVnPglC+xhKvc8HRjIPlOwUNTmUVvzOOh4ll1paKYAO3HoxASfHS+47wszCIJpNYelBO1
	vkwaZOEm5JqMKZOuXhKKbcWC8r+z/9uEG/VKb2umyB4dnozyYlunFYP83GcsW4vCOrO4wIb+JkraH
	ICdkH5wary5ljNa2oQ2Zx+VafUEDzTHMCxYtyNYuQmXbZK2JDjGv1j+RD9Lmu40QjSlpcUOO8Zk5t
	+GGmnHTODWXK7jOCL7Q/sWpzP3VsQLkzYhUvFvP3bSh1hvKsWAoUeKkpJdzqtTt3yymVfc5d2LqUI
	465Qm4dzLFFMy6H9eHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mArhN-0022VR-QE; Tue, 03 Aug 2021 10:31:01 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mArdz-0020ms-Av; Tue, 03 Aug 2021 10:27:32 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 v9-20020a9d60490000b02904f06fc590dbso1323721otj.4; 
 Tue, 03 Aug 2021 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a7FlZ03sMMFDq0EaJdzNgcA0RsE6ZHavlLrFbWbkVBI=;
 b=CTvQRaLuHwpr4YFmOpNfdF4A7yyh8VZ2GPLb8DzFNh22erw5Cc++vRRWJbF8keKdqd
 QVlhXXTEbwiHd3ovcn+RcDXgwv39FPnlMsufgZIJtX4a3NvXsLc8k/8jArevnDYmRJk7
 etrhLn8B0xe572yuRdZCNl/+thKd2QwGbU9fmTaZ69kgpWfm05aqq6ond6VQT68iHOz8
 qWG+MBQxMbz3Na1Uoxk/aD/a73ViW5EScqo/QdCt7f/f0XcECu+be2OEq5ULZOkJN0Y8
 EC/vrs0c4KdMVgYkEW7PDSBr8iHqkct/6kvg/axaC2Ds7gG5wHgOcc1v7pGCEKRS/J6A
 iRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a7FlZ03sMMFDq0EaJdzNgcA0RsE6ZHavlLrFbWbkVBI=;
 b=mv2eGYp9tkm3AieyIvxakib6sygRnLeW8fuZz+vlv1QcDGj7ACCxri2zGE0yWvHVuo
 +DjA5jPPy/Iwgtcpt9kkY4yQ1d5ggBdow4ee+XIGQrrT6CA6wA/QBlci7T/qTgMlJsNf
 4eAXcHxah20tl4qUCvbEXTcqlYoRgmWl9VXGKTASeoZGXA8/OOd9WimmYpZqCuvaReDO
 Vuh0sNSDJovCs/QVf5RqaAIxmiFyBZv3DEit+5gysQrHHByCtyzo/dFGcGhviPU1qQER
 wm515CWrMiJjd/oLzsDBhgo//tRSOwBPMQDKNlu6E8xKt84bvt3fZJalefMGUX6pPlr8
 vZzA==
X-Gm-Message-State: AOAM533ziveCtGtLXBhDjh9nfSOdv4Gwmhtbt/RqtyIQir34FlTUlEYO
 24nVWedkfrt8zZ8aGy1t/sSHNnlCIsCNfl3Zwm8=
X-Google-Smtp-Source: ABdhPJzoYlu+4fKg13DVvIhykV/dAvtsAaqF362YwTXvXeldN1kY6BImYn+JXzeDMp+4CQ/KtyJzyzujhmKXSI4scSM=
X-Received: by 2002:a9d:d86:: with SMTP id 6mr1355299ots.362.1627986450426;
 Tue, 03 Aug 2021 03:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
In-Reply-To: <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 3 Aug 2021 12:27:17 +0200
Message-ID: <CAFqH_53dZxhTwVmSRJ5DX+uV86cPRZjyEri3UEzcRLiye=OhNA@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement from
 mtk-mdp
To: Eizan Miyamoto <eizan@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 Houlong Wei <houlong.wei@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_032731_437230_75D9C728 
X-CRM114-Status: GOOD (  17.27  )
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

SGkgRWl6YW4sCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgpNaXNzYXRnZSBkZSBFaXphbiBN
aXlhbW90byA8ZWl6YW5AY2hyb21pdW0ub3JnPiBkZWwgZGlhIGRsLiwgMiBk4oCZYWcuCjIwMjEg
YSBsZXMgMTQ6MTU6Cj4KPiBJdCBpcyBubyBsb25nZXIgbmVlZGVkIGJ5IHRoZSBtdGstbWRwIGRy
aXZlcgo+Cj4gU2lnbmVkLW9mZi1ieTogRWl6YW4gTWl5YW1vdG8gPGVpemFuQGNocm9taXVtLm9y
Zz4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bj
b2xsYWJvcmEuY29tPgoKCj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPgo+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstbWRwLnR4dCB8IDMg
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1tZHAudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLW1kcC50eHQK
PiBpbmRleCBjYWEyNDk0M2RhMzMuLjRjMzI1NTg1ZjY4ZiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstbWRwLnR4dAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1tZHAudHh0
Cj4gQEAgLTQsOCArNCw2IEBAIE1lZGlhIERhdGEgUGF0aCBpcyB1c2VkIGZvciBzY2FsaW5nIGFu
ZCBjb2xvciBzcGFjZSBjb252ZXJzaW9uLgo+Cj4gIFJlcXVpcmVkIHByb3BlcnRpZXMgKGNvbnRy
b2xsZXIgbm9kZSk6Cj4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLG10ODE3My1tZHAiCj4gLS0g
bWVkaWF0ZWssdnB1OiB0aGUgbm9kZSBvZiB2aWRlbyBwcm9jZXNzb3IgdW5pdCwgc2VlCj4gLSAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXZwdS50eHQg
Zm9yIGRldGFpbHMuCj4KPiAgUmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nr
cywgY2hpbGQgbm9kZSk6Cj4gIC0gY29tcGF0aWJsZTogU2hvdWxkIGJlIG9uZSBvZgo+IEBAIC00
MSw3ICszOSw2IEBAIEV4YW1wbGU6Cj4gICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8
JnNjcHN5cyBNVDgxNzNfUE9XRVJfRE9NQUlOX01NPjsKPiAgICAgICAgICAgICAgICAgaW9tbXVz
ID0gPCZpb21tdSBNNFVfUE9SVF9NRFBfUkRNQTA+Owo+ICAgICAgICAgICAgICAgICBtZWRpYXRl
ayxsYXJiID0gPCZsYXJiMD47Cj4gLSAgICAgICAgICAgICAgIG1lZGlhdGVrLHZwdSA9IDwmdnB1
PjsKPiAgICAgICAgIH07Cj4KPiAgICAgICAgIG1kcF9yZG1hMTogcmRtYUAxNDAwMjAwMCB7Cj4g
LS0KPiAyLjMyLjAuNTU0LmdlMWIzMjcwNmQ4LWdvb2cKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
