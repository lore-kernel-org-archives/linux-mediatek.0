Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A857C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 07:37:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A782065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 07:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TsXHIM4I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2XwS2bD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A782065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGc6xcvUH3pXmBOaV82V9XU7hyXAmyT8Izo4jlxLjl8=; b=TsXHIM4I2/bo4r
	emP0qrzpp6X3xGb2UvQksKthsS2duqnwIPYArV9AKgd4MGNuOHZq2m6HZAy/9JTQqXp9pSSwSGdPT
	Utaom647yNgDByjmjKWzSBgLCFxMgf0Hia0mFy3PP2Z2z4cZIKKQQRo1cLS5OTT8jwwroRFUp3CmM
	QEMhyvT52ogVL9628rn+szmO/yJbARQPf3qhHfX1h/shi/L7XivAdnRlCQhMUfYzZphR0ecLbkcoB
	AZaHL7+5MxYENgQQjTcy2uiTJUNIfQl1YsfTaqC8AXszM7SUk750/U9ucOw+d7UWfV/wewFpwxjWY
	63ciNsn+C9cvyp5dgdHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc2FN-0005Kj-6O; Fri, 22 May 2020 07:37:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc2FD-0005CY-D1
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 07:37:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id h4so7741313wmb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 00:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FxhyYotOdsb3Prsxlw/PCmLh9cDfCT3MjS19m7K8Q5o=;
 b=s2XwS2bDg3iy2QFTSYYUp2zSt1XfNkCltyHI70cuooryTjTrmQxbyoYtC7EKyK4J/A
 CMELJ8ZUfGTSxOg6AYlN57glArOF+Ly3LjBs501uqsGcZR+l5Ibxqj5DBoVL8XlApo+b
 atG2eMn0WIvN4x1PzdTxcIHXw7mmI8zyZgEqdH4lRMCpbTWYzhSglv9A05yWl0+Rvm4o
 a1TeQChSuAktfp1bMBydXDruT0T7jEQlllRF0IEpKC1x+j4OCj2MCcDtMbvOQOrfVMww
 V3l5bx0/GQmy7oWXfKlljrEXIicKaJzqGjj0q/1VOv2DQAj2EGtyTx5RDElE8IrTsPbQ
 hSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FxhyYotOdsb3Prsxlw/PCmLh9cDfCT3MjS19m7K8Q5o=;
 b=eIWxRYkGLu2RYSGiqPMD0QPfEAf1f930XvnFmMj6S4ph5Ku8nDiMbGebjPM9nvthtZ
 5o2ihKz1UAfnL7Kf0jXGqcAWVG0HynWDwcxwMlViamh98XxyVromimZxuXJf92eS4ERK
 nWRR1g4gkAqkAox/7De05BPeLsnAcpOVEl6xEvqmzfgAvLTYrGlxjNHtgZDMNQiLS1aH
 yIIA4VUfO7/46eIiFecfKbJncvp5PpNd6W8X0FK9CWnyBArLvob+joVnnHqvzf+nIjbm
 rEJh0tU4+XvBCXz8B/5pAqbO97TiBZydpjl441vVlxdh0J07XkrWd+nPKVop1dyXmvfk
 4f2w==
X-Gm-Message-State: AOAM531dndRSlEbVJ7rZwxy5SLxx1C3B2R6z6P9tEYs5KC1tkfczr0kR
 IfYsPAeeWJZpinFqkRwPvdxHHA==
X-Google-Smtp-Source: ABdhPJxs2hJYnfDm6N4+o9/p+SF/UJ8IDcPxC+ZnYoNz7e9Bj+uhDyIZoQpHZd769I0Jckb0UavO0Q==
X-Received: by 2002:a1c:6042:: with SMTP id u63mr12028802wmb.65.1590133045474; 
 Fri, 22 May 2020 00:37:25 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id l19sm9221775wmj.14.2020.05.22.00.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:37:24 -0700 (PDT)
Date: Fri, 22 May 2020 08:37:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add MT6397 Pin Controller
Message-ID: <20200522073722.GP271301@dell>
References: <20200110145952.9720-1-matthias.bgg@kernel.org>
 <20200115151938.GA8182@bogus>
 <ce3747e5-41db-a168-0602-37337d8530f2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce3747e5-41db-a168-0602-37337d8530f2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_003727_435742_3FE2AE10 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMSBNYXkgMjAyMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKCj4gSGkgTGVlLAo+
IAo+IE9uIDE1LzAxLzIwMjAgMTY6MTksIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gT24gRnJpLCAx
MCBKYW4gMjAyMCAxNTo1OTo1MSArMDEwMCwgbWF0dGhpYXMuYmdnQGtlcm5lbC5vcmcgd3JvdGU6
Cj4gPj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiA+
Pgo+ID4+IFRoZSBNVDYzOTcgbWZkIGluY2x1ZGVzIGEgcGluIGNvbnRyb2xsZXIuIEFkZCBiaW5k
aW5nCj4gPj4gYSBkZXNjcmlwdGlvbiBmb3IgaXQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+ID4+Cj4gPj4gLS0tCj4g
Pj4KPiA+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9tdDYzOTcudHh0
IHwgNSArKysrKwo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPj4KPiA+
IAo+ID4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAKPiAKPiBJ
dCBsb29rcyBsaWtlIHRoaXMgZmFsbCB0aHJvdWdoIHRoZSBjcmFja3MuCj4gV291bGQgeW91IGNv
bnNpZGVyIHRvIHF1ZXVlIGl0IG9yIGRvIHlvdSBoYXZlIGZ1cnRoZXIgY29tbWVudHM/CgpUaGVy
ZSBpcyBhIGN1cnJlbnQgaXNzdWUgd2hlcmUgUm9iIGFuZCBJIGFyZSBib3RoIHRha2luZyBwYXRj
aGVzLgpTb21ldGltZXMgd2UgYm90aCBhc3N1bWUgdGhlIG90aGVyIHdpbGwgdGFrZSB0aGUgcGF0
Y2guCgpBcG9sb2dpZXMuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNl
cyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
