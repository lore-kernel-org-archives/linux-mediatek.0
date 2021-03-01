Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3DBC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 10:23:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A269064DBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 10:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A269064DBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FkmQ0IwFMCQAFcPjcGaL+M42+PQDN9q5rYrzGaHcWsg=; b=PTM/BHWdq2GQYwFX5rPeUYbIT
	iI6PsCviB2ZRhE20eV+sPO4/Q/uNM6QpzHDuviXjdQvUHbC0G2PZSIbe4AqLDLnBpZkAEX0/kLe/3
	ZBiKELt/3HGU2swGfkXR8KPAp6i+v9+xORxPe8dZLFwA3XYGwyZfqyTQsYVnTEEdnBe4c8xBR/tbF
	TmMvleovNtH9+3VNwFcahGcwGhTYuu5EZ1Dj4uZqvIOCek7/aq4raZkc9JyCgAxK9te7NgTeWsGqi
	+JrY+9FOwqUHPK7fAoZhO0rrmz6sGccfIYFxKgaDJNN9YfwfMNH7GQISBodPp6zeWviifxhIFUwG4
	k/7X6oI7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGfiD-0008Pa-8f; Mon, 01 Mar 2021 10:23:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGfge-0007Ne-7d
 for linux-mediatek@lists.infradead.org; Mon, 01 Mar 2021 10:22:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id h98so15480700wrh.11
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Mar 2021 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fO30ApwIwTZ6ViBN1Ge+IoLrpzbpt+XR3EbBXQz0Ao4=;
 b=OCOdfFrla8ehIgwoRPFmxKWVA5obG0UC2lRwXNbMWzvuKfpxOkp5Bro5tWT0cE/w9w
 x+bA+Czlt57JU6a42SkfptvC3JuGPA6StIHjWCY+RTvYQTW026gTUD5O4rbJHxolcIvX
 6oZ09xRd0HxZxSSov7dwBlVVhAQExMpyZNo1z/MlMXkzP1CodP7I6cY+mJeBwcH/Aw89
 6BG7KC7nt66322RaxL+SjLPIeBY8BWEPKjxGKwxkSugDprrUBSDKLLls5QlL9n84JSga
 6PvlPLDGTxOh21g88Zkz772Y4umW317CuFDEnDR9obAYTK2Mcgbf9/9ACljkOOJc9MRf
 iXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fO30ApwIwTZ6ViBN1Ge+IoLrpzbpt+XR3EbBXQz0Ao4=;
 b=jilUAVwON1T7Qaahk/zwAUx/jC30E1c6a1UHPsTV6/0PnOoV1TmsaNXPbmzuAR4eWs
 Z2MVGPby2SD4ZjRvQhky3y3H0AwcWSdHZy2U+MXoa9xia3bMmIdJpivnHI6MOHJLc0yL
 e6AY/w+IiDZ9wCJMw1RrrvrAM3q1PcgAOoTGc9TtXhbegwGGtr1Ts6xfZFa8RcDQsfnW
 HeXNPts7XfXK4JeCIoZ8bcwiSkhjkWcQw6o0A1lfTUhmmi6MjnjbLu+lvjXEvdT3ioip
 MmhFLtkThCtg70vVmmjHWMrxADhBax1m3NOI2zIPX4l0owCw0EwQu3fcguYGrSf4UNNs
 iT/A==
X-Gm-Message-State: AOAM5331ILweo61R04RpK4aEX1u4J0hcgSu9CS+kp9tK4y57mqAmnBox
 FhOaNMjJcOwp+MdpTiRXORfaAA==
X-Google-Smtp-Source: ABdhPJxAXiZUsHcR0Rc2xEpcKrMkbJ4gJn1n7JbYEm1p5PO/WxOTQnHJpHjB0WesA4oRThRvN58PLw==
X-Received: by 2002:adf:d217:: with SMTP id j23mr2045527wrh.113.1614594118833; 
 Mon, 01 Mar 2021 02:21:58 -0800 (PST)
Received: from dell ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id m3sm7999205wmc.48.2021.03.01.02.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 02:21:58 -0800 (PST)
Date: Mon, 1 Mar 2021 10:21:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH RESEND v5 7/8] regulator: mt6359: Add support for MT6359P
 regulator
Message-ID: <20210301102156.GJ641347@dell>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611913781-23460-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_052200_473812_C6C294D3 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com,
 Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyOSBKYW4gMjAyMSwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gVGhlIE1UNjM1
OVAgaXMgYSBlY28gdmVyc2lvbiBmb3IgTVQ2MzU5IHJlZ3VsYXRvci4KPiBXZSBhZGQgc3VwcG9y
dCBiYXNlZCBvbiBNVDYzNTkgcmVndWxhdG9yIGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBI
c2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiBj
aGFuZ2VzIHNpbmNlIHY0Ogo+IC0gYWRkIHRoZSByZWd1bGF0b3JzX25vZGUgc3VwcG9ydC4KPiAt
LS0KPiAgZHJpdmVycy9yZWd1bGF0b3IvbXQ2MzU5LXJlZ3VsYXRvci5jICAgICAgIHwgMzc5ICsr
KysrKysrKysrKysrKysrKysrLQoKPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU5cC9yZWdpc3Rl
cnMuaCAgICAgIHwgMjQ5ICsrKysrKysrKysrKysrCgpBbHRob3VnaCB0aGUgY29kZSBpcyBmaW5l
LCBqdXN0IGJlIGF3YXJlIHRoYXQgTGludXMgY2FuIGdldCBncnVtcHkKaGF2aW5nIDEwMHMgYW5k
IDEwMHMgb2YgdW51c2VkIHJlZ2lzdGVyIGRlZmluZXMgaW4gdGhlIGtlcm5lbC4KCj4gIGluY2x1
ZGUvbGludXgvcmVndWxhdG9yL210NjM1OS1yZWd1bGF0b3IuaCB8ICAgMSArCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgNjIzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTlwL3JlZ2lzdGVycy5oCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
