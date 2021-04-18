Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0C1C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 12:04:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A657B61019
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 12:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A657B61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BEJUNpBQQe8JnYtutSk+KCRx0oO2RwQx7BWuzjwn1DM=; b=WsZUd7GE1EumQAv8uzng6mv5L
	Pzsr0E6NlRTZR+lWYCihJJY1ICOIp0+yjtd9lbxn4cEGvFa0upcv6VTJXj5IMn9Bp52Lu1OT+lsto
	pEMg98W3cncuRxft3HmB1qNll+cc3KtRza5q77FiPhyDsyBrmRyMpzWJEpck+IDFPRlVSfCkIWdj/
	lI1qO57fC3DdcjV+f1nYiTl95lUMCl3pjRrV8RJlkdxbaH0/hBLNbRAWXzKkD3ZHhXKXgPDFzLndU
	//zWIeTHN2tG8pJCSc+XlJkJJN/gG2R4NoaM/Xk01E0FWFDB+4Aye0Z+jG5ioXw3s6cBP399E1Jpy
	2FchdqOBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lY69s-007sHr-JT; Sun, 18 Apr 2021 12:04:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY69q-007sHY-9c; Sun, 18 Apr 2021 12:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=UJsT5aV+MxRbho8JhRzNBpNeMbZUN3ULqGnvmwYqqo8=; b=FR0C6tw3DBJYskYkeYUd1NyZ6e
 +1KSNln2CPYIOM4O4M/aklnJtZQPMQRDfzcbtjoiGFdID7FRdu/EccR9LqQk2d7JijqUssPw+a4pg
 ZI+cJJAOQtC8LIcJsJBrNktScUA1rWDbfPauCCPyHc2j8M69OevzmgX3yBaaYpsoBWNCHEz19frfn
 z5TMdmhJv6f4eqN00JsbJBVt0/G3DljCMOsxbe9KmMY30MGjDdzleZ8LityIBrAsTqjyKM8xlIddR
 eVyaBPP3E3qRfHcsnsgqMSUQ2XYI3YnLPm6XB6yK77UuqUOUvhQ+lNZXUW4/scaED2c+kGrvKyzbK
 RIwoLiig==;
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY69k-00APmM-Cg; Sun, 18 Apr 2021 12:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1618747428;
 bh=UJsT5aV+MxRbho8JhRzNBpNeMbZUN3ULqGnvmwYqqo8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gtWAMLhVANHc5fa/MEW9QtadcRt6E3XfLkUMwhO75vFNJ9hSiCIcdBXyh19j4Glvx
 xlP1dPLK+L+gfju2A+suqWIgK1cDu7nk/k+Hk8vya2JdjeXOowr3KojS5rMCxKfH0l
 k494tuyFNJv4jIqxdj0i2T9ANWf8U/auoWtHGEaE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.75.88] ([80.245.75.88]) by web-mail.gmx.net
 (3c-app-gmx-bap31.server.lan [172.19.172.101]) (via HTTP); Sun, 18 Apr 2021
 14:03:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-93ab11dc-32c6-4e6b-8617-6bfff1a1b42d-1618747428085@3c-app-gmx-bap31>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Aw: [PATCH] thermal: mediatek: add sensors-support
Date: Sun, 18 Apr 2021 14:03:48 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210320080646.49615-1-linux@fw-web.de>
References: <20210320080646.49615-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:NpJG2XS0uVpmsDDBMEbodtzzfxpTnTBa8p1RkMykjqag/W3Gxr2tax05+zGq5AUWfZw8Y
 UR2I0pxvM9MHe0r8VhdDWkgQGBL1SI+8mAdYtMqgypfgy6RLOSe0qt1nK7c6agDFY5PfxSqpyO4Z
 wuBrnzufOyhYmZnoAymsyPyAXn2DXmF91+zeC+t21fCSauEkUxk78mx99SIl3IWAzCGwm7sT9tOV
 qAI+rAIGkZY8+FqJkyyuAffLkkKWZ7AsT6wur+yubLVNmz8hfao5kD5mi04EgQYx2wDkuWpwzz5T
 Is=
X-UI-Out-Filterresults: notjunk:1;V03:K0:I5KzL9OLaQU=:3OPO7RKu+UrbJhyuN6QKpU
 4BFYTNIp75gm+rV0iVvIjAnrZ4rj3UrvsoLuay+pCtGrHP3kS1gyMDoKaExubD2BtRxmnDcFP
 EXKFerqtjTB04wqUrO88LfpaXR73l0pGklAIgozu0o1JwZcj0Umk3S/bG6qd2vhka6gZH3jKh
 qRu0q85YFDxkMoCR6UUPpVEPnVYXeqHPNTdFN37xLgMWQ6okybKiy8tUUE+bUyeT2ZSVPD1yk
 2at67rwVhXuVNRDnpguJsZvuCBq9MJa5fWUHc/BZ4u54VHhg5HH6Qir6G8J48GSr6ZgzVdfWF
 p1FA/423VEpjXaXcAtA3tBTHaZAk59UAaiEn8hsDVE+UUwrb60yU3LAmxv8g0UrhJfDmYHsrh
 Gl4F4Cn9dkJEs266ePIsPs5U8XZ8yIBRtVlm/DYT+Ge3FHzqx90mSDbru7P8Cb72TdhZb4stC
 zb+HotaIeKhlrhZ7IbA57k62MuPtnAjeyawwjbZqzPnkb42UGomNLhwhjTnDyEFNvjezFFpfD
 y5rD4nGv3MbX/iTa+hRpzw5YKZVeCdbli2KhM3KWeQ8GEP5WQaBF9Eruhdvw1L3CE2jyPSMCz
 7K8Icw0Cf8kRzGRPxjMNukY07zv3tUyfUnBba8wMSmmdn8CcArkicuPi0i8/5ZZu5jVyN6+K1
 X+qLouCPOYByILOHs2fiFZVxcieOhdrk4fND/9bOBTRStLouXPo0aYprAGKXFpg2Yw7ZvHxDZ
 xFsPCVLNJE6nY/vdcN3WQViWdSHZK4iqsfTkN1eZUHW0WF2ORC5TDQOELbuapp321t3PbRyYK
 Bw3XYc3GqeMj2QKSR1+0lg4XQnhRLrXuuWUmN0DTw18tK/eZV4tCyn4MnqM9rUWjA178rfI81
 oX9ZfsAH+dh6HQ+BoZgsyLstw8Wrc5NgE3NKpQkJv+j1dSkcAiZcwjlHyVnblA5CKZ7/vcTyt
 VDaQZgQnZ+Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_050404_784263_5F06EAC4 
X-CRM114-Status: UNSURE (   5.05  )
X-CRM114-Notice: Please train this message.
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

SGksCgphbnkgb3BpbmlvbiAoZXhjZXB0IHR5cG8pPwoKdGhlcm1hbmwgPT4gdGhlcm1hbAoKcmVn
YXJkcyBGcmFuawoKCj4gR2VzZW5kZXQ6IFNhbXN0YWcsIDIwLiBNw6RyeiAyMDIxIHVtIDEwOjA2
IFVocgo+IFZvbjogIkZyYW5rIFd1bmRlcmxpY2giIDxsaW51eEBmdy13ZWIuZGU+Cj4gYWRkIEhX
TU9OLXN1cHBvcnQgdG8gbWVkaWF0ZWtzIHRoZXJtYW5sIGRyaXZlciB0byBhbGxvdyBsbS1zZW5z
b3JzCj4gdXNlcnNwYWNlIHRvb2xzIHJlYWQgc29jIHRlbXBlcmF0dXJlCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
