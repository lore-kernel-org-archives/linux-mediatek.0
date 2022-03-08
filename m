Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 08:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVPtvno/+C/MjegO6+Jg3n6FDWRpi3+6E412sqMjB7A=; b=wsDvCBoFPHGFP6
	TCcABI3biFOhR+PKMlBWHpanueii7mhRixnI08VqY7GY+QsnB3SXgP0BcWfY5s9hv9htOv3wgFu4g
	u7su4BpFWYd/53qlUes2ueBSf92vTXdar4EH9d9dGXtw66LbwMILBFBM3H3loRwh9aULJxEeqkCyI
	3nvZ6oZH+9bJfz/kbOZTzTfIontRaaLZIj3/h9c6GZhc0yHpHRspNmoy87Qk065/OWtJViwb+mE9s
	ssJnr7s93g78wm2mFbAB+Bo+b8gVHfP60jypo3FZn81FZGVxE87Wnee5E1KOhoLvh0P838qZBU77D
	I8qACHRPgfXdgtMlOr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVDJ-003GAh-IM; Tue, 08 Mar 2022 08:29:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVD6-003G4h-5q
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 08:28:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id k24so17731585wrd.7
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 00:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/uGXHNy/zDLI/MTkJ+zXxBEMLylwMy1wmMJ4HzLQpqg=;
 b=mx6SxlDWkIf87UH9JfXgftYx+tfPlL1e7u0ITMXbv4LqLWgHZ6Kim/bBTNZDWsNK+J
 6xzmoI8Zcuwn9zaGfZ6bSIDftCnQAN93XWUyAuH01477nvqn82x4zC2KPoYeB44nid2t
 ZI4TOm+IUphdKBUM89Wvx7S8aUHj5NSvoRYLnEh2b2hLYUIOSVhkk1D8sTxLwCsZK9TJ
 nfoBTEw7BiD8MeakcJgeIa3gK8nxqfjwHuPoEFHKCT5LogEUHcecaAHzmajcyJ9WeIDe
 e9XEwXJXfZ7ObuUb2XzZbEpyUPsrkIqvUv3Rmi5DvONgjvcfcmHM85Hd1WnHJvUqlJ/q
 24Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/uGXHNy/zDLI/MTkJ+zXxBEMLylwMy1wmMJ4HzLQpqg=;
 b=hip0GZqDZbA2qVF69ySAUX4hQQvuXz6FMJbzBK0iTZ82vtCfRdULx7CEPGpkZ9CTkX
 OfkZDddOHIVmnib1aghiICMhES0AqnIbxOolobT431QV8xz7zJDMqh4GpmVQPpmcDRUH
 +puiCxaZV3weS8h25vyC0Mt8agiQX8UKMJc2iyBq1yqgdhzB6HjPxhj4Kuwx0H6a2Mir
 7SSRueher8i1bfB6gc6KEufAaFEv1Y+lEHI4aT77K9W7tRNUGF4p4J87KqKvjx/hawVR
 9FPvMYDSucLBIQnRgM0sKjCSaLpdLdpkxzyFheXyTdo0gXp+IWOdhYPDO/OT2LtvIaxC
 vbmw==
X-Gm-Message-State: AOAM531pJhKG1z+7LNSC8O9g/m6IdZQI4anI8bLkitpNEYOS2DbIYPAB
 26/Ei122H260J3Fbz2K5JDZHUQ==
X-Google-Smtp-Source: ABdhPJzxeRffR9PjeILKkoPeUlAK7yU/4mJF9TwYU/She3MTYwCOmDE8rq/V0HY8DnDtvF8cI6RfCg==
X-Received: by 2002:adf:f849:0:b0:1ef:5d80:c68a with SMTP id
 d9-20020adff849000000b001ef5d80c68amr10888216wrq.280.1646728126427; 
 Tue, 08 Mar 2022 00:28:46 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 q11-20020adfcd8b000000b001e320028660sm12968877wrj.92.2022.03.08.00.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:28:45 -0800 (PST)
Date: Tue, 8 Mar 2022 08:28:43 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Johnson Wang <johnson.wang@mediatek.com>, broonie@kernel.org
Cc: robh+dt@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: [GIT PULL - FAO MARK BROWN]: Immutable branch for MediaTek MT6366
 due for the v5.18 merge window
Message-ID: <YicTu6FwOR7zIC6I@google.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106065407.16036-1-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_002848_227593_83222977 
X-CRM114-Status: UNSURE (   8.94  )
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

TWFyaywKClRoaXMgb25lIGlzIGp1c3QgZm9yIHlvdSwgc28geW91IGNhbiBtZXJnZSB0aGUgb3Ro
ZXIgcGF0Y2hlcy4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTc4MzM2MmVi
NTRjZDk5YjJjYWM4YjNhOWFlYWM5NDJlNmY2YWMwNzoKCiAgTGludXggNS4xNy1yYzEgKDIwMjIt
MDEtMjMgMTA6MTI6NTMgKzAyMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xl
ZS9tZmQuZ2l0IGliLW1mZC1tZWRpYXRlay1tdDYzNjYtdjUuMTgKCmZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0byBjNDczODNmODQ5MDk3YzJiMzU0N2UyODM2NTU3OGNkOWU1ODExMzc4OgoK
ICBtZmQ6IEFkZCBzdXBwb3J0IGZvciB0aGUgTWVkaWFUZWsgTVQ2MzY2IFBNSUMgKDIwMjItMDMt
MDcgMTQ6NTk6NDQgKzAwMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkltbXV0YWJsZSBicmFuY2ggZm9yIE1lZGlhVGVr
IE1UNjM2NiBkdWUgZm9yIHRoZSB2NS4xOCBtZXJnZSB3aW5kb3cKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSm9obnNvbiBX
YW5nICgxKToKICAgICAgbWZkOiBBZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UNjM2NiBQ
TUlDCgogZHJpdmVycy9tZmQvbXQ2MzU4LWlycS5jICAgICAgICAgICAgIHwgMSArCiBpbmNsdWRl
L2xpbnV4L21mZC9tdDYzNTgvcmVnaXN0ZXJzLmggfCA3ICsrKysrKysKIGluY2x1ZGUvbGludXgv
bWZkL210NjM5Ny9jb3JlLmggICAgICB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KUHJpbmNpcGFsIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
