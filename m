Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5538C5517A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 16:53:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49B2B206FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 16:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GquacqaN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vrWvgsCU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49B2B206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/icIogOezZ/9JM2+Qo8wzw4lCewW1kZ+Xy+QvQ8LCOk=; b=GquacqaNtozda0+xpjjwMtuk3
	IOTpyv8WvJbFrIaX7mWs5GhS3ccjfKpPfXby8ZfHO0B3JNzbl4BDuktuZmb04ABBa0n2RnBFcW6HG
	HRORrEhUeSa0mAU9XxHJrEtWyY2Psz4T7Ukcw57Uj7zoSmUSKVhYSCOhRDLMIPPHc92uBPENG/WVo
	k5uKGHmVwD+dz6sIxcTVTP/OkkSaRgPCAxrBCY88yyZ6xiXc9aUxgkFHK27VfdZCt0Ig4odO02KLg
	MqJ+727oFhyWmWIKpQh1FECQarYofkJditHkAC8/grVMfAXH54Lv643k+7vGwil1uwPamZeh29aSx
	n74gawWxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kctMo-0001KH-Rw; Wed, 11 Nov 2020 16:53:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kctMk-0001Iu-3s; Wed, 11 Nov 2020 16:53:03 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC29020756;
 Wed, 11 Nov 2020 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605113581;
 bh=JmHvo1SzasskdROAWMoAgJ6ASA6flz7HfKula4/+Rxc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vrWvgsCUe3WUikOynKF6WlqA5l0n3Ae1O6V5ZPQigDunSwUXIaYX8ZofQhXb9U4LG
 Esja9EsroullITulSAV8dkBDv3SOgb7xsRWgGf6oTesxapQG9ngNCNgSOZufBQADRR
 PvjNyIoTkRIvuA/Pa4Or0KVFxrn9OX8zEqdV9Jjg=
Received: by mail-ej1-f50.google.com with SMTP id o9so3715271ejg.1;
 Wed, 11 Nov 2020 08:53:00 -0800 (PST)
X-Gm-Message-State: AOAM532ShnWqtWF5TJuYfdIeAs/bMHnaBEY5wySj2NsyJWotRy54CnPt
 bHRvgZGV+odqLTlA9NscQEpKuf9SUHGDSAg7/A==
X-Google-Smtp-Source: ABdhPJzdRmYGXhqdGMuO0dJRFroeBzeq9MJGO2EU8QQlLa+CkCedj+n4fq3F2ISZsjzb4o981Dy2VwbcJ3xH0AIJoko=
X-Received: by 2002:a17:906:5f8d:: with SMTP id
 a13mr26062667eju.194.1605113579120; 
 Wed, 11 Nov 2020 08:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-25-yong.wu@mediatek.com>
In-Reply-To: <20201111123838.15682-25-yong.wu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 12 Nov 2020 00:52:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_85-PWMVh3k+P_984irVVLaEWjPSyw1amFkRaQ+x=wg=A@mail.gmail.com>
Message-ID: <CAAOTY_85-PWMVh3k+P_984irVVLaEWjPSyw1amFkRaQ+x=wg=A@mail.gmail.com>
Subject: Re: [PATCH v4 24/24] MAINTAINERS: Add entry for MediaTek IOMMU
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_115302_341774_81DF69A5 
X-CRM114-Status: GOOD (  17.63  )
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
Cc: youlin.pei@mediatek.com, DTML <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, kernel-team@android.com,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 iommu@lists.linux-foundation.org, chao.hao@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgWW9uZzoKCllvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDEx5pyI
MTHml6Ug6YCx5LiJIOS4i+WNiDg6NTPlr6vpgZPvvJoKPgo+IEkgYW0gdGhlIGF1dGhvciBvZiBN
ZWRpYVRlayBpb21tdSBkcml2ZXIsIGFuZCB3aWxsIHRvIG1haW50YWluIGFuZAo+IGRldmVsb3Ag
aXQgZnVydGhlci4KPiBBZGQgbXlzZWxmIHRvIGNvdmVyIHRoZXNlIGl0ZW1zLgoKUmV2aWV3ZWQt
Ynk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBNQUlOVEFJTkVS
UyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggZTczNjM2Yjc1ZjI5
Li40NjJhODdlZTE5YzggMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJ
TkVSUwo+IEBAIC0xMTA1Niw2ICsxMTA1NiwxNSBAQCBTOiAgICAgTWFpbnRhaW5lZAo+ICBGOiAg
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXQ2NXh4LnR4dAo+
ICBGOiAgICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYwo+Cj4gK01FRElBVEVLIElP
TU1VIERSSVZFUgo+ICtNOiAgICAgWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+Cj4gK0w6
ICAgICBpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+ICtMOiAgICAgbGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMp
Cj4gK1M6ICAgICBTdXBwb3J0ZWQKPiArRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pb21tdS9tZWRpYXRlayoKPiArRjogICAgIGRyaXZlcnMvaW9tbXUvbXRrLWlvbW11
Kgo+ICtGOiAgICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9tZW1vcnkvbXQqLWxhcmItcG9ydC5oCj4g
Kwo+ICBNRURJQVRFSyBKUEVHIERSSVZFUgo+ICBNOiAgICAgUmljayBDaGFuZyA8cmljay5jaGFu
Z0BtZWRpYXRlay5jb20+Cj4gIE06ICAgICBCaW4gTGl1IDxiaW4ubGl1QG1lZGlhdGVrLmNvbT4K
PiAtLQo+IDIuMTguMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
