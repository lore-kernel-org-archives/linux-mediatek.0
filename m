Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DEEC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:27:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D13613AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6D13613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=avH1qUKWZqzHGo+u0N7VfhadFJjGxv0rPYpZ6KJX2J0=; b=RgViNE+Jb91JZqQmJPFF4kSsv
	LkIgWtQaQqveU0SB+Onfc5CB6v+UBgfySd/WfQuS45cl5oRKE8D4iOZkk2SCQlLl7BV+wTNrH06lL
	L4deAY+wGZjWAdam0aRTE4yK73CYUC2r1AmBmCCxCTx2VIO7ri3vdcDlBWyi6q1cHh8ZB7by5D+ra
	PKNozmk3E4WLHYzI2yEdsEIHCyGnh8rmsDb71nB5TYWyHZ/Zq5maFSYA79WVUILwWFSSv1h4oF35+
	FcaFJ6wXkD9w/Np/x8uiCVnzGXZq+jgR1OolmiBBhrU8O+wbJvilVOt2EvzFaFqtBsljfMFxj5JGy
	6kEG47H9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYsHr-00CTqe-PU; Tue, 20 Apr 2021 15:27:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsHe-00CTmL-0V
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 15:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jM4HPTHVE1i18kTLntQk5Un7Ipi3bGzznJhmm/wqxNk=; b=zYDdXVKM4nnlBHhypt/+6tAgcz
 hTgx+aG94TTOI2qr2x0MIqTMxitibDyYHLwPGBVAxRcv+oAHYdzLkyPPQW03GQKFcytnVPIYWvdhD
 sATjH5yU2wwuusc1gvYP9OUg4/cVtKOS1WqSYUoCZ7G8TrMz2wudnisam+cg1t5BmupnaircjeZ7+
 aQrSCfpseEaLOAkFA7T3P5z/FZxVFdY3bZoAMuqdM+aeM/JZWW6ELJDAeQgKShntCd1yn0V5kZQLG
 GDFar78qS/uNRloygxAsFNZAekNuK1NE1mpQYnB0NzYXyGUZLkh+eeNJDvJuLLTWeLy+b5jnRJ0Ud
 pakrqAaw==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsHZ-00CEZl-3F
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 15:27:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id k128so20412795wmk.4
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jM4HPTHVE1i18kTLntQk5Un7Ipi3bGzznJhmm/wqxNk=;
 b=XUM56xO6qMQN9Aa7DR7Un+8zyg+8IaYdGdCmXjgZpfZbi3UddQnQeZjEMSoWDLhD8x
 /7wVBMAVYolnfGTnRc/E92kJt/Twt8eOjN+iFLHzuiXVm2D7cc5wUoTPM2oyzQMQmN1Q
 6ArqIHP8rQSHLaZ+C1niXlw9P+Z+56mQfJOpu8Wxt2J7FcxIUcA/21RRoDSsiYF/bIdd
 P0imvAZ5VyuTbkBeRogLQxmR8IqF3+GeDU0ra7ybNefKGpkfNJ8qDpfhvDF+aSOqusdU
 cFzNq8Zu4n4IDXTLKfLU7phOgRazle5mit0FvE+dc/0OhoUmtmnigiG3Kc5UWStyPc5m
 fdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jM4HPTHVE1i18kTLntQk5Un7Ipi3bGzznJhmm/wqxNk=;
 b=phHc0LVpr/3TcJm71x8jjkqERN8lk0HzsHU4zWSK6RMqkP7kfT62qd40dYIxgxTIzH
 pB986u1Ki1lHmFqEWU4YfKEoJkjgrQ8eymcP7IucBFq1cbFy8ABUKd530Qt/S0AwXtHx
 SCqCvRbHOfhYQRjcce79FWjVXGPQ9Cql9o+al6QSpBp6OFLjQcdycdwvtNTF/RqXEgpm
 MYNNheZrxPTetLV34irfyOTmtl9zk8J/PgwaaSXZL1Bd5IXPOxNUsiQw5Lb0WACAQAMK
 YO7pKmfc8Qtd055pJlriu/NdyOpOjEqoacKa71Nrmxb5EfuGQIBTdHGemsqnMjIsqY77
 moaA==
X-Gm-Message-State: AOAM5302TtoFUsJ99f+h9/PiJ8i/PFoIjwdg+Qpr4AaeYcE/0ZBjSS9c
 fZbTOE0h1BXbuq4f/tZ1zfBkEA==
X-Google-Smtp-Source: ABdhPJzu6SnxVt8JGXQc7mXw2W9R2/li/7Lf5f27wuyubM/gpnqLy0ueNIR2ppNIhIgV3DFvHTAUbA==
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr5109056wmd.30.1618932438646; 
 Tue, 20 Apr 2021 08:27:18 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a079:f96:da87:2d00?
 ([2a01:e34:ed2f:f020:a079:f96:da87:2d00])
 by smtp.googlemail.com with ESMTPSA id o18sm3471746wmp.26.2021.04.20.08.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 08:27:17 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH] thermal: mediatek: add sensors-support
To: frank-w@public-files.de, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <linux@fw-web.de>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210320080646.49615-1-linux@fw-web.de>
 <f4329b1a-02e0-aad5-55bd-82d30a38fc55@linaro.org>
 <trinity-4a3f024e-c01d-44e4-a884-530135853d33-1618930770250@3c-app-gmx-bs72>
 <b38c3539-c864-67b3-95e8-9b652cf6fcbf@linaro.org>
 <846366E9-5029-4C6A-B2EC-F70D901DC379@public-files.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <39eddcac-a86f-9259-6a1f-d3e39d872bb8@linaro.org>
Date: Tue, 20 Apr 2021 17:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <846366E9-5029-4C6A-B2EC-F70D901DC379@public-files.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_082721_146480_F69E4A8A 
X-CRM114-Status: GOOD (  10.15  )
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

T24gMjAvMDQvMjAyMSAxNzoyNCwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiBBbSAyMC4gQXBy
aWwgMjAyMSAxNzoxODozMiBNRVNaIHNjaHJpZWIgRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpj
YW5vQGxpbmFyby5vcmc+Ogo+Pgo+PiBIaSBGcmFuaywKPiAKPj4gVGhlIG5vX2h3bW9uIHVzYWdl
IGlzIGEgYml0IGZ1enp5IGluIHRoZSB0aGVybWFsIGNvcmUgY29kZS4KPiAKPiBNYXliZSBhZGQg
ZGVwZW5jeSBpbiBLY29uZmlnPyBFbHNlIHdlIGNhbiBnZXQgdW5kZWZpbmVkIHN5bWJvbHMgb24g
bGlua2luZwo+IAo+IHJlZ2FyZHMgRnJhbmsKCk5vcGUsIHRoZXJlIGFyZSB0aGUgc3R1YnMgaW4g
dGhlcm1hbF9od21vbi5oCgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAg
PGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDov
L3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
