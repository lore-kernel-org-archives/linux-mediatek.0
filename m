Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C56C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaHV7vJCIPEYU+XkG4rgKf15ONe1+gu5YSFSLe0VcO0=; b=DGTCy9junXqC7v
	/heqSNFRfYSsrRXjak4ZcW0iebswre+FpONZ62O6xuuouPHNAXcBPfWZ93hQPHPvY72762fWcp6s+
	yK0duKlG5G64JBwBhSmaiN9iT4KXsapZVOLJ7V354MpKbykz9wkA5BJBsDwymYzL851dXm8XEgqfC
	taedfvIVw32HudBzB8VzjQubD9CxsR5ReRwS1fn7/2RM50+SeiT+r2t8CJ+jA8hxPivGDf+728DAq
	FZN9DMv575aqQUJA7Yn90ipw+5dEtEvtixnMyUKfIYbhDhK9GgGTCGrmS6X6uDWwp3e2ZCr6TMa5n
	8UbHgFrAN/un0I5LdrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQHg9-00CORo-4G; Fri, 04 Mar 2022 23:49:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQHfv-00COMz-Mg; Fri, 04 Mar 2022 23:49:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D02261F35;
 Fri,  4 Mar 2022 23:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9231FC36AE3;
 Fri,  4 Mar 2022 23:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437770;
 bh=4ELZp74PMU7CcPVa1I6hOUB32VqfOzoIpZtL5yF8JJM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bH8Y9/qdfdmdEHqoPRStJ7/fyR414JEoPT8jqsRV7LWELkcJMkLjrB6qlTo4SvWoO
 rkqZduxODORdeDwBSek+U6J7GS+DpuEq8APBgOyPkiLAfMEYExBoFr4CYdJWOQmUsC
 7d4g/jAurqDNgogC57b3sMARoQgqA+7lizXuxw8Jt9YuAycE8UAdVw46OFZqnNIrRm
 DXTblS8GaC04L+TmYEeojPB5v8Ol1JQZVLSsJn2sMHrB4iWJGVf4Ec0QB4TrB02F7E
 1rysmAvGAHVeSdhPPHABHD6KFG3l9s9PTNZzRf2ytP6wApzGyBdpczY6EeYoGVsvj2
 6tz6mXbSMcQnQ==
Received: by mail-ej1-f53.google.com with SMTP id qt6so20489283ejb.11;
 Fri, 04 Mar 2022 15:49:30 -0800 (PST)
X-Gm-Message-State: AOAM5326PYwqMzp4OxTsK7/floj7vYhKjnp5dRm/jooe/5z4sFCpAWsX
 3pEDWQ2LkjRwA249qO6dY8hW6JQhz0KspVgGeQ==
X-Google-Smtp-Source: ABdhPJwKzfXlFjDAMAwtLcoz0QtxWyjlL5WxxrHe/cElb7iEak4IuABWyNlIa9tTLPAXSXTcst+Vdbv+PcgD7ZHGvOs=
X-Received: by 2002:a17:907:e87:b0:6da:8de2:ce94 with SMTP id
 ho7-20020a1709070e8700b006da8de2ce94mr959302ejc.406.1646437768870; Fri, 04
 Mar 2022 15:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:49:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
Message-ID: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix MediaTek display dt-bindings issues
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, krzysztof.kozlowski@canonical.com, 
 David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_154931_840891_6C02EE6A 
X-CRM114-Status: GOOD (  15.62  )
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

SGksIFJvYjoKCldvdWxkIHlvdSBsaWtlIHRvIHRha2UgdGhpcyBzZXJpZXMgaW50byB5b3VyIHRy
ZWUsIG9yIEkgdGFrZSB0aGlzCnNlcmllcyBpbnRvIG15IHRyZWU/CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4g5pa8CjIwMjLlubQz5pyINOaXpSDpgLHkupQg5LiL5Y2INTo1NeWv
q+mBk++8mgo+Cj4gVGhlIHZkb3N5czAgc2VyaWVzIGNhcnJpZWQgYSBuaWNlIGR0LWJpbmRpbmdz
IGNvbnZlcnNpb24gb2YgdGhlIG9sZAo+IHR4dCBkb2N1bWVudGF0aW9uIGZvciB0aGUgZW50aXJl
IG1lZGlhdGVrLWRybSBkcml2ZXIsIGJ1dCBzb21lIG9mCj4gdGhlIGlzc3VlcyBpbiB0aGVyZSB3
ZXJlbid0IHNlZW4uCj4KPiBUaGlzIHNlcmllcyBpcyBmaXhpbmcgYWxsIG9mIHRoZSBpc3N1ZXMg
cG9pbnRlZCBvdXQgYnkgYQo+IGBkdF9iaW5kaW5nX2NoZWNrYCBydW4sIGZvbGxvd2VkIGJ5IGBk
dGJzX2NoZWNrYC4KPgo+IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vICgzKToKPiAgIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlayxtdXRleDogRml4IG1lZGlhdGVrLGdjZS1ldmVudHMg
dHlwZQo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrLG92bDogRml4ICdpb21tdScg
cmVxdWlyZWQgcHJvcGVydHkgdHlwbwo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVr
OiBGaXggZXhhbXBsZXMgb24gbmV3IGJpbmRpbmdzCj4KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssYWFsLnlhbWwgICAgICAgIHwgMjQgKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssY2NvcnIueWFtbCAgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssY29sb3IueWFtbCAgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGl0aGVyLnlhbWwgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwgICAgICAgIHwgIDMgKy0KPiAgLi4uL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwgICAgICAgIHwgMjMgKysrLS0KPiAgLi4uL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZXRoZHIueWFtbCAgICAgIHwgOTkgKysrKysrKysrKy0t
LS0tLS0tLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxnYW1tYS55YW1sICAgICAg
fCAyMyArKystLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sICAg
ICAgfCA0OSArKysrKy0tLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXV0ZXgu
eWFtbCAgICAgIHwgMjcgKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssb2Qu
eWFtbCAgICAgICAgIHwgMTQgKystCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG92
bC0ybC55YW1sICAgICB8IDI2ICsrKy0tCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LG92bC55YW1sICAgICAgICB8IDI4ICsrKystLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxwb3N0bWFzay55YW1sICAgfCAyMyArKystLQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxyZG1hLnlhbWwgICAgICAgfCAyOCArKysrLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssc3BsaXQueWFtbCAgICAgIHwgMTcgKysrLQo+ICAuLi4vZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayx1Zm9lLnlhbWwgICAgICAgfCAxOSArKy0tCj4gIC4uLi9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLHdkbWEueWFtbCAgICAgICB8IDI2ICsrKy0tCj4gIDE4IGZpbGVzIGNo
YW5nZWQsIDMxOCBpbnNlcnRpb25zKCspLCAxODAgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzUu
MQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
