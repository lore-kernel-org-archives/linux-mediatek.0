Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB10EC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 10:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B375864DE4
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 10:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B375864DE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+NFgpKXpoqIcNHFbnYl3ahsoOuQVdNEq0S2oaVlbwiI=; b=UBwomT1ud5LnfEu9bPu/uGZqh
	x99NTgOTVUkWBLi5Y/aSp0hgxc2hvdtN6RV5aoAw/KsXVpp1azsT+4yyC8r6fSwS3CjkzJJJfBVlm
	f8ICi4CViq4U54lRVWK1XmN7OFVTI8Z0V+W2MlIcPkYd8gonHzf+1kX3LSdkTxpSINsco/ZUe1Y95
	8VT427+eiFxG+raqp5x3qNajE5NnmSoRJj267YV26nAo9AIlt3Gncrvw9Vsy92jE/+AzAb26ud636
	HVlF3RA50zWGR2WoB67tnCEeyHmhJf/mysX3fiQpYo5qDPMm563Mda1/TsUNH5utVPgR5XEVTcHBg
	laCDohQgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5nFP-00046r-8G; Sat, 30 Jan 2021 10:12:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5nFI-00045X-71; Sat, 30 Jan 2021 10:12:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC78864E08;
 Sat, 30 Jan 2021 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612001567;
 bh=N5xKQ7D7bbQAxoHSV1A03B0Qf2d9erN8a0kxiDAMWXY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sILany1Q3l1Jka8eKGJzp3yNvZKM0f5gBIlD0J+NN8OVmOWwd5eZi3uPadHSGgbuG
 zsswNk+/phPYZITk+uJtLtu6lBHIq+oBpyW8v7gzWruu/R/YPPQdcC15/OCILWtKnr
 ppC1cwLnxUKC3GmIXjXUTQzZcwa/57amfKpah9NeUlFcDMDSVkjNtmZmLrCaPH6Kpg
 ggVA7OrfefeR+w1mEaDGWQlT5AKhKBMprjTfINxohGWX9k95y+pd9/0hxLWA0uavXl
 4QdOvq00nLCCxNoqBrKVyGepL7NVdbk3lzSKhqOJ3VssWOUl5MlGZUNxz+y+wBvfGR
 VtVQ5Oy3eXPzg==
Received: by mail-ej1-f50.google.com with SMTP id r12so16625122ejb.9;
 Sat, 30 Jan 2021 02:12:46 -0800 (PST)
X-Gm-Message-State: AOAM532X/NGVbGmm8K53/pBy5bKwxBWi6WRwKBglox+qyZPsglEDXgI4
 8xSGfkV3K6BiHnyhaiaOG6UPUMcRGj5rYMLoew==
X-Google-Smtp-Source: ABdhPJy//YfGdlHPfWkuPSgx+JETf8NnC/t1qkUJybbWz8gEYP7LSsFu1qKJhn/0GYHqhW+ASitPV/FrQ5rMLv8vrGQ=
X-Received: by 2002:a17:906:ada:: with SMTP id
 z26mr8516170ejf.127.1612001565308; 
 Sat, 30 Jan 2021 02:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-6-hsinyi@chromium.org>
In-Reply-To: <20210129092209.2584718-6-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 30 Jan 2021 18:12:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8B_pca0GeJoASLOh1ROkErPZBJcew1N7+jZia7csHNMA@mail.gmail.com>
Message-ID: <CAAOTY_8B_pca0GeJoASLOh1ROkErPZBJcew1N7+jZia7csHNMA@mail.gmail.com>
Subject: Re: [PATCH v13 5/8] drm/mediatek: add has_dither private data for
 gamma
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_051248_395070_2BCC8E88 
X-CRM114-Status: GOOD (  19.34  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MeaciDI55pelIOmAseS6lCDkuIvljYg1OjIz5a+r6YGT77yaCj4KPiBGcm9tOiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPgo+IE5vdCBhbGwgU29DIGhhcyBk
aXRoZXIgZnVuY3Rpb24gaW4gZ2FtbWEgbW9kdWxlLgo+IEFkZCBwcml2YXRlIGRhdGEgdG8gY29u
dHJvbCB0aGlzIGZ1bmN0aW9uIHNldHRpbmcuCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0
IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUg
PHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2Fu
ZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1h
LmMgfCAxNCArKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfZ2FtbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9n
YW1tYS5jCj4gaW5kZXggNmI1MjA4MDc5MjFlMy4uNTA5MmEyN2NjYzI4YiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jCj4gQEAgLTI3LDcgKzI3LDcgQEAK
PiAgI2RlZmluZSBMVVRfMTBCSVRfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAweDAzZmYK
Pgo+ICBzdHJ1Y3QgbXRrX2Rpc3BfZ2FtbWFfZGF0YSB7Cj4gLSAgICAgICB1MzIgcmVzZXJ2ZWQ7
Cj4gKyAgICAgICBib29sIGhhc19kaXRoZXI7Cj4gIH07Cj4KPiAgLyoqCj4gQEAgLTkzLDggKzkz
LDkgQEAgdm9pZCBtdGtfZ2FtbWFfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQg
aW50IHcsCj4KPiAgICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3LCAm
Z2FtbWEtPmNtZHFfcmVnLCBnYW1tYS0+cmVncywKPiAgICAgICAgICAgICAgICAgICAgICAgRElT
UF9HQU1NQV9TSVpFKTsKPiAtICAgICAgIG10a19kaXRoZXJfc2V0X2NvbW1vbihnYW1tYS0+cmVn
cywgJmdhbW1hLT5jbWRxX3JlZywgYnBjLCBESVNQX0dBTU1BX0NGRywKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHQU1NQV9ESVRIRVJJTkcsIGNtZHFfcGt0KTsKPiArICAgICAgIGlm
IChnYW1tYS0+ZGF0YSAmJiBnYW1tYS0+ZGF0YS0+aGFzX2RpdGhlcikKPiArICAgICAgICAgICAg
ICAgbXRrX2RpdGhlcl9zZXRfY29tbW9uKGdhbW1hLT5yZWdzLCAmZ2FtbWEtPmNtZHFfcmVnLCBi
cGMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBESVNQX0dBTU1BX0NG
RywgR0FNTUFfRElUSEVSSU5HLCBjbWRxX3BrdCk7Cj4gIH0KPgo+ICB2b2lkIG10a19nYW1tYV9z
dGFydChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gQEAgLTE3NCw4ICsxNzUsMTMgQEAgc3RhdGljIGlu
dCBtdGtfZGlzcF9nYW1tYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9n
YW1tYV9kYXRhIG10ODE3M19nYW1tYV9kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5oYXNfZGl0
aGVyID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG10a19kaXNwX2dhbW1hX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+IC0gICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSJ9LAo+ICsgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSIsCj4gKyAgICAgICAgIC5kYXRhID0g
Jm10ODE3M19nYW1tYV9kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7fSwKPiAgfTsKPiAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgbXRrX2Rpc3BfZ2FtbWFfZHJpdmVyX2R0X21hdGNoKTsKPiAtLQo+
IDIuMzAuMC4zNjUuZzAyYmM2OTM3ODktZ29vZwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
