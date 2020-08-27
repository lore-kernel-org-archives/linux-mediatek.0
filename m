Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB1DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:52:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BBC2054F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QZ9hdQf1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjBwiPji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0BBC2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GQV+1aDskdupoqXZD1jNgzJz2kP+S4IaSI9/qMBZyNM=; b=QZ9hdQf17VC2hI/As5IsgEi2t
	YBU9dFR8MW2v2HG0hkI6MDLQ13jolJNTivAVf/Ih9mP80v6sO5XrpPIJlZ3uuf53vz/FJwj0lJDEM
	eqae1hPgoj08ledA6CgDJu2/ov4st0Kifj+R/zdePx7VyRUS0+Zi3DBZqhf2E7vBy3O0oeIXyWq6q
	/uscjpLw0W7Cor4YH9+T1GVaHn43OxgVGDnLrW4UVMlWH3zHu5nb6/rOWvp+9GMdat2hand/zvmqQ
	QqxC2ne9N0v6eWkourlVQI2Cbfh9I8Si9406dzEs4xP0uvNr+c5ZNuEhULvV3DrHL+w4wqDMV6cJE
	8+XSkqK7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBJFz-0007Mu-Q3; Thu, 27 Aug 2020 14:52:03 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBJFr-0007Jn-V9; Thu, 27 Aug 2020 14:51:56 +0000
Received: by mail-lj1-x243.google.com with SMTP id t6so6738389ljk.9;
 Thu, 27 Aug 2020 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=txhfrSF9RX3MqxwN9hoW/kar0+P8SVn2XnHOzqJQ9IY=;
 b=gjBwiPji3SaNbCP9jML1HZoNahK/I6qqs0rl0EygcZbZRptYdcMLHdy1mv7UHcaDp0
 +SUHGKslVz5TRz1z7pi7ETrhxoG2F4LiDXmAi5z22/+KyryUnUvOlH3Du1iqooWTAmiI
 gyt4ZHvwYsreEvMfFGES4WdC5hyJ9xDyNT6KxBEdkshROOsM3DbwVyaKf5XqbIzaLCW3
 2lgsa4SeK2WfjzhOr36LgK+d+MnFbnwSH3ryYf8jPNSSscvVS66RS1qRwWmJCTBwaMcE
 NwJdJy/VloyZP1dH0avdKUyPtuRnd6MBdpz+2Rhxdc+62XDR8G5XrE3S0sk3qNda5+Jq
 Uswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=txhfrSF9RX3MqxwN9hoW/kar0+P8SVn2XnHOzqJQ9IY=;
 b=nLLY46iD1TjI7pQ92PrLyQXYwgeHKd4pvwjRnd3ypYzATcJOzSgwaAj9oWU6xuD4h/
 ykqgNKPmKGm0iNjSM2IPVYoEWhhTxypNaGRpyLXsrx0VSxwJz8U3C/KyuGqtI4F+8ZfO
 JU72ZVRa5M9JqVGx3sOMYzUWDABX3NwLaY6lvyRRDQ37UJEh5mLZOjwT3I9Lv9tu53ni
 QMCnjjAuz6+ltTe7YAUlSDaREWW2HXGnbeAyDAbQH0zI7xEce+RNoAHFRINNG1eaQzJH
 atm3iq7KvhkTPzYqERAYyjcxMhGsUJnkYKL6jtCbNk0NNLfQEwe/CJTCeF/FBGlKJMot
 VDEQ==
X-Gm-Message-State: AOAM530Hjxzbd2uGBdSzLrqz7Kylh5N1XfuSFLAzWq3zkW6kkMwtOuTn
 ZfgWr9tS/AKKgMXeBdloFx36CnjZXbQsZ7XlVS+n3nNYdas=
X-Google-Smtp-Source: ABdhPJxkVhI0j2VsdBWVwc0FSlt/bcCfk71WFFX36z10VABx6cu21rQwkSKWef3JMaP2Bwmgr7KClVB6jt0m6gXA8C8=
X-Received: by 2002:a2e:160d:: with SMTP id w13mr10443684ljd.470.1598539914375; 
 Thu, 27 Aug 2020 07:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
 <20200827140001.GE813478@kuha.fi.intel.com>
In-Reply-To: <20200827140001.GE813478@kuha.fi.intel.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 27 Aug 2020 22:51:43 +0800
Message-ID: <CADiBU393V_iQw_8Hx2braL=8QpvQuTY0059C-XkqmjO9W=aBgQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb typec: mt6360: Add support for mt6360 Type-C
 driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_105156_054840_F4F0ED84 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPiDmlrwgMjAy
MOW5tDjmnIgyN+aXpSDpgLHlm5sg5LiL5Y2IMTA6MDDlr6vpgZPvvJoKPgo+IE9uIFRodSwgQXVn
IDI3LCAyMDIwIGF0IDA3OjE4OjU1UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3RlOgo+ID4gRnJvbTog
Q2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPgo+ID4gTWVkaWF0ZWsgTVQ2
MzYwIGlzIGEgbXVsdGktZnVuY3Rpb25hbCBJQyB0aGF0IGluY2x1ZGVzIFVTQiBUeXBlLUMuCj4g
PiBJdCB3b3JrcyB3aXRoIFR5cGUtQyBQb3J0IENvbnRyb2xsZXIgTWFuYWdlciB0byBwcm92aWRl
IFVTQiBQRAo+ID4gYW5kIFVTQiBUeXBlLUMgZnVuY3Rpb25hbGl0aWVzLgo+ID4KPiA+IHYxIHRv
IHYyCj4gPiAxLiBBZGQgZml4IHRvIFByZXZlbnQgdGhlIHJhY2UgY29uZGl0aW9uIGZyb20gaW50
ZXJydXB0IGFuZCB0Y3BjaSBwb3J0Cj4gPiB1bnJlZ2lzdGVyIGR1cmluZyBtb2R1bGUgcmVtb3Zl
Lgo+ID4KPiA+IHYyIHRvIHYzCj4gPiAxLiBDaGFuZ2UgY29tbWVudCBzdHlsZSBmb3IgdGhlIGhl
YWQgb2Ygc291cmNlIGNvZGUuCj4gPiAyLiBObyBuZWVkIHRvIHByaW50IGVycm9yIGZvciBwbGF0
Zm9ybV9nZXRfaXJxX2J5bmFtZS4KPiA+IDMuIEZpeCB0Y3BjaV9yZWdpc3Rlcl9wb3J0IGNoZWNr
IGZyb20gSVNfRVJSX09SX05VTEwgdG8gSVNfRVJSLgo+ID4gNC4gUmVuYW1lIGRyaXZlci9LY29u
ZmlnL01ha2VmaWxlIGZvcm0gbXQ2MzYwIHRvIG10NjM2eC4KPiA+IDUuIFJlbmFtZSBEVCBiaW5k
aW5nIGRvY3VtZW50cyBmcm9tIG10NjM2MCB0byBtdDYzNnguCj4KPiBZb3UgZG9uJ3QgcGxhY2Ug
YWRkaXRpb25hbCBjaGFuZ2Vsb2cgaGVyZS4uLgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFu
IEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4KPiA+IC0tLQo+Cj4gWW91IHB1dCBpdCBoZXJl
LCBhZnRlciB0aGF0ICctLS0nIG1hcmtlcjoKPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9o
dG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3RoZS1jYW5vbmljYWwt
cGF0Y2gtZm9ybWF0Cj4KSEkgSGVra2k6CiAgICAgYWZ0ZXIgcmVhZGluZyB0aGUgZG9jdW1lbnQs
IEkgaGF2ZSBhIGxpdHRsZSBiaXQgY29uZnVzZWQgaG93IHRvCnVzZSBkaWZmc3RhdCBmb3IgdGhl
IGNoYW5nZWxvZy4KICAgICAgSXMgdGhlcmUgYW55IGV4YW1wbGUgdGhhdCBtYWtlIG1lIGtub3cg
dG8gd3JpdGUgYSBjbGVhcgpkZXNjcmlwdGlvbiBmb3IgdGhlIGNoYW5nZWxvZz8KPgo+ID4gIGRy
aXZlcnMvdXNiL3R5cGVjL3RjcG0vS2NvbmZpZyAgICAgICAgfCAgIDggKysKPiA+ICBkcml2ZXJz
L3VzYi90eXBlYy90Y3BtL01ha2VmaWxlICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL3VzYi90
eXBlYy90Y3BtL3RjcGNpX210NjM2MC5jIHwgMjEyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDIyMSBpbnNlcnRpb25zKCspCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2MzYwLmMKPgo+
IHRoYW5rcywKPgo+IC0tCj4gaGVpa2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
