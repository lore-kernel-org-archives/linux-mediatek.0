Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06126C33CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 08:41:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0D62073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 08:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pc5wFQdi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxw6Ec/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0D62073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0B6pjXBZGUja5Q/qFtPE3lRbICTIusCruXpHyamAWw=; b=Pc5wFQdiFKSfrA
	GV9xEYz0mQXHpyvlhU2abt6aBjDAlm4RkaA0tV8ZWdNvi48VrNEJz5oHG+HXJvJD337HVdadR/tWT
	pdT/LfifyKsIa2Slh7RHRLKejslHnOCNOXcVsxTB56Q77mFMG6h5XGI2EXHRz3KwWuxLEKLIxAZre
	lAq70nPBuR5xYama4DWQ3ajucvmuMjjPOGi2Kq8HB1mw6qnnZzUf30CFaAt56swC/vtcDf+hH1nvq
	/2XHwXVJLAZ0CJTcA2H03Z+CsxfLo9DAMpTBIdZLYjjre0PQscq6bA6CF6KG3EmIUbDMBns7GwoBk
	hp+yvHidXd/DJ8uhjVzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itScO-0008He-Ag; Mon, 20 Jan 2020 08:41:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itScB-00088R-0C
 for linux-mediatek@lists.infradead.org; Mon, 20 Jan 2020 08:40:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id c14so28524663wrn.7
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2020 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=YcyMDNxU6CeZD0M4XJTzTVAVqgpQcDsBZ5eIyxVur50=;
 b=hxw6Ec/TOFHL1uviTFBXvHVns2s9jWeNiGPGY/t1nMnDss7ykWrKFU5OtlWIUYN/rn
 CSz/bR6YM4gxEe17MPUqY2sokNN+JOcvbUGn2uDJDb3DIau1C1LqvB4qjiulY/yHM1CS
 d/VfmvGC8KOnS0AHEyrqYUnG1QVsZgPJcxH8+tQSNrNuhR6Cjtso48v5pIUyorrMwyrg
 VXYIFb27EiVo5/RXvhpRR1RlvZZU5jsohwFCoBsLc1fKCk9sUkeNZgw1v+m7IjsYaOo8
 nQJWeVM7a+vNKAp0AigC4Y1uuJ067vY4nlXZ2IdjfSeym3L/srI6T/cKHXIb0xUZy8jY
 gJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YcyMDNxU6CeZD0M4XJTzTVAVqgpQcDsBZ5eIyxVur50=;
 b=IyQzwLQuB0lAGZ4IY2dRTyyDMemBVYJXf4RyT2SHUOBLIHpb3oGv8VIicnNQlzkLbk
 b+muAWTOaogVeaqf/io9RnHilRpUJOKRlKtY0SICfeK+7cwK2NTnf4xghLyETPh/lC9n
 yLxf6vO7aMY9MhOTO7G0Bf3cwEM8/MSOxomIDmuCfHzuKzr18+p9cFTx0NKJvZmcSGp/
 j9wcihflazTotcuNzkofoJdDwyL9MqMIOwMnLZmvw6oGlm2Uo6JK5sX86L89WASKI7yG
 R2GFX/Xq7B8PBj50zSmOUfyW7C2BrB/ltkOJfQmXEeqz6CWDX7Iw7bMNqN/yjEHUK5om
 3b/g==
X-Gm-Message-State: APjAAAWqN5+Uk4ue6HSwmZulVKUt4x7dhPov0lsasiVdJr4+FFw88Clj
 mSPGqXr+IJlpptz+vuP6+ClKXw==
X-Google-Smtp-Source: APXvYqyFzecxKx1E4K2sGz5OeZKOZDc0OJZI0IE0kmHpxY+jcimDKMgxHvzb7SXw0xV4Pn/XfxamKg==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr17024029wrr.421.1579509653290; 
 Mon, 20 Jan 2020 00:40:53 -0800 (PST)
Received: from dell ([2.27.35.227])
 by smtp.gmail.com with ESMTPSA id x6sm21451676wmi.44.2020.01.20.00.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 00:40:52 -0800 (PST)
Date: Mon, 20 Jan 2020 08:41:08 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Wen Su <Wen.Su@mediatek.com>
Subject: Re: [RESEND 0/4] Add Support for MediaTek PMIC MT6359 Regulator
Message-ID: <20200120084108.GV15507@dell>
References: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_004055_050535_1211C345 
X-CRM114-Status: UNSURE (   6.70  )
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
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMCBKYW4gMjAyMCwgV2VuIFN1IHdyb3RlOgoKPiBUaGlzIHBhdGNoc2V0IGFkZCBz
dXBwb3J0IHRvIE1UNjM1OSBQTUlDIHJlZ3VsYXRvci4gTVQ2MzU5IGlzIHByaW1hcnkKPiBQTUlD
IGZvciBNVDY3NzkgcGxhdGZvcm0uCgpUaGlzIGlzIG5vdCBhIHByb3BlciBjb3Zlci1sZXR0ZXIu
ICBQbGVhc2UgdXNlIHRoZSBjb3JyZWN0IGZvcm1hdHRpbmcsCndoaWNoIGNhbiBiZSBwcm92aWRl
ZCB0byB5b3UgZm9yIGZyZWUgdXNpbmcgYGdpdCBmb3JtYXQtcGF0Y2hgLgoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
