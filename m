Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FF2C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:21:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC62720663
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wWf5tPq9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxslYgCz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC62720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bxNRGnFIpvLWeu/Z/kBldrFSQitwnNeMfAGAlkYH33c=; b=wWf5tPq9KlKWPtRscfj3OLdYs
	fR8TIZJBmQk8dsnOzPR0u9bqGV1XmLoIuwqrkaq3UHduc0gtjAbuDSkU958OjoJ9fRSJXx2X6iimx
	EvArpIJBtgJ2+TxIrcEzsXI7Op4P9NSNcR6A9+qFnTxO5gJ3NNXFqeB2v78nXOk7VSNCQp8tuF3NR
	RtxlRfcHvRLKbS7i0shZYf4TPq1sg0GkxIXXej7Yq881TZ7eDo6Upj9dwJNhdvaUuys8CrZsNd/iP
	+twJvQQuoTubitroRTZ11Y+EJRFJJvLl3RPZBbfTrP3SuY29W9TKUnL+wJfDQ77bcUwCNGGaAYB2W
	MNSO63jyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k028W-0004XJ-VY; Mon, 27 Jul 2020 12:21:45 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k028V-0004WV-27
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 12:21:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id 88so14666575wrh.3
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pq1ET4NeB9RomAbsurjDGpllwmR8q23My4GbeazFctg=;
 b=RxslYgCzUp24ps37t5tlcbtukh5HBY2gz6DM/5CtdbQfE851RX+lF3b6YXu4hkEPSw
 LiHLUuA/LfwQPz9HAg9qK8uvB9tWnsNKFRwBRfRFPOWTRAaBfjb86rv3clMhe926LEwE
 vDiVz+Wxxu2W9w2EZ+Ehr6i/bw6yc+/p4RBerJ2CVWS99+THB4CLkHAvpoQib7O6UnHl
 UYzW3txmIOY9gMveuWLO/I0+6a5HOTgt3qI5cV50CN+sr/RCkbpwbv9KWJPy1u5sbGVq
 Fax8XWSNjxaYLM+yx91mlELxzpopp4kNnwqUFR+LLXULM5fDBzbQc4Rc/aMhoTuDLe1b
 QbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pq1ET4NeB9RomAbsurjDGpllwmR8q23My4GbeazFctg=;
 b=L8wqnibEFl0/W0QoZKDEqI3NCBBXZ2XtHjJps4JycatFjJYl4UPsB+7o3g5EtWk7h1
 maSkM9iE+uHiCwF+UHWIjVs8S9+r3T7+7GhZSiugXuqi04MDhpjjxsCTup+W+7jKC7Iv
 KCknLUjpzXrzOhTW1VqtoJ5G7uVJaYpc+geDYN5tzr0ts0HLxlxQUq4pXTt5sIjAl6tY
 yPw3PaX6aKSTaXQY5zxuMHonNrErvFkArepkHTfkt2kQjLy/Au9/1PxokUnBNWtfX93e
 Csbx4/pRI/wqQxUJDe/Dh46ffJsrXbAw40mqf1l7qhyWmfI8S5tbXx6tC6LtfYNENgR/
 W6/w==
X-Gm-Message-State: AOAM5320v6yhmBL8/07srbrSWsO4sFipJc1/JTQRv/aZgTXQ7UMVaKVV
 NYcq+1kAmoHLtMJZRYwcaHzEAg==
X-Google-Smtp-Source: ABdhPJyUbsfFbNt5s9bDOFEt/5mlBl8zmfH9uJA2kUAGXFJxr+iNBvBeHJmG26RIXYLYOgE7QsGFfQ==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr19740256wrt.159.1595852501921; 
 Mon, 27 Jul 2020 05:21:41 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id c24sm12625308wrb.11.2020.07.27.05.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 05:21:41 -0700 (PDT)
Date: Mon, 27 Jul 2020 13:21:39 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 6/9] mfd: mt6360: Rename mt6360_pmu by mt6360
Message-ID: <20200727122139.GM1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-7-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-7-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_082143_218960_EC04F615 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBSZW5hbWUgbXQ2MzYwX3BtdSBieSBtdDYzNjAs
IGJlY2F1c2Ugb2YgaW5jbHVkaW5nCj4gbm90IG9ubHkgUE1VIHBhcnQsIGJ1dCBhbHNvIGVudGly
ZSBNVDYzNjAgSUMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNo
dGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyB8IDQxICsrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCkZvciBteSBvd24gcmVmZXJlbmNlIChhcHBs
eSB0aGlzIGFzLWlzIHRvIHlvdXIgc2lnbi1vZmYgYmxvY2spOgoKICBBY2tlZC1mb3ItTUZELWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
