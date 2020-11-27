Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163A0C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:29:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B390206B2
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vGvT99QB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kjNQy3nh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B390206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IlrLYyozWypE039zmoLc6jS+Y3ki4lVZsP/+wJQj7ao=; b=vGvT99QBmluapFTkiymj2Sq1k
	3+56ToJtfY8r3gaMlM1RVBoowPmFg6OaI2tvBmuDMH6g7T8bne2T2Vqg5yfN81wasxQcbPXLx/E5C
	fHNYZdEURzKDsBaE1uXttKDRN4MF2yZoMKn9oj7VQI8RN1ceDxWvH7CT5gRUY4wL2AfRgs0xzBomq
	7fhXeLtcp7Xn66v1Hv4yDjE/DTseeE2xeo8lpS9Q5K5Zv5vcS5edVvCH5Y3jASVxtzXTdzjz4yZsE
	z++aXQxdFeoH0Np3UH4+2hQppXgmwyzXr0P2Im5Mj2++Ap7hHGARH8OteJCcbqzhHgMbYcy4t1ODc
	DK2Rn285A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kia4Y-0001Pl-5w; Fri, 27 Nov 2020 09:29:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kia4S-0001OY-Nt
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 09:29:41 +0000
Received: by mail-wm1-x342.google.com with SMTP id 1so5857574wme.3
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2020 01:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ev967dxFte9OFk/FlLebu9t70Z0aPWOKCMJc2joTu6I=;
 b=kjNQy3nhmsYJ29GqJOawmFYupvRUeFLOeuZSOa4HBhulZKUXaMFFdWuF0wyMzJV15f
 2Z5HjHwbyBhHuzyAY39tyqwI/K6UratOcGjB/u4twbdYIHmLNbEajnrl4kZ4qNevonkm
 Y1eYGNEjDd+sRAehSNyrDqnOWuoKr60StKwnVJj+YobYpddujSvOGaFq2e/m39coczwj
 juQTPh+2v1zHBE1YECdWhFFqfOH9mehdcAhIW1epDggez9CsWLQmlpFAk7A2gzpLt1Jy
 +oWMCO2Vn6/PJ/mVeG5US+B0oAcU39mbDzsDL62IIWpTGOq8j4zOeeyFDnh5jwtC1VlA
 btCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ev967dxFte9OFk/FlLebu9t70Z0aPWOKCMJc2joTu6I=;
 b=ex1P07g9h3SC0L+1Ook5dD++hx4EioefR2UpRbLyjuGsvUnu5BSqo0YddIWa24mvwW
 9Vvr6rxJb1C7vdVjigiUIWa+xDJ5t3AKNmT6H7fClEwm4qXXDkwA+lnrVU8BBghDLaSX
 ljEnozKsk+cpm9BC/WVToFbZyYKtK0pu8ctBE3Ut3ek1V6LNr/SNa+JIrJh5auEd2jI1
 CK97uDc8HObkYUmUa566WkmdCP3I6p62miSgujAXsJJAXcq53IKGrV6R7i1L0Sg+MPyC
 bUrrbsoES2nbu36qGd9GkzVxvjwMPQC7J2XD+5uEVWYNIxCd/EM2zAcGdfD/GeXnGHWt
 MARg==
X-Gm-Message-State: AOAM532gAEtiNha7hsMEq5x8qh179NThNDzpLdpiy3vKC2/HiWnmMh0p
 cIb9T6OusDeODqtpyX0COdwh5g==
X-Google-Smtp-Source: ABdhPJxKFlW9DFzkz1ig5ZJMa0hLQOUNltALJm8SRZsGKnNIuq0oatMB/aLoZxjolx5LW69kKIHLsQ==
X-Received: by 2002:a1c:de85:: with SMTP id v127mr852773wmg.178.1606469379121; 
 Fri, 27 Nov 2020 01:29:39 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id p19sm14377838wrg.18.2020.11.27.01.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 01:29:38 -0800 (PST)
Date: Fri, 27 Nov 2020 09:29:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 1/8] mfd: mt6358: refine interrupt code
Message-ID: <20201127092936.GO2455276@dell>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606103290-15034-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_042940_914528_E85EE1E4 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMyBOb3YgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gVGhpcyBwYXRj
aCByZWZpbmVzIHRoZSBpbnRlcnJ1cHQgcmVsYXRlZCBjb2RlIHRvIHN1cHBvcnQgbmV3IGNoaXBz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tSHNpdW5nIFdhbmcgPGhzaW4taHNpdW5nLndhbmdA
bWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzNTgtaXJxLmMgICAgICAgIHwg
NjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvbWZk
L210NjM1OC9jb3JlLmggfCAgOCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9u
cygrKSwgMzIgZGVsZXRpb25zKC0pCgpGb3IgbXkgb3duIHJlZmVyZW5jZSAoYXBwbHkgdGhpcyBh
cy1pcyB0byB5b3VyIHNpZ24tb2ZmIGJsb2NrKToKCiAgQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2Vu
aW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
