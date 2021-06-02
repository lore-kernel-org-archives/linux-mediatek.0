Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38F5C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 07:53:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6AC6138C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 07:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6AC6138C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zf4swtzNuh3SwzjBjPJBNFKynBZ8nRb5ZX8sE4iTkus=; b=2R9XiLf+o3OijZ
	EEGb0X9zCakmDFDyi6r1nTdZU7Ztj+V/PG/ne4u+umy116wSqvvNE31diMGFzQd9MBDTA3awhorZ6
	5H7OtaTGODyfv0yQ+kyyBj79ief7i1ui9TpyY/1efFC2pIsa22YYpMaZlZqk9X3HHbgNPkzGBmPfE
	Wv2bpSUOWeZ8VOOW0IBfLFeRcTq8fepEbnVnkrZ48wip+kYLaBpoR548/VCW8vDM9Zdm1skun8GPU
	GT8Xu/XMNveuuhUJhaJ4SRUi6PMPxcrWLawckww2VKEyRnfVHYwe3X/rEaMuh1fQJWhyGkhUKn/xj
	V2sjtbdThJKat8K1J4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLgN-002QN4-R4; Wed, 02 Jun 2021 07:52:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKvI-002AQC-Ug
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 07:04:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id h3so538547wmq.3
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 00:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mtcJF4D20naeNnEs0Zx/Q0Y+XC41jEFEF4kHOZDgNa0=;
 b=IDyBDoZbFzb7qwT31jzph7Ztl4UCpqBDTFYzg/bjN/q+1kcY8cHQPIh3BDWYwIRAAW
 y9E5QNyO32djUBRk4fYmEi08EArjk0+Wqriz4zcK9iraNhNOFutWm8oRtrogFCNMfSPC
 ttxHH1L4LgtDrUUkDrUzoMvS0RhFCStE858bpb3pTwTWtpALlMA2tS8phNDe6W1yNr3U
 yisV5bWn1XX+hSc6Uplrd0GN+M5FYZ+FmDxifREO8octqi2u5Mfjg0wWyv4bA54EkoTq
 7e/icvfdd5NPWYlHznYU96MSoXIUKbcpX990YLISjO6Lo2Sljsxa59k7l7h4OdjgfF+S
 m9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mtcJF4D20naeNnEs0Zx/Q0Y+XC41jEFEF4kHOZDgNa0=;
 b=RQ7RRgrMzQlsB5STJO81SlwtKzEmL33g1+0J1Me/29cB3IvGJWSAJfSqXXSecKkaNz
 1gazz1WUy0HV7Jxkn9uo1ELVd1P57NN0Go1D6du+OuWyreNoNQ8joTkRS+huVHMSlpab
 wZofuuogP+GCchVOTfF8iIvTzKyvuxiunIXcUkn+2Kql9sy2ti9lM7WcDrPsfWdwvE/c
 RqIb03BK5YaHFQ37eWgELKUDUpZFJd2Of7MFp4hWX3hgA7B6OdhIjSO9uPVp8dTk+4FL
 mbFaszHuQ7N/xf/HIGMV0D5XjEnnsDpHRRRuP0q7fVBOyDlu6tIFRUOwauG9th8iFhqC
 XS9Q==
X-Gm-Message-State: AOAM530zDSXB4UDIBZMs0TqRI/iq6devjxWOuvV/ZKr06l85dWgDD3QA
 DRAInEQWo02X90cYptzfKam5Kw==
X-Google-Smtp-Source: ABdhPJxX/9WU/SgxzH+ZyQgQR6B/ZRBTBVIOZNRce8o7bxoTkEzw37IgWFtvOv6OCmH2YZ7iNUDm7Q==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr3635505wmj.188.1622617455114; 
 Wed, 02 Jun 2021 00:04:15 -0700 (PDT)
Received: from dell ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id y9sm1853276wrh.11.2021.06.02.00.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 00:04:14 -0700 (PDT)
Date: Wed, 2 Jun 2021 08:04:12 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fei Shao <fshao@chromium.org>, Sean Wang <sean.wang@mediatek.com>,
 Yuchen Huang <yuchen.huang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: [GIT PULL] Immutable branch between MFD, Regulator and RTC due for
 the v5.14 merge window
Message-ID: <20210602070412.GD2173308@dell>
References: <1622011927-359-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622011927-359-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_000417_081488_5D5DA64C 
X-CRM114-Status: GOOD (  14.32  )
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

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDZlZmI5NDNiODYxNmVj
NTNhNWU0NDQxOTNkY2NmMWFmOWFkNjI3YjU6CgogIExpbnV4IDUuMTMtcmMxICgyMDIxLTA1LTA5
IDE0OjE3OjQ0IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9sZWUvbWZk
LmdpdCB0Yi1tZmQtcmVndWxhdG9yLXJ0Yy12NS4xNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDRjZmM5NjU0NzUxMjRjNGVlZDJiN2I1ZDhiNmZjNTA0OGEyMWVjZmQ6CgogIHJlZ3Vs
YXRvcjogbXQ2MzU5OiBBZGQgc3VwcG9ydCBmb3IgTVQ2MzU5UCByZWd1bGF0b3IgKDIwMjEtMDYt
MDEgMTY6NDQ6MzYgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkltbXV0YWJsZSBicmFuY2ggYmV0d2VlbiBNRkQs
IFJlZ3VsYXRvciBhbmQgUlRDIGR1ZSBmb3IgdGhlIHY1LjE0IG1lcmdlIHdpbmRvdwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpIc2luLUhzaXVuZyBXYW5nICg2KToKICAgICAgbWZkOiBtdDYzNTg6IFJlZmluZSBpbnRlcnJ1
cHQgY29kZQogICAgICBydGM6IG10NjM5NzogcmVmaW5lIFJUQ19UQ19NVEgKICAgICAgZHQtYmlu
ZGluZ3M6IG1mZDogQWRkIGNvbXBhdGlibGUgZm9yIHRoZSBNZWRpYVRlayBNVDYzNTkgUE1JQwog
ICAgICBkdC1iaW5kaW5nczogcmVndWxhdG9yOiBBZGQgZG9jdW1lbnQgZm9yIE1UNjM1OSByZWd1
bGF0b3IKICAgICAgbWZkOiBBZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UNjM1OSBQTUlD
CiAgICAgIHJlZ3VsYXRvcjogbXQ2MzU5OiBBZGQgc3VwcG9ydCBmb3IgTVQ2MzU5UCByZWd1bGF0
b3IKCldlbiBTdSAoMSk6CiAgICAgIHJlZ3VsYXRvcjogbXQ2MzU5OiBBZGQgc3VwcG9ydCBmb3Ig
TVQ2MzU5IHJlZ3VsYXRvcgoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQv
bXQ2Mzk3LnR4dCAgIHwgICAgMSArCiAuLi4vYmluZGluZ3MvcmVndWxhdG9yL210NjM1OS1yZWd1
bGF0b3IueWFtbCAgICAgICB8ICAzODUgKysrKysrKysKIGRyaXZlcnMvbWZkL210NjM1OC1pcnEu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4OSArLQogZHJpdmVycy9tZmQvbXQ2Mzk3
LWNvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDI0ICsKIGRyaXZlcnMvcmVndWxh
dG9yL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOSArCiBkcml2ZXJzL3Jl
Z3VsYXRvci9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogZHJpdmVy
cy9yZWd1bGF0b3IvbXQ2MzU5LXJlZ3VsYXRvci5jICAgICAgICAgICAgICAgfCAxMDM2ICsrKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL3J0Yy9ydGMtbXQ2Mzk3LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDIgKy0KIGluY2x1ZGUvbGludXgvbWZkL210NjM1OC9jb3JlLmggICAg
ICAgICAgICAgICAgICAgIHwgICAgOCArLQogaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU5L2NvcmUu
aCAgICAgICAgICAgICAgICAgICAgfCAgMTMzICsrKwogaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU5
L3JlZ2lzdGVycy5oICAgICAgICAgICAgICAgfCAgNTI5ICsrKysrKysrKysKIGluY2x1ZGUvbGlu
dXgvbWZkL210NjM1OXAvcmVnaXN0ZXJzLmggICAgICAgICAgICAgIHwgIDI0OSArKysrKwogaW5j
bHVkZS9saW51eC9tZmQvbXQ2Mzk3L2NvcmUuaCAgICAgICAgICAgICAgICAgICAgfCAgICAxICsK
IGluY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaCAgICAgICAgICAgICAgICAgICAgIHwgICAg
MSArCiBpbmNsdWRlL2xpbnV4L3JlZ3VsYXRvci9tdDYzNTktcmVndWxhdG9yLmggICAgICAgICB8
ICAgNTkgKysKIDE1IGZpbGVzIGNoYW5nZWQsIDI0OTQgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JlZ3VsYXRvci9tdDYzNTktcmVndWxhdG9yLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3JlZ3VsYXRvci9tdDYzNTktcmVndWxhdG9yLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL2xpbnV4L21mZC9tdDYzNTkvY29yZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9saW51eC9tZmQvbXQ2MzU5L3JlZ2lzdGVycy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9saW51eC9tZmQvbXQ2MzU5cC9yZWdpc3RlcnMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvbGludXgvcmVndWxhdG9yL210NjM1OS1yZWd1bGF0b3IuaAoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
