Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E964C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 23:39:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18FFA2223C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 23:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b4XIprbK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVq2Wnrl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18FFA2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f6ZnjstJrC159KgTme8tbjdNr0cNPes+vJzCSbG6VnI=; b=b4XIprbKPqvLeMS0GpGQFVx+j
	/dY/WvkNNNPrPMTWuc/rGQXh9/x7FapDBz9p6VL8b5+aj0/tOVMZJ77Xlx8WAHjnrZp3yWAMVUA7H
	Hnmo+5z8LxLkiQTRYZUQ9TLrieDK6oAA5Ec8xNTNBs3rA0ZytXrrjMttp6nRPNzW+gne08I9ERnSX
	euyiJA6R0+UbLMZJlBETxba7Z1bjkEypl+8n5T1bdTploGpgX6dzAf2Z8ctv3z1xCfC0Kc0nEUnVK
	5nS0QCqtzikV4XWJsRE4X/T1XA+dazm36fLoJd6R0GGLBuZXPXZ/4meWhRhJ69VXiINkoQmny9rxp
	Jp7bDmZsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXYYH-0004CM-Re; Tue, 27 Oct 2020 23:38:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXYYE-0004BZ-1L; Tue, 27 Oct 2020 23:38:51 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 239BF2225E;
 Tue, 27 Oct 2020 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603841928;
 bh=DSTkC5KLEySxuOgJIXhx4r8CGCV8SZykJdCrHvPLS3w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kVq2WnrlZADRQR5lW2fEQA21p3jZ4zfdjjAewDx6TaV11LG1oJ1UBLd6ycgO9v/Y7
 GmvgcWm1gVVG1cvRVNvA9ytm/DHZZ+gssbXRPpgN/a91D144X8OIzC6BBivcYgW7QY
 gaAxCZyBMIPPo0IZ6HTclLnL9Pid/dFsSg1o9vF8=
Received: by mail-ej1-f47.google.com with SMTP id t25so4622316ejd.13;
 Tue, 27 Oct 2020 16:38:48 -0700 (PDT)
X-Gm-Message-State: AOAM531YrfdKyJHBFqM+lIA1pog1Wz8pRapXQL2M7/hMBYGF10dpSl50
 rdErLfudcXNzW65iCWS/N/yThWA4ED4olxUhAA==
X-Google-Smtp-Source: ABdhPJzQlEglkYa6D7ubjNdMCkkeNzxjD0WQcilxpNfNSAd06/sNj6pyDK/JItntgOHe0L6l5haqvTeZePZHZvUPb9w=
X-Received: by 2002:a17:906:3b8e:: with SMTP id
 u14mr4751527ejf.127.1603841926757; 
 Tue, 27 Oct 2020 16:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201027160631.608503-1-fparent@baylibre.com>
In-Reply-To: <20201027160631.608503-1-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 28 Oct 2020 07:38:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9eBU06WGKcB61OzXYOgOOQY+45MQba9ELAZAi7rDGj6A@mail.gmail.com>
Message-ID: <CAAOTY_9eBU06WGKcB61OzXYOgOOQY+45MQba9ELAZAi7rDGj6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mmsys: add mt1867 binding
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_193850_194801_A35FCA81 
X-CRM114-Status: GOOD (  17.63  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjjml6Ug6YCx5LiJIOS4iuWNiDEyOjA35a+r6YGT77yaCj4KPiBBZGQgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciBNVDgxNjcgU29DLgo+CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CgoKPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4g
UGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnR4dCAgICAgICAgICB8IDEgKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWss
bW1zeXMudHh0Cj4gaW5kZXggZDhjOTEwOGMzYjRhLi43OGM1MDczMzk4NWMgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRl
ayxtbXN5cy50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnR4dAo+IEBAIC0xMyw2ICsxMyw3IEBAIFJlcXVpcmVk
IFByb3BlcnRpZXM6Cj4gICAgICAgICAtICJtZWRpYXRlayxtdDY3NzktbW1zeXMiLCAic3lzY29u
Igo+ICAgICAgICAgLSAibWVkaWF0ZWssbXQ2Nzk3LW1tc3lzIiwgInN5c2NvbiIKPiAgICAgICAg
IC0gIm1lZGlhdGVrLG10NzYyMy1tbXN5cyIsICJtZWRpYXRlayxtdDI3MDEtbW1zeXMiLCAic3lz
Y29uIgo+ICsgICAgICAgLSAibWVkaWF0ZWssbXQ4MTY3LW1tc3lzIiwgInN5c2NvbiIKPiAgICAg
ICAgIC0gIm1lZGlhdGVrLG10ODE3My1tbXN5cyIsICJzeXNjb24iCj4gICAgICAgICAtICJtZWRp
YXRlayxtdDgxODMtbW1zeXMiLCAic3lzY29uIgo+ICAtICNjbG9jay1jZWxsczogTXVzdCBiZSAx
Cj4gLS0KPiAyLjI4LjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
