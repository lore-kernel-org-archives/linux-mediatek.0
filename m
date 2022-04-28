Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C933C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sujxA9kHtyjshilzKJM3vqsy3lqEfjk3MjNt58IVfs=; b=Wfj5zUHX07ZWyw
	LFEKeLHmMsG7liT5SsWf5u6BfG8p7FyaVxJadzc5aoAu5ICWKgFfRmsDpjMinDsyQM5Q1GVufwNHb
	qvym3joc/msJDih8Nunkh7Jeixl/3nm0qvf1DtdLflDGBVFWsdGbfdXW8yW9yuSrj3/wV86cRMsDk
	q2+PDHpJ1p2KEOr67/HdhkOlybKh02hrevonbn0dRr1NcqM0Dy/MepmYJiHLS2Ls+hTRhX2jcB5PS
	G/PGwtCS/PIjT2Kp0cEHVDLHyc4uOBgmUPOrT0OtGVBNPmHwtL4MhFhUQV6YnJqrG/sqz4NGRxu4v
	eIhLc04utgZNhfj3NGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0UM-005jHf-3O; Thu, 28 Apr 2022 09:31:06 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0U7-005jDB-U5; Thu, 28 Apr 2022 09:30:55 +0000
Received: by mail-oi1-x22e.google.com with SMTP id m11so4716289oib.11;
 Thu, 28 Apr 2022 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nngAnZlymkzX4sUAsT0146zEMaA0AO4c4fvL3wIWwWk=;
 b=l18ijNANJ5b5fye/QNxz87z7+j8z02w6R0swX/JLw63krCb6g192GEyjHjzQP5aj5N
 Oa7DRdFJTdgQbLmCBFuvVrJFSZZCa7u2cofzzcnvLPI61NzdxgLO4fNj9EEFzE61wyUQ
 mam1iVGXHTeLeNvTESRsLv1awkl9hwK0Yu75xPx/hPIc21cKILj4Dqif7rntW15dNRgM
 PSyyh4uu+e/czfoBlGa26euNzMwWhk9eRd+G+bd56WOPNdgv9VmPtDcQw6SHIEQqXUoP
 z/HArI89LLF3VoUNX4cm9BKXp7vKYNCsN+7V/IEXzt52nWFAlin61yEZXfhUw/uPoXAY
 vqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nngAnZlymkzX4sUAsT0146zEMaA0AO4c4fvL3wIWwWk=;
 b=W5wqWAVoXIpCyWNiDMx4LWhsyQN3XVivog42O5txVhh9NNjQHvz9twQBjtGSz7VHLG
 wojX0+dU50iJfvKajEcMBwDbDkblr4040MDcVCHW4vnzs9CCeP1GgAeMTl6OPNwB1LBr
 ZrLJMCjP5edNKs4qamxknA/zNIqEZJv769M5ecKgtveOvnIvtMnIu5ARU0TuwEaAX9PE
 d5mDCrjnJ8UjJVu4uTSq+YBwckQ+OKbD3kpoEzlFql7JXb2TLgbexfP+lx3uizgKLhCB
 ixy3RIhe13uePzAqeTyzOLWpDhSdLSP6XV6eaXV5XYWd0UFatUzwRmlaaBnZxJu7oJcg
 aQjA==
X-Gm-Message-State: AOAM533XgoksPGIXHsRevrtsUNxbyeG/cn7cS7vR6bWbmKHVAXxedtMV
 8AT23ydQld6HETYqB0jII5jS3DFpuo+nRSkHX9s=
X-Google-Smtp-Source: ABdhPJxBPaN24K5DEsdqrFfIEtSaWdXHM9IEjTWzdDQ+b3wWrScNMI+uGO0dfJS0cpYEZLaEWLJNqGcvxnc4xNMAtpc=
X-Received: by 2002:a05:6808:1246:b0:2c9:efa5:7209 with SMTP id
 o6-20020a056808124600b002c9efa57209mr20058605oiv.62.1651138249908; Thu, 28
 Apr 2022 02:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
 <20220427080330.40136-3-gene.chen.richtek@gmail.com>
 <YmmQpg/Hh6qTNhj2@robh.at.kernel.org>
In-Reply-To: <YmmQpg/Hh6qTNhj2@robh.at.kernel.org>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 28 Apr 2022 17:30:38 +0800
Message-ID: <CAE+NS34SawC_pdTm=eDmp6zq1zLZgEaA+_s_xZOc4LuFHDV1iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: Add bindings for the Mediatek MT6360
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, krzysztof.kozlowski+dt@linaro.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, ChiYuan Huang <cy_huang@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_023052_022223_A2824A95 
X-CRM114-Status: GOOD (  16.53  )
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

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjLlubQ05pyIMjjml6Ug6YCx5Zub
IOS4iuWNiDI6NTHlr6vpgZPvvJoKPgo+IE9uIFdlZCwgQXByIDI3LCAyMDIyIGF0IDA0OjAzOjMw
UE0gKzA4MDAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVu
QHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFkZCBiaW5kaW5ncyBmb3IgdGhlIE1lZGlhdGVrIE1UNjM2
MAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29t
Pgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL210NjM2MC55YW1sICAg
ICAgIHwgMjU4ICsrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNTggaW5z
ZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWZkL210NjM2MC55YW1sCj4KPiBBcyBJIG1lbnRpb25lZCwgSSBhcHBsaWVk
IHlvdXIgcHJldmlvdXMgdmVyc2lvbi4gUGxlYXNlIHNlbmQgYSBwYXRjaCBvbgo+IHRvcCBvZiBp
dCBhZGRpbmcgdGhlIGNoaWxkIG5vZGVzLgo+Cj4gUm9iCgpIaSBSb2IsCgogICAgSSB0cnkgdG8g
c3luYyBsYXRlc3QgY29kZSBhbmQgY2FuJ3QgZmluZCB0aGUgbXQ2MzYwIGxlZCBmaXhlZCBwYXRj
aC4KICAgIENvdWxkIHlvdSBwbGVhc2UgdGVsbCBtZSBob3cgdG8gZ2V0IGFuZCBhcHBseSBwcmV2
aW91cyB2ZXJzaW9uPwogICAgQW5kIHNob3VsZCBJIGFkZCBhIHRhZ3MgaW4gY29tbWl0IG1lc3Nh
Z2UgdG8gdGVsbCB3aGljaCBwcmV2aW91cwpjb21taXQgSSBiYXNlZCBvbj8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
