Return-Path: <SRS0=MWo0=CI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20010C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2020 19:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14402071B
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2020 19:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l0knf1OA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhzf3GQj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14402071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N94mSmdCUkfQG4glBjXJGhhcfRBqI3QOJIN4IOwMLDw=; b=l0knf1OAx9sPPkb7jDBAa10Bq
	/1yuGY8koZwPkq2yuL61KH8iq+KVZsfZsE7S3gKkgW53iW4jRq4SFZiAd2x5h4aW4qv2IA2iNZSZO
	o3xU49pcQAYuKJJaGvz9AYLZeovPDOcIEXTxzMSpL2N5/qhIWsaZmfdrSw7pLpBQai6QeRoAeJmi8
	2yy2UUL+vS6Z/d/oSWZjOl/nHib9yfBLuvSVkaE8A0iWB3CvpUGJK02Og6UhNYUpoF+oJ0sIscsfZ
	IuFnDlEWzc8MpZDCefEjFs4lpidDssCiV08YLwvJdRmp+JPn65sinWJFbiZaK8OgssY6urlZ6WQ3h
	7LXhHZYRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCTFs-0007CK-QE; Sun, 30 Aug 2020 19:44:44 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCTFr-0007B9-0N; Sun, 30 Aug 2020 19:44:43 +0000
Received: by mail-lj1-x243.google.com with SMTP id y4so3263955ljk.8;
 Sun, 30 Aug 2020 12:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
 b=fhzf3GQjA1EtS/4zAwotNBVfEP5BgQC/vHh7NlqVuoqdj7ROn0tVvewLZVBzxTj4Pv
 4uAEsVCRdvMO7MN38yRhvjx55DRhviVUp+DeySquLtSENxd8LUNUq5mIKtUDp7268hWj
 EiAUYpoHBSpKqaW7iOB+cqshvXFhudBmVbsI7vuQfku+8lEdvR++g+KmaUBIrqUudFxn
 W8bUy8KkEXDCgYhxAAGz+7w9KmUMEitnB8JF5nbRsi/deNwUInd6AYGqmk3s0Ib8ljbl
 l0EyB1+767rr0k5EB5hEav1tXcXzg8p3RaCj4yuxNRG9oCWCo1/o1xG6lEcvfnnZFy/d
 3pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
 b=QReRvG/zv27rgVJ0HAQyFSTeYZZt4BRFRJNO0iwRbBkHYibpWIKvoZobLUS9HBc7vU
 lMg7e2kW093Ycp+B0NS6pOMZ/5MIdym9rWaaEfUjsvsr4C8gmQLse6Pec53WWnbzgNbh
 5CuJiSKWvvyOBi9xu251HNiHTzo19zV9b04hweBfMwwI36TbPCRNBlHHqyx0GGvc9Nb2
 tUhh/Q34n16QYrYe10Sxh4RqAFKZ4JmlCwDeP+b8v4AOlmkeHTLZUZycbWHIg9BvalaK
 N6dzTw+kDEoDdRST7y9n5yBSk/Qzz16RMnQa6D2KshaHetOjPvpBfHbMf83L8bXKznpX
 SfcA==
X-Gm-Message-State: AOAM530TPkgoo4MJAXoc4scjLvEA9rWwqMAZhqW+lcjAMnvjlJopJKIY
 rYbDm4eMy0Bl7tj3+MLMeSI=
X-Google-Smtp-Source: ABdhPJz59TfkPi8wlRB5m8RE5yjEcxQe68Z6X9P8P2LdznriMOncqOezMDUqioFbPNx1FbZLjJi8TA==
X-Received: by 2002:a05:651c:11c5:: with SMTP id
 z5mr3132694ljo.74.1598816680601; 
 Sun, 30 Aug 2020 12:44:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id e8sm1114886lja.93.2020.08.30.12.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 12:44:39 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
To: Thierry Reding <thierry.reding@gmail.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
 <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
 <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
 <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
 <f1923a53-e799-e63c-fd22-4a6cca3b8212@gmail.com>
 <20200827155446.GB1660457@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6240633-feed-70b7-2fe8-49fcee687676@gmail.com>
Date: Sun, 30 Aug 2020 22:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827155446.GB1660457@ulmo>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_154443_106636_77EADF46 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org, hch@lst.de,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, joro@8bytes.org,
 magnus.damm@gmail.com, linux@armlinux.org.uk, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, kyungmin.park@samsung.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, vdumpa@nvidia.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MjcuMDguMjAyMCAxODo1NCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKLi4uCj4+IFRoZSBU
ZWdyYSBEUk0gaGFzIGEgdmVyeSBzcGVjaWFsIHF1aXJrIGZvciBBUk0zMiB0aGF0IHdhcyBhZGRl
ZCBpbiB0aGlzCj4+IGNvbW1pdCBbMl0gYW5kIGRyaXZlciByZWxpZXMgb24gY2hlY2tpbmcgb2Yg
d2hldGhlciBleHBsaWNpdCBvciBpbXBsaWNpdAo+PiBJT01NVSBpcyB1c2VkIGluIG9yZGVyIHRv
IGFjdGl2YXRlIHRoZSBxdWlyay4KPj4KPj4gWzJdCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD0y
NzNkYTVhMDQ2OTY1Y2NmMGVjNzllYjYzZjJkNTE3MzQ2N2UyMGZhCj4+Cj4+IE9uY2UgdGhlIGlt
cGxpY2l0IElPTU1VIGlzIHVzZWQgZm9yIHRoZSBEUk0gZHJpdmVyLCB0aGUgcXVpcmsgbm8gbG9u
Z2VyCj4+IHdvcmtzIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKS4gVGhpcyBwcm9ibGVt
IG5lZWRzIHRvIGJlIHJlc29sdmVkCj4+IGJlZm9yZSBpbXBsaWNpdCBJT01NVSBjb3VsZCBiZSB1
c2VkIGJ5IHRoZSBUZWdyYSBEUk0gb24gQVJNMzIuCi4uLgo+IEkgZG8gaGF2ZSBhIHBhdGNoIGx5
aW5nIGFyb3VuZCBzb21ld2hlcmUgdGhhdCBpbXBsZW1lbnRzIHRoZSBtYXBwaW5nCj4gY2FjaGUg
dGhhdCB3YXMgcmVmZXJlbmNlZCBpbiB0aGUgYWJvdmUgY29tbWl0LiBMZXQgbWUga25vdyBpZiBJ
IHNob3VsZAo+IGRpZyB0aGF0IHVwIGFuZCBzZW5kIGl0IG91dC4KCkhlbGxvLCBUaGllcnJ5ISBJ
dCBjZXJ0YWlubHkgd2lsbCBiZSBpbnRlcmVzdGluZyB0byB0YWtlIGEgbG9vayBhdCB5b3Vycwpw
YXRjaCEKCkkgdGhpbmsgdGhhdCB0aGUgY2FjaGluZyBzaG91bGRuJ3QgYmUgc3RyaWN0bHkgbmVj
ZXNzYXJ5IGZvciBrZWVwaW5nIHRoZQpjdXJyZW50IHdvcmthcm91bmQgd29ya2luZyBhbmQgaXQg
c2hvdWxkIGJlIHBvc3NpYmxlIHRvIGtlZXAgdGhlIGNvZGUKYXMtaXMgYnkgcmVwbGFjaW5nIHRo
ZSBkb21haW4tdHlwZSBjaGVja2luZyB3aXRoIHRoZSBTb0MtZ2VuZXJhdGlvbgpjaGVjayBpbiB0
aGUgVGVncmEgRFJNIGRyaXZlci4KCkluIGdlbmVyYWwsIElNTyBpdCBzaG91bGQgYmUgYmV0dGVy
IHRvIHN0YXNoIHRoZSBjb21wbGV4IGNoYW5nZXMgdW50aWwKd2UnbGwgZ2V0IGNsb3NlciB0byBh
ZG9wdGluZyB0aGUgbmV3IFVBUEkgYXMgaXQgd2lsbCBjZXJ0YWlubHkgdG91Y2ggdGhlCmFzcGVj
dCBvZiB0aGUgcGVyLWRldmljZSBtYXBwaW5ncy4gQnV0IGlmIHlvdXJzIHBhdGNoIGlzIGxlc3Mg
dGhhbiAxMDAKTE9DLCB0aGVuIG1heWJlIHdlIGNvdWxkIGNvbnNpZGVyIGFwcGx5aW5nIGl0IHJp
Z2h0IG5vdyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
