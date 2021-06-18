Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA3FC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 14:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9056044F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 14:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9056044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp7/kd5AQ99XvQnFzbxISHE5LTTQVKaQ8wYgcRJvt30=; b=a6+qgbhrYjfU0e
	MMvWJkVGppWEpI4mb7CxwG+yTIJl6czos/UvvMu1nH0N7AOjjm2KA5Pi1641or179aSzRkCm9+AAD
	wSqbEiQ7V35pZaurb6+HApC4YQwXe8nqs7heRKSccWtbZWVkVrRhKcSFvePyDGlXcCOrL8vjwXRsu
	uc7JtlBDZMcRNdte1eaTaMMJtApt2AEjMbQ8ubmEThnkPU+zG2g9pG72TFCLEoWBVx2WDVdwUDD1v
	zvhLRxiSocvzXrf+9AvvqwmSv8gdS8rMv4WYHdfF39mRaezj3IKGy2HSDM+5b8NjlEI+MMk/6ia/q
	NdJxdHRFY4FbK0ZbQrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luFAH-00EQNq-OC; Fri, 18 Jun 2021 14:08:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luFA1-00EQJE-3e; Fri, 18 Jun 2021 14:07:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B38161222;
 Fri, 18 Jun 2021 14:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624025272;
 bh=q/EDRsPbyVWw5nHi1pYUbYz0y1rXX8Okh97nJe5Pe5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d9j253wkESIMW45qp/ovM+NBE8sm+EXTmrbeWa10xcjBaqjSMjf1LyuvEM45fy6FT
 3eVpFHXzk5JF/TgOETVLLoKy36ywpeXC/x1CQTL1aXsmc7pRsIgEIbh2kiQvyWEM0i
 uHK+JUSzq4glrSEEQxK0qHCrG4ekb79dp8iJ7MesvceUly84s8nIAXJyIl84ZZtmPA
 GqNZX3f6tJbGFw07JeXWpX6f0m/xCY/Pnu99+a0qPhtevC0g1eDIQvY0bW0f4kpj61
 2BdPeByG17CzChFIiBur/VPnN5nYb9KrgQmddiJMwHjehyIKaKo+bS0wip/o6pR8Ls
 VqMmutnkpqxVg==
Received: by mail-ed1-f49.google.com with SMTP id b11so8832854edy.4;
 Fri, 18 Jun 2021 07:07:52 -0700 (PDT)
X-Gm-Message-State: AOAM533/5VTOs00WAgz4GWZuOHzBEISpmK/exTRL1+zd7R1ibZsdtfTf
 zeOzNXDNTEJcGvC7hq0TmeTTmgc8qWKZR/syKA==
X-Google-Smtp-Source: ABdhPJwKlMD/iaZlnx1AtcRmiX+8KHoKp9K/i1zV+cOE9TBxS9hQPHWvWDu2gJFH+ufOe7b8ejNQgcY0Cmei387eDz8=
X-Received: by 2002:aa7:c0da:: with SMTP id j26mr5031487edp.38.1624025270893; 
 Fri, 18 Jun 2021 07:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
 <20210615173233.26682-23-tinghan.shen@mediatek.com>
In-Reply-To: <20210615173233.26682-23-tinghan.shen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 18 Jun 2021 22:07:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Q63NGmOxjbBz0AEUdMUoVbTpbn8ZXkawauP_bNr2oYw@mail.gmail.com>
Message-ID: <CAAOTY_9Q63NGmOxjbBz0AEUdMUoVbTpbn8ZXkawauP_bNr2oYw@mail.gmail.com>
Subject: Re: [PATCH 23/27] arm64: dts: mt8195: add gce node
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 DTML <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, wenst@google.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_070753_234782_0B981AF1 
X-CRM114-Status: GOOD (  14.84  )
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

SGksIFRpbmdoYW46CgpUaW5naGFuIFNoZW4gPHRpbmdoYW4uc2hlbkBtZWRpYXRlay5jb20+IOaW
vCAyMDIx5bm0NuaciDE25pelIOmAseS4iSDkuIrljYg1OjM15a+r6YGT77yaCj4KPiBGcm9tOiBK
YXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4KPiBhZGQgZ2NlIG5vZGUg
b24gZHRzIGZpbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTk1LmR0c2kgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRz
aQo+IGluZGV4IGQ3ZDJjMmE4ZjQ2MS4uNTFlZGI4ZWUzNWE4IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpCj4gQEAgLTcsNiArNyw3IEBACj4gIC9kdHMtdjEv
Owo+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDgxOTUtY2xrLmg+Cj4gKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9nY2UvbXQ4MTk1LWdjZS5oPgo+ICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+ICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9t
ZW1vcnkvbXQ4MTk1LW1lbW9yeS1wb3J0Lmg+Cj4gQEAgLTEwNzUsNiArMTA3NiwyNiBAQAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPiAgICAgICAgICAgICAg
ICAgfTsKPgo+ICsgICAgICAgICAgICAgICBnY2UwOiBtZHBfbWFpbGJveEAxMDMyMDAwMCB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZ2Nl
IjsKCldoZXJlIGlzIHRoZSBkZWZpbml0aW9uIG9mIHRoaXMgY29tcGF0aWJsZT8KCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMDMyMDAwMCAwIDB4NDAwMD47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyNiBJUlFfVFlQRV9MRVZF
TF9ISUdIIDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNtYm94LWNlbGxzID0gPDM+Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJB
X0FPX0dDRT4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZpbmZyYWNmZ19h
byBDTEtfSU5GUkFfQU9fR0NFMj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFt
ZXMgPSAiZ2NlMCIsICJnY2UxIjsKCkFjY29yZGluZyB0byB0aGUgYmluZGluZyBkb2N1bWVudCBb
MV0sIGNsb2NrLW5hbWVzIHNob3VsZCBiZSAiZ2NlIi4KClsxXSBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tdGstZ2Nl
LnR4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsg
ICAgICAgICAgICAgICBnY2UxOiBkaXNwX21haWxib3hAMTAzMzAwMDAgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWdjZSI7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMDMzMDAwMCAwIDB4NDAwMD47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyOCBJUlFfVFlQRV9MRVZF
TF9ISUdIIDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNtYm94LWNlbGxzID0gPDM+Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJB
X0FPX0dDRT4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZpbmZyYWNmZ19h
byBDTEtfSU5GUkFfQU9fR0NFMj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFt
ZXMgPSAiZ2NlMCIsICJnY2UxIjsKPiArICAgICAgICAgICAgICAgfTsKPiArCj4gICAgICAgICAg
ICAgICAgIHVhcnQwOiBzZXJpYWxAMTEwMDExMDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LXVhcnQiLCAibWVkaWF0ZWssbXQ2NTc3LXVh
cnQiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTEwMDExMDAgMCAweDEw
MD47Cj4gLS0KPiAyLjE4LjAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
