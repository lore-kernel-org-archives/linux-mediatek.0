Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5F4C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 19:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DA342075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 19:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BML+N19K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVInyANV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DA342075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1QFZwA7wi7OGIJqV415GunAs6xqdgLM65obCeWEYa5k=; b=BML+N19KcUgwTvtWBICu1Gl18
	rE4UfIXKaOsWzy5pdsBg3917D8wn/fib8W4MXUAuSuDIIw+qqtjPTLlsWw3ZrZvpp1IoJOPd1FcC5
	d3cfd0GJrBq0wGBAjDgJuuv7eiACyEjho3HePuRZ3Wmrtf6aFW7EMdEJsHkkGXFK56LQRcdTgotEO
	qsFurlKmdd+oHtSEOacXaIndf/WeNQBZgWc3RcPUJx2uOuxS3vHoiIulC8D81TvNblM0RZtClBneo
	tuDSMCsI4SNrYAYx0qohDCFYFaMZvXBt05UOBfXSopJMxn8+HhZxD+gyBbeIYVhZrVHoGnkslDS6N
	LjklSlcrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8qae-0003sx-DP; Thu, 20 Aug 2020 19:51:12 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8qac-0003sQ-7W; Thu, 20 Aug 2020 19:51:11 +0000
Received: by mail-lj1-x241.google.com with SMTP id 185so3422652ljj.7;
 Thu, 20 Aug 2020 12:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OniJLvMGszqKdZPfnGGPRm6yrJhAzhpZMeh8ipXlA60=;
 b=kVInyANVqA86ZsupZ+Pb7ttjo0P8NA3R0p3DEzLgJRsTMKMITZei2G3WfZlSDDDOVo
 Brozzas6ZvHEMSO6RQ7WwIfPzyZXzZCTaGO6sIRzul2WnVUcIu4qdNYnU6EQ9GWkivhM
 QTGkeebRJE/pgeW85V9eAFS/VGArzEWQd7WIUDnvijv+JOo1PxZqZIJ3N/OfFTlCMK6Q
 5lFS3LvaE9s+NfL7N0AZ0y0gja4R9roVmkZSMm/4V7djiYtKW0fMsvRVrfErEqK7D0IF
 jvYrsgGLLa5tUOsuvyse6KRWT+USoZzaP/vuWqauOYwXsCSrWIwjCcleXTCwmdlO3FOW
 8Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OniJLvMGszqKdZPfnGGPRm6yrJhAzhpZMeh8ipXlA60=;
 b=BGSVHcpzk9POxNPlr0azpGFE0UUk979yDOZBTRYq91/hGqaZAEvrJVOZ+JDEe5Vuun
 Z3IdTsY+sOHMshaFiQedxFCkzcgkEMLtBDtoGwKx9Nue+cm+dIGQmokM9rblD2cib8//
 vBoikWWBZjND5y1jJ4eAEWWRkoB6B/0hiVLWaBRze0o2iKTOmAcjM+PisfpafalluzvR
 n9nVbkVUzWFhM6VAPb3J6+9o5oRE3ZjYW3aEP4n5nP3O+67NeUdlOCL/iV6gPd+sQXNq
 yW705nEsS/OlJiZBJ9wIVMJk/igsQozqSy0WghNNXooi2+2wvcaG556teS5PbCjZZLtR
 NfGQ==
X-Gm-Message-State: AOAM530kAz+NWv9juLMP+p3xlydkULgCocglvDqPQPIPwB3XFHeCmFwa
 JPy9q0Jy9l7s8RiAJiZ1DgA=
X-Google-Smtp-Source: ABdhPJyvIy9bEn51zd/IbZfZTQR3N2YYlmALsIktwWFi5DNbYZ8x8ytUZs/6wT5ORieeLAv6LpyrBA==
X-Received: by 2002:a05:651c:231:: with SMTP id
 z17mr2146637ljn.109.1597953064841; 
 Thu, 20 Aug 2020 12:51:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id l26sm690804lfj.22.2020.08.20.12.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 12:51:03 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Date: Thu, 20 Aug 2020 22:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_155110_347038_052CBE89 
X-CRM114-Status: GOOD (  21.50  )
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

MjAuMDguMjAyMCAxODowOCwgUm9iaW4gTXVycGh5INC/0LjRiNC10YI6Cj4gTm93IHRoYXQgYXJj
aC9hcm0gaXMgd2lyZWQgdXAgZm9yIGRlZmF1bHQgZG9tYWlucyBhbmQgaW9tbXUtZG1hLCB3ZSBu
bwo+IGxvbmdlciBuZWVkIHRvIHdvcmsgYXJvdW5kIHRoZSBhcmNoLXByaXZhdGUgbWFwcGluZy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+
IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lvbW11LmMgfCAxMiAtLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lvbW11LmMgYi9kcml2ZXJzL3N0
YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lvbW11LmMKPiBpbmRleCA2YWY4NjNkOTIxMjMuLjRmNzcw
MTg5ZWQzNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lv
bW11LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lvbW11LmMKPiBA
QCAtMTAsMTAgKzEwLDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gIAo+IC0jaWYgSVNfRU5BQkxFRChDT05GSUdf
QVJNX0RNQV9VU0VfSU9NTVUpCj4gLSNpbmNsdWRlIDxhc20vZG1hLWlvbW11Lmg+Cj4gLSNlbmRp
Zgo+IC0KPiAgI2luY2x1ZGUgInZkZS5oIgo+ICAKPiAgaW50IHRlZ3JhX3ZkZV9pb21tdV9tYXAo
c3RydWN0IHRlZ3JhX3ZkZSAqdmRlLAo+IEBAIC03MCwxNCArNjYsNiBAQCBpbnQgdGVncmFfdmRl
X2lvbW11X2luaXQoc3RydWN0IHRlZ3JhX3ZkZSAqdmRlKQo+ICAJaWYgKCF2ZGUtPmdyb3VwKQo+
ICAJCXJldHVybiAwOwo+ICAKPiAtI2lmIElTX0VOQUJMRUQoQ09ORklHX0FSTV9ETUFfVVNFX0lP
TU1VKQo+IC0JaWYgKGRldi0+YXJjaGRhdGEubWFwcGluZykgewo+IC0JCXN0cnVjdCBkbWFfaW9t
bXVfbWFwcGluZyAqbWFwcGluZyA9IHRvX2RtYV9pb21tdV9tYXBwaW5nKGRldik7Cj4gLQo+IC0J
CWFybV9pb21tdV9kZXRhY2hfZGV2aWNlKGRldik7Cj4gLQkJYXJtX2lvbW11X3JlbGVhc2VfbWFw
cGluZyhtYXBwaW5nKTsKPiAtCX0KPiAtI2VuZGlmCj4gIAl2ZGUtPmRvbWFpbiA9IGlvbW11X2Rv
bWFpbl9hbGxvYygmcGxhdGZvcm1fYnVzX3R5cGUpOwo+ICAJaWYgKCF2ZGUtPmRvbWFpbikgewo+
ICAJCWVyciA9IC1FTk9NRU07Cj4gCgpIZWxsbywgUm9iaW4hIFRoYW5rIHlvdSBmb3IgeW91cnMg
d29yayEKClNvbWUgZHJpdmVycywgbGlrZSB0aGlzIFRlZ3JhIFZERSAoVmlkZW8gRGVjb2RlciBF
bmdpbmUpIGRyaXZlciBmb3IKZXhhbXBsZSwgZG8gbm90IHdhbnQgdG8gdXNlIGltcGxpY2l0IElP
TU1VIGRvbWFpbi4gVGVncmEgVkRFIGRyaXZlcgpyZWxpZXMgb24gZXhwbGljaXQgSU9NTVUgZG9t
YWluIGluIGEgY2FzZSBvZiBUZWdyYSBTTU1VIGJlY2F1c2UgVkRFCmhhcmR3YXJlIGNhbid0IGFj
Y2VzcyBsYXN0IHBhZ2Ugb2YgdGhlIEFTIGFuZCBiZWNhdXNlIGRyaXZlciB3YW50cyB0bwpyZXNl
cnZlIHNvbWUgZml4ZWQgYWRkcmVzc2VzIFsxXS4KClsxXQpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS45LXJjMS9zb3VyY2UvZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZk
ZS9pb21tdS5jI0wxMDAKClRlZ3JhMzAgU29DIHN1cHBvcnRzIHVwIHRvIDQgZG9tYWlucywgaGVu
Y2UgaXQncyBub3QgcG9zc2libGUgdG8gYWZmb3JkCndhc3RpbmcgdW51c2VkIGltcGxpY2l0IGRv
bWFpbnMuIEkgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBhZGRyZXNzZWQKYmVmb3JlIHRoaXMgcGF0
Y2ggY291bGQgYmUgYXBwbGllZC4KCldvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciBJT01NVSBkcml2
ZXJzIHRvIGdhaW4gc3VwcG9ydCBmb3IgZmlsdGVyaW5nIG91dApkZXZpY2VzIGluIGlvbW11X2Rv
bWFpbl9hbGxvYyhkZXYsIHR5cGUpPyBUaGVuIHBlcmhhcHMgVGVncmEgU01NVSBkcml2ZXIKY291
bGQgc2ltcGx5IHJldHVybiBOVUxMIGluIGEgY2FzZSBvZiB0eXBlPUlPTU1VX0RPTUFJTl9ETUEg
YW5kCmRldj10ZWdyYS12ZGUuCgpBbHRlcm5hdGl2ZWx5LCB0aGUgVGVncmEgU01NVSBjb3VsZCBi
ZSBjaGFuZ2VkIHN1Y2ggdGhhdCB0aGUgZGV2aWNlcwp3aWxsIGJlIGF0dGFjaGVkIHRvIGEgZG9t
YWluIGF0IHRoZSB0aW1lIG9mIGEgZmlyc3QgSU9NTVUgbWFwcGluZwppbnZvY2F0aW9uIGluc3Rl
YWQgb2YgYXR0YWNoaW5nIGF0IHRoZSB0aW1lIG9mIGF0dGFjaF9kZXYoKSBjYWxsYmFjawppbnZv
Y2F0aW9uLgoKT3IgbWF5YmUgZXZlbiBJT01NVSBjb3JlIGNvdWxkIGJlIGNoYW5nZWQgdG8gYXR0
YWNoIGRldmljZXMgYXQgdGhlIHRpbWUKb2YgdGhlIGZpcnN0IElPTU1VIG1hcHBpbmcgaW52b2Nh
dGlvbj8gVGhpcyBjb3VsZCBiZSBhIHVuaXZlcnNhbApzb2x1dGlvbiBmb3IgYWxsIGRyaXZlcnMu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
