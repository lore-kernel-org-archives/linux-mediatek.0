Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C00C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 12:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A660616EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 12:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A660616EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoZT2Rd36Nih+O09g7hHD2jimeF0hfw7509iNt6J8hs=; b=l1cTJ08SSUbZHx
	OWtyPzOqfBY+OUGDlfSDQlWnWB3lrYxLMW4bGCPQf5ke52eagIZKkzMO7/Rx1J/lg9Uc3b4I9wZN/
	x8eSvi+4L2YJKOQJtvGoybpNyAgDWDdqMDUm19T0wyyzMHOuDSUARYKm2H1KKyZ9tQ9Zcpp0csTME
	UMjATduf3NX/tyZDb+quUy2+Vq1nZp+U1O/z+c2eXyRks0dw5ostuSulw/U2G6n3XSDycwSjvx5WW
	FVLHqegUGP+C/KdGV+/awC2eSik71yI/Je8+5LeWrWyaUL+G8n8GLVmhgSueOroq/RImsCoTaQ+db
	SEMbqY7cD5VhscI4ZqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwkx5-001RHv-Lg; Fri, 25 Jun 2021 12:28:55 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwkwq-001RFH-Jd; Fri, 25 Jun 2021 12:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624624112;
 bh=OSQyckPbw3HSVrcza1qfbGitHxWf8m8/W3YNrW4Ri7c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Lumec2k3Atjmeyg0Xtc35ID9/eM0wr4cQc1xgM1rx1ts10cp/VzkYZqMPlsuAfGrY
 wNvExspkTaaSSeStaT90WpeBolFAGzQh1L4nma/OHPRVa9asx11EEySQ4T0l9/WW7Z
 YT9/IdK2peJ5TAwUoStOKRi83r45IN6MSQ7ab0xI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.157.219] ([217.61.157.219]) by web-mail.gmx.net
 (3c-app-gmx-bs66.server.lan [172.19.170.210]) (via HTTP); Fri, 25 Jun 2021
 14:28:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-59bd4461-3429-4382-9754-90cf20287cad-1624624111998@3c-app-gmx-bs66>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eric Woudstra <ericwouds@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Subject: Aw: Re:  Re: Re: [PATCH] Fix mt7622.dtsi thermal cpu
Date: Fri, 25 Jun 2021 14:28:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <915b101a-6bea-ae96-78ed-d27fa5bfce3a@linaro.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
 <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
 <8b27246b-721e-fa0e-5c2b-b1b4b4d6fdd3@linaro.org>
 <trinity-2eb7c0ac-d9dc-446c-8907-69b5f4df6838-1624618996538@3c-app-gmx-bs66>
 <915b101a-6bea-ae96-78ed-d27fa5bfce3a@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:od0scxwbJ1nSJhIAUYPE2trywtLcZeB6ouz/UKD7WmKyMhXo6bKsskeKCb01sRHMI4NVM
 80RQFPsgXQFcaurpT5/Q+yWRD2Wy+g2vRu7Njs3I8rKk3KwxuEFeQ6bK5IF+sII9P3o4R0zTWaz3
 oBsUNXA4FS+kcqBNGUN6BX9uQyNreIgPu5NDmYs1vSF8HAOA587d2ZfQt6/VrfusmvDdoZyncRkB
 YXLs/gJ3ULx69KCAxsnlkVSpuT42Qs3yu2TOHrJhzBje8+0XKI52AewxkJnq8ysmaV+HiuGQ4f/r
 IE=
X-UI-Out-Filterresults: notjunk:1;V03:K0:AvEMWffUDa4=:5Qe6+hxNliYMnd53d0bxNd
 RmiMDlmgGfPhgEbexzdxoIcXq2Iz6243smb0UmLokG5VUQhr2O2XChyXkaCok6wx+Xe/LOwJJ
 aGU/ZHtusv1AAhUnCoioqxjcpXvNeY9SCS6oR5Clq10ccCuE+L5Udw0NT9LRl3VHIJ+ay+s9I
 IC55+vL2/ixzw+wZ9aVC9d/XLIkBtUxUdDqTZ8Bo4gOz8mDb/leWLS39G3Ilbkih0A+7Blbuh
 Ek0ez9cUAN1lkCaS2DaffyxCrvkxiZLwVDWaf34at6IWQAPQDigDdIxzNGPtLOEg5itub84ix
 XmloSsSJGLLpz6JaK9dlWY2/NtOiPJ30WkfEgNCH4AekKWv8O0daQy3cd9+L3y0279iCnqfZ6
 hBQkaQOJzdv5N3wYQPeVJgLOYe1+G7qazooH1Lq64iD0wbUutcDpWHDzc5AFL4aj8C2gfgK29
 ZX8yYr3fVFV1k9QfSqCDkhbQ7GEXgdy3K2vpQJmMoImJBUGmzMBC2Bsiwi8llQwfedD0Lo4P6
 ZjeANm9/+DgTkJhnoI+/VpyB/MB7xY8I9Tv/hU46UvpEEOCfF4Hp/zZukyg+VzML+A/gGaPFO
 y8Vxm7vvFGdLyqv9iaTQGZKJDQyQTLS3RYZmlskOr2qewDoJfZD2LGJwgVVhAi4Rt5RVi2TJD
 gew1as39uC68Mqb3PLNrwvmJLsMtTnDRCznOnbWVp0MopBU2St6hgkp/IktbM+lJhGN0AmtPf
 NNHAkjnfMlulHtfI0DL0YVpwzdtDnNN+7ANiHU9YsS2yZnUYe4AwwsVQYJBnIeRscqXn2aZvd
 C4P1Fu3KyznNn+yxkuhS3kcOz58hduhCtHoWlEk2I/qgOD9lXk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_052841_030772_BCE6F594 
X-CRM114-Status: GOOD (  24.13  )
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

PiBHZXNlbmRldDogRnJlaXRhZywgMjUuIEp1bmkgMjAyMSB1bSAxMzo0NyBVaHIKPiBWb246ICJE
YW5pZWwgTGV6Y2FubyIgPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+Cgo+ID4gYnV0IHdlIG5l
ZWQgdG8gZGlzYWJsZSB0aGUgcGFzc2l2ZSB0cmlwIGFzIGNwdS10cm90dGVsaW5nIHN0YXJ0cyB0
aGVyZS4uLnRoZSBoaWdoZXIgdGVtcGVyYXR1cmUgdHJpcHMgYXJlIGN1cnJlbnRseSBub3QgcmVh
Y2hlZAo+IAo+IFNvcnJ5LCBjYW4geW91IHJlcGhyYXNlIGl0ID8gSSdtIG5vdCBnZXR0aW5nIHRo
ZSBwb2ludC4KCnRoZSBwcm9ibGVtIGN1cnJlbnRseSBpcyB0aGF0IHBhc3NpdmUgaXMgYXQgNDdk
ZWdyZXNzIENlbHNpdXMgYW5kIHRyb3R0bGVzIGNwdSwgYWN0aXZlICg2N8KwQykgYW5kIGhvdCBw
b2ludHMgYXJlIG5ldmVyIHJlYWNoZWQgdGhpcyB3YXkuIHNvIGF0IGxlYXN0IHdlIG5lZWQgdG8g
Y2hhbmdlIHRlbXBlcmF0dXJlcyBpbiBkdHNpLCBhbmQgbWF5YmUgZGlzYWJsZSBjcHUtdHJvdHRl
bGluZyBvbiBwYXNzaXZlIHRyaXAuIGltaG8gZmFuIHdpbGwgbmV2ZXIgc3RhcnQgaWYgaXQgaXMg
aW4gYWN0aXZlIGFuZCBjcHUgaXMgdHJvdHRsZWQgYmVmb3JlIGluIHBhc3NpdmUKCj4gPiBzdW1t
YXJ5Cj4gPiAKPiA+IG1vdmluZyBmYW4gYW5kIGNwdV90aGVybWFsLW92ZXJyaWRlIHRvIGJhbmFu
YXBpLXI2NC5kdHMKPiA+IAo+ID4gcGFzc2l2ZS10cmlwOiBjb29saW5nLWRldmljZSA9IDwmY3B1
MC8xIDAgMD4gYXMgaW4gZXJpY3MgUGF0Y2gKPiA+IGFjdGl2ZSB0cmlwOiBjb29saW5nLWRldmlj
ZSA9IDwmZmFuMCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+ID4gdGhlIG90
aGVyIDIgdW5jaGFuZ2VkCj4gPiAKPiA+IGJ1dCBpIHN1Z2dlc3QgY2hhbmdpbmcgdGhlIHRlbXBl
cmF0dXJlIHBvaW50cyBpbiBtdDc2MjIgZHRzaSBhcyB0aGlzIGlzIFNvQyBzcGVjaWZpYwo+ID4g
Cj4gPiBzbyBiYXNpY2x5Ogo+ID4gCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210NzYyMi5kdHNpCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
NzYyMi5kdHNpCj4gPiBAQCAtMTQzLDEzICsxNDMsMTMgQEAgY3B1X3RoZXJtYWw6IGNwdS10aGVy
bWFsIHsKPiA+IAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgdHJpcHMgewo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfcGFzc2l2ZTogY3B1LXBhc3NpdmUgewo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRlbXBlcmF0dXJlID0gPDQ3
MDAwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZW1wZXJh
dHVyZSA9IDw3MDAwMD47Cj4gCj4gTWF5IGJlIGluY3JlYXNlIHRoZSBwYXNzaXZlIHRlbXAgdG8g
NzXCsEMuCj4gCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHlz
dGVyZXNpcyA9IDwyMDAwPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB0eXBlID0gInBhc3NpdmUiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB9Owo+ID4gCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9hY3RpdmU6
IGNwdS1hY3RpdmUgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRlbXBlcmF0dXJlID0gPDY3MDAwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0ZW1wZXJhdHVyZSA9IDw4MDAwMD47Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaHlzdGVyZXNpcyA9IDwyMDAwPjsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0eXBlID0gImFjdGl2ZSI7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gCj4gTW92ZSB0aGUgYWN0aXZlIHRyaXAgJ2Nw
dV9hY3RpdmUnIHRvIG10NzYyMi1iYW5hbmFwaS1icGktcjY0LmR0cy4gYW5kCj4gc2V0IGl0IHRv
IDcwwrBDIGluIHRoZSBtdDc2MjItYmFuYW5hcGktYnBpLXI2NC5kdHMsIHNvIHRoZSBmYW4gd2ls
bCBhY3QKPiBiZWZvcmUgdGhlIGNwdSB0aHJvdHRsaW5nLgo+IAo+IFRoZSBiZWhhdmlvciBzaG91
bGQgYmUgdGhlIGZvbGxvd2luZzogVGhlIHRlbXBlcmF0dXJlIHJlYWNoZXMgNzDCsEMsIHRoZQo+
IGZhbiB3aWxsIHN0YXJ0LCBpZiB0aGUgdGVtcGVyYXR1cmUgY29udGludWVzIHRvIGluY3JlYXNl
LCBpdCB3aWxsCj4gaW5jcmVhc2UgdGhlIHNwZWVkLiBJZiB0aGUgdGVtcGVyYXR1cmUgcmVhY2hl
cyA3NcKwQywgdGhlIGZhbiBpcyBzdGlsbAo+IHJvdGF0aW5nIGF0IGZ1bGwgc3BlZWQgYnV0IHRo
ZSBjcHUgYmVnaW5zIHRvIGJlIHRocm90dGxlZC4KCnBhc3NpdmUgdG8gNzUgYW5kIGFjdGl2ZSBs
b3dlciB0byA3MD8gaXMgdGhpcyBhcyBpbnRlbmRlZCB0aGF0IGFjdGl2ZSBjb21lcyBiZWZvcmUg
cGFzc2l2ZT8KCm10NzYyMi1iYW5hbmFwaS1icGktcjY0LmR0czoKCiZjcHVfdGhlcm1hbCB7Cgl0
cmlwcyB7CgkJY3B1X3Bhc3NpdmU6IGNwdS1wYXNzaXZlIHsKCQkJdGVtcGVyYXR1cmUgPSA8NzUw
MDA+OwoJCQloeXN0ZXJlc2lzID0gPDIwMDA+OwoJCQl0eXBlID0gInBhc3NpdmUiOwoJCX07CgoJ
CWNwdV9hY3RpdmU6IGNwdS1hY3RpdmUgewoJCQl0ZW1wZXJhdHVyZSA9IDw3MDAwMD47CgkJCWh5
c3RlcmVzaXMgPSA8MjAwMD47CgkJCXR5cGUgPSAiYWN0aXZlIjsKCQl9OwoJfTsKCgljb29saW5n
LW1hcHMgewoJCW1hcDEgewoJCQl0cmlwID0gPCZjcHVfYWN0aXZlPjsKCQkJY29vbGluZy1kZXZp
Y2UgPSA8JmZhbjAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKCQl9OwoJfTsK
fTsKCgo+IEFGQUlVLCBpdCBpcyBhIENvcnRleC1BNTMgcnVubmluZyBAMS4zNUdILCBzbyBleGNl
cHQgdGhlIGJvYXJkIGlzIGluIGEKPiBibGFjayBtZXRhbCBib3ggdW5kZXIgdGhlIHN1biwgSSBk
b24ndCBzZWUgaG93IHdlIGNhbiByZWFjaCB0aGlzIHRoZXJtYWwKPiBsaW1pdHMuCj4gCj4gPiBA
QCAtMTcwLDggKzE3MCw4IEBAIGNwdS1jcml0IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNvb2xpbmctbWFwcyB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcDAg
ewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRyaXAgPSA8JmNw
dV9wYXNzaXZlPjsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b29saW5nLWRldmljZSA9IDwmY3B1MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+
LAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPCZjcHUxIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29vbGluZy1kZXZpY2UgPSA8JmNw
dTAgMCAwPiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwmY3B1MSAwIDA+Owo+IAo+IFlvdSBzaG91bGQga2VlcCBpdCB1bnRvdWNo
ZWQuCgp0aGVuIGNwdSBpcyB0cm90dGxlZCBhdCBwYXNzaXZlIHBvaW50IChjdXJyZW50bHkgNDfC
sEMpIGFuZCBpbWhvIGZhbiBkb2VzIG5vdCBzdGFydCBhdCBhY3RpdmUKCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIH07CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
