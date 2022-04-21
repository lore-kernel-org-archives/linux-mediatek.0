Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C2EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnEUY9ADRTbWvjKiUPZ65jmSR5+iCUdjZJgn4O+twsY=; b=LlGkf4Efm94Ol8
	LNN/Sn3+bWxuyZ0r91AcQHx3zfMe160DQGGXEAr9UxCCuPfyEyAQidGj/LangtIQFzc+LjcpHxR9+
	aA16+YUL9Cb22N5nW556987pFi8ulV4DxcLMRI4VxPUWDECrzJ+ggEGc+SXRKoILY+qH6zvPFgdO7
	4KwWn3lklY1EqZQv2hFuUwOx9yxxU/ca94PgdTJFXDLupAWmzg0jjCc8l1bo/+iaIOkIXNSWs32dK
	2u4p8Q1U8mcyYgPWZzOl6fBJQq7qWWd5E6AVT73DFf7Aapag/GkQOIizecvVNf8V6sO8AIl31vZSy
	5IfAM1pSX0DCPAjXhX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhXmV-00DlbG-Pa; Thu, 21 Apr 2022 14:27:39 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhXmK-00DlVa-45
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 14:27:29 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id i20so9035269ybj.7
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rZBFlmHymTZ2XITuJ76uKuNQ0o0eA5W4vkdFBM1hN1c=;
 b=HIUTIlxPXowbJ3dcoyknjSXqxR5CjgMSug5s2lgyUCH6fubEhvkPqSs0IQEDbIUavK
 rsUZpjscswS7NpGcWsb4RmKrAcIcd8Szmtj1s/qcOR1cYUm45ffupKZabx5GPyeqlA3X
 BW+y35hFDgzhnFox/GHjge6OtB6J5xqVUoQdR+SO5hJy97Q5J8JHBGhWGKORRF6ezZJJ
 aLtfoRyuL76mWxeQWWMRn6UscTZmDGHerZo7SFSdKEw3tnsw2BeISqIz46UbGlEGFJdF
 hofHZ2NlkXN5SCdQKsNHU/MnOPdwknu3LGVzxvS3Az86dxhgXmhw+xODOjaW0TXdWtVR
 h2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rZBFlmHymTZ2XITuJ76uKuNQ0o0eA5W4vkdFBM1hN1c=;
 b=MBmw2xVx+IFQWYUxWhjfp/oSFIa4TuAN+issg2MArIwxet6nQsdQFdW+pnGLN4CsSl
 GVVPNu3dbdaFQtkVNkk8qLRDX71O0hHsEd/vLdW2Rb0gFpc545CxFs8IFvMigdq4BRLe
 DJElj1eKm5l6/fW40fcUSc1pwcScYarCXU/U5IKUAKE6kbPMr7r7Oj+Zf53tGGOaWOwF
 PyaIVoJCF6pjBjmgTBZpu61JDeZUzDyJWQGeiAC0azamb7strMHB/917NxGSVDf4UElK
 0klu3m2vT2AjKM3QQXfCd7UlYHn2ozsnAIuk5953kxuUrw8BkWCtlT6mwVzZKsxzadLI
 IaXg==
X-Gm-Message-State: AOAM532iUlTr+afsBZK/OJ45LDy1kBLt8vrQ4pPxFa3HiIInPjXqONWc
 LJ3Fe6cJt9EfaqFrIZwd9SIeZ+PPg5oPJQLWfoJSXQ==
X-Google-Smtp-Source: ABdhPJxwa0wYivda5wva68xSE6bQM3iIiGgh0H/o0EtiG339T3VCMNkaKR8Ayly0FrW7pr65Fgv+eV4VQGZN5Tvmkzk=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr26018665ybb.514.1650551245081; Thu, 21
 Apr 2022 07:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Apr 2022 16:27:13 +0200
Message-ID: <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_072728_225093_276F5914 
X-CRM114-Status: GOOD (  12.78  )
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

T24gV2VkLCBBcHIgMTMsIDIwMjIgYXQgODowOCBBTSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFs
QGFyaW5jOS5jb20+IHdyb3RlOgoKPiBUaGlzIHBhdGNoIHNlcmllcyBicmluZ3MgY29tcGxldGUg
cmVmYWN0b3JpbmcgdG8gdGhlIFJhbGluayBwaW5jdHJsIGRyaXZlcgo+IGFuZCBpdHMgc3ViZHJp
dmVycy4KCkkganVzdCBtZXJnZWQgYWxsIHRoZSBwYXRjaGVzLCB0aGUgY29tbWVudHMgc2VlbSBt
aW5vciBhbmQgYW55IGZ1cnRoZXIKZml4ZXMgY2FuIGNlcnRhaW5seSBiZSBkb25lIG9uIHRvcCBv
ZiB0aGlzLiBBbnlvbmUgaW50ZXJlc3RlZCBpbiByYWxpbmsKd29ya2luZyBuaWNlbHkgaXMgbGlr
ZWx5IGluIHRoZSB0aHJlYWQgYW5kIHdlIG1vc3RseSBjYXJlIGFib3V0IHRoYXQgdGhpcwp3b3Jr
cyBmb3IgT3BlbldydCwgYW5kIGlmIGl0IHdvcmtzIGZvciB0aGVtIHdlIGFyZSBoYXBweS4KCj4g
ICBtaXBzOiBkdHM6IHJhbGluazogbXQ3NjIxOiB1c2UgdGhlIG5ldyBjb21wYXRpYmxlIHN0cmlu
ZyBmb3IgTVQ3NjIxIHBpbmN0cmwKClRoaXMgd2FzIGEgYml0IHNjYXJ5IHNpbmNlIHdlIHVzdWFs
bHkgdGFrZSB0aGVzZSB0aHJvdWdoIHRoZSByZXNwZWN0aXZlClNvQyB0cmVlLCBidXQgSSBqdXN0
IGFwcGxpZWQgaXQgYW55d2F5LCBpdCBtYWtlcyBsb2dpY2FsIHNlbnNlIGluIHRoZQpzZXJpZXMu
CgpJIGhvcGUgaXQgd2lsbCBub3QgbGVhZCB0byBjb25mbGljdHMuCgpHb29kIHdvcmsgd2l0aCB0
aGlzIHNlcmllcyEKCk15IHBlcnNvbmFsIGhlYWRhY2hlIHdpdGggUlQyODgwIGlzIHRoZSBSYWxp
bmsgUlQyODgwRiBtaW5pIFBDSSBjYXJkCndoaWNoIGFwcGFyZW50bHkgY29udGFpbnMgYSBub24t
cmVmbGFzaGFibGUgZmlybXdhcmUuIEl0J3Mgbm90CnRoZSBSVDI4ODA6cyBmYXVsdCB0aG91Z2gs
IEknbSBqdXN0IGFsd2F5cyByZW1pbmRlZCBvZiB0aGlzIHdoZW4Kd29ya2luZyB3aXRoIFJUMjg4
MCA6LwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
