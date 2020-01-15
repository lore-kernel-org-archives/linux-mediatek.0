Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C05C33CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 07:55:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A25214AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 07:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oe0TP22Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvUkGk7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A25214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qxbvjy149aMcjvfRyDju0Ryi+CHxC/o9LyLWiqv4F4k=; b=oe0TP22ZNauUdI
	HCXzCaIzkzd88+71ZFgz2crtNMmGfpwR5KavsV6C9eXNdG5U2IwViEW7Hj+f4CDsoWpA0qLhgySBl
	g62zSMlvtWfUMYHRmYM5SsZCYNIIutm5v4gHNNBym9KMcup6XohluowtTK90sMsloY/tjpTG75URm
	4WoMpqNE1f8MHivw7bMZxLB0RhHGJGBXSd8yN/mfvwaEwfUN+BHRp5YsZ6v8PMA/vWBDOgppcDgRh
	NJ+HKi0C8D8B6bTDpXK6/ZYze2G/gQnrRSdsH0BtrB1zRBh3XiwSSTT0GgRGALpCXHG8GvUXbmAn9
	kHNPPQvbCQwK+biYIIog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irdVz-0005Rs-MF; Wed, 15 Jan 2020 07:54:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irdVu-0005Qt-Dm
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 07:54:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id q10so14712018wrm.11
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2020 23:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=15L7jlFqNO2Bso518qKUnevC0GsYD/ESd/nGLMhwY18=;
 b=YvUkGk7+bHFbBiHvppN2kI5YCnCNxnXe3u7oi6v/yBKhT0qQ/TUefkDTiAscRl6mJU
 9+PNZhlEvHQKdI9U3T9G+drI9Bu1AAsx4FOTyEjfy3XUi9Bn4Zl1qnfj/g6L8y2/2sMQ
 NtWrWvvsc6KubXhZu5tA4a15M9I3G6heuTACJ///AKb339G4xRF1OUQDwuls0BNHj6Dd
 L+Ao+9F6DyIGDmlExl1k6P91ReYIN3xWIVpMaL/vUlNo5n0UkHMmtI+SU+9i6s4wQefw
 cAa2en57TyecoCFj7V2uTmp3Sdl6biCxiHChJnF7z9QB2zNP10RiP0Dz/4UHcPuNjkvP
 /aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=15L7jlFqNO2Bso518qKUnevC0GsYD/ESd/nGLMhwY18=;
 b=UbhjGP4QmXVhtinsAXhdsD1G8C2Uf6qOSTEvK7PsPZ+Os5HQ8hq/UowmZWpkk7khV6
 vGRNPYaiZ52eRZvP8A2FnrDwoiEgOk+BY/VEVwAXVv0hF3h0/6DjBDaKRwajFyMkZBeF
 J+/f5cb3z476qqevV9FjP29kMFp+Mo4mRBCJAhgaWD9GgyihUgNuK6NASZyRQYLVDzEc
 Zdsd5/BvoCO0rBGuCg+B0eFcYJKpihNm9RjTBhswp/LTRTqOzwL6Ozwm+7SkKv8Y2Hk/
 tHt/VFgkbO/9nAwfWyqZp9DUkgjl7Knkr401lgS8t8d6XbqKCVOs/hD80uDuSlcl7wTz
 E3kw==
X-Gm-Message-State: APjAAAWN00GKvSn2LFDpiRJv5MkGFg1d1AtlPwvcbcuCOdeOBYB0PEbF
 RKAqpebgBhhVVljd2MNd0l4ZBA==
X-Google-Smtp-Source: APXvYqyGZdgYfY2VItz4h8XSNP932dhDZZ7eluAWOElft/WQQOcEsxckB+CTyI0jPiwls4B9Ze0uDw==
X-Received: by 2002:a5d:49cc:: with SMTP id t12mr28623351wrs.363.1579074892536; 
 Tue, 14 Jan 2020 23:54:52 -0800 (PST)
Received: from dell ([2.27.35.221])
 by smtp.gmail.com with ESMTPSA id o4sm22723616wrx.25.2020.01.14.23.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 23:54:51 -0800 (PST)
Date: Wed, 15 Jan 2020 07:55:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20200115075511.GB325@dell>
References: <20200107153314.21486-1-gene.chen.richtek@gmail.com>
 <CAE+NS34ULhk=CLo+e6gAO3SF9NW1cTAZcpMvX1yLfChNCJTpRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS34ULhk=CLo+e6gAO3SF9NW1cTAZcpMvX1yLfChNCJTpRA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_235454_788802_336900BF 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNSBKYW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBIaSBMZWUvTWF0dGhpYXMs
Cj4gCj4gICAgIENvdWxkIHlvdSBwbGVhc2UgaGVscCB0byByZXZpZXcgbmV3IGZpeCBjaGFuZ2Us
IHRoYW5rcwoKYSkgSWYgeW91IHRoaW5rIGEgc3VibWlzc2lvbiBoYXMgYmVlbiBhY2NpZGVudGFs
bHkgZHJvcHBlZCwgeW91IHNob3VsZAogICByZXN1Ym1pdCBpdCBhcyBhICJSRVNFTkQiLiAgUGxl
YXNlIGRvIG5vdCBzZW5kIGNvbnRlbnRsZXNzIHBpbmdzLgoKYikgSXQgbG9va3MgbGlrZSB5b3Ug
aGF2ZSBjb21wbGFpbnMgZnJvbSB0aGUgJ2J1aWxkIHRlc3Qgcm9ib3QnLiAgWW91CiAgIG5lZWQg
dG8gYWRkcmVzcyB0aGVtIGZpcnN0LCBiZWZvcmUgcmV2aWV3LiAgT3IgYXQgbGVhc3QganVzdGlm
eQogICB0aGVtLgoKPiBHZW5lIENoZW4gPGdlbmUuY2hlbi5yaWNodGVrQGdtYWlsLmNvbT4g5pa8
IDIwMjDlubQx5pyIN+aXpSDpgLHkuowg5LiL5Y2IMTE6MzPlr6vpgZPvvJoKPiA+Cj4gPiBGcm9t
OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+Cj4gPiBBZGQgbWZkIGRyaXZl
ciBmb3IgbXQ2MzYwIHBtaWMgY2hpcCBpbmNsdWRlCj4gPiBCYXR0ZXJ5IENoYXJnZXIvVVNCX1BE
L0ZsYXNoIExFRC9SR0IgTEVEL0xETy9CdWNrCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBD
aGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbWZkL0tjb25m
aWcgICAgICAgIHwgIDEyICsrCj4gPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgfCAgIDEg
Kwo+ID4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgIHwgNDI0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCB8IDI0
MCArKysrKysrKysrKysrKysrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDY3NyBpbnNlcnRp
b25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmgKCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
