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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51883C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:59:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45E76113D
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45E76113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MnG+RW79A9vtT17N3OIeHJbo8ZjWjcKo6R4696HvOkg=; b=rZT3vpDcb3hmDP5jbrBl5mAkD
	N/XhTQyeRI0mpdWsPl7BGDOrjdnT31ZonCO5RlKFc3jzMQhQRHBHAb6hB/Xa+ITWgrCxfFvSHaShm
	PqE42BAlwlFObWW0v/MlfZ1TAzgMTCxaf0zrl6fZvgPd8jaBQp7qEwnlPEE2VUdyJt5N2LGbSWPzg
	9sRYuFqcoa9TEpkITll6EHGC6+X/eJUJsDtEjtBev8/3YpKF6jZd4449OJdN/WeCA1lBODqMpGcnf
	i1wyg+wWeEw40RzL5TwudPK7wEyW/LzXW6xFsFtzPbM5pIEjRm6ks+0B0zntNgvtfOAFmqVsWl+vN
	pdHEY63gw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHVZ-000w6e-H7; Fri, 16 Apr 2021 05:59:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHTD-000vgD-87; Fri, 16 Apr 2021 05:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=kS57iiOa0AGHkUaGIRJozUL71gHvC57WJEZwM6v3V14=; b=V+BrREQ7cIhY8RvMR0D60TeD+0
 AyTyGvmDjYmZkprKrktmj8XrSJ59y2JH4yPYOFWRqxhTuqvsgae8BMNh8de1LZ9r+ZxawKWcWgfUY
 lricNeMik14Jb+sADwL32dlj/uv+/M1sTJoGtK43ZVUj9hYudZf96t6g9T/C7ABjz09nh47x6AXuh
 IWi5PnVz1rDafNzEY8LnAqU1wHtcCQVU1AglQBAdecH0J++K0ppfBjFo0o2lE3jwpR5SzGSGhB5MZ
 dmMcMc+GrNviZAZw2gE5HlYw40NUv+YQv9JTJuhE02CX6b0YnoCI5Uhy73UeDgNhhVovsAJpLyvFJ
 QSYgHTqw==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHTA-0096Fe-J5; Fri, 16 Apr 2021 05:56:46 +0000
Received: by mail-oi1-x233.google.com with SMTP id e66so11474825oif.11;
 Thu, 15 Apr 2021 22:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kS57iiOa0AGHkUaGIRJozUL71gHvC57WJEZwM6v3V14=;
 b=UpCWEGb8NJ6bZ5/8DkI7x52RqEg7jfX1hhsKz9FtR96RgK0RNurxNWriMVVmSzQQak
 bZKOePt3I24vEzbYf6iekOhDLwojaS+SvE2FPK8Rx2dD1zqWgZ8AZWUprHgcCX+B5Isf
 bAjAWQ5RB3NrIE82iyBNJPgha0EtA0euWxoXYEjx0l4JtrS+6iWztFxmktTPRqX/36Ou
 5XgbqkqYnp2yHSkZuiP9QY9jZNsBnBROirUq7OQeI1EFBxYrwWVzgJsSkSs84crzQJAD
 GzzGK5Y+lc4qgVpjWRl9TWMluEl+rv3zENBOzcZAHJHBxhorMbk3fpC6Rwjc+Cvq7NO5
 jMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kS57iiOa0AGHkUaGIRJozUL71gHvC57WJEZwM6v3V14=;
 b=cExqJ4m3xPpcYv7X+xIGt3MnlDDasLQ8rzHLJc1f4ypuOi0X0snutFnrqXosFpo2Ra
 0iKSfslAFSSY0BLdTrkxjWssLEgzBy3YZcx4oO0U/wi1jMr6jGAllghX3Y5JVgO96Xul
 rDeuRwnjlPWnI2FynJf3DjHcJ9+NoKkO7HLZVVcZHHGQJojOBIROyxSYyURhDYnwFQ0+
 6B5EtFoGqmKMXjA6emHvM4SBe0XBE96jUbsTriA8kqvRYlgUHaPRhbLfB+D1FXOcJYTn
 PrGxlL/Lbcv0nEEjsNKsikYYeIjlOD6Ol/3+suLBS8rEJt4ktAufnL9ZUkC9eXfsVOnX
 xwUw==
X-Gm-Message-State: AOAM5329TcJE3KYGsAA4cpLfL1rIvqIugYA/PbX2iwYVzeMBuIpLujEr
 u2u2Pohtzgqf59MYMdNrTMQQ6mFcqt9UUctD9/E=
X-Google-Smtp-Source: ABdhPJymhDuEtEnD+Fy/IUfcVZZ89XR8eRsUMCgAQ1y3Y1XFsaC/aS5rMV3CqroE+T+Rv+aaJReYZqP4yA5Fzn4GVnk=
X-Received: by 2002:aca:b408:: with SMTP id d8mr5312478oif.47.1618552602684;
 Thu, 15 Apr 2021 22:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-2-hsinyi@chromium.org>
In-Reply-To: <20210415093519.1920877-2-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 07:56:33 +0200
Message-ID: <CAFqH_51rfSf5QR5xE5v=Fky5djT3uR_=0Ho8hD-wXS57tNXtpw@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-willow
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_225644_647310_89F91911 
X-CRM114-Status: GOOD (  14.03  )
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

SGkgSHNpbi1ZaS4KClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4KCk1pc3NhdGdlIGRlIEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gZGVsIGRpYSBkai4sIDE1IGTigJlhYnIuCjIw
MjEgYSBsZXMgMTE6MzY6Cj4KPiBXaWxsb3cgaXMga25vd24gYXMgQWNlciBDaHJvbWVib29rIDMx
MSAoQzcyMi9DNzIyVCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBj
aHJvbWl1bS5vcmc+CgpSZXZpZXdlZC1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMu
YmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KCj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9tZWRpYXRlay55YW1sCj4gaW5kZXggODFiODZiMTg5YThkLi45NmM0MDE1
OTdiZDggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9tZWRpYXRlay55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9tZWRpYXRlay55YW1sCj4gQEAgLTE1Nyw2ICsxNTcsMTMgQEAgcHJvcGVydGllczoKPiAg
ICAgICAgICAgICAgICAtIGdvb2dsZSxrb2RhbWEtc2t1MzIKPiAgICAgICAgICAgIC0gY29uc3Q6
IGdvb2dsZSxrb2RhbWEKPiAgICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4Mwo+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBHb29nbGUgV2lsbG93IChBY2VyIENocm9tZWJvb2sgMzExIEM3
MjIvQzcyMlQpCj4gKyAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAtIGVudW06Cj4gKyAgICAg
ICAgICAgICAgLSBnb29nbGUsd2lsbG93LXNrdTAKPiArICAgICAgICAgICAgICAtIGdvb2dsZSx3
aWxsb3ctc2t1MQo+ICsgICAgICAgICAgLSBjb25zdDogZ29vZ2xlLHdpbGxvdwo+ICsgICAgICAg
ICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTgzCj4gICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAg
ICAtIGVudW06Cj4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtcHVtcGtpbgo+IC0t
Cj4gMi4zMS4xLjI5NS5nOWVhNDViNjFiOC1nb29nCj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
