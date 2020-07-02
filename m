Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5432CC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 14:52:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA69220771
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 14:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qlzZpjh9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAQqKXwN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA69220771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=roy2FvL8VcccS8hvRI3HKNFle26RrbNUPd6FxfRTR9o=; b=qlzZpjh94/ITgb9ruGzxAHvh2
	B8J7ZgCyFnWylkytaqqwlQuXlNC2l8msMyyPLFHstYm3XdMnY2VNRc022t4ORI/cVP60rkKDf9pOh
	XG5b9HmmpBS9yGlCd6nm7bnh7IuBaGx7IB3wvMpqLqaT1isMhVik5jcGa/r9xGby7OpiVKNVlX7mF
	4UahceVNryX33nMT7iBjM72yfyBtNPNIKPYr24RmtmFBqlR3srGxE7j5EixAJZrNtdYuaPVC7zD2o
	6UlsgoH2PyECuvwASDeL3Ye9eb6n+hNIstPC0G8g1F+sJO7907YD5o42bjP7vSwpemIeb5JPByhnX
	vlAkpbT9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr0ZY-0000K1-UU; Thu, 02 Jul 2020 14:52:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr0UQ-0005RN-KB
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 14:47:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id f18so28296421wml.3
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2020 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cen7jwZ+l5/fZQV9+f4eKCsdCtb++xjGqhYwjDReG4s=;
 b=wAQqKXwNUvkayHtIMBV6LS0l4vt72aFTjRZSPiSvZJ5C/hqTBy3STN6t0PpK9LZ9Sl
 Lb2UEfzaiMVbpQgMEOWrkp/dkAtB7fHH/UdXXaH4Bf/pD65LBDmzIoAElaEn6uRbkhsr
 Sq6KZ9fmigZNrcfwKtfJpaz/LqAUX/icEFbG3MXXNaTW9OxviX1QsPqnDatS1kMepeKS
 ppuFUZVk6RIA9kGXBgwQV83qvsCFqp560ZzvnuFh2RPn028KWAA/WSY3RrZ3P7YNx2HP
 rVxY/LyhKyYUKA1wHnrnUWETqAHP/uHelYufgGMcwMsaC+Gn9/8D884fgDtbffl5wEIf
 Db4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cen7jwZ+l5/fZQV9+f4eKCsdCtb++xjGqhYwjDReG4s=;
 b=gNH2nIA+2HAlmJt9+d2Cp1BGpxl7em+84pRJsmokud01hdC2efeVc7qo5IeHNZfYgN
 IDy4m7jXX6yr40t3UgzeJahMzA7PlSIuzS2z99AHrLUbtJcNp2kVRyHA6PM5lJ8EpwRI
 hkfrmZsGHelBaK9nq61Qzrx4PAWDmbp7K8HXejeL7QXAhJlRlZ0VUmfDYgwVMFOCAzxr
 VQ5rSZcxbRWbUGcR722tAOR1FcfQuxJc5pfJHjTMzFyhvBWrFYzKY/AlQ/NE3KvxNZhi
 RVZcKO9b1D5slq8iCfBVrjwmGlHnD5ZlJhjlPZ58a+BcetefYwmoENiYcxOwObqmkMjc
 +GsA==
X-Gm-Message-State: AOAM532UDlsIJ+MfQGVfc8uVBeotNBZ483qFIKa7GrzExGrw14tVyxFx
 XNSh9WL7EzyXniROhbo6aczyiQ==
X-Google-Smtp-Source: ABdhPJyKXHl2Fi+reKwJfYF/na/idnzE4RoZeL56RxRf05pfTe+1N4F2X4OdO6C8BsdOK8Y+xUFvgg==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr18364006wma.46.1593701221058; 
 Thu, 02 Jul 2020 07:47:01 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 07:47:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 24/30] usb: mtu3: mtu3_trace: Supply missing mtu3_debug.h
 include file
Date: Thu,  2 Jul 2020 15:46:19 +0100
Message-Id: <20200702144625.2533530-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_104702_855667_B7FC9FC3 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWYgdGhlIGhlYWRlciBmaWxlIGNvbnRhaW5pbmcgYSBmdW5jdGlvbidzIHByb3RvdHlwZSBpc24n
dCBpbmNsdWRlZCBieQp0aGUgc291cmNlZmlsZSBjb250YWluaW5nIHRoZSBhc3NvY2lhdGVkIGZ1
bmN0aW9uLCB0aGUgYnVpbGQgc3lzdGVtCmNvbXBsYWlucyBvZiBtaXNzaW5nIHByb3RvdHlwZXMu
CgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2
ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYzoxMzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmG10dTNfZGJnX3RyYWNl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDEz
IHwgdm9pZCBtdHUzX2RiZ190cmFjZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmZt
dCwgLi4uKQogfCBefn5+fn5+fn5+fn5+fgoKQ2M6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVu
QG1lZGlhdGVrLmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpD
YzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdXNiL210dTMvbXR1M190
cmFjZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M190
cmFjZS5jCmluZGV4IDE1NWVhZTEyNmU1ZTIuLmQxN2RkYjg3Y2RjZjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdXNiL210dTMvbXR1M190cmFjZS5jCisrKyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M190
cmFjZS5jCkBAIC04LDYgKzgsNyBAQAogICovCiAKICNkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5U
UworI2luY2x1ZGUgIm10dTNfZGVidWcuaCIKICNpbmNsdWRlICJtdHUzX3RyYWNlLmgiCiAKIHZv
aWQgbXR1M19kYmdfdHJhY2Uoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICpmbXQsIC4u
LikKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
