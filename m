Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FFEC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 20:16:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE16F207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 20:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B5ib18ir";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH0fXemG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE16F207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F7+ILa4jow+v5u/l98RK9ETGqxa9lfPjOZkeTLEw4p4=; b=B5ib18irVKFnIRv20+WS+EUFb
	UCIarOZr4iiTnGXXka97n3zErOcZgx+rQoea8erFDpVW7UAj4QsRPR+YXy59foaIltPfW//WVsGx8
	2L2N2m10arMmYZxLYW7LoBfIHmZ9maGw1JuCZ1whZ0pj0xPAddwmfvXiF2Q6Vxrolt737nTqcaLka
	cQEQTH+VrrwU9mWZNk2+TYwC70NZTLtNga8G6enqhGLktbwRymM716UwwElkRnvRpermBK3dEfroV
	Mr6Ic08icfphd2gR72Q/BrW/WWjP/z9tq2GI5KB5dL6/i4Hg0VK0h22eYc3avi2NksQDwrcJvZb3A
	3D6nZMV1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8qym-0007al-9L; Thu, 20 Aug 2020 20:16:08 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8qyj-0007Zy-Up; Thu, 20 Aug 2020 20:16:06 +0000
Received: by mail-lf1-x143.google.com with SMTP id v15so1580731lfg.6;
 Thu, 20 Aug 2020 13:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z4/wj3Fu4Eph1sTO7GVhSlXHwAR3nCexyHHqjazhrhI=;
 b=eH0fXemGHyYrqVaXCSwoyiADThja4royuk8E2W7qgm+q+qNvxSE7WFI1GWAcUNWol5
 TkSlaIwWXfpGCu1rdKd4xbo6v5YOfOA1VqIE+e7I3KOFxP8uY8gZHQ5hEn18nNUkQltB
 61cD6GShkUj7anmSjHmNJJyQtWOSzcA/6WiCmvyl1yqsI+3JLWIFkxCEfZSA0Tkc4rwt
 Al0YwbiQoEnH/bE6QfOQS6mPRhuh/7eJUl9miYuu6EqyUaDTzmIFC9UVy73ZFdaDHzDh
 OoBwM1FfdFr2C2ppdWQEZQUf+F4zaBl1T3JBG+3PU5tvXyUEefM3HxjeLEu6sI20OYUe
 7V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z4/wj3Fu4Eph1sTO7GVhSlXHwAR3nCexyHHqjazhrhI=;
 b=mPcM05u1YiCwU/kqlkWW4HjbkeaeNqEn7Fb23OHzcmg4n0Htv9bo2KaDUMU+k8oQY9
 ZY3Ka4WNwpX5nGmWJtzGIHvUPGVLHNiMjHcUJ1c3qFetoUU5wLD7lOFhTMmUVwEYOhYg
 HkwjMicvtFEJP42NgRcSCxJEpRLqb/nzilSdGAMo0E95Sge2PI1Sj1C/nh3VjHOxpzf4
 DqwNeJ1+ZieFhiDynRHac2VtR3V/I4pCCxsODklIuJRnM7QXu/lxU1WGr/7rHOaTTFtz
 rS4aCc2Tpq1IUEHEribptkwheR4bMeUu7zFSnMJrxTTraWNmtjHGcAZvPv37rMiSIK5l
 VjUA==
X-Gm-Message-State: AOAM533ZkSyOuNI5wQoPdvsypElXEqOhXzlWYpehQyVO0GANV05KL3yl
 NaZIb8HUm7AwAosLep45XHg=
X-Google-Smtp-Source: ABdhPJwrxwMvfMIi1WMXou3rl8xDa6keRlOnRHgj5dYDGe39qslojpYQkA223xf57H7QsDS0Qr4vug==
X-Received: by 2002:a19:8a57:: with SMTP id m84mr30938lfd.159.1597954564373;
 Thu, 20 Aug 2020 13:16:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id b15sm638637lji.140.2020.08.20.13.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 13:16:03 -0700 (PDT)
Subject: Re: [PATCH 12/18] iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
Date: Thu, 20 Aug 2020 23:16:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_161606_080241_2DB560AC 
X-CRM114-Status: GOOD (  20.95  )
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
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MjAuMDguMjAyMCAxODowOCwgUm9iaW4gTXVycGh5INC/0LjRiNC10YI6Cj4gTm93IHRoYXQgYXJj
aC9hcm0gaXMgd2lyZWQgdXAgZm9yIGRlZmF1bHQgZG9tYWlucyBhbmQgaW9tbXUtZG1hLAo+IGlt
cGxlbWVudCB0aGUgY29ycmVzcG9uZGluZyBkcml2ZXItc2lkZSBzdXBwb3J0IGZvciBETUEgZG9t
YWlucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2lvbW11L3RlZ3JhLWdhcnQuYyB8IDE3ICsrKysrKysrKysr
Ky0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3RlZ3JhLWdhcnQuYyBiL2RyaXZlcnMv
aW9tbXUvdGVncmEtZ2FydC5jCj4gaW5kZXggZmFjNzIwMjczODg5Li5lMDgxMzg3MDgwZjYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS90ZWdyYS1nYXJ0LmMKPiArKysgYi9kcml2ZXJzL2lv
bW11L3RlZ3JhLWdhcnQuYwo+IEBAIC05LDYgKzksNyBAQAo+ICAKPiAgI2RlZmluZSBkZXZfZm10
KGZtdCkJImdhcnQ6ICIgZm10Cj4gIAo+ICsjaW5jbHVkZSA8bGludXgvZG1hLWlvbW11Lmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+Cj4gQEAgLTE0NSwxNiArMTQ2LDIyIEBAIHN0YXRp
YyBzdHJ1Y3QgaW9tbXVfZG9tYWluICpnYXJ0X2lvbW11X2RvbWFpbl9hbGxvYyh1bnNpZ25lZCB0
eXBlKQo+ICB7Cj4gIAlzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW47CgpIZWxsbywgUm9iaW4h
CgpUZWdyYTIwIEdBUlQgaXNuJ3QgYSByZWFsIElPTU1VLCBidXQgYSBzbWFsbCByZWxvY2F0aW9u
IGFwZXJ0dXJlLiBXZQp3b3VsZCBvbmx5IHdhbnQgdG8gdXNlIGl0IGZvciBhIHRlbXBvcmFsIG1h
cHBpbmdzIChtYW5hZ2VkIGJ5IEdQVQpkcml2ZXIpIGZvciB0aGUgdGltZSB3aGlsZSBHUFUgaGFy
ZHdhcmUgaXMgYnVzeSBhbmQgd29ya2luZyB3aXRoIGEKc3BhcnNlIERNQSBidWZmZXJzLCB0aGUg
ZHJpdmVyIHdpbGwgdGFrZSBjYXJlIG9mIHVubWFwcGluZyB0aGUgc3BhcnNlCmJ1ZmZlcnMgb25j
ZSBHUFUgd29yayBpcyBmaW5pc2hlZCBbMV0uIEluIGEgY2FzZSBvZiBjb250aWd1b3VzIERNQQpi
dWZmZXJzLCB3ZSB3YW50IHRvIGJ5cGFzcyB0aGUgSU9NTVUgYW5kIHVzZSBidWZmZXIncyBwaHlz
IGFkZHJlc3MKYmVjYXVzZSBHQVJUIGFwZXJ0dXJlIGlzIHNtYWxsIGFuZCBhbGwgYnVmZmVycyBz
aW1wbHkgY2FuJ3QgZml0IGludG8KR0FSVCBmb3IgYSBjb21wbGV4IEdQVSBvcGVyYXRpb25zIHRo
YXQgaW52b2x2ZSBtdWx0aXBsZSBidWZmZXJzIFsyXVszXS4KVGhlIHVwc3RyZWFtIEdQVSBkcml2
ZXIgc3RpbGwgZG9lc24ndCBzdXBwb3J0IEdBUlQsIGJ1dCBldmVudHVhbGx5IGl0Cm5lZWRzIHRv
IGJlIGNoYW5nZWQuCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL2dyYXRlLWRyaXZlci9saW51eC9i
bG9iL21hc3Rlci9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2FydC5jI0w0ODkKClsyXQpodHRwczov
L2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9nYXJ0LmMjTDU0MgoKWzNdCmh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1kcml2ZXIv
bGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3VhcGkvcGF0Y2hpbmcuYyNM
OTAKCj4gLQlpZiAodHlwZSAhPSBJT01NVV9ET01BSU5fVU5NQU5BR0VEKQo+ICsJaWYgKHR5cGUg
IT0gSU9NTVVfRE9NQUlOX1VOTUFOQUdFRCAmJiB0eXBlICE9IElPTU1VX0RPTUFJTl9ETUEpCj4g
IAkJcmV0dXJuIE5VTEw7CgpXaWxsIGEgcmV0dXJuZWQgTlVMTCB0ZWxsIHRvIElPTU1VIGNvcmUg
dGhhdCBpbXBsaWNpdCBkb21haW4gc2hvdWxkbid0CmJlIHVzZWQ/IElzIGl0IHBvc3NpYmxlIHRv
IGxlYXZlIHRoaXMgZHJpdmVyIGFzLWlzPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
