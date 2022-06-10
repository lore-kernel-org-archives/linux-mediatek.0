Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE03C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBz+3y51bA/JNdcblotIgyknSIxzvqbXTgTxErwp+Q8=; b=ph9RHT4/aTdOvo
	U2RTS5p8h2vx/IJORxh8EXHMswAgkjsqp9NJEI+4swSQZE7pm9M+G/mjrOpM1YqWcUsQ4LJJffynb
	z7ffYfGDae8kO86YwdLhZuX27G/J2UmojdrBnbsGg8ZfbhjZoDpaV35NtiGRCm5YZWDvc9aJo03+4
	XLd5C3oZgsxi/1EdoJKLMlPh5IaHYfig3HPdydPlJiVqUpQFrfWSPCYRylHwT7cwX0Ma3s3DbQZcF
	igmcJh+lVst575U3e0J4uui3LxAUhwUbU9aawZFonnYiEr+xGZih/vTPJUyHpUtauB2gHSeNeDTqT
	4j/arm+ephnBcA40t+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgEm-008hNY-HK; Fri, 10 Jun 2022 15:07:48 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgEj-008hMj-Mj; Fri, 10 Jun 2022 15:07:47 +0000
Received: by mail-ed1-x529.google.com with SMTP id o10so35662878edi.1;
        Fri, 10 Jun 2022 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kUO2ibunC7H0XDsaHRR1RaXa5+TAT1P54T7nymM8aoY=;
        b=Km/6uG4N0I1v3nCHQDOVYyGXyKL6LrNTIbysl2MklDB9UNEDZqbo8NqSGO5sAbe1x3
         1cNbRBqVAX7iALT4cPuZPV2Gy0svte0/yscfFN+g1Ogb2RIQjl6DgOizWWO5fd4eNFOS
         cFHB/CShwbXerNRbAbMaZARMBkStUWNdpK4AI4NeBMKj0sDM63KFgdNX9P/+Dhd1uRNk
         FLcTygnXnEYbzwm+r9bTo4ZY2iUckj/9fDrW+Io2qRDuYMft54iHj9QNjGfcRYMVRQ12
         wfKGJOKpPYgf+b/ciNPTOWTHRSnMg76WfJK7EXdcaCmTVdopl5R4fFUp7H4JdCySKPj5
         iqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kUO2ibunC7H0XDsaHRR1RaXa5+TAT1P54T7nymM8aoY=;
        b=N8h/NDan0C6dnTKrJD3Gi5YbWYwZADO9gRC38qqlF3tCx4Whe2zD+1omUQI/dcBlSr
         f7lYqHhKpU1hdFTYwdrsB1jAhPgJIQQ1v5CdWF+oT1opr3lLxHVQ1iURD7hiS/SwuiYZ
         rDKyWUmHCnemZAV+2sfd7574jpRBtY1i4L3NiTxt6JJ4GGMQ0m2/4gUhWAz5R89jj6cQ
         pNUDpA4RMaAAJUqTGYaiPv/hh2jq+CgwYWDEAiQ2OBDdg76STrdsTsDIzx9tYb2n9kZf
         DYYv5ojZDo61F8gni72G9J25gbE7lWplthhRBxMGUvzeeaMvECT5exxuKpm6RXVtSNeq
         32SQ==
X-Gm-Message-State: AOAM53318c4K3WAZ+EtzzVkDfRJYv0DfKon4zlW4pjNYr/j9DgzbWpde
	1Fyu2e2k/bUQKNnmSRgYXMUW+1dAdnhbYizExE4=
X-Google-Smtp-Source: ABdhPJxWp2gvN4Nfk2r+vYkXDxxpanl8SYkus08bByYas8UdfPjxgCPUYO0Y8DTxN4CocSeDaFKMLBbwWkQqK48L8Co=
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id
 b1-20020aa7d481000000b0042dd5fdf963mr51786214edr.209.1654873659584; Fri, 10
 Jun 2022 08:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-24-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-24-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:07:03 +0200
Message-ID: <CAHp75VcxZrMM7nHyOYdNMkepbP51Wf4z5botU9ma8+gmn_Lz-w@mail.gmail.com>
Subject: Re: [PATCH 23/34] iio: inkern: split of_iio_channel_get_by_name()
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>, 
	Andy Gross <agross@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Benson Leung <bleung@chromium.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Jonathan Cameron <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_080745_782266_3CD16FA0 
X-CRM114-Status: GOOD (  26.64  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNoYW5nZSBzcGxpdHMgb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5
X25hbWUoKSBzbyB0aGF0IGl0IGRlY291cGxlcwo+IGxvb2tpbmcgZm9yIGNoYW5uZWxzIGluIHRo
ZSBjdXJyZW50IG5vZGUgZnJvbSBsb29raW5nIGluIGl0J3MgcGFyZW50cwo+IG5vZGVzLiBUaGlz
IHdpbGwgYmUgaGVscGZ1bCB3aGVuIG1vdmluZyB0byBmd25vZGUgcHJvcGVydGllcyB3aGVyZSB3
ZQo+IG5lZWQgdG8gcmVsZWFzZSB0aGUgaGFuZGxlcyB3aGVuIGxvb2tpbmcgZm9yIGNoYW5uZWxz
IGluIHBhcmVudCdzIG5vZGVzLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuLi4K
ClJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+
Cgo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvaWlvL2lua2Vybi5jIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDI1IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2lua2Vybi5jIGIvZHJpdmVy
cy9paW8vaW5rZXJuLmMKPiBpbmRleCAzMWQ5YzEyMjE5OWEuLmRkZTQ3MzI0YjgyNiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2lua2Vybi5j
Cj4gQEAgLTIxMSw0NCArMjExLDYzIEBAIHN0YXRpYyBzdHJ1Y3QgaWlvX2NoYW5uZWwgKm9mX2lp
b19jaGFubmVsX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgaW5kZXgpCj4gICAgICAg
ICByZXR1cm4gRVJSX1BUUihlcnIpOwo+ICB9Cj4KPiArc3RydWN0IGlpb19jaGFubmVsICpfX29m
X2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5h
bWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJv
b2wgKnBhcmVudF9sb29rdXApCj4gK3sKPiArICAgICAgIHN0cnVjdCBpaW9fY2hhbm5lbCAqY2hh
bjsKPiArICAgICAgIGludCBpbmRleCA9IDA7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IEZvciBuYW1lZCBpaW8gY2hhbm5lbHMsIGZpcnN0IGxvb2sgdXAgdGhlIG5hbWUgaW4gdGhlCj4g
KyAgICAgICAgKiAiaW8tY2hhbm5lbC1uYW1lcyIgcHJvcGVydHkuICBJZiBpdCBjYW5ub3QgYmUg
Zm91bmQsIHRoZQo+ICsgICAgICAgICogaW5kZXggd2lsbCBiZSBhbiBlcnJvciBjb2RlLCBhbmQg
b2ZfaWlvX2NoYW5uZWxfZ2V0KCkKPiArICAgICAgICAqIHdpbGwgZmFpbC4KPiArICAgICAgICAq
Lwo+ICsgICAgICAgaWYgKG5hbWUpCj4gKyAgICAgICAgICAgICAgIGluZGV4ID0gb2ZfcHJvcGVy
dHlfbWF0Y2hfc3RyaW5nKG5wLCAiaW8tY2hhbm5lbC1uYW1lcyIsIG5hbWUpOwo+ICsKPiArICAg
ICAgIGNoYW4gPSBvZl9paW9fY2hhbm5lbF9nZXQobnAsIGluZGV4KTsKPiArICAgICAgIGlmICgh
SVNfRVJSKGNoYW4pIHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikgewo+ICsgICAg
ICAgICAgICAgICAqcGFyZW50X2xvb2t1cCA9IGZhbHNlOwo+ICsgICAgICAgfSBlbHNlIGlmIChu
YW1lICYmIGluZGV4ID49IDApIHsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCJFUlJPUjogY291
bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgIG5wLCBuYW1lID8gbmFtZSA6ICIiLCBpbmRleCk7Cj4gKyAgICAgICAgICAgICAgICpw
YXJlbnRfbG9va3VwID0gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGNo
YW47Cj4gK30KPiArCj4gIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5
X25hbWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCj4gIHsKPiAgICAgICAgIHN0
cnVjdCBpaW9fY2hhbm5lbCAqY2hhbjsKPiArICAgICAgIGJvb2wgcGFyZW50X2xvb2t1cCA9IHRy
dWU7Cj4KPiAgICAgICAgIC8qIFdhbGsgdXAgdGhlIHRyZWUgb2YgZGV2aWNlcyBsb29raW5nIGZv
ciBhIG1hdGNoaW5nIGlpbyBjaGFubmVsICovCj4gKyAgICAgICBjaGFuID0gX19vZl9paW9fY2hh
bm5lbF9nZXRfYnlfbmFtZShucCwgbmFtZSwgJnBhcmVudF9sb29rdXApOwo+ICsgICAgICAgaWYg
KCFwYXJlbnRfbG9va3VwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gY2hhbjsKPiArCj4gKyAg
ICAgICAvKgo+ICsgICAgICAgICogTm8gbWF0Y2hpbmcgSUlPIGNoYW5uZWwgZm91bmQgb24gdGhp
cyBub2RlLgo+ICsgICAgICAgICogSWYgdGhlIHBhcmVudCBub2RlIGhhcyBhICJpby1jaGFubmVs
LXJhbmdlcyIgcHJvcGVydHksCj4gKyAgICAgICAgKiB0aGVuIHdlIGNhbiB0cnkgb25lIG9mIGl0
cyBjaGFubmVscy4KPiArICAgICAgICAqLwo+ICsgICAgICAgbnAgPSBucC0+cGFyZW50Owo+ICAg
ICAgICAgd2hpbGUgKG5wKSB7Cj4gLSAgICAgICAgICAgICAgIGludCBpbmRleCA9IDA7Cj4gLQo+
IC0gICAgICAgICAgICAgICAvKgo+IC0gICAgICAgICAgICAgICAgKiBGb3IgbmFtZWQgaWlvIGNo
YW5uZWxzLCBmaXJzdCBsb29rIHVwIHRoZSBuYW1lIGluIHRoZQo+IC0gICAgICAgICAgICAgICAg
KiAiaW8tY2hhbm5lbC1uYW1lcyIgcHJvcGVydHkuICBJZiBpdCBjYW5ub3QgYmUgZm91bmQsIHRo
ZQo+IC0gICAgICAgICAgICAgICAgKiBpbmRleCB3aWxsIGJlIGFuIGVycm9yIGNvZGUsIGFuZCBv
Zl9paW9fY2hhbm5lbF9nZXQoKQo+IC0gICAgICAgICAgICAgICAgKiB3aWxsIGZhaWwuCj4gLSAg
ICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBpZiAobmFtZSkKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgImlvLWNo
YW5uZWwtbmFtZXMiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG5hbWUpOwo+IC0gICAgICAgICAgICAgICBjaGFuID0gb2ZfaWlvX2No
YW5uZWxfZ2V0KG5wLCBpbmRleCk7Cj4gLSAgICAgICAgICAgICAgIGlmICghSVNfRVJSKGNoYW4p
IHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikKPiArICAgICAgICAgICAgICAgaWYg
KCFvZl9nZXRfcHJvcGVydHkobnAsICJpby1jaGFubmVsLXJhbmdlcyIsIE5VTEwpKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBjaGFuOwo+IC0gICAgICAgICAgICAgICBpZiAobmFt
ZSAmJiBpbmRleCA+PSAwKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJFUlJP
UjogY291bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG5wLCBuYW1lID8gbmFtZSA6ICIiLCBpbmRleCk7Cj4gKwo+
ICsgICAgICAgICAgICAgICBjaGFuID0gX19vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShucCwg
bmFtZSwgJnBhcmVudF9sb29rdXApOwo+ICsgICAgICAgICAgICAgICBpZiAoIXBhcmVudF9sb29r
dXApCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNoYW47Cj4gLSAgICAgICAgICAg
ICAgIH0KPgo+IC0gICAgICAgICAgICAgICAvKgo+IC0gICAgICAgICAgICAgICAgKiBObyBtYXRj
aGluZyBJSU8gY2hhbm5lbCBmb3VuZCBvbiB0aGlzIG5vZGUuCj4gLSAgICAgICAgICAgICAgICAq
IElmIHRoZSBwYXJlbnQgbm9kZSBoYXMgYSAiaW8tY2hhbm5lbC1yYW5nZXMiIHByb3BlcnR5LAo+
IC0gICAgICAgICAgICAgICAgKiB0aGVuIHdlIGNhbiB0cnkgb25lIG9mIGl0cyBjaGFubmVscy4K
PiAtICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIG5wID0gbnAtPnBhcmVudDsK
PiAtICAgICAgICAgICAgICAgaWYgKG5wICYmICFvZl9nZXRfcHJvcGVydHkobnAsICJpby1jaGFu
bmVsLXJhbmdlcyIsIE5VTEwpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBjaGFu
Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPiArICAg
ICAgIHJldHVybiBjaGFuOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKG9mX2lpb19jaGFubmVs
X2dldF9ieV9uYW1lKTsKPgo+IC0tCj4gMi4zNi4xCj4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMs
CkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
