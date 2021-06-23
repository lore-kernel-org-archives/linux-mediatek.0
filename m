Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB12C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 15:58:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB40611AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB40611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nu7/IMO120IJ7+fV+tWBvNmV/Bl8bcXBF62Wz+qdleM=; b=kfZ7aIEjOZLQZObfCdL+UnCP56
	JJLyiVjBFay6pwSUI7wnCJNBF9xWqNoO88W1t2rjtXLYbiKymzJU56OIfStfOcpm0PwNWrRFLT8V7
	k7c4WKmqfkAJrokbyOLp6KxddBmuF6Jv7w6araWa8zy9px1I9ZHZyzmxGM0P4SR1AYaEJWCaYJ/y+
	0r7YiCl69MZdFRAJ3ecvfokSBx672/4sNG8kDlE7+8nQqgtPil4Qb4O49G8by7j+8Aj9gRj1hJDpf
	6vB+nzSSLuJajONQuRsTo346DVBshWv158SMIiDQwuUm4g3w4Uiy+5y0g3szPtw0AV7fwgAS3fYt/
	GJJivp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw5H5-00BBk8-71; Wed, 23 Jun 2021 15:58:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw5Gs-00BBiL-4B
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 15:58:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id f15so3216791wro.8
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Jun 2021 08:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aWHjZHm3N3KTaeI1flHxO+u2O+0Wxl7tL3alYGtaqRE=;
 b=a6J6ljRuAIZkb+DVh8LoW7jj02m2amlvP37pUMNIC86PChD5zvYWSbh2ZPGuIxteun
 CxrJF0tvbIvfvj/x0Xh15YJyR3eEd7alhnBUiQfafOQENqPJrAnhOb07FAaltD3iRPJ0
 xiZnW98dRqX9F/1ss+6OxTkIwJOcNEgXMu1m+xQfHHCH/Lfw53oWHLY4Q/cUfXehz1Bz
 UHV3VjzMXqwFYdkBf6UMuRYKHap3m517Gu5B6RuzCUvw5aQLeyYBImR4Hl6R7NtHS2bB
 qlhH//kCrMoF7nN7WaOAKcluRgurO8Oo1ozvhsnjva9/o7Rdar18Ndu5a/Ex8yTkocnw
 qFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aWHjZHm3N3KTaeI1flHxO+u2O+0Wxl7tL3alYGtaqRE=;
 b=es+xPRh1LzBQGvnFgk2p6NUI2sduJtkkM4wu975AfkWvzHypqsuxdw4FK5HYH7Wwu8
 shB4v0nNFS/92hXF0QtRVoK1b0SojLXG4mN3A2cWHO87beOOxPo85/VpilE0VS7XXGQx
 BoCQMXfVd9Jwhz8EIJOBpYJJKTj0xo+I36/Nnhk2VCF0/xJJA6Ay382fHs8hP0E6rxkf
 zp09VGOo9hDlAS1Xv8UyuD5k551YkNdIRvbyo4SOeigkKcy1QaXJj7d03AcHiVkZcIv9
 MfrJ7DbTz1azuCHaaJMDSuMnqNc8u44IlPACq/QL7JCcd0phFVBHVSV2nW/pYB2rqkmD
 /XCA==
X-Gm-Message-State: AOAM533crCnI4NC+qGIbSKpl6KuFdEgt2mR1QSLlftYpjm3tBF6TEhuK
 pBMqO8f28co7zFcOXOK7yJgGRQ7+uWsLFuK5
X-Google-Smtp-Source: ABdhPJxWwEtc54/a6jHteiZGwnV6uZAjaFc7gseO7+hvrMbqZvGrAyvk5bMATLRniaJYmXd8+LDzzw==
X-Received: by 2002:adf:e48e:: with SMTP id i14mr880832wrm.64.1624463911596;
 Wed, 23 Jun 2021 08:58:31 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a562:3d0a:cd98:9ffd?
 ([2a01:e34:ed2f:f020:a562:3d0a:cd98:9ffd])
 by smtp.googlemail.com with ESMTPSA id l22sm493291wrz.54.2021.06.23.08.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 08:58:30 -0700 (PDT)
Subject: Re: [PATCH] Fix mt7622.dtsi thermal cpu
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
Date: Wed, 23 Jun 2021 17:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_085834_262176_2D62B5CE 
X-CRM114-Status: GOOD (  23.42  )
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

T24gMjMvMDYvMjAyMSAxNzozNSwgRXJpYyBXb3Vkc3RyYSB3cm90ZToKPiBJdCBpcyBvbmx5IHVz
ZWZ1bCB0byBzZXQgMSBtYXAgd2l0aCB0aGUgcmVndWxhdGVkIHRlbXBlcmF0dXJlIGZvciBjcHUK
PiBmcmVxdWVuY3kgdGhyb3R0bGluZy4gU2FtZSBhcyBpbiB0aGUga2VybmVsIGRvY3VtZW50IGV4
YW1wbGUuCj4gCj4gCj4gSXQgaGFzIG5vIHVzZSB0byBzZXQgZnJlcXVlbmN5IHNjYWxpbmcgb24g
MiBkaWZmZXJlbnQgdGVtcGVyYXR1cmUKPiB0cmlwIHBvaW50cywgYXMgdGhlIGxvd2VzdCBvbmUg
bWFrZXMgc3VyZSB0aGUgaGlnaGVyIG9uZShzKSBhcmUgbmV2ZXIKPiByZWFjaGVkLgoKSSBsb29r
ZWQgbW9yZSBjbG9zZWx5IHRoZSBEVCBhbmQgdGhlcmUgaXMgYSBtaXN1bmRlcnN0YW5kaW5nIG9m
IHRoZQp0aGVybWFsIGZyYW1ld29yayBpbiB0aGUgZGVmaW5pdGlvbi4KClRoZXJlIGlzIG9uZSB0
cmlwIHBvaW50IHdpdGggdGhlIHBhc3NpdmUgdHlwZSBhbmQgdGhlIGNwdSBjb29saW5nCmRldmlj
ZSwgZm9sbG93ZWQgYnkgYSBzZWNvbmQgdHJpcCBwb2ludCB3aXRoIHRoZSBhY3RpdmUgdHlwZSAq
YnV0KiB0aGUKc2FtZSBjcHUgY29vbGluZyBkZXZpY2UuIFRoYXQgaXMgd3JvbmcuCgpBbmQgZmlu
YWxseSwgdGhlcmUgaXMgdGhlIGhvdCB0cmlwIHBvaW50IGFzIGEgdGhpcmQgbWFwcGluZyBhbmQg
dGhlIHNhbWUKY29vbGluZyBkZXZpY2UuCgpUaGUgaG90IHRyaXAgcG9pbnQgaXMgb25seSB0aGVy
ZSB0byBub3RpZnkgdXNlcnNwYWNlIGFuZCBsZXQgaXQgdGFrZSBhbgppbW1lZGlhdGUgYWN0aW9u
IHRvIHByZXZlbnQgYW4gZW1lcmdlbmN5IHNodXRkb3duIHdoZW4gcmVhY2hpbmcgdGhlCmNyaXRp
Y2FsIHRlbXBlcmF0dXJlLgoKPiBJdCBjYW4gYmUgYXBwbGllZCBvbmx5IGF0IDEgdHJpcCBwb2lu
dC4gTXVsdGlwbGUgdHJpcCBwb2ludHMKPiBpcyBvbmx5IHVzZWZ1bGx5IGZvciBmYW4gY29udHJv
bCB0byBtYWtlIHN1cmUgdGhlIGZhbiBpcyBub3QgdG9vCj4gbm9pc3kgd2hlbiBpdCBpcyBub3Qg
bmVjZXNzYXJ5IHRvIGJlIG5vaXN5Lgo+IAo+IAo+IFRoZSBDUFUgd2lsbCBhbG1vc3QgY29tZSB0
byBhIGRlYWQgc3RvcCB3aGVuIGl0IHN0YXJ0cyB0byBwYXNzIHRoZQo+IGxvd2VzdCB0aGVybWFs
IG1hcCB3aXRoIGZyZXF1ZW5jeSB0aHJvdHRsaW5nLgo+IAo+IFRoaXMgaXMgd2h5IGl0IGlzIGEg
YnVnIGFuZCBuZWVkcyBhIGZpeCwgbm90IG9ubHkgYWRqdXN0bWVudC4KClllcywgeW91IGFyZSBy
aWdodC4gSXQgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlICh2ZXJiYXRpbSBjb3B5KToKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpCmIvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQppbmRleCA4OTBhOTQyZWM2MDguLjg4
YzgxZDI0ZjRmZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2
MjIuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpCkBA
IC0xMzYsMjQgKzEzNiwxOCBAQCBzZWNtb25fcmVzZXJ2ZWQ6IHNlY21vbkA0MzAwMDAwMCB7Cgog
CXRoZXJtYWwtem9uZXMgewogCQljcHVfdGhlcm1hbDogY3B1LXRoZXJtYWwgewotCQkJcG9sbGlu
Zy1kZWxheS1wYXNzaXZlID0gPDEwMDA+OworCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0gPDI1
MD47CiAJCQlwb2xsaW5nLWRlbGF5ID0gPDEwMDA+OwoKIAkJCXRoZXJtYWwtc2Vuc29ycyA9IDwm
dGhlcm1hbCAwPjsKCiAJCQl0cmlwcyB7CiAJCQkJY3B1X3Bhc3NpdmU6IGNwdS1wYXNzaXZlIHsK
LQkJCQkJdGVtcGVyYXR1cmUgPSA8NDcwMDA+OworCQkJCQl0ZW1wZXJhdHVyZSA9IDw3NzAwMD47
CiAJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47CiAJCQkJCXR5cGUgPSAicGFzc2l2ZSI7CiAJCQkJ
fTsKCi0JCQkJY3B1X2FjdGl2ZTogY3B1LWFjdGl2ZSB7Ci0JCQkJCXRlbXBlcmF0dXJlID0gPDY3
MDAwPjsKLQkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsKLQkJCQkJdHlwZSA9ICJhY3RpdmUiOwot
CQkJCX07Ci0KIAkJCQljcHVfaG90OiBjcHUtaG90IHsKIAkJCQkJdGVtcGVyYXR1cmUgPSA8ODcw
MDA+OwogCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+OwpAQCAtMTczLDE4ICsxNjcsNiBAQCBtYXAw
IHsKIAkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFM
X05PX0xJTUlUPiwKIAkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19M
SU1JVD47CiAJCQkJfTsKLQotCQkJCW1hcDEgewotCQkJCQl0cmlwID0gPCZjcHVfYWN0aXZlPjsK
LQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05P
X0xJTUlUPiwKLQkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1J
VD47Ci0JCQkJfTsKLQotCQkJCW1hcDIgewotCQkJCQl0cmlwID0gPCZjcHVfaG90PjsKLQkJCQkJ
Y29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlU
PiwKLQkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47Ci0J
CQkJfTsKIAkJCX07CiAJCX07CiAJfTsKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExp
bmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExp
bmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwK
PGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5s
aW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
