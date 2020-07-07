Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4DAC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 08:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C421206C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 08:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPIYlxxt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWrw+neG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C421206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OSpgZISrdaE8U4x7+qJbfmQltX/xhGGIG/4A9oAfioc=; b=iPIYlxxtfJPGnzqIrG8uRHVq/
	Aij+0gjBzDjDFSp7AemT7TTDOIB2YyYZroAhw/SI7hqmnJfpCOp+LMjvIacuMquqRFCjNlCRAqZxV
	6ijRAbL02B044hGzwmgHIYf4vzghFsGG2SgZUOOOwYpoIwHIjTAvc0UKL5Vm/h1sKmdxWEGKJrn8Y
	X/0dbi2fWyiMfB0CpQntPV0HCepLYabEVMHoVb79sh55ADqjnPnsodyhF0m9TcfjR189dnXAaJXrn
	195ec15Cq3O0mgAtJcCY9ixeWVBzFzDs2x4k5/c2oNKukFUuatGQcCv6uiURbhxc5VSHWPtAWTN8g
	mw6WdxkaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsihu-0008Hl-Jn; Tue, 07 Jul 2020 08:12:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsihs-0008Gz-Am
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 08:12:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id s10so44104398wrw.12
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 01:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Om/XPTjADVYkykZwGGFhhFw2NeXXFx1YufzyiN0meo4=;
 b=xWrw+neGQIhWOVrb5t79sZctZYqc9AE6XcjS3FBux/54b/eC8cbjSLQa9KFB+RJg+N
 oaCg0wLHKYUfcIU74uKd1Z6XwHIUYbHhfptA7+xShXddi/Ml7/2Te9sIpB+4D7+r6Yo7
 6DPuwoU705hm0jcqPc9e0rVfcsfM6JViJXUwstRlgn6/F8/3MmIvbb+cru/4pJZB1fs+
 t337Iv9MFUTTi/uFZmfj9IGhxT/Boj8h++Y+dACbPar4QahxNUXg3Oe08NuM3/nAgF0Y
 xUw0b7ctgsWAE1vJPIZmYcW4Ca6lddpUTU5xa4tDiS5rj/VDWdAVANFajmNweEg45Lsr
 091g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Om/XPTjADVYkykZwGGFhhFw2NeXXFx1YufzyiN0meo4=;
 b=LXsLE7zbw2ch3fbkBBbk6R1IIfBy8PMheDh4T6+9A2rD1YlhgojF6x674npD2iGBiJ
 Q+yCBwdW4cMw8rMn4e1vgM0PkHnsHoCHEE3SwLuKerrBuvqGinOelY1Sk/Bah5pzDK/Z
 Q0DzZ5F1TMLKOAYfKViEB3IND2adhNpc444/K63+iTmU3XupgsldDx4sgnZlrfm1WCuK
 MPyTs033M3OGDw28rkp7iMgbk6DWSmYGXt3RA5elc6lWjaEGr51R+VXJO9VPAWp+l1eG
 Wbz2vx1fxLzvNGA/tlIa/qwzHdq2G/RBpkm5qWg+JsAq2dLOuiiYWLMUkBldo5lEen1S
 WXlw==
X-Gm-Message-State: AOAM532/p0TTw85gSiCjxkZ5W+cCisor22zlWm1gjq382MX9GcKpi0Gn
 bw936WeXzyrjgV9k9vh/7kYYgA==
X-Google-Smtp-Source: ABdhPJyhQVBRWgi0ZALecoxb1nyzRu8gH7Pag6gT9p4aJ7+hhF2+R8SBeh7THJGM/p0LXX3DfDzelw==
X-Received: by 2002:adf:f082:: with SMTP id n2mr55669814wro.326.1594109519219; 
 Tue, 07 Jul 2020 01:11:59 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:b4ff:29eb:619e:318?
 ([2a01:e34:ed2f:f020:b4ff:29eb:619e:318])
 by smtp.googlemail.com with ESMTPSA id u15sm29087207wrm.64.2020.07.07.01.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 01:11:58 -0700 (PDT)
Subject: Re: [v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL
To: Michael Kao <michael.kao@mediatek.com>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
 <20200323121537.22697-8-michael.kao@mediatek.com>
 <1afbf412-fbeb-8abe-66d8-bd7ac4e9dd83@linaro.org>
 <1591329023.12739.0.camel@mtksdccf07> <1594090621.20216.0.camel@mtksdccf07>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e7a14d36-7bea-eb05-0573-66951b788e37@linaro.org>
Date: Tue, 7 Jul 2020 10:11:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1594090621.20216.0.camel@mtksdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_041200_401600_61D6D6DA 
X-CRM114-Status: UNSURE (   9.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDcvMDcvMjAyMCAwNDo1NywgTWljaGFlbCBLYW8gd3JvdGU6CgpbIC4uLiBdCgo+IEdlbnRs
eSBwaW5nLgoKTWljaGFlbCwKCml0IGlzIGltcG9zc2libGUgdG8gaGF2ZSB0aGlzIHNlcmllcyBt
ZXJnZWQgaWYgdGhlcmUgaXMgYSBzbyBiaWcgZGVsYXkKYmV0d2VlbiB0aGUgY29tbWVudHMgLyBx
dWVzdGlvbnMgYW5kIHRoZSBhbnN3ZXJzIChvciBubyBhbnN3ZXJzIGF0IGFsbCkuCgoKCi0tIAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
