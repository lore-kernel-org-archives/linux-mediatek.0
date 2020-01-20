Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF4C33CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 08:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920D9207E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 08:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g9O999yL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="musV59sR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 920D9207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eudpA4ambjQQKWQjgspltSllRCG7lrUEL6LHI0EZXfw=; b=g9O999yLqIBsWK
	RIPGL4EVAcm9yQ39G3TeZJljlHvPBipMBmWasM5kYCQifHYvCqLzT8jnGklOLLWnNF5ze38UgRztZ
	b1z8iuRK7RkJhlyz+pSrhCB7NgQ/KMrRhl7N09q2PbFd9tBlMShDmPk7OsusTkfOVTj4+vjwW/DPt
	t3vzmv+0Gh/lxxgTfoTxfnxeHFfbAVcMgxWCFJ+faGR2fwswMaupJZf15/zJ59Hnn6oufsgP3xBPr
	FDfRtyS4RwNcWN6qK5bGT9YMJ8PfonxWOWDwpBk360MOIcLi2ZnG1FAm7MlzFDNIygFPkrF/qYxVo
	UmKTYXwU+J7CnIj8GkBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itSew-0000Wh-Tw; Mon, 20 Jan 2020 08:43:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itSer-0000VE-4o
 for linux-mediatek@lists.infradead.org; Mon, 20 Jan 2020 08:43:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id j42so28503192wrj.12
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2020 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=gifHuIbCmX+R9NDRnITZu82J8BFsOQKVLbmsTjc0e3M=;
 b=musV59sR94nIPfcgLIQtZwLs7/Yv/sT8+U7PToHVQCNBIcL9rnHYPKzK/o72OFGbox
 jC5rDARSf8dVbjGdy1UbybpHRvHUWMVEnAJWJfY/VzyoM70ysvSBCWqNMlraAkrJ8eGO
 UFcbGHGVg2C7GbWXAWgdzcBbK80kqSgtqMC9mfwfNsUffbNzqADCqCqSn9oHEnxXyk2n
 PxwYRMqYfoafCx/frJnKYxhPj/KO5Gwc3r4Jg9XBiSpOfSupaGCRbAYKNcSs1kmUiGUD
 yuAit4UfcbMIbIdFYnIZfY59dbcgkaoQKR1W+VD8uNGNVebbWne7xwRuhiywuw78zJNQ
 S+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gifHuIbCmX+R9NDRnITZu82J8BFsOQKVLbmsTjc0e3M=;
 b=k8N/YcpaHCeiX3YgOosbf4vwCGo1M2ckgATt2QI7RW7TqpxUHPZ65MxM/yemFF9lQ/
 kokcyEJfsW5bS2lxciROOKMl7dAo0oB5uRnTcByDdffZk7tLOvL6/as/eJfWJVOE5wcv
 cksecQOmIivBD0hOPI5fNCR3PZdtfFW1YK2Myz5ATz2IndwO2wTZL7rmIl/RTt1NXcW+
 dRURprLzXhcm+rzD9SV8PZBm+s+g3E8VMHSdBScf9+SxZ539ziahMhrDRlfALL5lKCD7
 lOEezWP1Ub0KvmAZwNA0Lo8J2AI+ZviSQinTBmwwf7qxijb3j/RX87CSvggV0xywD6hT
 MoRA==
X-Gm-Message-State: APjAAAV6YOKleFzWPpLHpAG+NQW0bRXFSssdPji0my/j+D1ZtTVVCHMg
 j3lzxHhh8yCoxsEyeq6Lf4hFCw==
X-Google-Smtp-Source: APXvYqy+rWDfjjYcUJ9qyGjk1MjXcoc+KJXJZXfExAHNyyprH+X8jUuldYdSqr6JOsriaYepWzKiNA==
X-Received: by 2002:adf:df03:: with SMTP id y3mr17198094wrl.260.1579509819402; 
 Mon, 20 Jan 2020 00:43:39 -0800 (PST)
Received: from dell ([2.27.35.227])
 by smtp.gmail.com with ESMTPSA id n16sm47472001wro.88.2020.01.20.00.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 00:43:38 -0800 (PST)
Date: Mon, 20 Jan 2020 08:43:55 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Wen Su <Wen.Su@mediatek.com>
Subject: Re: [RESEND 1/4] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20200120084355.GW15507@dell>
References: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
 <1579506450-21830-2-git-send-email-Wen.Su@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579506450-21830-2-git-send-email-Wen.Su@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_004341_217501_93F0E405 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMCBKYW4gMjAyMCwgV2VuIFN1IHdyb3RlOgoKPiBGcm9tOiBXZW4gU3UgPHdlbi5z
dUBtZWRpYXRlay5jb20+Cj4gCj4gYWRkIGR0LWJpbmRpbmcgZG9jdW1lbnQgZm9yIE1lZGlhVGVr
IE1UNjM1OSBQTUlDCj4gCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogV2VuIFN1IDx3ZW4uc3VAbWVkaWF0ZWsuY29tPgoKVGhlc2Ug
YXJlIGluIHRoZSB3cm9uZyBvcmRlci4gIFRhZ3Mgc2hvdWxkIGRlc2NyaWJlIGhpc3RvcnksIHRo
dXMKc2hvdWxkIGJlIGluIGNocm9ub2xvZ2ljYWwgb3JkZXIuICBGb3IgaW5zdGFuY2UsIHRoZSBv
cmRlcmluZyB5b3UgdXNlZApkZXNjcmliZXMgUm9iIHJldmlld2luZyB0aGUgcGF0Y2ggKmJlZm9y
ZSogeW91IHNlbnQgaXQsIHdoaWNoIGlzIG5vdApwb3NzaWJsZS4KCj4gLS0tCj4gIC4uLi9iaW5k
aW5ncy9yZWd1bGF0b3IvbXQ2MzU5LXJlZ3VsYXRvci50eHQgICAgICAgIHwgNTkgKysrKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRv
ci9tdDYzNTktcmVndWxhdG9yLnR4dAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8g
U2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
