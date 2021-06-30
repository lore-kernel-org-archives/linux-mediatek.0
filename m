Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7BAC11F68
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 23:22:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509D761263
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 23:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 509D761263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqXgBQJLXMu4UOiWgs7ufv5nDT8luVUB9U9kdnTEAgw=; b=NQEapkU9q6i2X7
	dRjOE72T5qynjFYzNMuBDLP+jBDBMzEibD9soNRnjfg5+jWBST+SozzJX+zBnTrFhNS7XIw//GL1M
	eX9bK3XvAXwcM8OgbHqvKLn5AABHYbxlMiwNYSL+1VHoK8KHZ2+nbbh0If9+f3ib8GDWFYb0SiKQD
	Phj4gkUhnXdCWqwrh9Gmy2UhYRS3pCRdw2smV7JS6+Sx8SNg3HHUeReQ+v5U/vKwEUJHXUtikKiwi
	MBXvAzmYEFWLYhmSJ5Nh9jvkgucb2j3ZqumZHB26KWiQAMSiPIx3SXJZ1IU4pzi4L4C/yLkj+3fzL
	cJ3d2mByAMDV0pSEthpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyjX2-00FXFn-Nw; Wed, 30 Jun 2021 23:22:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyjWo-00FXDL-6a; Wed, 30 Jun 2021 23:21:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF09961494;
 Wed, 30 Jun 2021 23:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625095317;
 bh=tHL+XCD2rEOEbdKWrPLa/uYf1Uf/oPwC9ZVcqe4TrdY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YYa33W2Vyt7lkUX04pP+nNvic6v7cT5Uo2pb8NL2unCfUn5oPA/NrwOat3zyM2oWw
 XZOBlVwFU5f7qTuKjro6Ydm0353Yl3l4nm7E6JOCwHH7guKZGu452c1+gtBEt86+78
 g74Ec9OJJgxr/x60pq/DSyBTZF0PrFgVfyfdyexnk4JbsqrxCGN/RFnZVxPfbMWLY5
 mB/j4p19WV4CL2tQwj9jnRV9SFBViabowIpoDOZgLuYPZQIUBwL875vIaZ0DC3vhBO
 vhinhbDPhM0Jg2P7VENluWFuXEQf4oNmc1QrJ1sowwO+iEUn62bWHGWbR6KDmhex23
 lEQDuP7XWt4Qg==
Received: by mail-ej1-f54.google.com with SMTP id hc16so7045864ejc.12;
 Wed, 30 Jun 2021 16:21:57 -0700 (PDT)
X-Gm-Message-State: AOAM533XY+ImGmr1XB4hwZ0X/SZ+pTnMvBcaTitx0XEy4G8z67BUvEls
 o7bqXdJJ4kOEwmKXdv5HIHYaqGdq6jcCmDT48A==
X-Google-Smtp-Source: ABdhPJzPLyaPSWeFoM4shqoF7CpJjg3MvYR1+Z7xCorPSgqpeK6NZ7q6OI8QkU2saaQqmqcU0ei0B2umtiEAoJkXeD4=
X-Received: by 2002:a17:907:7287:: with SMTP id
 dt7mr4200475ejc.127.1625095316280; 
 Wed, 30 Jun 2021 16:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210630051418.14044-1-jason-jh.lin@mediatek.com>
 <20210630051418.14044-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210630051418.14044-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 1 Jul 2021 07:21:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9B1L=1=LzdC_1_czFgc4smH0hTk0B=XCquH08KAjx_nA@mail.gmail.com>
Message-ID: <CAAOTY_9B1L=1=LzdC_1_czFgc4smH0hTk0B=XCquH08KAjx_nA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] arm64: dts: mt8195: add gce node
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_162158_321487_6442CCFA 
X-CRM114-Status: GOOD (  15.46  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDbmnIgzMOaXpSDpgLHkuIkg5LiL5Y2IMToxOOWvq+mBk++8mgo+Cj4gYWRkIGdjZSBu
b2RlIG9uIGR0cyBmaWxlLgo+Cj4gQ2hhbmdlLUlkOiBJODA1NDU1Y2I3YzY0NWNiNWEyNGNlMWM4
N2ZlODkxYTgwNzA2OTEyMwo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgu
bGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIFsxXQo+IFsx
XSBBZGQgTWVkaWF0ZWsgU29DIE1UODE5NSBhbmQgZXZhbHVhdGlvbiBib2FyZCBkdHMgYW5kIE1h
a2VmaWxlCj4gICAgIC0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1lZGlhdGVrL3BhdGNoLzIwMjEwNjAxMDc1MzUwLjMxNTE1LTItc2VpeWEud2FuZ0BtZWRpYXRl
ay5jb20vCj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kg
fCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQo+IGluZGV4
IGMxNDZhOTFjNjI3Mi4uMzgwNTQxOTZlZWE0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5NS5kdHNpCj4gQEAgLTYsNiArNiw3IEBACj4KPiAgL2R0cy12MS87Cj4gICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDgxOTUtY2xrLmg+Cj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9nY2UvbXQ4MTk1LWdjZS5oPgo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgx
OTUtcG93ZXIuaD4KPiBAQCAtNzE3LDYgKzcxOCwyNiBAQAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICNjbG9jay1jZWxscyA9IDwxPjsKPiAgICAgICAgICAgICAgICAgfTsKPgo+ICsgICAgICAg
ICAgICAgICBnY2UwOiBtZHBfbWFpbGJveEAxMDMyMDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZ2NlIjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MCAweDEwMzIwMDAwIDAgMHg0MDAwPjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjI2IElSUV9UWVBFX0xFVkVMX0hJR0gg
MD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI21ib3gtY2VsbHMgPSA8Mz47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZpbmZyYWNmZ19hbyBDTEtfSU5GUkFfQU9fR0NF
PiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmluZnJhY2ZnX2FvIENMS19J
TkZSQV9BT19HQ0UyPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJn
Y2UiLCAiZ2NlMSI7Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICBn
Y2UxOiBkaXNwX21haWxib3hAMTAzMzAwMDAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWdjZSI7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDAgMHgxMDMzMDAwMCAwIDB4NDAwMD47Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyOCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Owo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICNtYm94LWNlbGxzID0gPDM+Owo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNsb2NrcyA9IDwmaW5mcmFjZmdfYW8gQ0xLX0lORlJBX0FPX0dDRT4sCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZpbmZyYWNmZ19hbyBDTEtfSU5GUkFfQU9f
R0NFMj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiZ2NlIiwgImdj
ZTEiOwoKSSB0aGluayBlYWNoIGdjZSBjb3VsZCBiZSBicm9rZW4gaW50byB0d28gZnVuY3Rpb24g
YmxvY2ssIHRoZSBjb3JlCmZ1bmN0aW9uIGJsb2NrIGFuZCBldmVudCBwcm9jZXNzaW5nIGJsb2Nr
LgpFYWNoIGJsb2NrIGhhcyBpbmRlcGVuZGVudCBjbG9jayBzb3VyY2UgYW5kICJnY2UiIGlzIGZv
ciBjb3JlIGZ1bmN0aW9uCmJsb2NrIGFuZCAiZ2NlMSIgaXMgZm9yIGV2ZW50IHByb2Nlc3Npbmcg
YmxvY2ssIGlzIGl0PwpJZiBzbywgdGhlIGNvcmUgZnVuY3Rpb24gb2YgZ2NlMCBhbmQgZ2NlMSBo
YXMgY29tbW9uIGNsb2NrIHNvdXJjZQooPCZpbmZyYWNmZ19hbyBDTEtfSU5GUkFfQU9fR0NFPiks
IHJpZ2h0PwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+
ICAgICAgICAgICAgICAgICB1YXJ0MDogc2VyaWFsQDExMDAxMTAwIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS11YXJ0IiwgIm1lZGlhdGVr
LG10NjU3Ny11YXJ0IjsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDExMDAx
MTAwIDAgMHgxMDA+Owo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
