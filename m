Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8581C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:07:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A65E820738
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3fqkbzx6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2rzrcC1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A65E820738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OfiE/nmLk2N4TphJbKqihEmGMTEkQwP2eaEpg5+8f3Q=; b=3fqkbzx6+kRvw+Clsqtx+uDx3
	beECdk8Nlic/jn6d3mMouhuDefsjvJgpbT6r+xCRL6Wq6yewBbJWo5/P6BHaSfZNehw3qwv9jF0QS
	qjW/u6g+O3F6eJu+JJvUTckGrkzKINIr8AYHk6Uc0lk+q4NhYJXx8V6bgSF1PzHxD7/lSexFsyTq6
	wF9eC4WRbjZG3pPUXTLCmz8Kgt/26Q1MIV+Qa5HRxcwhQ+46TeHR3LUunzYrhcCZY0UhBZbjoXO/E
	4RLQroj+UkwVfNHVpOQATf3HiXn8Chbq+pZXe6hGKikqcnZKblgD1gdGoGk5yEw8ixg14p35CJAxz
	oGW7f4atA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo7v8-0007y0-Hu; Wed, 24 Jun 2020 16:06:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo7v6-0007w7-5C; Wed, 24 Jun 2020 16:06:41 +0000
Received: by mail-wm1-x344.google.com with SMTP id o2so3054882wmh.2;
 Wed, 24 Jun 2020 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N5fl5/sMZxwAr7ptc9+M4Sr+AByefpkVY5hVcBVQQ/k=;
 b=c2rzrcC1s/RvV0v6BauZL5SgifsfzraAm6dKbwwVmpzxQX4AEpCnmWIyRQjVyJ0BxY
 VwAF1gysQzcY6viTFWKNd5ER+wald/A+oDJmThbanQzzZTMkP8Syhpwrt+cK1I8evkBw
 vKEUtxcqdx/YAs6AfAz1YMl1W6EjqZaigjKox7N0hT1oe61tpTl1rIpLMJbIlywMUA6y
 r9Iqdiq9bK+9J6sjSGr1PFWW6C7ipYzc5btYktjX9GjMxMJrTiHGA4nrljYift0Cb5wn
 Lo9oppL/ubGVr1CRnyh4GbMhJctzp8q5jjRO/KLV5NGB/8uatOUPDVDfTmK6h+fUbnK4
 JiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N5fl5/sMZxwAr7ptc9+M4Sr+AByefpkVY5hVcBVQQ/k=;
 b=DOx/NrZJmp/RVpUNsJIzTdHoJGWB4HaSPjGJXmpc2wwGM0H+xqmhYFluZZAImGsmhO
 GpMHr1sDIe4x+Cezmsb7BIv2mqbLnskcaLhMe9Z7C/5FqEJooZzz+uJDFdWBCkDR3get
 XeZ26Ur7dJ31OJlNTmILvpzTbnogAshEDqghrxK659OrlVdKgNqeR3GJSQHVFsCkLh4V
 RwF7+GJbq4tbgZEgwiX5zze2PFyQffYxOqCIWBzkpNgx7awIernvhzQ6ZvneDDJUMtps
 W8bxoIuaqXFHqA3LUkQtunNvwov7kJQjoKZ7z6CkxUGm1a3Vbmzkdh8ht1pJ1eV3q6Cw
 uzcQ==
X-Gm-Message-State: AOAM530iX08kU2IK4r9Epnme3/QwhuVp2ebINJsatGhp5wJpdECyh7Ss
 g8ZtVkBCqOmiHQmROkBefcU=
X-Google-Smtp-Source: ABdhPJwWIG0y9eC4lbkgJBhmydeFIya8dS7IrcbvZPWjmmIvUtHTKwrtZj6sEnp2a6behlqd9ZQbOQ==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr16491624wme.184.1593014797129; 
 Wed, 24 Jun 2020 09:06:37 -0700 (PDT)
Received: from [10.230.189.192] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id f14sm10446689wro.90.2020.06.24.09.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 09:06:36 -0700 (PDT)
Subject: Re: [PATCH 09/15] net: phy: delay PHY driver probe until PHY
 registration
To: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-10-brgl@bgdev.pl> <20200622133940.GL338481@lunn.ch>
 <20200622135106.GK4560@sirena.org.uk>
 <dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com>
 <20200624094302.GA5472@sirena.org.uk>
 <CAMRc=McBxJdujCyjQF3NA=bCWHF1dx8xJ1Nc2snmqukvJ_VyoQ@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f806586d-a6d7-99af-bba4-d1e7d28be192@gmail.com>
Date: Wed, 24 Jun 2020 09:06:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=McBxJdujCyjQF3NA=bCWHF1dx8xJ1Nc2snmqukvJ_VyoQ@mail.gmail.com>
Content-Language: en-US
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree <devicetree@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Salil Mehta <salil.mehta@huawei.com>, netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiA2LzI0LzIwMjAgNjo0OCBBTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiDFm3Iu
LCAyNCBjemUgMjAyMCBvIDExOjQzIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gbmFw
aXNhxYIoYSk6Cj4+Cj4+IE9uIFR1ZSwgSnVuIDIzLCAyMDIwIGF0IDEyOjQ5OjE1UE0gLTA3MDAs
IEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4+PiBPbiA2LzIyLzIwIDY6NTEgQU0sIE1hcmsgQnJv
d24gd3JvdGU6Cj4+Cj4+Pj4gSWYgdGhlIGJ1cyBpbmNsdWRlcyBwb3dlciBtYW5hZ2VtZW50IGZv
ciB0aGUgZGV2aWNlcyBvbiB0aGUgYnVzIHRoZQo+Pj4+IGNvbnRyb2xsZXIgaXMgZ2VuZXJhbGx5
IHJlc3BvbnNpYmxlIGZvciB0aGF0IHJhdGhlciB0aGFuIHRoZSBkZXZpY2VzLAo+Pj4+IHRoZSBk
ZXZpY2VzIGFjY2VzcyB0aGlzIHZpYSBmYWNpbGl0aWVzIHByb3ZpZGVkIGJ5IHRoZSBidXMgaWYg
bmVlZGVkLgo+Pj4+IElmIHRoZSBkZXZpY2UgaXMgZW51bWVyYXRlZCBieSBmaXJtd2FyZSBwcmlv
ciB0byBiZWluZyBwaHlzaWNhbGx5Cj4+Pj4gZW51bWVyYWJsZSB0aGVuIHRoZSBidXMgd2lsbCBn
ZW5lcmFsbHkgaW5zdGFudGlhdGUgdGhlIGRldmljZSBtb2RlbAo+Pj4+IGRldmljZSBhbmQgdGhl
biBhcnJhbmdlIHRvIHdhaXQgZm9yIHRoZSBwaHlzaWNhbCBkZXZpY2UgdG8gYXBwZWFyIGFuZAo+
Pj4+IGdldCBqb2luZWQgdXAgd2l0aCB0aGUgZGV2aWNlIG1vZGVsIGRldmljZSwgdHlwaWNhbGx5
IGluIHN1Y2ggc2l0dWF0aW9ucwo+Pj4+IHRoZSBwaHlzaWNhbCBkZXZpY2UgbWlnaHQgYXBwZWFy
IGFuZCBkaXNhcHBlYXIgZHluYW1pY2FsbHkgYXQgcnVudGltZQo+Pj4+IGJhc2VkIG9uIHdoYXQg
dGhlIGRyaXZlciBpcyBkb2luZyBhbnl3YXkuCj4+Cj4+PiBJbiBwcmVtaXNlIHRoZXJlIGlzIG5v
dGhpbmcgdGhhdCBwcmV2ZW50cyB0aGUgTURJTyBidXMgZnJvbSB0YWtpbmcgY2FyZQo+Pj4gb2Yg
dGhlIHJlZ3VsYXRvcnMsIHJlc2V0cywgcHJpb3IgdG8gcHJvYmluZyB0aGUgUEhZIGRyaXZlciwg
d2hhdCBpcwo+Pj4gY29tcGxpY2F0ZWQgaGVyZSBpcyB0aGF0IHdlIGRvIG5lZWQgdG8gaXNzdWUg
YSByZWFkIG9mIHRoZSBhY3R1YWwgUEhZIHRvCj4+PiBrbm93IGl0cyAzMi1iaXQgdW5pcXVlIGlk
ZW50aWZpZXIgYW5kIG1hdGNoIGl0IHdpdGggYW4gYXBwcm9wcmlhdGUKPj4+IGRyaXZlci4gVGhl
IHdheSB0aGF0IHdlIGhhdmUgd29ya2VkIGFyb3VuZCB0aGlzIHdpdGggaWYgeW91IGRvIG5vdCB3
aXNoCj4+PiBzdWNoIGEgaGFyZHdhcmUgYWNjZXNzIHRvIGJlIG1hZGUsIGlzIHRvIHByb3ZpZGUg
YW4gRXRoZXJuZXQgUEhZIG5vZGUKPj4+IGNvbXBhdGlibGUgc3RyaW5nIHRoYXQgZW5jb2RlcyB0
aGF0IDMyLWJpdCBPVUkgZGlyZWN0bHkuIEluIHByZW1pc2UgdGhlCj4+PiBzYW1lIGNoYWxsZW5n
ZXMgZXhpc3Qgd2l0aCBQQ0kgZGV2aWNlcy9lbmRwb2ludHMgYXMgd2VsbCBhcyBVU0IsIHdvdWxk
Cj4+PiB0aGV5IGhhdmUgcmVzZXQgb3IgcmVndWxhdG9yIHR5cGljYWxseSBhdHRhY2hlZCB0byB0
aGVtLgo+Pgo+PiBUaGF0IGFsbCBzb3VuZHMgdmVyeSBub3JtYWwgYW5kIGlzIGNvdmVyZWQgYnkg
Ym90aCBjYXNlcyBJIGRlc2NyaWJlPwo+Pgo+Pj4+IFdlIGNvdWxkIHVzZSBhIHByZS1wcm9iZSBz
dGFnZSBpbiB0aGUgZGV2aWNlIG1vZGVsIGZvciBob3RwbHVnZ2FibGUKPj4+PiBidXNlcyBpbiBl
bWJlZGRlZCBjb250ZXh0cyB3aGVyZSB5b3UgbWlnaHQgbmVlZCB0byBicmluZyB0aGluZ3Mgb3V0
IG9mCj4+Pj4gcmVzZXQgb3IgcG93ZXIgdGhlbSB1cCBiZWZvcmUgdGhleSdsbCBhcHBlYXIgb24g
dGhlIGJ1cyBmb3IgZW51bWVyYXRpb24KPj4+PiBidXQgYnVzZXMgaGF2ZSBtb3N0bHkgaGFuZGxl
ZCB0aGF0IGF0IHRoZWlyIGxldmVsLgo+Pgo+Pj4gVGhhdCBzb3VuZHMgbGlrZSBhIGJldHRlciBz
b2x1dGlvbiwgYXJlIHRoZXJlIGFueSBzdWJzeXN0ZW1zIGN1cnJlbnRseQo+Pj4gaW1wbGVtZW50
aW5nIHRoYXQsIG9yIHdvdWxkIHRoaXMgYmUgYSBnZW5lcmljIExpbnV4IGRldmljZSBkcml2ZXIg
bW9kZWwKPj4+IGFkZGl0aW9uIHRoYXQgbmVlZHMgdG8gYmUgZG9uZT8KPj4KPj4gTGlrZSBJIHNh
eSBJJ20gc3VnZ2VzdGluZyBkb2luZyBzb21ldGhpbmcgYXQgdGhlIGRldmljZSBtb2RlbCBsZXZl
bC4KPiAKPiBJIGRpZG4ndCBleHBlY3QgdG8gb3BlbiBzdWNoIGEgY2FuIG9mIHdvcm1zLi4uCj4g
Cj4gVGhpcyBoYXMgZXZvbHZlZCBpbnRvIHNldmVyYWwgbmV3IGNvbmNlcHRzIGJlaW5nIHByb3Bv
c2VkIHZzIG15Cj4gdXNlLWNhc2Ugd2hpY2ggaXMgcmVsYXRpdmVseSBzaW1wbGUuIFRoZSBmb3Jt
ZXIgd2lsbCBwcm9iYWJseSB0YWtlCj4gc2V2ZXJhbCBtb250aHMgb2YgZGV2ZWxvcG1lbnQsIHJl
dmlld3MgYW5kIGRpc2N1c3Npb25zIGFuZCBpdCB3aWxsCj4gYmxvY2sgc3VwcG9ydGluZyB0aGUg
cGh5IHN1cHBseSBvbiBwdW1wa2luIGJvYXJkcyB1cHN0cmVhbS4gSSB3b3VsZAo+IHByZWZlciBu
b3QgdG8gcmVkbyB3aGF0IG90aGVyIE1BQyBkcml2ZXJzIGRvIChwaHktc3VwcGx5IHByb3BlcnR5
IG9uCj4gdGhlIE1BQyBub2RlLCBjb250cm9sbGluZyBpdCBmcm9tIHRoZSBNQUMgZHJpdmVyIGl0
c2VsZikgaWYgd2UndmUKPiBhbHJlYWR5IGVzdGFibGlzaGVkIGl0J3Mgd3JvbmcuCgpZb3UgYXJl
IG5vdCBuZXcgdG8gTGludXggZGV2ZWxvcG1lbnQsIHNvIG5vbmUgb2YgdGhpcyBzaG91bGQgY29t
ZSBhcyBhCnN1cnByaXNlIHRvIHlvdS4gWW91ciBwcm9wb3NlZCBzb2x1dGlvbiBoYXMgY2xlYXJs
eSBzaG9ydCBjb21pbmdzIGFuZCBpcwphIGhhY2ssIGVzcGVjaWFsbHkgYXJvdW5kIHRoZSBQSFlf
SURfTk9ORSBidXNpbmVzcyB0byBnZXQgYSBwaHlfZGV2aWNlCm9ubHkgdGhlbiB0byBoYXZlIHRo
ZSByZWFsIFBIWSBkZXZpY2UgSUQuIFlvdSBzaG91bGQgYWxzbyBub3cgdGhhdCAiSQpuZWVkIGl0
IG5vdyBiZWNhdXNlIG15IHByb2R1Y3QgZGVsaXZlcmFibGUgZGVwZW5kcyBvbiBpdCIgaGFzIG5l
dmVyIGJlZW4KcmVjZWl2ZWQgYXMgYSB2YWxpZCBhcmd1bWVudCB0byBjb2VyY2UgcGVvcGxlIGlu
dG8gYWNjZXB0aW5nIGEgc29sdXRpb24KZm9yIHdoaWNoIHRoZXJlIGFyZSBhdCByZXZpZXcgdGlt
ZSBrbm93biBkZWZpY2llbmNpZXMgdG8gdGhlIHByb3Bvc2VkCmFwcHJvYWNoLgoKPiAKPiBJcyB0
aGVyZSBhbnkgY29tcHJvbWlzZSB3ZSBjb3VsZCByZWFjaCB0byBhZGQgc3VwcG9ydCBmb3IgYSBi
YXNpYywKPiBjb21tb24gdXNlLWNhc2Ugb2YgYSBzaW5nbGUgcmVndWxhdG9yIHN1cHBseWluZyBh
IFBIWSB0aGF0IG5lZWRzCj4gZW5hYmxpbmcgYmVmb3JlIHJlYWRpbmcgaXRzIElEIHNob3J0LXRl
cm0gKGp1c3QgbGlrZSB3ZSBjdXJyZW50bHkKPiBzdXBwb3J0IGEgc2luZ2xlIHJlc2V0IG9yIHJl
c2V0LWdwaW9zIHByb3BlcnR5IGZvciBQSFlzKSBhbmQKPiBpbnRyb2R1Y2luZyBhIHdob2xlIG5l
dyBjb25jZXB0IHRvIHRoZSBkZXZpY2UgbW9kZWwgZm9yIG1vcmUgYWR2YW5jZWQKPiAoYnV0IGN1
cnJlbnRseSBtb3N0bHkgaHlwb3RoZXRpY2FsKSBjYXNlcyBsb25nLXRlcm0/CgpUaGUgcHJlLXBy
b2JlIHVzZSBjYXNlIGlzIGFic29sdXRlbHkgbm90IGh5cG90aGV0aWNhbCwgYW5kIEkgd291bGQg
bmVlZAppdCBmb3IgcGNpZS1icmNtc3RiLmMgYXQgc29tZSBwb2ludCB3aGljaCBpcyBhIFBDSWUg
cm9vdCBjb21wbGV4IGRyaXZlcgp3aXRoIG11bHRpcGxlIHJlZ3VsYXRvcnMgdGhhdCBuZWVkIHRv
IGJlIHR1cm5lZCBvbiAqcHJpb3IqIHRvCmVudW1lcmF0aW5nIHRoZSBQQ0llIGJ1cyBhbmQgY3Jl
YXRpbmcgcGNpX2RldmljZSBpbnN0YW5jZXMuIEl0IGlzCmxpdGVyYWxseSB0aGUgc2FtZSB0aGlu
ZyBhcyB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGRvLCBqdXN0IGluIGEKZGlmZmVyZW50IHN1YnN5
c3RlbSwgdGhlcmVmb3JlIEkgYW0gaGFwcHkgdG8gdGVzdCBhbmQgcmV2aWV3IHlvdXIgcGF0Y2hl
cy4KLS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
