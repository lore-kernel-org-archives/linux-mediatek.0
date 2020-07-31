Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2E8C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:06:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B40072072A
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PE66VNLh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un/qHsaj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B40072072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=auEAxA1H77NGxH5suNCwuVneU/WiOWNEbl3qUzwG/eg=; b=PE66VNLhM+xKrsTeZfixcbQhx
	7mOACm6osY5umPHszX+dPrCc/31MEmzW6X2iqbkmPq1shfmOsonrh0T96omMUZ9QkGJbUIfZM8fX7
	AO9s82aITHo095/H0pf3PGAFlQJhEOQBU3GQdZ0snc+7kfK143Wtx5rw1u8q8zCSHhtZ6GWR5/cZ+
	/pkvGxBH4ho+CeaMy6GNmMgIE2IqDGlxZypGsdzM8nvw2vgWaS7OTDJ6A4TMk7ENynD2goeJrooJA
	gABez2P23mZS0c1oV6/8KHH9v5Ah0F6yy0IhFHkkKM9OVkgYlweroG+w9NO9CBWWPBdsscJvK3Szf
	I+CB2IpYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Qze-0005bm-5i; Fri, 31 Jul 2020 09:06:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Qza-0005an-SV
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 09:06:20 +0000
Received: by mail-wr1-x442.google.com with SMTP id y3so27301046wrl.4
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2020 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lfnkQfm3GKzU95XwF2JxhE5x/N3AyvhM1u96HkPpQ6s=;
 b=Un/qHsajtmNjsOmCb2mnNKCZnsB5UPu6XobhVc6xxd3nqxAzWj6t50hCNgEd4vTdGo
 mvJ1bgtAOIVAMdbh82+osjwh9TPvAkn4Ge781EHgqcOq3+EeXqkni0j0/1htkPAbUj5f
 OhrmFEFapzJ0E1to8b0HIKVZ1GQ1szmMS57VdH43oD25bjccRrDHN4W+zbI6C09/k3z0
 PDA5t/WdD8bG6gtLLQxi7EJjzT7p72J8GxdLyc81X7vGZMx3UwyiSaXF+/INF6PpgVUY
 lVsmFIihfDiCS9C4xNgXsYX2hHO/4x7e93WW7twv+zu/pZ5PRfmj4pyHC7kciNooqtIf
 WGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lfnkQfm3GKzU95XwF2JxhE5x/N3AyvhM1u96HkPpQ6s=;
 b=CwGFuOWcD0tMNyMqMlI6D8O5m0B03X5agPVThCAbSfYnF4+MIjXZT0OLTV+HmKfudr
 73zjpVzAxx9LNWj53qaNoyWTHAjcglT1IdRyQmHgre33VyqshXF0wVYuD/Ueb35fZ0uq
 2/QPFut2gWtzr3Mn5ikEjkS7ssA50yNylZnTZiejyUWcHga6EOjmDvXXQdU/XS5UFa5U
 Uca7+Z/fXajD0xtEkMeeqvFqboEQlZ0lf5SOIPk2NS/THt1PJtTGGbmd3xbC/V0mxv7U
 vHedhgZc6ua6ScqrB6wrYjFXdUaeGLoL3xiHA2alC/BjFC43CWDXeJ4cYj5AFnxvoEFv
 TvAg==
X-Gm-Message-State: AOAM5316AFXwdw5UqObM6pbdJp5+jQEv33oXY/saGAxdH1fzoSLRmN/n
 jLcJx0ztZ7rjiJla72PshRb+fqdAwmQ=
X-Google-Smtp-Source: ABdhPJxvvy10AX5J00BsA51P9Ib9neAMULoBhvxJmXpVuThEekQJMPq47kHsZzAyKsIgo2uMvjo84w==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr2555849wru.211.1596186377988; 
 Fri, 31 Jul 2020 02:06:17 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id c24sm13316548wrb.11.2020.07.31.02.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:06:17 -0700 (PDT)
Date: Fri, 31 Jul 2020 10:06:15 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 9/9] mfd: mt6360: Merge different sub-devices i2c
 read/write
Message-ID: <20200731090615.GK2419169@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-10-git-send-email-gene.chen.richtek@gmail.com>
 <20200727124306.GP1850026@dell>
 <CAE+NS354H-j5UKa+JxHzvwinpPN9QR176ugFVt+UYyJFsOMg0w@mail.gmail.com>
 <20200729101244.GH2419169@dell>
 <CAE+NS37hURYnWqsewnc+T9yn62pFdSHUTqL4BvdsH_3mRf6Yrg@mail.gmail.com>
 <CAE+NS35bHQkiQroRGOWGNv_jbCiW6p4FfwJXNieEuN40YHdf_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS35bHQkiQroRGOWGNv_jbCiW6p4FfwJXNieEuN40YHdf_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_050619_254644_EA558022 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Wy4uLl0KCj4gPiA+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9idXMgbXQ2MzYw
X3JlZ21hcF9idXMgPSB7Cj4gPiA+ID4gPiA+ICsgICAgIC5yZWFkICAgICAgICAgICA9IG10NjM2
MF9yZWdtYXBfcmVhZCwKPiA+ID4gPiA+ID4gKyAgICAgLndyaXRlICAgICAgICAgID0gbXQ2MzYw
X3JlZ21hcF93cml0ZSwKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArICAgICAvKiBkdWUgdG8g
cG1pYyBhbmQgbGRvIGNyYyBhY2Nlc3Mgc2l6ZSBsaW1pdCAqLwo+ID4gPiA+ID4gPiArICAgICAu
bWF4X3Jhd19yZWFkICAgPSA0LAo+ID4gPiA+ID4gPiArICAgICAubWF4X3Jhd193cml0ZSAgPSA0
LAo+ID4gPiA+ID4gPiArfTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBXaHkgaXNuJ3QgYWxsIG9mIHRo
ZSBhYm92ZSBpbiBhIFJlZ21hcCBkcml2ZXI/Cj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gRG8g
eW91IG1lYW5zIHNwbGl0IG91dCBsaWtlIGRyaXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLWFjOTcu
Yz8KPiA+ID4KPiA+ID4gWWVzLCBJIGRvLgo+ID4gPgo+ID4gPiBbLi4uXQo+ID4gPgo+ID4KPiA+
IEFDSwo+ID4KPiAKPiBBZnRlciBJIGltcGxlbWVudCBmaXJzdCB2ZXJzaW9uIG9mIHJlZ21hcC1t
dDYzNjAuYywgSSBmb3VuZCBvdXQgYWM5Nwo+IGlzIGEgaW50ZWwgc3RhbmRhcmQgY29kZWMuCj4g
SWYgZGV2aWNlIGZvbGxvdyB0aGlzIHNwZWMsIGl0IGNhbiByZXVzZSB0aGlzIGFwaS4KPiBCdXQg
cmVnbWFwLW10NjM2MC5jIG1heSBzaW5nbGUgdXNlIG9ubHkuCj4gc2hvdWxkIEkgdHJ5IHNlbmRp
bmcgcGF0Y2ggb25jZSB0byByZWdtYXAgcmV2aWV3ZXI/CgpTaW5nbGUgdXNlIGlzIG9rYXkuICBQ
dXR0aW5nIFJlZ21hcCBjb2RlIGludG8gTUZEIGlzIG5vdCBva2F5LgoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
