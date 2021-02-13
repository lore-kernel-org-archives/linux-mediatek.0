Return-Path: <SRS0=otxm=HP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEADC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Feb 2021 18:29:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4385564E38
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Feb 2021 18:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4385564E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q4K46PGsyLEect+ZxVf9lUl97VHvWqyCNi89t28xRoY=; b=h8kLrdhGmX1LRt
	8Agor1eC8sG+Uynv41lwkiMsbx2kaL4FfEL6nkv2kESB5Gf+Pe15+3p5HJWAdSSerufZ3VGDx1e/l
	00B9vqaNDNmWVf3TuaB/KWBOhGzKcLqIMoJAEPkOoggPxXog2pKvKJDVvn7jyMQ7HPL958qieGYdG
	dIJPIqHaJjV3vNBgK+EaYj/rJAiJDH77o5YfzdRa/PgFI5HA0Uv2adcBEc5EnXDuWAMzF1Yty1C4O
	qLOD2vL70cCU3wg/cIAMGYtCrx0NrS++iUnHI76Sqnfria/ZnwnA6XlAiEFVjCXaQ168XfdIOoSYo
	WWVkI1Veoa1anumwSbFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAzfV-0003EI-D6; Sat, 13 Feb 2021 18:29:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAzfR-0003DQ-VV
 for linux-mediatek@lists.infradead.org; Sat, 13 Feb 2021 18:29:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id b9so4766596ejy.12
 for <linux-mediatek@lists.infradead.org>; Sat, 13 Feb 2021 10:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=mQLFodBCSvyfsidHzpPOPRThjI7FqCYhJ8zNreHFwsA=;
 b=pRlVStwPk+/kn2lP4X+ZCIrBl3VMBaqLggRumkkINfJ4giBpCzGfvqBAhgOA7eMF75
 K2MIhX4AwhQvB1d4t4QtPzg16znBY6Cwd0LH7xHR/HsjXjjYcGIKLK4XaPFcyULY4iu3
 vOnQxubryYsHoA8RTqxX/VZiWuoXK6x0Tqhln4P9a9BoiGfqKn5tId1oRVMzx+p5GfHp
 h/mg7PzPDewojW7NgbnjZINxCu+mEPCkR/cNuDQaX+uUhL4W2eM2Ka7rc2tSjy8cxlsY
 HdITpvdbUloCam/pOf6Yv66aAo7lGdt/ngRSou3VjNQknslzqLx/bJIeF7kY1iG5NrJq
 uOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=mQLFodBCSvyfsidHzpPOPRThjI7FqCYhJ8zNreHFwsA=;
 b=uZABrvxLQBrFhEqJyTpQxWBwin8ZGMM1br/89A3liiJkZnyEbDq8UJ7FQroTN09Ghk
 rpJapO5oHdj/Js85YWiMq5mEp/kZHcoK7MsB14ugLWYVJJ8R9WU3zC5hQFXtfX7coaDx
 zYzX20QAdsOzEK4deJMPltrMbmDCtl/Oq+OLeeb+7pEZ2ygYW4WYIMcf2G1u7/8s64+F
 Fo0bAO1FXNSg7KaJPzK6si8eWRtjYqF9yFUA+E5giZuSKgNCz/YmhuXFVrPGsLEahAoC
 Tt+Je2sfUOsKneTFi7eitbfN6HTvweoTD6+zYglK8Ta5Ln9O0MSLrZDlyptAozZQyJyu
 embQ==
X-Gm-Message-State: AOAM5301OfQa0rMeDeWdPDEpQ7GqofDO4j4uv8PjZxkNBR1CQZms1wyk
 JyT9vleFrunJJ/hOtIQeWevGvl4tq2k=
X-Google-Smtp-Source: ABdhPJyX7R64+zfdQOCu9VChi15B36+xadLMysmE71PXobJvtAjvZBGPAFC86sAEQFCoAGS/k5opTQ==
X-Received: by 2002:a17:906:c444:: with SMTP id
 ck4mr8763029ejb.156.1613240954176; 
 Sat, 13 Feb 2021 10:29:14 -0800 (PST)
Received: from [192.168.88.26] ([37.237.208.10])
 by smtp.gmail.com with ESMTPSA id r9sm7881188eju.74.2021.02.13.10.29.12
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 10:29:13 -0800 (PST)
To: linux-mediatek@lists.infradead.org
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [QUESTION] what kind of support does MT6797 has?
Message-ID: <476cadfc-8da0-bb82-ea4d-55ee18735f89@gmail.com>
Date: Sat, 13 Feb 2021 21:29:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_132918_121623_684D5D21 
X-CRM114-Status: UNSURE (   9.01  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCgpJIGhhdmUgYW4gb2xkIFJlZG1pIG5vdGUgNFggcGhvbmUgd2l0aCBhbiBNVDY3OTcgc29j
LCB1bmZvcnR1bmF0ZWx5IHRoZSAKdmVuZG9yIGhhc24ndCByZWxlYXNlZCBhIGtlcm5lbCBmb3Ig
dGhhdCBkZXZpY2UuCgpGdWxsIGRldmljZSBzcGVjczrCoGh0dHA6Ly93d3cuZGV2aWNlaW5mb2h3
LnJ1L2RldmljZXMvaXRlbS5waHA/aXRlbT0xMDU1MDEKCk5vdyBJJ20gdGhpbmtpbmcgb2YgcnVu
bmluZyBMaW51eCBvbiBpdCAocG9zdG1hcmtldG9zKSB1c2luZyBtYWlubGluZSAKa2VybmVsLCBz
byBJIHdhbnQgdG8ga25vdyBpZiBpIHdhcyBhYmxlIHRvIGJ1aWxkIGEgZGV2aWNlIHRyZWUgZm9y
IG15IApkZXZpY2UgZm9yIHRoZSBtYWlubGluZSBrZXJuZWwgd2hhdCBraW5kIG9mIHN1cHBvcnQg
Y2FuIGkgZXhwZWN0ID8KCm9ubHkgc2ltcGxlZmIgPwoKZG9lcyBwbWljLCB1c2Igd29yayA/Cgp3
aWZpIHN1cHBvcnQgPwoKClJlZ2FyZHMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
