Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86518C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 23:53:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29775619D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 23:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29775619D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DjfWI4byQJ+9XIaRRScTybuMoQeQEE7yp1/+Jl31jdQ=; b=NOLHzwhjGsIvCeeig4ghfgpmp
	63qJ4Pmkxe24icacY4ViPRYOPjW43f28R7d9PH8cmX5H8OkeFxYzEf5rP75NHBOTJbZBUmB94d2Vt
	XwCD0+mOkqOQkZA028av5T/VQHJyUINVfFCz8zzwiFSDa4lgjzvYJgKDmrtyIDxMeZEsNTdbXdTye
	oBm/WgsPtP6i2lDj32F/XaxYqp9vZ7Wj7r8y4i5IoxaALTNFvtqx+250VDlsoc1W6rtMKkhM+2lwJ
	5LXEjCQ8qMTWlnygp3uNk7r3y0v8pYY5mGAScx7wrVaLpwpw1gBd43p0EuRFpsnFyiD+rtQu6W2N5
	6f9gWoidQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPwGq-004XOj-It; Fri, 26 Mar 2021 23:53:43 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPwGl-004XOP-KW
 for linux-mediatek@lists.infradead.org; Fri, 26 Mar 2021 23:53:37 +0000
Received: by mail-lj1-f175.google.com with SMTP id f16so9287948ljm.1
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Mar 2021 16:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=klEY6MAuaf1tQSTVwnzoetEJxHTL/+NzhZHmVVkbjzc=;
 b=s0MFV2ywyc/t8askk7kLXdvakobbEJoVHOmhD28amKs8NCsmTGpQeM6AYoTHx2m2i3
 VdqtwJZJvVTElrWVy2Ni0+wu3DsoBy1FLgsIjKzf+ttFxEKsVAMILiwPPiuWpyWeKT0M
 K7fbBzuhe0Pv8ph9ADZpb5PTKdWbPutAraCOMyigE/d1l+SKPivHbbOA2YwLOLjC03n6
 R4u2mavDquzcNmfg9ZTyARakIRvBf1cbTmw5CK80dlMk4KKYLGLZNui67KSFvLiTiBwH
 2CKqi55PVXUFTFmWSPjE5NRcdItbHrlakE16wU+BmYlmVsn9CbSY+43oJsPYq4FEMj1I
 BPeg==
X-Gm-Message-State: AOAM532OnLvI6l5yo7vctNbPyj/v2ndYnompKP3qFbZq9N8oCSDfKVJS
 i0uULdwrQ70/8YNRwdKVGAo=
X-Google-Smtp-Source: ABdhPJztF391GdFpc7uqifsXjc+5QIKMehK72VLylGMRXxzdbwwfFNhplqnoMIcK4CogTKVKXOEJSA==
X-Received: by 2002:a05:651c:289:: with SMTP id
 b9mr3874733ljo.400.1616802814755; 
 Fri, 26 Mar 2021 16:53:34 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id d4sm1017147lfs.45.2021.03.26.16.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 16:53:34 -0700 (PDT)
Date: Sat, 27 Mar 2021 00:53:32 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] PCI: mediatek: Configure FC and FTS for functions
 other than 0
Message-ID: <YF5z/LFisXr3b5yi@rocinante>
References: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
 <YDK0fr/UiKjit+ty@rocinante>
 <20210326155104.GA8190@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326155104.GA8190@e121166-lin.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_235335_915374_B88DF8A9 
X-CRM114-Status: UNSURE (   9.31  )
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

SGkgTG9yZW56bywKClsuLi5dCj4gPiBBIHNtYWxsIG5pdC4gIFRoZSBjb21taXQgbWVzc2FnZSBp
cyBtaXNzaW5nIHRoZSBvcGVuaW5nIHF1b3RlLCBzZWUKPiA+IEJqb3JuJ3Mgc3VnZ2VzdGlvbjoK
PiA+IAo+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyMDExMDQxMzEw
NTQuR0EzMDc5ODRAYmpvcm4tUHJlY2lzaW9uLTU1MjAvCj4gPiAKPiA+IEJ1dCwgaXQncyBwcm9i
YWJseSBub3Qgd29ydGggc2VuZGluZyBhbm90aGVyIHBhdGNoLCBhbmQgcGVyaGFwcyBlaXRoZXIK
PiA+IEJqb3JuIG9yIExvcmVuem8gY291bGQgZml4IHRoaXMgd2hlbiBhcHBseWluZyBjaGFuZ2Vz
Lgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5j
b20+Cj4gCj4gVGhhbmtzLCBJIHdpbGwgZG8uIENhbiBJIGFwcGx5IGl0IG9yIHRoZXJlIGFyZSBz
dGlsbCBwZW5kaW5nIHJldmlldwo+IGNvbW1lbnRzIHRvIGFkZHJlc3MgPwoKTm90aGluZyBmcm9t
IG1lLCBzbyBpdCdzIGdvb2QgdG8gZ28sIEknZCBzYXkuICBUaGFuayB5b3UhCgpLcnp5c3p0b2YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
