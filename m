Return-Path: <SRS0=dVWc=FR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C126C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Dec 2020 15:58:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E926422240
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Dec 2020 15:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E926422240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gtcVEj10KW/LWt1fuOEMrTGesfliPCF5u0wyxrJ8rfc=; b=BjZ+vzTLJt9GQhzV8SNTqgSpB
	ej88Mq1hjIPXwVDFUr+VPw7uNcE427wBASj+A/kvwUehIckmzMH32eBGYyvGXYijWmgZQank4Yg3m
	G7PNNg3Zo0uulM5pppQ+BGLIlkWl368llrr2ln4tLpu7bz8dlgjWW+OKvQ5NRVMsMSpsxFdllpU6Z
	7nsTKh7zgxakKvP+8iVc2p18S0JGTjv2sQIvA2CAfIZr+A/1tlsBBFhHZaifq8Qz+pj5aVsb5Xxsu
	7VCBCufCFT/zKnzXcBd5EZHpZxMdbnlLg5KwS03mhDCSx9oaqxGb2pJEdBfb6kqjtzHzEpphjz59J
	ch7lCzjLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koTle-0006uI-U8; Sun, 13 Dec 2020 15:58:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koTlZ-0006tK-A7; Sun, 13 Dec 2020 15:58:35 +0000
X-Gm-Message-State: AOAM530cpVztSiMxzAZYXo5T4hn9IrbRS02vg21wSxW1YT8Xa28FIEPP
 9c86gvazRb27tK8BAYQnRJcUNK2eaanKQJWslw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607875112;
 bh=TUEXd1NufKhBjH3w0YLBQgI4G4nF26Jpf12BZg2DdkU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vJRnrzs7P6heS4pWkFfwEyWeiYDaKgI8pRS8Vf5gSRcEtXB5EwUnu+gviqkUk2kx8
 UJtwlNtQFpdWCpJJ4Q3u99L6dtww4ZH8/QzHtnR4TT/9kBlGAdZibwxZquibbdFPsS
 JGPg4q+sP/2ZD4BbS7ZoMFGDLMxOIH2Z2yJs/3Jx0XM8fVZ523kAmK2y/BRM8MRbkh
 oVcZLY0MU6VthHzq/YwAAnRAEfeoyBmjEQbReRd3FxlEhBVGXJRShrQfO3VIw4VWUQ
 vlais4qeT+kLJAkJBZOomUre3HjGXg7d/q5yBUmmKzbjIunjf3i/EbN4EMXzfQNWVv
 ps7CcvvE3qjjA==
X-Google-Smtp-Source: ABdhPJzQ7X5J5ZOuZiSIqmWQH6RPNRgCbzq8nEgfd2GgED4aXNSwfqseLuR73PpirrPAI1Pa+7yPj6L3B8AH6G4uL4U=
X-Received: by 2002:aa7:dbca:: with SMTP id v10mr5100096edt.219.1607875110439; 
 Sun, 13 Dec 2020 07:58:30 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 13 Dec 2020 23:58:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9p0J0uMRu1gzkgCzj3uf=1gKPjubAbkx-aYY=rRuc3Pw@mail.gmail.com>
Message-ID: <CAAOTY_9p0J0uMRu1gzkgCzj3uf=1gKPjubAbkx-aYY=rRuc3Pw@mail.gmail.com>
Subject: Re: [PATCH v2, 03/17] dt-bindings: mediatek: add description for
 mt8192 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_105834_229382_B17E3399 
X-CRM114-Status: GOOD (  15.45  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBh
ZGQgZGVzY3JpcHRpb24gZm9yIG10ODE5MiBkaXNwbGF5CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3Fp
YW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggZGZiZWM3
Ni4uYjRlNjJhZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0
Cj4gQEAgLTQ0LDcgKzQ0LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJs
b2Nrcyk6Cj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAg
LSBEUEkgY29udHJvbGxlciwgc2VlIG1lZGlhdGVrLGRwaS50eHQKPiAgICAgICAgICJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1tdXRleCIgICAgICAgICAgICAtIGRpc3BsYXkgbXV0ZXgKPiAgICAgICAg
ICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vZCIgICAgICAgICAgICAgICAtIG92ZXJkcml2ZQo+IC0g
IHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE3MyBh
bmQgbXQ4MTgzLgo+ICsgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBt
dDI3MTIsIG10ODE3MywgbXQ4MTgzIGFuZCBtdDgxOTIuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNl
IGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3BhY2UK
PiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBi
bG9jayAocmVxdWlyZWQsIGV4Y2VwdCBmb3IKPiAgICBtZXJnZSBhbmQgc3BsaXQgZnVuY3Rpb24g
YmxvY2tzKS4KPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
