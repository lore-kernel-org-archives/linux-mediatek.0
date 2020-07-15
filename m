Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547A2C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:33:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9E2206F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSyE52bX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdQed/Ih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9E2206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9IinYvkGuE03ZGSqu2qfWan4yYFPV1a8UrxxT4X8i0U=; b=iSyE52bXdF2ryjX4vhCpbfTDE
	PPLtBopBdiduSUmB3GRIMLpPn1EOnA1ZURr6cw5p80PIx6FJDTKZlbGWT9BzIYL/GJEG+ZUlefv+E
	Imco2i0bpx/PZoC9SNzPmM5sMg3pWV3cVPW8+jWo9HLb9XzpR0pCSHt4ZhID/YkjBjLGl/bLcnGHs
	d9cwTV9dsDdpZyEgslZUOER0y2LR9mHESPYXAteOlsetLWa3uEDT7FMDEhnCeUeEAlvlNWs/XUBak
	w8Nc27tOFHz9mZEq5JOZ7GNiNNtGwkgWTf1OXp9704OHDyZrh40dZ4h2fzqR8/ecOIXWk1EI3V3w+
	H/8zwwjDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvdmM-0003Un-LR; Wed, 15 Jul 2020 09:32:42 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvdly-0003Lx-MC
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 09:32:21 +0000
Received: by mail-wm1-x342.google.com with SMTP id c80so4687529wme.0
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2020 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDADXb7FAzSw8X5lKDm1Tv4eULkfL4pe/oWt/8u/tjI=;
 b=LdQed/Ih0lqZSe0CCBXFgRaZlWuEjjDKJxIpKs/nPHffEQP1EdCkcHyMLyH37Yz6LS
 hw3npNiL3hzjRYUd1n4AFDMrT0loBlTdv1mSuVODZjFfdKA5HWic/IoHbOHOa4zkFowx
 OXx9B97n+b4Kxs2zb/p5G3JVDB52/VcKxYcfzDBFm9RCqeUtgBLq4ThSGCTp8HmC33Rp
 7iPo+vyJiyamddgrr3wrjR3t40fA+jCSFuS/YmUgy7j8Iw+0aw8ElXPK457oReUWs2jO
 /kew5bxhd7rV2rtWYpK2FoaxwlADY6SqfwuWS/+eX/L8KjU/C3IKG2NuQqIg+YdDhOXJ
 ar2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDADXb7FAzSw8X5lKDm1Tv4eULkfL4pe/oWt/8u/tjI=;
 b=qXX0msND9hRnvBASJnnWauVDup4MoVFqW23mcIqUngXwbRrTubA7TLq3iH2lvEFxCW
 CJPyTVg86WKbO+EWP+5+5j0oiUb0vN0U2XsVVOibBFZJARWG4fP2OoPt73dqj+nf9i7z
 OPG+r4xdFnjUbZxOnySl9KlTKBwGGdzkfSNlhvJwlOvjB9rh2dKkF5b+T2Fets9RTgCn
 QURAYScofWAdQjAeIfKIN+WTG7Miss5rv8VuK0HmeQdME7wA4oYQTxPwaf11+Pu3D/zk
 0khNwUH8YRdODKrIi7E3bFQA9HMzpEc4XjZJksQej0MOx+guQM/7NnnK+yO63N8HTIiS
 5lRw==
X-Gm-Message-State: AOAM532DpIcwDbU9/V5atim48/WBhFoSdlz7qG+XYE+7K8jabElUdnuO
 YLsi/kwJuHwBcsT6R1b2b58Uj7vsnP4=
X-Google-Smtp-Source: ABdhPJxO/xBg6hX1tW1/OdfO23Yl4NCWnZHIuTxnlzd6rvRZWjW7iMR0nFemLByMXCsySd2r1950Wg==
X-Received: by 2002:a7b:c348:: with SMTP id l8mr8206612wmj.54.1594805537724;
 Wed, 15 Jul 2020 02:32:17 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 02:32:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 4/8] usb: mtu3: mtu3_trace: Supply missing mtu3_debug.h
 include file
Date: Wed, 15 Jul 2020 10:32:05 +0100
Message-Id: <20200715093209.3165641-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715093209.3165641-1-lee.jones@linaro.org>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_053218_846046_AB878A49 
X-CRM114-Status: GOOD (  11.42  )
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
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KQ2hhbmdlbG9nCgp2MjogTm8gY2hhbmdl
IC0gcm9ib3Qgd2FybmluZyBkaWQgbm90IGFwcGVhciB0byBiZSB2YWxpZAoKIGRyaXZlcnMvdXNi
L210dTMvbXR1M190cmFjZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYyBiL2RyaXZlcnMvdXNi
L210dTMvbXR1M190cmFjZS5jCmluZGV4IDE1NWVhZTEyNmU1ZTIuLmQxN2RkYjg3Y2RjZjIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL210dTMvbXR1M190cmFjZS5jCisrKyBiL2RyaXZlcnMvdXNi
L210dTMvbXR1M190cmFjZS5jCkBAIC04LDYgKzgsNyBAQAogICovCiAKICNkZWZpbmUgQ1JFQVRF
X1RSQUNFX1BPSU5UUworI2luY2x1ZGUgIm10dTNfZGVidWcuaCIKICNpbmNsdWRlICJtdHUzX3Ry
YWNlLmgiCiAKIHZvaWQgbXR1M19kYmdfdHJhY2Uoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBj
aGFyICpmbXQsIC4uLikKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
