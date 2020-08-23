Return-Path: <SRS0=ROsh=CB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85B3C433E1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 21:42:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743B3206BE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 21:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YVVX0/Cb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bi3p+Cp3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 743B3206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wg2uDxNECd1T+byEqiR/SkTkHjuS5tYHy/NZW0I0E+s=; b=YVVX0/CbcpcDz1cw3vrDPGLHg
	HJ81yxjDvQki7T0YkiXVTDTBjb6vQA0bIZC0UEUVNIwyTznuanhR0j3AmMYYYoqxdnrPYOHn2A1iv
	OFcmQ4wOEIEkuflprILjZtJ8tzul2y/IhVAii2+ShMzP4WPNqfC4onEm9AHqoMzGL0/OvlelGUGoa
	KX24UxY1kn6oWVliNbgzQadNQjmaXFKm2/6ThD+gM9oioJZfplUcKsOGspE4DSas6FNTYX7oqflsW
	dpIP7JR4gVrJMnMBO1HgtHtepwILBzgGTbD0BDEZw5BfWl7hCdCFWChMJ7nKvLdoFTWCWcP9NUIbO
	5NMoaDBMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9xkf-0004FM-6N; Sun, 23 Aug 2020 21:42:09 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9xkc-0004Eu-Je; Sun, 23 Aug 2020 21:42:08 +0000
Received: by mail-lf1-x142.google.com with SMTP id 12so3404564lfb.11;
 Sun, 23 Aug 2020 14:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wc4iGC6lUOkdFB1yl61K549g5r3SOsu5JHxiruFQCrg=;
 b=Bi3p+Cp3Oib9xYvfFtUZm0Uf4rS7f9RNyKsd3tWxxONpQQc3PTzptgnmmrY8S6kGoN
 MOvAz8xOUY9ngcOmmuv32FeGCODgI3+OG2C1ZfXRwC80bdmDQFHZhV0g8e/8gqYcSkMK
 VnOoZTXbShIC6Bch87KRpZNeDTivaN6dRe3bl07uV2weQcOSTlnP8PSnJSpTAz6UwHXh
 jfkfJtWP6VTM0IVwVX0tTJylC0DIYkRTaV1fnQyEsy7T5f3ySgDBw7pvJhI1XA7xov8H
 aaOCGtjqie8LdeYqkGUwj5n+Z1y9yL6cENlISNUIdyKKFk/8rZaF0QyYzMRltPEBVOw0
 WQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wc4iGC6lUOkdFB1yl61K549g5r3SOsu5JHxiruFQCrg=;
 b=EtM7fPcZEBqjKKMxcOp3BdVfeEnJQ2/ZVQBiBbQMuwjpGSIbqYKEbPV+5yIcbcHWpA
 SEdBzbx/M5tj6MJFHQ6hUu0KiTp0q6wwsX3BaE/0gz4/KecVrPJ8ExnLWZXd0rl0Y8z7
 FrJ+nIZ669U9cAmS5GPYSjoFVR0YhzuDv3s0i/hxadh5vJEyqBIcjH2GqVGg7TqiEib/
 rzlfbe0B1BMYuXZQyYoh01Y0qoiK7RAaMw6EMDhKhip+R2I+6CXx1SSCqJGoM1inAmdF
 mqdQpgDbarwixO5mHYK3AKwKayuoxg6mih5B/m4JjZbaO1Z6hoccO5EI7WPZubbYeIpv
 A1Cg==
X-Gm-Message-State: AOAM5334aLBxa268iQM7IZwvAwItyEC4DtqGAYCD9LBlZATV8vOpYqs7
 fPqZcxjqsTKBcEtxmcA3MGo=
X-Google-Smtp-Source: ABdhPJzBkQVyR54HEK+tqk6nv9UaSdmG4fAbLjgLYrMh+ECOQvZhJQPh8Uzu3899cmc9YqmRioxiNg==
X-Received: by 2002:a19:4ace:: with SMTP id x197mr1185909lfa.70.1598218924740; 
 Sun, 23 Aug 2020 14:42:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id w8sm1807687ljm.48.2020.08.23.14.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Aug 2020 14:42:03 -0700 (PDT)
Subject: Re: [PATCH 12/18] iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
 <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
 <3a132bb0-f2e6-6f8d-6d0c-bc925dd23f06@arm.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceccd3d1-2510-c289-c063-681ae005da85@gmail.com>
Date: Mon, 24 Aug 2020 00:42:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3a132bb0-f2e6-6f8d-6d0c-bc925dd23f06@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_174206_975931_E78D8A8F 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MjEuMDguMjAyMCAwMzoyOCwgUm9iaW4gTXVycGh5INC/0LjRiNC10YI6Ci4uLgo+PiBXaWxsIGEg
cmV0dXJuZWQgTlVMTCB0ZWxsIHRvIElPTU1VIGNvcmUgdGhhdCBpbXBsaWNpdCBkb21haW4gc2hv
dWxkbid0Cj4+IGJlIHVzZWQ/IElzIGl0IHBvc3NpYmxlIHRvIGxlYXZlIHRoaXMgZHJpdmVyIGFz
LWlzPwo+IAo+IFRoZSBhaW0gb2YgdGhpcyBwYXRjaCB3YXMganVzdCB0byBtYWtlIHRoZSBjb252
ZXJzaW9uIHdpdGhvdXQgZnVuY3Rpb25hbAo+IGNoYW5nZXMgd2hlcmV2ZXIgcG9zc2libGUsIGku
ZS4gbWFpbnRhaW4gYW4gZXF1aXZhbGVudCB0byB0aGUgZXhpc3RpbmcKPiBBUk0gYmVoYXZpb3Vy
IG9mIGFsbG9jYXRpbmcgaXRzIG93biBpbXBsaWNpdCBkb21haW5zIGZvciBldmVyeXRoaW5nLiBJ
dAo+IGRvZXNuJ3QgcmVwcmVzZW50IGFueSBqdWRnZW1lbnQgb2Ygd2hldGhlciB0aGF0IHdhcyBl
dmVyIGFwcHJvcHJpYXRlIGZvcgo+IHRoaXMgZHJpdmVyIGluIHRoZSBmaXJzdCBwbGFjZSA7KQo+
IAo+IEhvcGVmdWxseSBteSBvdGhlciByZXBseSBhbHJlYWR5IGNvdmVyZWQgdGhlIGRlZ3JlZSBv
ZiBjb250cm9sIGRyaXZlcnMKPiBjYW4gaGF2ZSB3aXRoIHByb3BlciBkZWZhdWx0IGRvbWFpbnMs
IGJ1dCBkbyBzaG91dCBpZiBhbnl0aGluZyB3YXNuJ3QKPiBjbGVhci4KClRoYW5rIHlvdSBmb3Ig
dGhlIGRldGFpbGVkIGNvbW1lbnRzISBJIHdhc24ndCB3YXRjaGluZyBjbG9zZWx5IGFsbCB0aGUK
cmVjZW50IGlvbW11LyBjaGFuZ2VzIGFuZCB5b3VycyBjbGFyaWZpY2F0aW9uIGlzIHZlcnkgaGVs
cGZ1bCEKCk15IGN1cnJlbnQgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBHQVJUIGRyaXZlciB3
aWxsIG5lZWQgdG8gc3VwcG9ydAp0aGUgSU9NTVVfRE9NQUlOX0lERU5USVRZIGFuZCBzZXQgZGVm
X2RvbWFpbl90eXBlIHRvCklPTU1VX0RPTUFJTl9JREVOVElUWSBmb3IgYWxsIGRldmljZXMuCgpN
ZWFud2hpbGUsIHRvZGF5J3MgdXBzdHJlYW0gZHJpdmVycyBkb24ndCB1c2UgR0FSVCwgaGVuY2Ug
dGhpcyBwYXRjaApzaG91bGQgYmUgb2theS4gQWx0aG91Z2gsIGl0J3MgYSBiaXQgdW5saWtlbHkg
dGhhdCB0aGUgSU9NTVVfRE9NQUlOX0RNQQp0eXBlIHdpbGwgZXZlciBiZSB1c2VmdWwgZm9yIHRo
ZSBHQVJULCBhbmQgdGh1cywgSSdtIHN0aWxsIHRoaW5raW5nIHRoYXQKd2lsbCBiZSBhIGJpdCBu
aWNlciB0byBrZWVwIEdBUlQgZHJpdmVyIGFzLWlzIGZvciBub3cuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
