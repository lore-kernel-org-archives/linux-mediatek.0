Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9380C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:41:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 965CF20829
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Vq1nuBu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qYJcKTPW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 965CF20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pgd89swCRTtrx9XaSwOQLFD+Ivvo0WH12pSZ9SAC60I=; b=2Vq1nuBuUPEKu6keASDy0B8BP
	0tDe7RuD3UhZfECjG7Gx97A33FhFjO6Md0DWMqff7Pj+QW3S2YmdxHtzm1Jh2vthd/ue6wEGPCuma
	kP9QagElp52U/Je+A4rknGADy5QKiNqQNXb4I8BHq2QKtvM4waSTOyNtieed2sI37nBJE3cJhVKmM
	iRHpm60Ij9JpF6PwZCQkBu50gVE+ZIt5eciF8Agb5V4OiUBJe8d6a6frtrFI3OUOt2q98aBIxeDgt
	1a0CCLCFlQuIfI1/q4amAeDj8nfhWfy/YvvEDwnllabSmng7ZgL39Co/3JdVZQiaLhAFsvFpeZiqP
	TU/GS3BpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1RXb-0002bG-JU; Fri, 31 Jul 2020 09:41:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1RXU-0002Xq-FO
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 09:41:21 +0000
Received: by mail-wr1-x443.google.com with SMTP id l2so16832883wrc.7
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2020 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=blK2S6cH6qikd/XbUA6HFppZyi5UmFkTzQjVm4HqLu8=;
 b=qYJcKTPWZ/tbOoxgiSar9u8OlLsqIHNM2w7j0r/MKDA9uWzeRrLmOrBQMNLyThxO8+
 WdjRAwWDyig9Pe2KYm7WTkfn16dgYWGhGWWJJpdNH3oVhT54Hhbn5MA04BN3B4Vfcxx7
 BGQwJZkoPmj/pniMy9VKUAG5drnY86/yjhvW5zMMZejVLSbJbn36KxPMwtVQ31om84DV
 7gP3+QlT/SHSP0gwvagI6Oo/WOlba0fNglBmXUk1QuET0uUBN41VwqZeBVk+9L57rGGc
 Dl00XU9ZPofnh/BPtIbyJtimImNfx6bzbN1rjoegQyLThRCRMlX2/DLKVIWBDTXFDUaW
 tcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=blK2S6cH6qikd/XbUA6HFppZyi5UmFkTzQjVm4HqLu8=;
 b=Gz+gx4Q/AKBA6swqhpHTtMM0hy+HLLPy0u4NT07RVOEB7pRDkLY+BSlVw32Kq+Gj6N
 rTIrhqpNeFcQwk8I43bCbrtpIt7hRn9607HsgzWoQnD/jXnKhR8W5+A6eIq51PPw0aTw
 F7JDPVGaapKw/e40/xT6PpYYsRfXzu4TKQk1Or5Q6+gd8Zv29IxETDD+0epA3TX1k5+u
 LXSNynxqA4YiUInyT2eOipHQ31EzvVQSoZnzLDnaysDpyfU3xygMhYoI3EZeRSfo1NFz
 3kg2FNn6xIb6Z+wSsLS4nqoZveRXQBDvN4tmA/Jbx3A5OiJzbiH64VDGHGX4RUHzQYJ9
 Fjlw==
X-Gm-Message-State: AOAM5306XqHvgZ9X4DGsorejZoNiYEIGoq++9cJpO/cJTi4j9QNuwFeL
 364nhKg2kSAZ2C3/P3x+FwCpoQ==
X-Google-Smtp-Source: ABdhPJwNSLofjJwuFuHlU7XMv9pf4+e12egPsBdGARtG7JOGdvQEnjlxZrj7kRD3mLXivOz+KUA1JA==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr2772718wrt.67.1596188477304;
 Fri, 31 Jul 2020 02:41:17 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e484:a7d1:6931:9059?
 ([2a01:e34:ed2f:f020:e484:a7d1:6931:9059])
 by smtp.googlemail.com with ESMTPSA id
 t202sm11904350wmt.20.2020.07.31.02.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 02:41:16 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH v2 2/2] thermal: mediatek: add tsensor support for
 V2 thermal system
To: Frank Wunderlich <frank-w@public-files.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
 <1588238074-19338-3-git-send-email-henry.yen@mediatek.com>
 <f086c86e-7d7b-50c4-baf2-66022301adc7@gmail.com>
 <trinity-a82d184c-1a5a-4f73-84c7-bcba3d84d5a4-1596131147519@3c-app-gmx-bs42>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ccfa7b46-1663-3891-a7fe-76759c708a6d@linaro.org>
Date: Fri, 31 Jul 2020 11:41:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <trinity-a82d184c-1a5a-4f73-84c7-bcba3d84d5a4-1596131147519@3c-app-gmx-bs42>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_054120_820907_69F5AF42 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: Amit Kucheria <amit.kucheria@verdurent.com>,
 Steven Liu <steven.liu@mediatek.com>, linux-pm@vger.kernel.org,
 Henry Yen <henry.yen@mediatek.com>, linux-kernel@vger.kernel.org,
 Michael Kao <michael.kao@mediatek.com>, linux-mediatek@lists.infradead.org,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMzAvMDcvMjAyMCAxOTo0NSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiBUZXN0ZWQgb24g
YnBpLXI2NCBhbmQgcjIsIGkgaG9wZSB0aGlzIGNhbiBiZSBtZXJnZWQgdG8gbmV4dCAvIDUuOQo+
IAo+IFRlc3RlZC1CeTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+
CgoKVGhhbmtzIGZvciB0ZXN0aW5nLCBhcHBsaWVkIGZvciB2NS45CgoKLS0gCjxodHRwOi8vd3d3
LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGlu
YXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVy
IHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
