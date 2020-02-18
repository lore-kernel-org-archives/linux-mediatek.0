Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F9BC34026
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 09:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 131FE21D7D
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 09:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKn9Hivl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z79p2R5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 131FE21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HPNHprUsw0lLV/by7bDGj6Pb/2bEGD0nzrPN96Rmj34=; b=QKn9Hivl0wxLN6hSzTxzCfj0R
	nvHEF1581mzb3rcyLIN5TgKxomtYvVRJN1b+XibeR1nvJUFJT5/x77HaWxfARmzII6jgzAdNdKZIJ
	WdZJOw4y0h34jNQ97i+o1yOZWBFp4S5MYtsJIUSzp1Mt6WPsZuIISdMDI07eLPswP3CS1LwfLGRaA
	zdgoyA+/1SAqOm6A/FlZbVUzeGwBogSyPCdUrSKYwaTDaffC8aLLugeGjrSwgb3m4K66Uw8ugO6Z9
	aUB4q5sg3NvQjqMF6CBP8lodv8QY9gWGFg/OLKi0CAozr1pbHEeGn54amWEcGXL722XyBIxk2fq9F
	b7Ev8DhuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3z1o-0007Z9-Lg; Tue, 18 Feb 2020 09:18:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3z1j-0007RJ-32
 for linux-mediatek@lists.infradead.org; Tue, 18 Feb 2020 09:18:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n10so21016778wrm.1
 for <linux-mediatek@lists.infradead.org>; Tue, 18 Feb 2020 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pGj8/tYNr2ig9yDk7W4pxK2twpGRw2//c44318tSQKY=;
 b=z79p2R5onpcGuw8vQOPzZfTC7kCwHgJ5gd9evog64W4IaU0W4VTmDQxMFweMGbV+OR
 ylFwgiWjYOMY9M2sbkdXdMQ9WCFOQYkkn3uHVjgmYTGGEsumO+TShYDR+kik9hO8NudO
 Kd07/+G6vO7q6A3kT8fp5qrQde1bzjps0TGgbHhGHD0lyn4v6/WYsLYtVAw7fLgSQPTi
 fD0yZPk7NPJCl33wqPj+hpIKpzaaEO/EXcJMC9UzCn2alpnKEKe7k5qpJP0aatUWWWdR
 3bNdiajddk2e68c2x7VV+uYZ+QAxCvW7HWQ6zGPgGxbE9/HwTF+UJj+0OF2ihWDkXO+r
 fbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pGj8/tYNr2ig9yDk7W4pxK2twpGRw2//c44318tSQKY=;
 b=cY2zVycCnSnM/Ye3ScyGYehsMwiNwNIXcx27i57VkradxR4J5KJNZWAryU9XzGATix
 zy+cQ7g+oTrXwsYRKg5uipVU7k5+QMkdQdfOKFk6ljRrMoQR9ordW0q6lu5Ku32DXwS2
 u8bNWEcHFes3rzmKoff3M7sMXjvIGIG6AySEcD57m2Ez03kn9HPiN6F6LavTh/C54EGo
 IFiBJT3MtI0joMWdKegaDI5RN+5lJUh2cgwZTyZQTmujpa8Mc4FhKAwJkuSzQQUuxoVT
 DPamfgsL+uEuT3wrZxYcIM046QqyZ0z3mNgWr2PeQSzNanCcGr1h0BiMRAlyookEWe69
 j6tw==
X-Gm-Message-State: APjAAAWGSwRePCU8R59W58t4XhT8ey8dNXrwlWXRDSh/DRoJndsK0Q5x
 EcquKADgYq82Qb850QSK7xyT/g==
X-Google-Smtp-Source: APXvYqz02xAXAjUKJgD/rvMDjCVXHkpDbNxW9oqzSnZbpdPpfwXZ7NlrpXVc33TpioZPTWJNoTzjXQ==
X-Received: by 2002:adf:ed8e:: with SMTP id c14mr27740701wro.80.1582017525325; 
 Tue, 18 Feb 2020 01:18:45 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h128sm2917571wmh.33.2020.02.18.01.18.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:18:44 -0800 (PST)
Subject: Re: NVMEM usage consult for device information
To: =?UTF-8?B?TWFjIEx1ICjnm6flrZ/lvrcp?= <mac.lu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <06d083206a4f4f5981be9d2e628162f8@mtkmbs01n1.mediatek.inc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <11b42d7b-ff96-d377-5225-6f9fcd5c57b8@linaro.org>
Date: Tue, 18 Feb 2020 09:18:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <06d083206a4f4f5981be9d2e628162f8@mtkmbs01n1.mediatek.inc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_011847_162242_BDB42B7B 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxOC8wMi8yMDIwIDA1OjE2LCBNYWMgTHUgKOebp+Wtn+W+tykgd3JvdGU6Cj4gSGVsbG8s
Cj4gCj4gTWVkaWF0ZWvCoGNoaXAgaGF2ZSBzb21lIFNPQyBjb25maWd1cmF0aW9ucyBhbmQgc3Bl
Y2lmaWMgZGF0YSB3aGljaCB3b3VsZCAKPiBiZSBkZWxpdmVyZWQgdG8ga2VybmVsIGJ5IERUQi4K
PiAKSXMgdGhpcyBkYXRhIHN0b3JlZCBpbiBhIG5vbiB2b2xhdGlsZSBtZW1vcnkgb24gdGhlIFNv
Qz8KaWYgeWVzLCB0aGVuIHdlIHNob3VsZCBoYXZlIGEgcHJvcGVyIG52bWVtIHByb3ZpZGVyIGRy
aXZlci4KCi0tc3JpbmkKCj4gU28gd2Ugd2FudCB0byBpbXBsZW1lbnQgYSBuZXcgTlZNRU0gZHJp
dmVyIHRvIHJldHJpZXZlIHRoZXNlIGRhdGEgZm9yIAo+IHVzZSBieSB0aGUgTlZNRU0gRnJhbWV3
b3JrLgo+IAo+IERvIHlvdSBhZ3JlZSB3aXRoIHRoZSB1c2FnZSBmb3Igb3VyIGFwcGxpY2F0aW9u
Pwo+IAo+IFRoYW5rcwo+IAo+IE1hYwo+IAo+ICoqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlk
ZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKgo+IFRoZSBpbmZvcm1hdGlvbiBj
b250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueQo+IGF0dGFjaG1l
bnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3Ro
ZXJ3aXNlCj4gZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0
IGlzIGludGVuZGVkIHRvIGJlCj4gY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNp
cGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sCj4gZGlzdHJpYnV0aW9uLCBwcmludGlu
ZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMKPiBh
dHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGli
aXRlZCBhbmQgbWF5Cj4gYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJl
Y2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQo+IHRoYXQgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlcgo+IGltbWVk
aWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBj
b3BpZXMgb2YKPiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5
b3VyIHN5c3RlbSwgYW5kIGRvIG5vdAo+IGRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1t
YWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
