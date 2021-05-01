Return-Path: <SRS0=lfsG=J4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325A1C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 04:21:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B8E061106
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 04:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B8E061106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a4LW9ZHo2/szWPTJLEmbVqlDGZbr2AcEHyUpwnT7e6w=; b=cD626yt0T03YI5UNj8AbJrJ5J
	RxmBfVs+d13KXo+v/cyh7KMvKskJnDohNF/6Z540yrx4uXG1eMq87HN8zaC/DEF4Jzp4NP1D5LNt4
	UODiEfWI/BsuswBMSiddaV37GfZrI6DzzrPXEMaTGgvYT6XJYUuQNKqiKv2m2ng8ykQPH0iGzyzgb
	O1MTRG4FZxRzF1LA2BVq+/8swPs17TCzBzwnhacYt4FbyOGm8fR/KctjDVuENnATr06LOyDORiI5I
	pZAGKnLUpjP50VKKiC6iAACe8KoCB6usjRP1hAO5tIg+CKzrR9aKL5WNbA8FUIA7bLuJOOnzofShT
	2thJ/yFOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lch7p-009Mmj-LC; Sat, 01 May 2021 04:21:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcgtl-009L8R-EB; Sat, 01 May 2021 04:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=BhMcUwkhffNas85am8YpXhNIyyWVNRi9qTqiWjiIrNA=; b=Q3rlSP4MrjsqsjblQ4ukcbk1+f
 OKCQIyjE4szL14PnfTfwxNcQViS/9VqMYMqYiEwnoWYtwtiJ4ixN6IYcpZOoZ+EW0kc3/59/YCVG8
 v/oGVxu0pc9xheELECVMV8Vm84eSpVrnHxBiSAvLDMn/oXRCzyIX3gKZiDVKBZ/4HkIQYbQufxMTa
 VFk809su8LbvsvyYL4OQgxmuaVuU0ofO4P882SVdYkFx474fHZAzjE4QBdPr+UVTTnwrH0320GiJ3
 Q/uWsqduA2WJ4qwl/KjdLn42CFycQKlTSuDLN4R0EUSjrPe4Vhl+iUIO9M1qFeh1PlyZR7dY8+ifp
 q3IoHwSw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcgti-001o0z-D6; Sat, 01 May 2021 04:06:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62FE661449;
 Sat,  1 May 2021 04:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619841989;
 bh=F+isvP/CISEBur6+0efALgnBlYarHdry2+xf4t13CSQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Laf32isseyoxoRlwVduDmzQloyXdmi8KFQvzoQbIpm//+nG2tKgMZKOTmZw8KhEws
 h6wXYysAUKvIXNy263+Fvjl8rRAFB4laVwWX1qKIHBMo/SjncrB4+CTzUTB7S6y627
 DxhBXP5/UnFst/UMWoLRlmOegqns5crpye1SjT/hWXaVMYxLsfi5bUELL+6AfbJb4d
 NGk15pJuP75yQG5eDN+1RqAtDA4yDmdjB9IlB2pB4arlDX0rqtLqoChA2GTNzlAjvR
 d+85ImFDiGyEBKS5WQGChN3HEOpOXgRquTqTWP/mIZcXoAwWEf1P+34T4T8tBkYGtn
 HjSucjlZ8y8EA==
Received: by mail-ed1-f48.google.com with SMTP id di13so367962edb.2;
 Fri, 30 Apr 2021 21:06:29 -0700 (PDT)
X-Gm-Message-State: AOAM530m97itL8iwn/JOdm9/Hw6PFwlHgqbwN20KphfVxgWCaF9PpvMr
 Rvl92hG5feeMPuDdAIJVGgMXjjKLlH3+HHiRBw==
X-Google-Smtp-Source: ABdhPJy/xB9YH6r0sZIkUz5zI/CnVQBqFHcrCzYVGkRITeICDiq17pGJWls+d/u9iH8uBuq2/DCSh3jzzV+xhxEq6C0=
X-Received: by 2002:aa7:db0c:: with SMTP id t12mr9503414eds.72.1619841987818; 
 Fri, 30 Apr 2021 21:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <1619838819-11309-1-git-send-email-yongqiang.niu@mediatek.com>
 <1619838819-11309-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1619838819-11309-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 1 May 2021 12:06:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_93Ym8yg1rmTVSqG5XCCkkGTWE4HBqiUWCRYk-Af4WKNg@mail.gmail.com>
Message-ID: <CAAOTY_93Ym8yg1rmTVSqG5XCCkkGTWE4HBqiUWCRYk-Af4WKNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: move page flip handle into cmdq cb
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_210630_513504_1A53FCB2 
X-CRM114-Status: GOOD (  18.27  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDXmnIgx5pelIOmAseWFrSDkuIrljYgxMToxM+Wvq+mBk++8mgo+Cj4gbW92
ZSBwYWdlIGZsaXAgaGFuZGxlIGludG8gY21kcSBjYgo+IGlycSBjYWxsYmFjayB3aWxsIGJlZm9y
ZSBjbWRxIGZsdXNoIGRkcCByZWdpc3Rlcgo+IGludG8gaGFyZHdhcmUsIHRoYXQgd2lsbCBjYXVz
ZSB0aGUgZGlzcGxheSBmcmFtZSBwYWdlCj4gZmxpcCBldmVudCBiZWZvcmUgaXQgcmVhbHkgZGlz
cGxheSBvdXQgdGltZQoKQWZ0ZXIgYXBwbHkgcGF0Y2ggWzFdLCB3ZSBkb24ndCBuZWVkIHRvIGNh
cmUgYWJvdXQgd2hpY2ggb25lIChpcnEgb3IKY21kcV9jYikgY29tZSBmaXJzdC4gRXZlbiB0aG91
Z2ggY21kcV9jYiBjb21lIGxhdGVyLCBHQ0Ugd291bGQgaGF2ZQphbHJlYWR5IHdyaXRlIHJlZ2lz
dGVyIGluIHZibGFuay4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC8/aD1uZXh0LTIwMjEwNDMwJmlk
PTM2ODE2NmVjNzYwMGJhODM1ODdjZmNiMzFkODE3Y2Y2NDc5Y2YwMDYKClJlZ2FyZHMsCkNodW4t
S3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCA4YjBkZTkwLi5jMzc4ODFiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IEBAIC03Miw2ICs3MiwxMyBA
QCBzdHJ1Y3QgbXRrX2NydGNfc3RhdGUgewo+ICAgICAgICAgdW5zaWduZWQgaW50ICAgICAgICAg
ICAgICAgICAgICBwZW5kaW5nX3ZyZWZyZXNoOwo+ICB9Owo+Cj4gKyNpZiBJU19SRUFDSEFCTEUo
Q09ORklHX01US19DTURRKQo+ICtzdHJ1Y3QgbXRrX2NtZHFfY2JfZGF0YSB7Cj4gKyAgICAgICBz
dHJ1Y3QgY21kcV9wa3QgICAgICAgICAgICAgICAgICpjbWRxX2hhbmRsZTsKPiArICAgICAgIHN0
cnVjdCBtdGtfZHJtX2NydGMgICAgICAgICAgICAgKm10a19jcnRjOwo+ICt9Owo+ICsjZW5kaWYK
PiArCj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IG10a19kcm1fY3J0YyAqdG9fbXRrX2NydGMoc3Ry
dWN0IGRybV9jcnRjICpjKQo+ICB7Cj4gICAgICAgICByZXR1cm4gY29udGFpbmVyX29mKGMsIHN0
cnVjdCBtdGtfZHJtX2NydGMsIGJhc2UpOwo+IEBAIC05Niw3ICsxMDMsNiBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHJtX2NydGNfZmluaXNoX3BhZ2VfZmxpcChzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtf
Y3J0YykKPgo+ICBzdGF0aWMgdm9pZCBtdGtfZHJtX2ZpbmlzaF9wYWdlX2ZsaXAoc3RydWN0IG10
a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gIHsKPiAtICAgICAgIGRybV9jcnRjX2hhbmRsZV92Ymxh
bmsoJm10a19jcnRjLT5iYXNlKTsKPiAgICAgICAgIGlmIChtdGtfY3J0Yy0+cGVuZGluZ19uZWVk
c192YmxhbmspIHsKPiAgICAgICAgICAgICAgICAgbXRrX2RybV9jcnRjX2ZpbmlzaF9wYWdlX2Zs
aXAobXRrX2NydGMpOwo+ICAgICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19uZWVkc192
YmxhbmsgPSBmYWxzZTsKPiBAQCAtMjIzLDcgKzIyOSwyNyBAQCBzdHJ1Y3QgbXRrX2RkcF9jb21w
ICptdGtfZHJtX2RkcF9jb21wX2Zvcl9wbGFuZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICNp
ZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQo+ICBzdGF0aWMgdm9pZCBkZHBfY21kcV9j
YihzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGEpCj4gIHsKPiAtICAgICAgIGNtZHFfcGt0X2Rlc3Ry
b3koZGF0YS5kYXRhKTsKPiArICAgICAgIHN0cnVjdCBtdGtfY21kcV9jYl9kYXRhICpjYl9kYXRh
ID0gZGF0YS5kYXRhOwo+ICsgICAgICAgc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGM7Cj4g
Kwo+ICsgICAgICAgaWYgKCFjYl9kYXRhKSB7Cj4gKyAgICAgICAgICAgICAgIERSTV9FUlJPUigi
Y21kcSBjYWxsYmFjayBkYXRhIGlzIG51bGwgcG9pbnRlciFcbiIpOwo+ICsgICAgICAgICAgICAg
ICByZXR1cm47Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgbXRrX2NydGMgPSBjYl9kYXRhLT5t
dGtfY3J0YzsKPiArICAgICAgIGlmICghbXRrX2NydGMpIHsKPiArICAgICAgICAgICAgICAgRFJN
X0VSUk9SKCJjbWRxIGNhbGxiYWNrIG10a19jcnRjIGlzIG51bGwgcG9pbnRlciFcbiIpOwo+ICsg
ICAgICAgICAgICAgICBnb3RvIGRlc3Ryb3lfcGt0Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAg
IG10a19kcm1fZmluaXNoX3BhZ2VfZmxpcChtdGtfY3J0Yyk7Cj4gKwo+ICtkZXN0cm95X3BrdDoK
PiArICAgICAgIGlmIChjYl9kYXRhLT5jbWRxX2hhbmRsZSkKPiArICAgICAgICAgICAgICAgY21k
cV9wa3RfZGVzdHJveShjYl9kYXRhLT5jbWRxX2hhbmRsZSk7Cj4gKwo+ICsgICAgICAga2ZyZWUo
Y2JfZGF0YSk7Cj4gIH0KPiAgI2VuZGlmCj4KPiBAQCAtNDYzLDEzICs0ODksMjAgQEAgc3RhdGlj
IHZvaWQgbXRrX2RybV9jcnRjX2h3X2NvbmZpZyhzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0
YykKPiAgICAgICAgIH0KPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gICAg
ICAgICBpZiAobXRrX2NydGMtPmNtZHFfY2xpZW50KSB7Cj4gKyAgICAgICAgICAgICAgIHN0cnVj
dCBtdGtfY21kcV9jYl9kYXRhICpjYl9kYXRhOwo+ICsKPiAgICAgICAgICAgICAgICAgbWJveF9m
bHVzaChtdGtfY3J0Yy0+Y21kcV9jbGllbnQtPmNoYW4sIDIwMDApOwo+ICAgICAgICAgICAgICAg
ICBjbWRxX2hhbmRsZSA9IGNtZHFfcGt0X2NyZWF0ZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQsIFBB
R0VfU0laRSk7Cj4gICAgICAgICAgICAgICAgIGNtZHFfcGt0X2NsZWFyX2V2ZW50KGNtZHFfaGFu
ZGxlLCBtdGtfY3J0Yy0+Y21kcV9ldmVudCk7Cj4gICAgICAgICAgICAgICAgIGNtZHFfcGt0X3dm
ZShjbWRxX2hhbmRsZSwgbXRrX2NydGMtPmNtZHFfZXZlbnQsIGZhbHNlKTsKPiAgICAgICAgICAg
ICAgICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRjLCBjbWRxX2hhbmRsZSk7Cj4gICAgICAgICAg
ICAgICAgIGNtZHFfcGt0X2ZpbmFsaXplKGNtZHFfaGFuZGxlKTsKPiAtICAgICAgICAgICAgICAg
Y21kcV9wa3RfZmx1c2hfYXN5bmMoY21kcV9oYW5kbGUsIGRkcF9jbWRxX2NiLCBjbWRxX2hhbmRs
ZSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBjYl9kYXRhID0ga21hbGxvYyhzaXplb2YoKmNiX2Rh
dGEpLCBHRlBfS0VSTkVMKTsKPiArICAgICAgICAgICAgICAgY2JfZGF0YS0+Y21kcV9oYW5kbGUg
PSBjbWRxX2hhbmRsZTsKPiArICAgICAgICAgICAgICAgY2JfZGF0YS0+bXRrX2NydGMgPSBtdGtf
Y3J0YzsKPiArCj4gKyAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZsdXNoX2FzeW5jKGNtZHFfaGFu
ZGxlLCBkZHBfY21kcV9jYiwgY2JfZGF0YSk7Cj4gICAgICAgICB9Cj4gICNlbmRpZgo+ICAgICAg
ICAgbXV0ZXhfdW5sb2NrKCZtdGtfY3J0Yy0+aHdfbG9jayk7Cj4gQEAgLTQ4OCw3ICs1MjEsMTQg
QEAgc3RhdGljIHZvaWQgbXRrX2NydGNfZGRwX2lycSh2b2lkICpkYXRhKQo+ICAjZW5kaWYKPiAg
ICAgICAgICAgICAgICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRjLCBOVUxMKTsKPgo+ICsgICAg
ICAgZHJtX2NydGNfaGFuZGxlX3ZibGFuaygmbXRrX2NydGMtPmJhc2UpOwo+ICsKPiArI2lmIElT
X1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gKyAgICAgICBpZiAoIXByaXYtPmRhdGEtPnNo
YWRvd19yZWdpc3RlciAmJiAhbXRrX2NydGMtPmNtZHFfY2xpZW50KQo+ICsgICAgICAgICAgICAg
ICBtdGtfZHJtX2ZpbmlzaF9wYWdlX2ZsaXAobXRrX2NydGMpOwo+ICsjZWxzZQo+ICAgICAgICAg
bXRrX2RybV9maW5pc2hfcGFnZV9mbGlwKG10a19jcnRjKTsKPiArI2VuZGlmCj4gIH0KPgo+ICBz
dGF0aWMgaW50IG10a19kcm1fY3J0Y19lbmFibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YykKPiAtLQo+IDEuOC4xLjEuZGlydHkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
