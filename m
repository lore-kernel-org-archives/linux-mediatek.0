Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87439C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOpGkw2Ieclb8MsU5QaKtIeLlmiZSRVa0h3QjyEpoOI=; b=Nesm+uvxbh5vgm
	K6HncCyZLcFgdzqmOv5uqMuWyPC/VYwdq/rbUcYeTvN2hZ2sdg7AZ7MN0oAvYc8CTWN/YpwNF4YPE
	EK/DtghViaMZAAVO7cwpMA6PEI4SQXSqlUDKtyo62uPG3AdZIoXFmYm8oVl7TdiNXfOw0FNNQLmQk
	zz8mPvG9OwiGPqxnl0PpZD8EL2kusfP5Pi1Y9bRc7BHSsGTGoeQRYfANxZ0erCS7hPi08UTYTsyeQ
	akGBQdHLFQ4CKbeOUuYmR3b4EYkUT/jTULzU9GfT4SLLkv6l2aXf4tFXkMDLg8f5tlEyPrUal4I+m
	b73lqLxLDHYXemzW0YSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquSZ-00D6QT-71; Tue, 17 May 2022 10:29:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquSW-00D6NO-3L; Tue, 17 May 2022 10:29:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso857711wmq.1; 
 Tue, 17 May 2022 03:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=T5Y1b6MSTSDc62ZZyWayGESS/DrDYqtlxsbdBnKwLdA=;
 b=VYKzS2kN0FFAnX4lzjuqVDsdNLyYCFES8rKBC/KPUC10SmAUCTYRjrYHOHoe2vJcm8
 sdqBCD17ys08EY/HTqVXZLqMkOyOOZtAjHd/hKG5s/sNRz0J5kGvWGalPCK2vzX1c/A3
 DfP9N7ZpIsOWXofYldFzgQXCXlPrDhPSxOGHcdkLWMKhVkTeFIYq1bOiL5hwl6e42PuN
 UWZMShCJQyI1kgQxVuXBVY1cCNuV3sfpiIraCzqfkgVnPhpMJWdm4PKL9N24GtOfNXXW
 WJCjrCG1YbH4stgQhDmDa6kxrCM/6EhF7eM5fN4uVnltsWkQz4pEpOIFFM2SHMvCwgcB
 Y6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=T5Y1b6MSTSDc62ZZyWayGESS/DrDYqtlxsbdBnKwLdA=;
 b=okav59nKHDcPwwDNSr+PNMED+3hUbi8O8Q18o2ifMxvoEwV511x549QGGC7PIiFqcP
 e2FWCPDTSNGfrOEkam60DVyoPNj8aGQY7eSm9I2WUhydHSKTzQCOySQmocMixBi6JikF
 BgO5I6NciK9qGhi9701FOjfajhtifmLsQQdH2TsHDAzpsKEXsy3WQ0hHhLJLKJ5XIVZw
 c+UAAWi+k+ixekJ6MljYfT2Udcm4LaK5gci/cpNsybBf/t4+aZDXrGCgFJ6GAAMsDWDx
 WX+wSWqIZIExLCK16cD0qVVrdIMWc3L2GA8LnRKSV2EkoImr4S9UG++x1OAhIkIQsFnC
 Wriw==
X-Gm-Message-State: AOAM533pqQge8aPPaoBkql3gdJGldH/fCyiqokYElwdB8EoXAnsNu1ET
 67vPxsdND3dvbkCXyyK4/TE=
X-Google-Smtp-Source: ABdhPJzfBnWPJiwfC93HpWH7vV0YVhtEQkrGLNuwAocWmFPYATQgc990iZt3LWEWWO4aApv9rLO3pw==
X-Received: by 2002:a05:600c:154d:b0:394:8d64:9166 with SMTP id
 f13-20020a05600c154d00b003948d649166mr21054212wmg.102.1652783380402; 
 Tue, 17 May 2022 03:29:40 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v8-20020adfa1c8000000b0020d050461c9sm7968570wrv.54.2022.05.17.03.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 03:29:39 -0700 (PDT)
Message-ID: <5965f488-714d-0456-50e0-bef79dc5ad0c@gmail.com>
Date: Tue, 17 May 2022 12:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
 <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
 <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
 <623fb170-b59a-84a0-3826-4b78968924bc@gmail.com>
 <CAAOTY_9gReO45qVhd5-9UrDYsDkOeS+FZT2Dw2McVgZvK3jfeg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
In-Reply-To: <CAAOTY_9gReO45qVhd5-9UrDYsDkOeS+FZT2Dw2McVgZvK3jfeg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_032944_201223_7574678C 
X-CRM114-Status: GOOD (  19.73  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxNS8wNS8yMDIyIDAwOjQ1LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBNYXR0aGlh
czoKPiAKPiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAy
MuW5tDXmnIgxM+aXpSDpgLHkupQg5LiL5Y2IMzo0MuWvq+mBk++8mgo+Pgo+PiBIaSBDaHVuLUt1
YW5nLAo+Pgo+PiBPbiAwMi8wNS8yMDIyIDAwOjU0LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+Pj4g
SGksIE1hdHRoaWFzOgo+Pj4KPj4+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+IOaWvCAyMDIy5bm0NOaciDIy5pelIOmAseS6lCDkuIvljYg4OjQy5a+r6YGT77yaCj4+
Pj4KPj4+Pgo+Pj4+Cj4+Pj4gT24gMTkvMDQvMjAyMiAxMTo0MSwgamFzb24tamgubGluIHdyb3Rl
Ogo+Pj4+PiBBZnRlciBtbXN5cyBhbmQgZHJtIGNoYW5nZSBESVRIRVIgZW51bSB0byBERFBfQ09N
UE9ORU5UX0RJVEhFUjAsCj4+Pj4+IG1tc3lzIGhlYWRlciBjYW4gcmVtb3ZlIHRoZSB1c2VsZXNz
IEREUF9DT01QT05FTlRfRElUSEVSIGVudW0uCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IGph
c29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPj4+Pj4gUmV2aWV3ZWQtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+Cj4+Pj4KPj4+PiBBY2tlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KPj4+Pgo+Pj4+IENodW4tS3VhbmcsIEkgdGhpbmsgaXQgd291bGQg
bWFrZSBzZW5zZSB0byB0YWtlIHRoYXQgdGhyb3VnaCB5b3VyIHRyZWUgYXMgaXQKPj4+PiBkZXBl
bmRzIG9uIHRoZSBwcmV2aW91cyBwYXRjaGVzLgo+Pj4+Cj4+Pj4gSSBwcm92aWRlIHlvdSBhIHN0
YWJsZSB0YWcgc28gdGhhdCB5b3UgY2FuIHRha2UgaXQ6Cj4+Pj4gdjUuMTgtbmV4dC12ZHNvMC1z
dGFibGUtdGFnCj4+Pgo+Pj4gQWZ0ZXIgSSB0YWtlIHRoaXMgdGFnLCBJIGZpbmQgb25lIGNoZWNr
cGF0Y2ggd2FybmluZzoKPj4+Cj4+PiBXQVJOSU5HOiBEVCBjb21wYXRpYmxlIHN0cmluZyAibWVk
aWF0ZWssbXQ4MTk1LW1tc3lzIiBhcHBlYXJzCj4+PiB1bi1kb2N1bWVudGVkIC0tIGNoZWNrIC4v
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLwo+Pj4gIzY3MDogRklMRTogZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmM6MzkwOgo+Pj4gKyAgICAgICAgICAgICAgIC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1tbXN5cyIsCj4+Pgo+Pj4gSSB0aGluayB0aGlzIHRh
ZyBsb3N0IG9uZSBiaW5kaW5nIHBhdGNoLCBpdCdzIGJldHRlciB0aGF0IHRoaXMgdGFnIGhhcwo+
Pj4gbm8gdGhpcyB3YXJuaW5nLgo+Pj4KPj4KPj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IEkg
d2FzIHNpY2suCj4+IFRoZSB3YXJuaW5nIGlzLCBiZWNhdXNlIHRoZSBzdGFibGUgYnJhbmNoIG1p
c3NlcyBjb21taXQ6Cj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L21hdHRoaWFzLmJnZy9saW51eC5naXQvY29tbWl0Lz9oPXY1LjE4LW5leHQvc29jJmlk
PTgxYzVhNDFkMTBiOTY4ZWE4OWQ1ZjQ0ZmUxZTVjMmZjNzAyODkyMDkKPj4KPj4gU28gaXQncyBu
b3QgYSByZWFsIGlzc3VlIGFuZCB3aWxsIGdvIGF3YXkgb25jZSBvdXIgYnJhbmNoZXMgbGFuZCBp
biB1cHN0cmVhbS4KPj4gSXMgaXQgT0sgZm9yIHlvdSB0byBpZ25vcmUgdGhlIGlzc3VlPwo+IAo+
IEl0J3MgT0sgZm9yIG1lLCBidXQgdGhlIHBhdGNoIHdvdWxkIGdvIHRocm91Z2ggZGlmZmVyZW50
IG1haW50YWluZXIncwo+IHRyZWUgYW5kIEknbSBub3Qgc3VyZSBpdCdzIE9LIGZvciBhbGwgb2Yg
dGhlbS4gU28gSSB3b3VsZCB3YWl0IGZvciB0aGUKPiBuZWNlc3NhcnkgcGF0Y2ggbGFuZCBpbiB1
cHN0cmVhbS4KPiAKCk9rIG1ha2VzIHNlbnNlLiBTb3JyeSBmb3IgdGhlIGJhZCBjb29yZGluYXRp
b24gZnJvbSBteSBzaWRlIG9uIHRoaXMuCgpSZWdhcmRzLApNYXR0aGlhcwoKPiBSZWdhcmRzLAo+
IENodW4tS3VhbmcuCj4gCj4+Cj4+IFJlZ2FyZHMsCj4+IE1hdHRoaWFzCj4+Cj4+PiBSZWdhcmRz
LAo+Pj4gQ2h1bi1LdWFuZy4KPj4+Cj4+Pj4KPj4+PiBSZWdhcmRzLAo+Pj4+IE1hdHRoaWFzCj4+
Pj4KPj4+Pj4gLS0tCj4+Pj4+ICAgICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuaCB8IDMgKy0tCj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5
cy5oCj4+Pj4+IGluZGV4IDU5MTE3ZDk3MGRhZi4uZmI3MTlmZDEyODFjIDEwMDY0NAo+Pj4+PiAt
LS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+Pj4+PiArKysgYi9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+Pj4+PiBAQCAtMTYsOCArMTYs
NyBAQCBlbnVtIG10a19kZHBfY29tcF9pZCB7Cj4+Pj4+ICAgICAgICAgRERQX0NPTVBPTkVOVF9D
Q09SUiwKPj4+Pj4gICAgICAgICBERFBfQ09NUE9ORU5UX0NPTE9SMCwKPj4+Pj4gICAgICAgICBE
RFBfQ09NUE9ORU5UX0NPTE9SMSwKPj4+Pj4gLSAgICAgRERQX0NPTVBPTkVOVF9ESVRIRVIsCj4+
Pj4+IC0gICAgIEREUF9DT01QT05FTlRfRElUSEVSMCA9IEREUF9DT01QT05FTlRfRElUSEVSLAo+
Pj4+PiArICAgICBERFBfQ09NUE9ORU5UX0RJVEhFUjAsCj4+Pj4+ICAgICAgICAgRERQX0NPTVBP
TkVOVF9ESVRIRVIxLAo+Pj4+PiAgICAgICAgIEREUF9DT01QT05FTlRfRFBfSU5URjAsCj4+Pj4+
ICAgICAgICAgRERQX0NPTVBPTkVOVF9EUF9JTlRGMSwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
