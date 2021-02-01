Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40AFC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 08:49:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FAD164E36
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 08:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FAD164E36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sB/34DX8tKuF/+7yaSjeD5a6b2NJmQ68v4rRgwgLN+0=; b=U5Ru5Ia4LVpzAQY3JeLgQ9lnh
	pCz1QSJZ8I5A4qaLYC3MoWKJMC+fs122ONWXmzZO8wlPdBCVHDC7yh4kaDvMiov0crJCzLqsBa0bk
	du1Qb6hvdMaGlzRQpaoVNDBD3zIr0rWxEw6S2QXFkTVd6bbViVLcrbSpwOkFO//fQn/tWEhO1DDgB
	7YiGUiJyKjG8iRWYzfuarDPool87otMlvF5cSioSRNDZMbJRo829yyRna46iUqBlnYORbVI2t8WT1
	Jms8Uy9YP45SwsdC/lEa+vtDx8wE7DwThllrWNbF25m6FrS7oSPwonaOjqIx4ifDgVX3lreJjMEr0
	sxu3gm3iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Ute-0002Wj-LT; Mon, 01 Feb 2021 08:49:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Utb-0002W7-7K; Mon, 01 Feb 2021 08:49:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id c4so12909812wru.9;
 Mon, 01 Feb 2021 00:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I5quN8hgyIirr+TXubErY4OwtDxCoITlt00TDLVsUo4=;
 b=t+Dew0pqvYUsHeFn9pF7XWtG201+klBjCcn+/NsZZrV/OFPyuGvvFzJoYoXgKb073S
 0CrnmhQWlmbW141DHdeHwtCee2wYX97/nzUpd3hnxpaCfZqT/K0Z4tD76Lh4O1tW0GWK
 sv84IYnI21eOChgIUjL4HnSwuAieM46HZ89OlLlN1PJ/ZvbTao0GQfkXgQgvou5Ays2B
 EcLd8y4f4Pj2xpcoVcJPXZwGOtpkIbO9MY9SmUscn+YlMblT8zeyqLxDp3aNlKTQWlgQ
 NLlCcvlpngW2NToD5vVFUH2p282NzcPsH9wonCOxu26I6FgnDc0vvsvedLNSej+vKP5h
 EnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I5quN8hgyIirr+TXubErY4OwtDxCoITlt00TDLVsUo4=;
 b=NKOJTh1ljWyJRo9wJkPkt9qQgMYReQn3OX9tWPq0Z3S2ehmldCjK7pFwE6WYmbpzNX
 TxuIKH2ltRnVxd7UskJ/QF+ReSRkVsDym8N9N2oA2npmS/1fc+yazFOup3PoMVH2g96h
 7vVS+mVBFE3euDkwe9X85LbrxZN192vYhy1CtPdiSHw9LJqDcXb8lbBfPVz4y9tGgNHC
 EVErEFKU8VQHZINbqIoovnzBqOxruRaTqfLJ3jz83qqgJY+l3v11EEqK4jf/sGj+iXsx
 p+mfs1Li0wk1YNKKSWndrKLfScJrUtyJbp15zfwXFga87+tV1zJA1T7+yBJPfARvYUet
 +NqA==
X-Gm-Message-State: AOAM531L70cUq3tlykLqV7n8yXf5FHbDVfEXvMuRyUFojVhkOpKzag5I
 GhoHXgNKJ5meGUAdsV41zc0GNQGvwHQCQdQc
X-Google-Smtp-Source: ABdhPJzbM41H3fnkeABFIvGY1igV7fKzPcE4QNnGj4BtjholB0xxbRzwTOXd6hDFTtno8iIZpSj3Pg==
X-Received: by 2002:adf:9b8c:: with SMTP id d12mr17286687wrc.51.1612169358007; 
 Mon, 01 Feb 2021 00:49:18 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id o14sm24788202wri.48.2021.02.01.00.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:49:17 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: mt8183: Fix GCE include path
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@kernel.org>
References: <20210131101726.804-1-matthias.bgg@kernel.org>
 <CAAOTY_87TfpnScL+t624+FbdixosNpfoEkuMi8Y+h_RXttA7Tg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <42b6f5ae-bfa9-e28d-21b4-e3f91ad4b046@gmail.com>
Date: Mon, 1 Feb 2021 09:49:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAAOTY_87TfpnScL+t624+FbdixosNpfoEkuMi8Y+h_RXttA7Tg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_034919_350833_785E9D77 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: DTML <devicetree@vger.kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAzMS8wMS8yMDIxIDE3OjE3LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBNYXR0aGlh
czoKPiAKPiA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MeaciDMx5pelIOmA
seaXpSDkuIvljYg2OjE35a+r6YGT77yaCj4+Cj4+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1i
cnVnZ2VyQHN1c2UuY29tPgo+Pgo+PiBUaGUgaGVhZGVyIGZpbGUgb2YgR0NFIHNob3VsZCBiZSBm
b3IgTVQ4MTgzIFNvQyBpbnN0ZWFkIG9mIE1UODE3My4KPj4KPiAKPiBSZXZpZXdlZC1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gCgpBcHBsaWVkIHRvIHY1LjEx
LW5leHQvZHRzNjQKClRoYW5rcwoKPj4gRml4ZXM6IDkxZjljOTYzY2U3OSAoImFybTY0OiBkdHM6
IG10ODE4MzogQWRkIGRpc3BsYXkgbm9kZXMgZm9yIE1UODE4MyIpCj4+IFJlcG9ydGVkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVn
Z2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPj4KPj4gLS0tCj4+Cj4+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE4My5kdHNpIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxODMuZHRzaQo+PiBpbmRleCA1Yjc4MmE0NzY5ZTcuLjgwZTQ2NmNlOTlmMSAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQo+PiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpCj4+IEBAIC02LDcgKzYs
NyBAQAo+PiAgICovCj4+Cj4+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTgzLWNs
ay5oPgo+PiAtI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2djZS9tdDgxNzMtZ2NlLmg+Cj4+ICsjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvZ2NlL210ODE4My1nY2UuaD4KPj4gICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4+ICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4+ICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvbWVtb3J5L210ODE4My1sYXJiLXBvcnQuaD4KPj4gLS0KPj4gMi4zMC4wCj4+Cj4+Cj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdAo+PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
