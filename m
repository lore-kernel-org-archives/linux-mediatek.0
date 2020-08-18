Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98435C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 14:46:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67295207D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 14:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q6tLUlXV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqPm/t4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67295207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ooz2MoGL/D4/oEnQAFiR6BgUprv7gpDs7Joi3JafHW0=; b=q6tLUlXVlk+a+45F6u9Q9wO5x
	6SeUK1nIc1oDvZT+sDUvUOzMAZZOOzZJBqmb9hxuwIJYcOfrlPsQ9rj6hpI5YUje0WSURq+UuMpnO
	VH4fqHp5nnhpK3u00/I4f3NIyyTrvZdnaN0RwE9Oso4OcFPK3I4FepEwQ4gdg87O+79TdDHsAe1+J
	LmMZ15JYdyGEQeznE4epjK1+PIGWMGio+q/YiVypOz1rHrL4zs6gdB5qPF2QgzqHYQBmheFRS/xHH
	efq5LHyVUL1pS3pFH984EZKwbk1AbHe5Owv8/a9W25epaD75VMfbmORdxcN0iPvicCfir0+codRDh
	73ksne2dA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k82sP-0001jW-GX; Tue, 18 Aug 2020 14:46:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k82sK-0001hF-5X; Tue, 18 Aug 2020 14:46:09 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29E3520866;
 Tue, 18 Aug 2020 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597761967;
 bh=uLShTqPsScOSS/Y7xhwooyk4VokN/5lcf0l5sX6cwe0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LqPm/t4tT/0fik+ovMNaZmmhNITKQnbE/SEtpU/wQaHeFsc0oEqv0Ok7zgT8K8q0g
 RzriiVo1EJOuEDWve2doQaiolPRjJE7i2Qfp7Q61s8o6qzy1RG89yQc6J/XgBhUjv8
 N80VcYnaemw4XlLvCbVZs7Xhay5iOr2yqH8+lDpY=
Received: by mail-ej1-f49.google.com with SMTP id a26so22409437ejc.2;
 Tue, 18 Aug 2020 07:46:07 -0700 (PDT)
X-Gm-Message-State: AOAM531Eb5J0BnvgFED8qvzP6jAMh2y80319gGYGXxX3dTxYjQKNs0dc
 8RvR8fsXdEfsb20KDUAHfKZ+gGpKz+5OdJ+IpQ==
X-Google-Smtp-Source: ABdhPJyAegsVyLKiVAWm3/ULM5Zo7ujEpLDRmMYGDKOTvVSOcFz66S1v3I39ISq/ljIBOR2BqS2UuSxiTjiBJSeDKEk=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr21208887ejd.7.1597761965685; 
 Tue, 18 Aug 2020 07:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
 <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
 <1597718492.6381.6.camel@mszsdaap41>
In-Reply-To: <1597718492.6381.6.camel@mszsdaap41>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Aug 2020 22:45:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
Message-ID: <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_104608_340643_3E8454A2 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDjmnIgxOOaXpSDpgLHkuowg5LiK5Y2IMTA6NDHlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMjAyMC0w
OC0xOCBhdCAwNzo0MiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+IEhpLCBKaXRhbzoK
PiA+Cj4gPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0OOac
iDE35pelIOmAseS4gCDkuIvljYg5OjA35a+r6YGT77yaCj4gPiA+Cj4gPiA+IGhvcml6b250YWxf
YmFja3BvcmNoX2J5dGUgc2hvdWxkIGJlIGhicCAqIGJwcCAtIGhicCBleHRyYSBieXRlcy4KPiA+
ID4gU28gcmVtb3ZlIHRoZSB3cm9uZyBzdWJ0cmFjdGlvbiAxMC4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA5ICsrKystLS0tLQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiA+IGluZGV4IDI3MGJmMjJjOThm
ZS4uNWQwMzFlNjM0NTcxIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiA+ID4gQEAgLTQ3MywxNCArNDczLDEzIEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmln
X3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kgKmRzaSkKPiA+ID4gICAgICAgICBob3Jpem9udGFs
X3N5bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCAtIDEw
KTsKPiA+Cj4gPiBTbyB0aGlzIHN1YnRyYWN0aW9uIDEwIGlzIGNvcnJlY3Q/Cj4gPgo+ID4gUmVn
YXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+Cj4gWWVzLCBJdCBpcyByaWdodC4KPgo+IEluIHRo
ZSBjZWE4NjEgYW5kIGRtdCBzcGVjIHRoZSBtaW5pIGhzeW5jIGlzIDQwIHBpeGVscy4KPiBTbyB0
aGUgdm0tPmhzeW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCA+PSAxMjAgPiAxMAo+CgpPSywgc28K
ClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4g
QmVzdCBSZWdhcmRzCj4gaml0YW8KPiA+ID4KPiA+ID4gICAgICAgICBpZiAoZHNpLT5tb2RlX2Zs
YWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFKQo+ID4gPiAtICAgICAgICAgICAg
ICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICh2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7Cj4gPiA+ICsgICAg
ICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlID0gdm0tPmhiYWNrX3BvcmNoICog
ZHNpX3RtcF9idWZfYnBwOwo+ID4gPiAgICAgICAgIGVsc2UKPiA+ID4gLSAgICAgICAgICAgICAg
IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAoKHZtLT5oYmFja19wb3JjaCArIHZtLT5oc3lu
Y19sZW4pICoKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZHNpX3RtcF9idWZfYnBwIC0g
MTApOwo+ID4gPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9ICh2
bS0+aGJhY2tfcG9yY2ggKyB2bS0+aHN5bmNfbGVuKSAqCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZHNpX3RtcF9idWZfYnBwOwo+ID4gPgo+ID4gPiAg
ICAgICAgIGRhdGFfcGh5X2N5Y2xlcyA9IHRpbWluZy0+bHB4ICsgdGltaW5nLT5kYV9oc19wcmVw
YXJlICsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICB0aW1pbmctPmRhX2hzX3plcm8g
KyB0aW1pbmctPmRhX2hzX2V4aXQgKyAzOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
IHRpbWluZy0+ZGFfaHNfemVybyArIHRpbWluZy0+ZGFfaHNfZXhpdDsKPiA+ID4KPiA+ID4gICAg
ICAgICBpZiAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCkgewo+
ID4gPiAgICAgICAgICAgICAgICAgaWYgKCh2bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3Bv
cmNoKSAqIGRzaV90bXBfYnVmX2JwcCA+Cj4gPiA+IC0tCj4gPiA+IDIuMTIuNQo+ID4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
