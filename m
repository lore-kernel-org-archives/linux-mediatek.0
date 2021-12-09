Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB230C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 00:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je3bX3OfOA73IZDwlxeItXg/ADz4eUPtFuFYKjaOPIU=; b=Od3gHYj9WB1Cg7
	ztOrAom2KfVfy5We6woUVzMr7E1zfpTFWlExuf7TVnIR5iJrsk0ELcQ8rV8OnuLJVYAPRCfQc5Fsm
	M5FfmPjhvX1f7vhnL6504rB0lHrmYmWri0ibAq2DCyJA+xPNSXIEwIgfX3i5b/K3pB7LV3rod7q4n
	NcZUS49E7IiLDYRtWEDjvH0XYAQlGujzT1qIzEgZFOqgpTomDVHLt4lyGUjLe6vz+b2YZgfw11ECF
	7cLqsdI667ozbLDz6lhIr+hmy3mO66SchO8vGGnvCDyq0X/YtrRmSFpg90qdXRZqm+uxLBAtDBhgv
	8XFaHE73ybrlgToLZTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv76h-00EaOK-1t; Thu, 09 Dec 2021 00:16:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv76T-00EaM8-LQ; Thu, 09 Dec 2021 00:16:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3152DCE2408;
 Thu,  9 Dec 2021 00:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C66C341C7;
 Thu,  9 Dec 2021 00:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639008960;
 bh=oVSOBOa6BXE/T1paveXxdxhNyigIeoXyMRSYZn5ztc8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xbh8zW9a4BNtJUamHUMgd/G0U8wsAoNVgu1NdgnUQI0ziYSTS+YgLYditYytslYMV
 gpYPw9Hed6vDfqNYjGjQHm6CYrQayp5dUoqMH9GDL3Hxf0v3JXgggWq75Vg0UHvPF+
 twc+0rdfYigCw0aVZNhLRLo/HP3iWhwwF6twjVb3yT4vWUcQiYAVbjLaazlyHAIUli
 dEkh9xiFVxGU4ZJWeUDF+mwjhuSE46dbwDtxXv/wDBu/aUZGA/8NzfI+2YdsnpAN/J
 JxylvXVMA0wdeknmQ/Bg+KnTQEV0y4T4tkDlsTXUIKf8EkNhql0t7hEShiiVHPSCit
 Mx4A/NqJ6Vywg==
Received: by mail-ed1-f51.google.com with SMTP id e3so14128661edu.4;
 Wed, 08 Dec 2021 16:16:00 -0800 (PST)
X-Gm-Message-State: AOAM531my01udOO+8pdl96OEWmPpowDItAyQYrVFCs+n+9Cqf49jb6/v
 bT8i4cJal7hqSDVcke9iaXN4PeHuXrVtLC2jCQ==
X-Google-Smtp-Source: ABdhPJwbRkLlN1DN6NRjc1MrpWhMmKdZKIytk32WxKVDcsvTdDXYzOYWNAqhEtEdWyy6APe77L/rn1RVklA5TSKKC5c=
X-Received: by 2002:a50:d883:: with SMTP id p3mr24003865edj.94.1639008958411; 
 Wed, 08 Dec 2021 16:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
In-Reply-To: <20211027162806.2014022-1-markyacoub@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Dec 2021 08:15:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
Message-ID: <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
To: markyacoub@chromium.org
Cc: Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_161606_128346_395ABAFF 
X-CRM114-Status: GOOD (  19.06  )
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

SGkgTWFyazoKCk1hcmsgWWFjb3ViIDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4g5pa8IDIwMjHl
ubQxMOaciDI45pelIOmAseWbmyDkuIrljYgxMjoyOOWvq+mBk++8mgo+Cj4gRnJvbTogTWFyayBZ
YWNvdWIgPG1hcmt5YWNvdWJAZ29vZ2xlLmNvbT4KPgo+IEF0IHRoZSByZXNldCBob29rLCBjYWxs
IF9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQgd2hpY2ggaXMKPiBjYWxsZWQgYXQgdGhl
IGluaXRpYWxpemF0aW9uIG9mIHRoZSBwbGFuZSBhbmQgc2V0cyB0aGUgZGVmYXVsdCB2YWx1ZSBv
Zgo+IHJvdGF0aW9uIG9uIGFsbCBwbGFuZXMgdG8gRFJNX01PREVfUk9UQVRFXzAgd2hpY2ggaXMg
ZXF1YWwgdG8gMS4KClRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSwgYnV0IHBsZWFzZSBmaXgg
dGhpcyBjaGVja3BhdGNoIHdhcm5pbmc6CgpXQVJOSU5HOiBGcm9tOi9TaWduZWQtb2ZmLWJ5OiBl
bWFpbCBhZGRyZXNzIG1pc21hdGNoOiAnRnJvbTogTWFyawpZYWNvdWIgPG1hcmt5YWNvdWJAZ29v
Z2xlLmNvbT4nICE9ICdTaWduZWQtb2ZmLWJ5OiBNYXJrIFlhY291Ygo8bWFya3lhY291YkBjaHJv
bWl1bS5vcmc+JwoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxMSBsaW5lcyBjaGVja2Vk
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFRlc3RlZCBvbiBKYWN1enppIChNVEspLgo+IFJl
c29sdmVzIElHVEBrbXNfcHJvcGVydGllc0BwbGFuZS1wcm9wZXJ0aWVzLXtsZWdhY3ksYXRvbWlj
fQo+Cj4gU2lnbmVkLW9mZi1ieTogTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJAY2hyb21pdW0ub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgMyAr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jCj4gaW5kZXggZTZkY2IzNGQz
MDUyMi4uYWNjZDI2NDgxYjlmYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYwo+IEBAIC00NCw5ICs0NCwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfcGxhbmVfcmVz
ZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gICAgICAgICAgICAgICAgIHN0YXRlID0ga3ph
bGxvYyhzaXplb2YoKnN0YXRlKSwgR0ZQX0tFUk5FTCk7Cj4gICAgICAgICAgICAgICAgIGlmICgh
c3RhdGUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0gICAgICAgICAgICAg
ICBwbGFuZS0+c3RhdGUgPSAmc3RhdGUtPmJhc2U7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIF9f
ZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQocGxhbmUsICZzdGF0ZS0+YmFzZSk7Cj4gKwo+
ICAgICAgICAgc3RhdGUtPmJhc2UucGxhbmUgPSBwbGFuZTsKPiAgICAgICAgIHN0YXRlLT5wZW5k
aW5nLmZvcm1hdCA9IERSTV9GT1JNQVRfUkdCNTY1Owo+ICB9Cj4gLS0KPiAyLjMzLjAuMTA3OS5n
NmU3MDc3OGRjOS1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
