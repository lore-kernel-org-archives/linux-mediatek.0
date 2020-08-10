Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4329C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:09:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC3E20734
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f42j+Pgr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcKtsfc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC3E20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D+NdrZqJ4UA1nIgWnTLsvrfscYgbiE7F9sOFzaX5R9o=; b=f42j+PgrhY2m/upymTC7m5GJT
	/Fq/w2F+rheZeO9a8DdL3VWyvoQ6GWpPBsNP35w8V774Xevusj6A+yTKOi2B6X6X3zkzwcj7X7Q/m
	mlyqNy07O6o9U4UEiGx66eO5xyrWDzl6z0wMq3nX+2K+0z0i00Kt91O+tx28TqRTkH9H/x1y0g1gx
	fsj1DEnORopp5HtM1JZf7YCbZcZZRRanPf9+Nrw4hYwnAyAxHgolYELR8UQXm7iM9Gzv/hX3/hjQZ
	bkgbrQTV/wGpXTrWbmxqLtbAWEcBxCbGR8xxET0ryHNl171rPrxt/5b9ZeWKJYlBarBfmBQBcaAxc
	TdgR/qJug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k51vO-00016R-Qs; Mon, 10 Aug 2020 07:08:50 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k51vM-00015b-QF
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 07:08:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id 3so7288383wmi.1
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 00:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=47Gs9F1F8d09vZAc729o4HZeuw/VZH9JG+bx1Ajssig=;
 b=zcKtsfc8/Kleb9yRFPedZRukZN5BBfo337spqmdbUq9GEygQLbhq2BJ4pzaTY0/jUo
 91w5WkpjQW5DWV6jefPAnIRJvmGRiwiJcMfFNoOeDvuYJEa4PNoh36UhmSwof/MQAsGR
 m2xJsQK9B/9RZimDRm5uYXPUQq58wChaHdgj7XJYw6L6cMig5+QJ0+Wgg7VLEwzrU3DU
 fuRLexZM8n86RWBdX+vcqa9boVH8K2D3ntwLzct/OLmqy7m1Yy5+7NR2s0Qj1AER3+BE
 HFEDUEbuI0RitlAe4uPcyWkF19VwDo7tD381Uy/kh964R5Znw1VCtPGix9HAT4eUIFKZ
 kz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=47Gs9F1F8d09vZAc729o4HZeuw/VZH9JG+bx1Ajssig=;
 b=tcXw2wpNsp6zaRLa2cQ4FRRfQI7C8q6QZDiHSDJUuNRPNqSeB/C1LFBykiJbgP68+Y
 FGlqMgATdwLc3KlPVrx7zIGYZJRKwcWtTial6mRY3N/pxShCqjglC1KFIQdp45Iw/ms4
 2fun96wGx0RTU0oSPhZOWkZg8howy2LIDHDFjUoPCfKq9x4yeNlliI2yigVEy2/N+38C
 2Yx91GzmPYlS0Ht9/klldyN1bSFV9vtOJEL8OBiXXT49gh7BcE6Eu672cqt3g5h4xPqw
 0D4oXHbiIqzxpyf2YRAFGVS7RLEaPIGhW52ZqYaGSnB80a5qEH6s38u4ugYp7Dd3uO6B
 lDDw==
X-Gm-Message-State: AOAM530yEnvzQXRfODDa7vzjSweibVsu7azdZYZnAXbjBdF0pHsvhtQS
 ZsUdGZ4nqN5jqkWQNbuPo7S6rw==
X-Google-Smtp-Source: ABdhPJzaszzYjiz41rjzxkM5loaOj5BIe+vF8wU0E97WRWint16E9KsV5ipy0b3/vzW4w2iwnkZh7Q==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr25757680wmk.185.1597043325510; 
 Mon, 10 Aug 2020 00:08:45 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id w10sm20031948wmk.0.2020.08.10.00.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 00:08:44 -0700 (PDT)
Date: Mon, 10 Aug 2020 08:08:43 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20200810070843.GA4411@dell>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
 <1596558782-3415-11-git-send-email-gene.chen.richtek@gmail.com>
 <20200805161021.GK5556@sirena.org.uk>
 <CAE+NS360iKLoGxiiz8NmQqCp2Uge98Eehe4g2sn_N0e-E3DgyQ@mail.gmail.com>
 <20200806121332.GB6442@sirena.org.uk>
 <CAE+NS37tr65GnTue89wJkPvJzddahKj__KPgzmjzwkOfWQnc8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS37tr65GnTue89wJkPvJzddahKj__KPgzmjzwkOfWQnc8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_030849_180636_AA62E745 
X-CRM114-Status: GOOD (  22.44  )
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
Cc: Gene Chen <gene_chen@richtek.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNyBBdWcgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0OOaciDbml6Ug6YCx5ZubIOS4i+WNiDg6MTPlr6vp
gZPvvJoKPiA+Cj4gPiBPbiBUaHUsIEF1ZyAwNiwgMjAyMCBhdCAxMTozMDo1NkFNICswODAwLCBH
ZW5lIENoZW4gd3JvdGU6Cj4gPiA+IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4g5pa8
IDIwMjDlubQ45pyINuaXpSDpgLHlm5sg5LiK5Y2IMTI6MTDlr6vpgZPvvJoKPiA+Cj4gPiA+ID4g
SXQncyBub3QgY2xlYXIgd2h5IHRoaXMgaXNuJ3QganVzdCBkb25lIGluIHRoZSBkZXZpY2UgcmVn
bWFwLCB0aGVyZSdzCj4gPiA+ID4gZXhhY3RseSBvbmUgdXNlcj8KPiA+Cj4gPiA+IGJlY2F1c2Ug
SSB1c2Ugb25lIHJlZ21hcCB0byBhY2Nlc3MgNCBJMkMgZGV2aWNlcywKPiA+Cj4gPiBUaGVyZSBh
cHBlYXJzIHRvIGJlIG9ubHkgb25lIGRldmljZSBoZXJlPwo+ID4KPiA+ID4gSSBuZWVkIGNoYW5n
ZSB0aGUgcmVnbWFwX2J1cyBzdHJ1Y3QgdG8gZml0IEkyQyByZWFkL3dyaXRlIHdpdGggQ1JDIGJp
dAo+ID4gPiBUaGVyZWZvcmUsIE1GRCByZXZpZXdlciBzdWdnZXN0cyBJIGNhbiBtb3ZlIHRoZSBy
ZWdtYXAgYXBpIHRvIHJlZ21hcAo+ID4gPiBmb2xkZXIgc3VjaCBhcyByZWdtYXAtYWM5Ny5jCj4g
Pgo+ID4gQUMnOTcgaXMgYW4gaW5kdXN0cnkgc3RhbmRhcmQgYnVzIHVzZWQgYnkgYSByYW5nZSBv
ZiBkZXZpY2VzIGluCj4gPiBkaWZmZXJlbnQgc3Vic3lzdGVtcy4gIFlvdSBjYW4gYWxyZWFkeSBo
YXZlIGN1c3RvbSBvcGVyYXRpb25zIGZvciBhCj4gPiBkZXZpY2UganVzdCBpbiBhIHJlZ3VsYXIg
cmVnbWFwIHVzaW5nIHRoZSByZWdfcmVhZCgpIGFuZCByZWdfd3JpdGUoKQo+ID4gb3BlcmF0aW9u
cyB3aGljaCBhcmUgdGhlcmUgc28gZGV2aWNlcyB0aGF0IGluZGl2aWR1YWwgZGV2aWNlIHN1cHBv
cnQKPiA+IGRvZXNuJ3QgbmVlZCB0byBiZSBhZGRlZCB0byB0aGUgcmVnbWFwIGNvcmUuCj4gPgo+
IAo+IEkgbmVlZCB1c2UgcmVnbWFwX3Jhd19yZWFkIHRvIGFjY2VzcyBNVDYzNjAgVFlQRUMgcGFy
dCwgc28gd2UgbmVlZAo+IGltcGxlbWVudCBidXMgcmVhZCBjb250cm9sCj4gCj4gPiBZb3UgcmVh
bGx5IGFsc28gbmVlZCB0byB3cml0ZSBhIG11Y2ggY2xlYXJlciBjaGFuZ2Vsb2csIEkgd291bGQg
YmUgaGFyZAo+ID4gcHJlc3NlZCB0byB0ZWxsIGZyb20gdGhlIGNoYW5nZWxvZyB0aGF0IHRoaXMg
d2FzIG1vdmluZyB0aGluZ3MgdG8gdGhlCj4gPiByZWdtYXAgY29yZSByYXRoZXIgdGhhbiBzaHVm
ZmxpbmcgcmVnbWFwcyB3aXRoaW4gdGhlIGRldmljZS4KPiAKPiBNVDYzNjAgaGFzIDQgSTJDIHdv
cmtlciBkZXZpY2VzCj4gRmlyc3QsIEkgaW5jcmVhc2UgcmVnX2JpdHMgZnJvbSA4IHRvIDE2IGJp
dHMuCj4gSGlnaGVyIDggYml0cywgYmFuaywgaW5kaWNhdGVkIHdoaWNoIHdvcmtlciBkZXZpY2Ug
SSB3YW50IGFjY2Vzcwo+IFRoZW4sIGlmIHdvcmtlciBkZXZpY2VzIGlzIFBNSUMgb3IgTERPIHBh
cnQsIEkgbmVlZCBjYWxjdWxhdGUgb3IgY2hlY2sKPiBDUkM4IGJpdHMgd2hlbiB3ZSB3cml0ZSBv
ciByZWFkIGRhdGEuCj4gQ1JDOCBiaXRzIGlzIGNhbGN1bGF0ZWQgYnkgMyBwYXJ0cy4KPiAxJ3N0
IHBhcnQgaW5jbHVkZSAxIGJ5dGUgaXMgd29ya2VyIGFkZHJlc3MgYW5kIFIvVyBpbiBMU0IuCj4g
MiduZCBwYXJ0IGluY2x1ZGUgMSBieXRlIGlzIHJlZ2lzdGVyIGFkZHJlc3MKPiAzJ25kIHBhcnQg
aW5jbHVkZSB3cml0dGVuIGRhdGEgb3IgcmVhZCBkYXRhIGZyb20gTVQ2MzYwCj4gSSBhbHNvIG5l
ZWQgMSBkdW1teSBieXRlIHdoZW4gd3JpdGUgZGF0YQo+IAo+IEBMZWUgSm9uZXMsCj4gSSBmb3Vu
ZCBvdXQgZHJpdmVycy9paW8vY2hlbWljYWwvYm1lNjgwX3NwaS5jIGltcGxlbWVudCB0aGVpciBv
d24KPiByZWdtYXBfYnVzIHRvby4KPiBDYW4gSSBtb3ZlIHJlZ21hcCBjb250cm9sIGJhY2sgdG8g
bXQ2MzYwLWNvcmUuYz8KClllcywgaWYgdGhhdCBpcyB0aGUgJ2RvbmUgdGhpbmcnLgoKLS0gCkxl
ZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vy
dmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZv
bGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
