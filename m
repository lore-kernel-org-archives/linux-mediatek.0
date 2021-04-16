Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8430C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:58:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1EA6117A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D1EA6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IKGlsz3YnCDvWqNvhmbLsq7RTi+DUhBsgtlyKggBr68=; b=HWsMbGxc+GdtoasSU4zs6kDqI
	3+ZipXBEopcHZahyjoxmJfuAExDXXOhTnwbdZjbvtoFh9+m0ZkBx3WOHmSV4gCdyaZXjMfocjYN0e
	NwYajbJW3nifILg9J5X2cur/BAexeOTWGHT+eO7/Y/Z5DpM70WwcxNW77tY+4KnqFzLHQ7SJ7TmL0
	nR+dF8FUeuxxjx24aFVEWgo+vxF+kz+qmaW7dPR7S3YbmxFQ9M+ZUycKNFdUgwMglF/qas6W5zlzY
	CZUU/oxarLCVYxcTOhZScIayVmCf0tedk4vPbNlT/5GBUtCxNLo9gI0tVdOqaYE24IqQpWsscSKtZ
	bKT/Y+qDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHUq-000vxB-1Q; Fri, 16 Apr 2021 05:58:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHPv-000vVy-Mx; Fri, 16 Apr 2021 05:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=MCLUGMKOGCUhcX5PBKwgjDIDGwxEw0xOP/rCTk9Ji7w=; b=bQvvUbqKF1GD6ihbYPqdrlxQe4
 yOyYWZgVkbUIqCZD+rDMymvaIFewU3L7uoyhvtgkRbqA0FawYeus1bnwhDvqyPgfJW4i22w0nZX0H
 0LM1GtrAXz+e4qnVjOZtmjovRho6ekDMlXzZsA3gvkoDodkVNsIhV6e/YP7w0f8NB2gAZMMsPhhiG
 MUfZteWxt+o9Hvuz44o25OZ1LL0xhvWvR30rd1k3zYd+JldIUdu7D7UwAov347tT2WJBketxsEcXx
 JM1SkREJowML5mVeHJ5BxZjDx0v+Jlk1fPUFsWoHsvo8ULa/OcV1lnxfNidsqUUxZx7UkcRCCNUc8
 tYphF4MQ==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHPt-0096Bq-4V; Fri, 16 Apr 2021 05:53:22 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 o13-20020a9d404d0000b029028e0a0ae6b4so5732875oti.10; 
 Thu, 15 Apr 2021 22:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MCLUGMKOGCUhcX5PBKwgjDIDGwxEw0xOP/rCTk9Ji7w=;
 b=dWqwHYu2UDFUk2dsRv+6Opo6tnDsyuOf/z6SFDD6Yu/pYZeMyd5ptvs+teCRwYrFcV
 r0QJo7BFf/SgXng34dmLR210AModhgA2SwTdXfsnsN3e7r3aG1waK6OgJbaoYakNsyhR
 2qWHWnkC+u3an0MrnM4T41G5/nrQUbbseJzCgrtr9Fdt1MMWfvxKqSeXGqY0hqTr8y7S
 KFvRvCUT+vPfg7rS/MIKLvQktakh+cBjSmPkgJ2metykBox4dimG2a1gEpp72kj5xh8b
 nbFCddQeeQoEH+b8JSUojOPj5EqKGqa8m/ZVsFgIhcHmqL9zvKH4Vflh1KdqCHpppzfM
 1cnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MCLUGMKOGCUhcX5PBKwgjDIDGwxEw0xOP/rCTk9Ji7w=;
 b=kPU8Oe8gPfCfZBnzhDCOr11sIX9wX+RbPkxKEC51Ea5lMEOkuWDp+Nqbw7uL804c1C
 LsvQgXzSG9qXH4KQLSjHp9GIX6qg/rADUHUaH7TZ6JXoVMY5us6vUn77uBCKmSeGvZpp
 cRT+mucEgp27DczNg54BFkroSh4K2Z1Kvp7mTPq9zg6fVvd5EuoDs/eOPhBj7+ZWCInu
 OIM/lGKIShu883mJAwh6TVccr9bcoygpZ2Fzj/+xr6nhv97LX+LogO+mmEQitB/FOq2O
 fxQv6x5RxA2oktrbuGzkOTdmvuJxPikdJhaGoo3bPOmFxHNz1PgbJZyE1JVJIfhcz/Jf
 QoGw==
X-Gm-Message-State: AOAM530DJdzomcrPzjCWGFjoDUprcSePwtS9GZudm/7SdDgAqab4zbl2
 sfACRlbvyPDcePlTwXxB/f1ORjtrlKyhhS4lpPQ=
X-Google-Smtp-Source: ABdhPJzFLjrAS4QeLk1KFR6twQbAcjPSrmnYSU8cMmm1EBYPMvKlpmQ3aMpsI2Zm4QhdZI2+66eoLsV3YPk0O9aLiKs=
X-Received: by 2002:a05:6830:15d0:: with SMTP id
 j16mr2489968otr.184.1618552400329; 
 Thu, 15 Apr 2021 22:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210414144643.17435-1-matthias.bgg@kernel.org>
 <20210414144643.17435-2-matthias.bgg@kernel.org>
In-Reply-To: <20210414144643.17435-2-matthias.bgg@kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 07:53:11 +0200
Message-ID: <CAFqH_51iP+V1hQ=J+YtLv0K9qoEK9WJgoCiNyqp6Yd1T9RKfXw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: mt8183: fix dtbs_check warning
To: matthias.bgg@kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>, 
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_225321_201333_A1136E1A 
X-CRM114-Status: GOOD (  15.10  )
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

SGkgTWF0dGhpYXMsCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgpNaXNzYXRnZSBkZSBsJ2Fk
cmXDp2EgPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiBkZWwgZGlhIGRjLiwgMTQgZOKAmWFici4K
MjAyMSBhIGxlcyAxNjo0ODoKPgo+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJn
Z0BnbWFpbC5jb20+Cj4KPiBGaXggdW5pdCBuYW1lcyB0byBtYWtlIGR0YnNfY2hlY2sgaGFwcHku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwu
Y29tPgo+IC0tLQo+Cj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kg
fCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgz
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpCj4gaW5kZXgg
MGZmN2I2N2E2ODA2Li5jNWU4MjJiNmI3N2EgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTgzLmR0c2kKPiBAQCAtNjgxLDEzICs2ODEsMTMgQEAgY3B1X3RoZXJtYWw6IGNw
dV90aGVybWFsIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN1c3RhaW5hYmxl
LXBvd2VyID0gPDUwMDA+Owo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmlw
cyB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRocmVzaG9sZDog
dHJpcC1wb2ludEAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dGhyZXNob2xkOiB0cmlwLXBvaW50MCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdGVtcGVyYXR1cmUgPSA8NjgwMDA+Owo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh5c3RlcmVzaXMgPSA8MjAwMD47Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSA9ICJw
YXNzaXZlIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKPgo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXQ6IHRyaXAtcG9p
bnRAMSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdldDog
dHJpcC1wb2ludDEgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRlbXBlcmF0dXJlID0gPDgwMDAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBoeXN0ZXJlc2lzID0gPDIwMDA+Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUgPSAicGFzc2l2ZSI7Cj4g
QEAgLTExMDMsNyArMTEwMyw3IEBAIHUycG9ydDA6IHVzYi1waHlAMCB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgfTsKPgo+IC0gICAgICAgICAgICAgICAgICAgICAgIHUzcG9ydDA6IHVzYi1waHlAMDcw
MCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdTNwb3J0MDogdXNiLXBoeUA3MDAgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDcwMCAweDkwMD47Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsazI2bT47Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJyZWYiOwo+IC0tCj4gMi4z
MC4yCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsKClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJp
Yy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
