Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114D8C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 16:45:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C3620756
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 16:45:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1qf6Hfrg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqZB/9eO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C3620756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KL7A7hZ8UMwtDvoO5OGDespqBcdBMcAOC9g6pCOtfZM=; b=1qf6HfrgjR+0XL7YNxEv1XNUe
	kYps2f+u3Wae0lkK0XzfpFQ+EdiXXb3YYpP6LYSAAD6WMB46vml0gsMh6IVf0o6fWmGBVHoT1GAR2
	JQQ2MF8R3NPR4mHJ6tDRXeb9TB3fprqIj47YbZqiOOlkl4gQJlnIqdCVGnLOz2ktsze+HXhjN0M+o
	lhg/J4w1WXV8G/P0rphcYWx8H3xIDDpPHN8eHt5/4kN86pu4S0vczC7eSmHpb+h1HJrEE9PS9+5gb
	cse4xMLTBuhX3CrQwqPmCYxLTTkSd9QRxnji8M08buheaTNWajVW6gHLNZjlY9A6NhCALVcA0qQhh
	MnadMlFig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kctFh-0008Sy-Eq; Wed, 11 Nov 2020 16:45:45 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kctFf-0008S9-6g
 for linux-mediatek@lists.infradead.org; Wed, 11 Nov 2020 16:45:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id h2so2877840wmm.0
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2020 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/tc7xjG5IAbwDOITmzqVihGpQaXzagYZQvBTGpgYms8=;
 b=HqZB/9eOVs5Rg+FIk/cwSY1ITdAAr4IZZPS594amIXOyh8I2d8M0/qLDdduvDiTyK3
 F5MgnTA+Qhdyy3QW9QiEbp8JDQMZLo4T0fMsYfxcDydQAsdZqZInzdqpRgJu0v1lMFaA
 pq7+3X4mqnv3He/q7wjGHKJlgCakYJAo5E8cQcbQ60WBt8sBzwrr3DStZh2fUqPS3jMg
 Hj9rEzq4aRJMagdnZ403kmbZ5UiYCZ7ZgUKil49Cxbxdb8y0pte1X6i7e5xMyTYwK8aN
 tzhC/1EIb3tonF54o6OjhfeaGQ39ic1An6wqdheJ+nbJC00L/zOhCR+WMRwOcYrCluP9
 bh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/tc7xjG5IAbwDOITmzqVihGpQaXzagYZQvBTGpgYms8=;
 b=Ixi9msvgZHYWjrIor6zgci/bcOfZgAVIlLNnMNpBSfhZn5WX4OjSW9j3VILvniffgF
 iUq9FZt5e9Svv1xhZqnQeiLPeNSfO8CsWHJLmjcdSupxULZVm0XbQ0f9rpLEuAUFvkB+
 Nh5p62NbyIjCodsapSiORdUEuWqUafam8gQDeTET6KjmvE58r2Vf1DfjgZ8C0FBTYhSP
 YZ6o3mJD8tEdoKv+bvMwdNqyO09Y/vrpk13LcrTEle8fSXSia3BiILUINAnIeVcLlalN
 xiBfl3g4YDgUqmJ8p0gx31gikhmF1dPvS0j7Ud+yVqy40Fr8pnzGo4Yv0FhxPd/msNiK
 zwGg==
X-Gm-Message-State: AOAM531mPVorXAfoByg0+AwtTrQQfN9z1X5zy3jbIdVRWESIl8jrMIwJ
 MLReL11ABlSJhZubNYKJuLTTSg==
X-Google-Smtp-Source: ABdhPJz0o72ogXRNWJ4UArzT4Bpb3qdlMIZVvlFneGXocObLd1BcMYpFQaNQaXJVTTA1BPlz6H5Tyw==
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr5146868wmb.180.1605113142145; 
 Wed, 11 Nov 2020 08:45:42 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id c6sm3309966wrh.74.2020.11.11.08.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:45:41 -0800 (PST)
Date: Wed, 11 Nov 2020 16:45:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v6 10/11] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20201111164539.GQ2063125@dell>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
 <1604656432-10215-11-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604656432-10215-11-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_114543_370948_19FE652A 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 sre@kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNiBOb3YgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBNZXJnZSBkaWZmZXJlbnQgc3ViLWRldmljZXMg
STJDIHJlYWQvd3JpdGUgZnVuY3Rpb25zIGludG8gb25lIFJlZ21hcCwKPiBiZWNhdXNlIFBNSUMg
YW5kIExETyBwYXJ0IG5lZWQgQ1JDIGJpdHMgZm9yIGFjY2VzcyBwcm90ZWN0aW9uLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL21mZC9LY29uZmlnICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyB8IDIwMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoK
Rm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMtaXMgdG8geW91ciBzaWduLW9mZiBi
bG9jayk6CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERl
dmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
