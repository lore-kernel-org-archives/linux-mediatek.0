Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2C1C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:54:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A986A20578
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A986A20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yj4FKYYX2nmLkpJdTakq1OwuII+CDgvMnj1HDK5klMs=; b=wdR7abua2PfCz8K5Uz6w4qGEq
	5SH2MYtJdo4+HsBgSXToAVDw8uU0CwyN2tDHF07NSgOBvrHn0/fwBZYW+o+/aDtymZSE0+GKi69WO
	1E42p+cBj6Zy5sJajfpJt/ftHAT5WIIID9hkmmUfjOzC8QNcgbz6UXvuwy5lI+lnaVzpjBbPk3j7D
	195KRAeoYgCdnxwhj3RBeZfCFcEWlWYIunp19tlA4ZchdUTWwmt4cBOioQcHxQKrJaiJnM4uV9Bdp
	3vHSTn0Pz3/5bPla6TTYCKlheFwRhrRmEAA9NPG/ropnILTdezlZYuWNriNSUhMSsNiUL2krOyfdv
	ob1UNXecQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxS03-0005M9-HB; Thu, 07 Jan 2021 09:54:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxS00-0005LP-0j; Thu, 07 Jan 2021 09:54:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7BBF2333E;
 Thu,  7 Jan 2021 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610013270;
 bh=9pBng+AVEqLNZFQoFpUKzynC7ullL0lxTHI0rs1FDo4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M+coG7So3bVUqKnccpElJkFrB901cfuCCl9rgz6bukHllQ/g2ioVK7WRYLjO2QF+o
 sKPr9QPtC1VbVlJkM4JQinbHsALHvYDmT8zjuYk4jpJzO3/sV6JmIBCORrmxnllKCQ
 zwqAGL3ucX74+K7SDsEYo071J2zF0GozsQox7YSkL1j4NT+1c5qSutovHZVY/KcQb4
 /ScOfyZBiqIkfdTaTof9nZcztgwafh5u44NygZHUW+WH5F0dimvIj/Cjy07UYAT7FA
 lDensYtZnKXPsFO7fXj66HfL/atNtNnOQFEIMW9sUvz868iDgKVLltSdjQJz0F33UL
 L2HV6UDFht9fQ==
Received: by mail-ej1-f45.google.com with SMTP id x16so8846466ejj.7;
 Thu, 07 Jan 2021 01:54:30 -0800 (PST)
X-Gm-Message-State: AOAM5336IPEjgqAtaiomr7CbDsUH6kRLwS+Tr4V900FqVSmQq3e6Cu5q
 Ff7xh69I3HdnWYw7cZUjBi9x2W0XhiAGYx5s2A==
X-Google-Smtp-Source: ABdhPJwb3idVQRWQCrmNfDclIJoa1CSuPbDunAFSX4HX9CXgW142tjcm1t3p9B86xQsdcyQdWANVKIAM8+nvB3sqyHY=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr5714887ejb.194.1610013269189; 
 Thu, 07 Jan 2021 01:54:29 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 17:54:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9FdLrZyKpgAsuJQxORh7uHhjYBn8Acu_1B0vQ0Uv_Nzw@mail.gmail.com>
Message-ID: <CAAOTY_9FdLrZyKpgAsuJQxORh7uHhjYBn8Acu_1B0vQ0Uv_Nzw@mail.gmail.com>
Subject: Re: [PATCH v9, 01/11] dt-bindings: mediatek: add rdma-fifo-size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_045432_197412_5183CCEE 
X-CRM114-Status: GOOD (  17.73  )
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
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMeWvq+mBk++8mgo+Cj4gcmRt
YSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+
IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25n
cWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCAgICAgICB8
IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggMzM5NzdlMS4uYjA3ODgx
ZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTY2
LDYgKzY2LDE0IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOgo+
ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11
L21lZGlhdGVrLGlvbW11LnR4dAo+ICAgIGZvciBkZXRhaWxzLgo+Cj4gK09wdGlvbmFsIHByb3Bl
cnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToKPiArLSBtZWRpYXRlayxyZG1hLWZpZm8tc2l6
ZTogcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQg
dGhpcwo+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKPiArICB0aGUgdmFs
dWUgaXMgdGhlIE1heCB2YWx1ZSB3aGljaCBkZWZpbmVkIGluIGhhcmR3YXJlIGRhdGEgc2hlZXQu
Cj4gKyAgbWVkaWF0ZWsscmRtYS1maWZvLXNpemUgb2YgbXQ4MTczLXJkbWEwIGlzIDhLCj4gKyAg
bWVkaWF0ZWsscmRtYS1maWZvLXNpemUgb2YgbXQ4MTgzLXJkbWEwIGlzIDVLCj4gKyAgbWVkaWF0
ZWsscmRtYS1maWZvLXNpemUgb2YgbXQ4MTgzLXJkbWExIGlzIDJLCj4gKwo+ICBFeGFtcGxlczoK
Pgo+ICBtbXN5czogY2xvY2stY29udHJvbGxlckAxNDAwMDAwMCB7Cj4gQEAgLTEwMyw2ICsxMTEs
NyBAQCByZG1hMDogcmRtYUAxNDAwZTAwMCB7Cj4gICAgICAgICBjbG9ja3MgPSA8Jm1tc3lzIENM
S19NTV9ESVNQX1JETUEwPjsKPiAgICAgICAgIGlvbW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfRElT
UF9SRE1BMD47Cj4gICAgICAgICBtZWRpYXRlayxsYXJiID0gPCZsYXJiMD47Cj4gKyAgICAgICBt
ZWRpYXRlayxyZG1hLWZpZm9zaXplID0gPDgxOTI+Owo+ICB9Owo+Cj4gIHJkbWExOiByZG1hQDE0
MDBmMDAwIHsKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
