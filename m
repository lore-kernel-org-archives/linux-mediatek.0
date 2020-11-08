Return-Path: <SRS0=xa7l=EO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889BCC388F7
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 03:29:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0F620760
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 03:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YEVSWbwP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMoQBj41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0F620760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Ap4DVdlL0CuyZPYbdp3uK2hoXJdU5qhGvr3tkgfzGo=; b=YEVSWbwPbTxzyYPQglPqLXrzJ
	M/rtdtDgjL09ZSGTtv/lPwdGj0GillUPIIM1nS2Bd7Zw6jextzsUVdwUBKROvEZpT917dTFCyFJR3
	jOLbO/CZqKDWcm07YzncUKWEC1B6onqFifElzx1WDydd0md2u/ZRLgV6CtXDB35ZggoFgHEP1K2w4
	GsyNmdXGIo2tB66nfXJkyHxnhHIeRGL//e2J6qXfqt6Y9tQsFV+rZtsPXjVNvv7rreQ8WgfNM74T5
	fSkvZyNQvk62Ce3MrcnJN6xHbL7PfdinCLJRTig3/fbVXFLeZMNk069RFpFPRVrlr/NB2PkiWK5L0
	IvB+Ea1wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbbNn-0005pY-6O; Sun, 08 Nov 2020 03:28:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbbNj-0005oc-6w; Sun, 08 Nov 2020 03:28:44 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7754C221E9;
 Sun,  8 Nov 2020 03:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604806121;
 bh=15PLnXybh2lEXrB1xUvGTz2108s9b14lvl6FVOOsnkM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sMoQBj41ddbPFQTcan6DzPGdl1NoHy+EQV286lImAxg0Id1qJpr6o2rqD1S5896F2
 Qy5jqS6bzaaVGf2oANmLFLAci4OFrnv04egdIUEALM93RUdywpy4c6UQXeRL4o9lOE
 fqKyCmm6FX7g/hDnhbcqixNuQoDd6nQW/0Hh2gHM=
Received: by mail-ej1-f46.google.com with SMTP id i19so7426533ejx.9;
 Sat, 07 Nov 2020 19:28:41 -0800 (PST)
X-Gm-Message-State: AOAM530/lXcRo6aWCupFX7vpC+ccnlR259jhmGlZQ2C9rNZcdVP5N5vi
 S81bXb47UAJ/muNqcY7SuPRUr62ZZmCi3Cx02g==
X-Google-Smtp-Source: ABdhPJyBseDAhXQ/6C9jcMSsrTp+8xbOBCsG2KacXh8VPxOMNSA/zdsBnuqjc6Ef7wdx0UtfJ8yVeN4wasCoPh0S1AU=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr9065798ejq.303.1604806120037; 
 Sat, 07 Nov 2020 19:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20200917073305.25738-1-jitao.shi@mediatek.com>
 <20200923201517.GA1226945@bogus>
In-Reply-To: <20200923201517.GA1226945@bogus>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 11:28:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8EbbWRzvn3i_a5TjYKuUX7g=EmVNnAVY80OYePr_ndDQ@mail.gmail.com>
Message-ID: <CAAOTY_8EbbWRzvn3i_a5TjYKuUX7g=EmVNnAVY80OYePr_ndDQ@mail.gmail.com>
Subject: Re: [v2 PATCH] dt-bindings: display: mediatek: convert the dpi
 bindings to yaml
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_222843_351361_DDBE4FAE 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ55pyI
MjTml6Ug6YCx5ZubIOS4iuWNiDQ6MTXlr6vpgZPvvJoKPgo+IE9uIFRodSwgMTcgU2VwIDIwMjAg
MTU6MzM6MDUgKzA4MDAsIEppdGFvIFNoaSB3cm90ZToKPiA+IENvbnZlcnQgZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkcGkudHh0IHRvIGRpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlh
bWwKPiA+IGFuZCByZW1vdmUgdGhlIG9sZCB0ZXh0IGJpbmRpbmdzLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQgICAgIHwgNDIgLS0t
LS0tLS0tLQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55
YW1sICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
OTcgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRwaS50eHQKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwKPiA+Cj4KPiBS
ZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBfXwoKQXBwbGllZCB0
byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
