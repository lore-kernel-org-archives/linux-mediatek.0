Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43921C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:05:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA60619B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAA60619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mCIlcAJcymRN1Tg/ICfA/ZAZoaYSjUTHZW4B/NiorQQ=; b=MQHB5dteqN2yXZHCYhS33sc4K
	EZjbwH1dmxMcgBBL3c7D+gD6JkR8dp1yyI3qo2IXFcEMDK+uK+2lImJ0T49FmLdE2ROnM8+jSfk5U
	vARXX2JZqBoGq5xY2vqKmvCRQumBQFAaPVykTgx6CLxACIxNYpN/9CjF+yit3bt0/fHvyjukdolti
	oGZbjFUTd3JCDPN/0elIb+/RuexcbtX5vIiCaPA1F6uVe/L6jNHqrwFkqs4foRqixkfbkXBD07DZF
	u3u8dT7Klsg9j3i9gxVpKreMGRy1N/GZBv+2oBTpkQafzAzhlHxZaaCxuFA5I1e5CcAUUWzU0x6Nm
	dkTdx547Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOcyg-00EOHe-3U; Tue, 23 Mar 2021 09:05:30 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOcyS-00EOEs-C7
 for linux-mediatek@lists.infradead.org; Tue, 23 Mar 2021 09:05:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id e14so7595975ejz.11
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Mar 2021 02:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NaxMk1X4JgQvNguaXzrkddVGWdXTSwTVvMkeeopGQCc=;
 b=EkcarqZKUy0ymiF4kWv0Lkwrc9OXZEDWInUH5Be+lbkNWzuZ0bH1/rBhCpRwLiqTdt
 rBd/jZXsSc+/gr0W5vVDjKeAbBiJNnqL4d8FVLGBZgt06UhuthKl3hoG91vBLikuJLNs
 4XHZBPrXItBGRVsuFFU+Aay2UuLxvNpfwAp+UJOTSQ35dL31Q2B9wQ2HZT8KRflMEb7C
 pXRPGCU0Nclm8CvMHG0ni3P5qwx4l1n1LIqBhgxjANlEzftOTvwqxahdOlKmHDfAvEyg
 qLjBEZ5ypgC1Nmdp+HiBhrAcllw0tq/I+5iHIj2uYWO+CKOFFc2s9MXEMg7ZkLbOmQms
 BM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NaxMk1X4JgQvNguaXzrkddVGWdXTSwTVvMkeeopGQCc=;
 b=gn7f35KQr0yr+8VlnK20mp3dCoJxxHlb+NDUzdrFjIf/Eo7gyY6MMp1Lr0Ed741Ow3
 cG2NV0PRpghn/rBElERFj4H9UOrm2WjRqbD3ktZw7spgJy75vGxk8gMjgGZFpYE0CnkH
 vVWOz8mLR4RGZMoV/LjKdpqx66Hk2FjndmPlsSYQ1dIsICSnOt9CiX3DQJzBLCwgUVhQ
 VkCpMEIagMrrOGoWezfTsL6gIjnIG+aCamM3XslARZArrvi8I6/G5F9WQ5yUDVYyRmWm
 TrOat6rowpqE11jlGLXp6WBzLHZfJIGPntdjXDShFmAFwvB8L9T7wcta0K1+YfDK3M3T
 61PQ==
X-Gm-Message-State: AOAM532ZiqvGtBfgxl9I3fwDDFMl/Bu9RLme9o/bkxvqlPuxJV2bkgHu
 pVuiDVdxT89yhRBM1Ru6Zx2wqg==
X-Google-Smtp-Source: ABdhPJzVzXe2FBZymosCx+Rjdu4KKVi7Zq3N3gYPqVzkCfVULSYBS8mOmRdLM8ry58+y1DxBB4xE/w==
X-Received: by 2002:a17:907:720a:: with SMTP id
 dr10mr3843386ejc.375.1616490315603; 
 Tue, 23 Mar 2021 02:05:15 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id be27sm12873864edb.47.2021.03.23.02.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:05:15 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:05:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 3/7] mfd: mt6397: Drop of_compatible for regulator
Message-ID: <20210323090513.GJ2916463@dell>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
 <20210312145545.26050-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312145545.26050-3-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_090516_698145_28EB696B 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAxMiBNYXIgMjAyMSwgbWF0dGhpYXMuYmdnQGtlcm5lbC5vcmcgd3JvdGU6Cgo+IEZy
b206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+IAo+IEZvciByZWd1bGF0
b3JzIGEgY29tcGF0aWJsZSBzdHJpbmcgaXMgc3VwZXJmbHVvdXMuIERyb3AgdGhlIHN0cmluZy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAt
IERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
