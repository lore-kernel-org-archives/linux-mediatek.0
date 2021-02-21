Return-Path: <SRS0=8HwV=HX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C782C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Feb 2021 19:29:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C805164DDA
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Feb 2021 19:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C805164DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tlvdYpeWBESxwtnFUoTk6SE2SarqHR6f/Gu0dH2+1gc=; b=1YEXVBXgMVvr9WzJZoxvQiI9O
	2Wja/fHZYa+qQ8xMbEopGKJ5m20LgzCmcVjt7luE0YHgEa2KQqc8C9vBd1UX/XpAQSy8DlUVWF2xf
	SumYINT404ko2xSOxb6d5soqg729GyIe5frX/K91gWkY0ae8BkDtqFiGgqRfzLP5/rDopPFnc5cQd
	UN/QwP69wT3SpC9OBJam78kxceKiwGwWF18AiXLsPo8kAoiOP0HGYyyGS4RVRF11rpPbuX2ozAE9x
	JCuIrgb6cBmy8J4NxnI485FgyjLhluriO286R0pmzeyszyoeYSAzNEVjpk7G8CS2k/heOP/fmHXUa
	aOL2x6PVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDuPm-0005AX-Br; Sun, 21 Feb 2021 19:29:10 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDuPk-0005AE-1H
 for linux-mediatek@lists.infradead.org; Sun, 21 Feb 2021 19:29:09 +0000
Received: by mail-lj1-f170.google.com with SMTP id c8so51961196ljd.12
 for <linux-mediatek@lists.infradead.org>; Sun, 21 Feb 2021 11:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SQFiq6DDN/SxkW/ohlkqHphfIUHTGypAJ815v4LoWb0=;
 b=uCVkTSXlwCYJ5bcQNAtjdgd7bBtrMs09Q2k74vuNJFGP82G/6OYbMxet/t1B/MA9Zv
 6pBKyQ+CqA/KeEwsxyZnrBu7HimH6o4oizrRNmOj4KSDSAyjioDnChwphEpDwX3PX+5g
 38Nhn/0TR/JRwHDUTk4bwZOD51lT8+b3neCR/aSabUm8PUKQUxxr/7YBs4l+s/EbWKWg
 t88JntkgS+5/kyCYbAzJwj0qcHZcuNAM5dAsBAA2xNbrqRZTSdCO7cZApA6oUi8DtcKx
 qGoSDA+99T84DVW9NNYKYWeH018fYi6bNCrF4R/XQxyNkOcykU1aLxhnghSxWrvuuBsQ
 cOnA==
X-Gm-Message-State: AOAM532/+p5cceDdDqcsg4jJ0vN/ltVOMy5jeGoaozfFGQUFXLjg+m1n
 UDSKYGmjuNm40OR08kxCRbQ=
X-Google-Smtp-Source: ABdhPJzEbbeu0fbOev1XlPyOYD2DYPIjQcoys0e400+VdE5MQpJrqN14HwH/8s7yvbBL3objVQrxPA==
X-Received: by 2002:a05:651c:110c:: with SMTP id
 d12mr11837357ljo.350.1613935744971; 
 Sun, 21 Feb 2021 11:29:04 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id 74sm1649404lfo.268.2021.02.21.11.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 11:29:04 -0800 (PST)
Date: Sun, 21 Feb 2021 20:29:02 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v3] PCI: mediatek: Configure FC and FTS for functions
 other than 0
Message-ID: <YDK0fr/UiKjit+ty@rocinante>
References: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_142908_111269_E8CF8B37 
X-CRM114-Status: UNSURE (   6.08  )
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
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WytjYyBMb3JlbnpvIGZvciB2aXNpYmxpdHldCgpIaSwKClRoYW5rIHlvdSBmb3IgdGFraW5nIGNh
cmUgb2YgdGhpcyEKClsuLi5dCj4gUENJX0ZVTkMocG9ydC0+c2xvdCA8PCAzKSIgaXMgYWx3YXlz
IDAsIHNvIHByZXZpb3VzbHkKPiBtdGtfcGNpZV9zdGFydHVwX3BvcnQoKSBvbmx5IGNvbmZpZ3Vy
ZWQgRkMgY3JlZGl0cyBhbmQgRlRzIGZvcgo+IGZ1bmN0aW9uIDAuClsuLi5dCgpBIHNtYWxsIG5p
dC4gIFRoZSBjb21taXQgbWVzc2FnZSBpcyBtaXNzaW5nIHRoZSBvcGVuaW5nIHF1b3RlLCBzZWUK
Qmpvcm4ncyBzdWdnZXN0aW9uOgoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kv
MjAyMDExMDQxMzEwNTQuR0EzMDc5ODRAYmpvcm4tUHJlY2lzaW9uLTU1MjAvCgpCdXQsIGl0J3Mg
cHJvYmFibHkgbm90IHdvcnRoIHNlbmRpbmcgYW5vdGhlciBwYXRjaCwgYW5kIHBlcmhhcHMgZWl0
aGVyCkJqb3JuIG9yIExvcmVuem8gY291bGQgZml4IHRoaXMgd2hlbiBhcHBseWluZyBjaGFuZ2Vz
LgoKUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBXaWxjennFhHNraSA8a3dAbGludXguY29tPgoKS3J6
eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
