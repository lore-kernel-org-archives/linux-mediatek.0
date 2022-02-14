Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14363C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b02cNXTtnPeGmxJ7Pq/jwsnv4ZwQDHPIhbFAOtmnSOU=; b=k1vs3dI0N4WNML
	vMoVxH6nYvttFp9y9oxroKT5GvGT/hqYWDhirPuwkT0o7tyRqiBZyNbc6qwh7LKdMynztVBP0y5L5
	Mc1IbTcoR7QmfSzRsxT3Q+YgCs0p6Ylss0WvhMw0QTSrj2jWIFiJ5g2/k0myFanhBjMGDOkwVBqkw
	sk/EspgEDQdK7k8/dIvlWGZBL8YLDFypt+t+gRG0r0dKH9uawACqf4f90+Sr0ZPY02cgeNVMzdk6n
	DpzSVqTDc/r1AvpBBWz2UNtutxg5r+3jxHLe8cyad95NIYeZgmjNDnzQHimMcVLBp8UmT+/aHkdpe
	lvu305HKz919jBe/QOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbaA-00FSAl-0Y; Mon, 14 Feb 2022 13:39:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbZr-00FS41-VY
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 13:39:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id k41so8523641wms.0
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 05:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q2xtWcTzY3fGlUDVCwgpXaikGTqqdVJF0/bajHnvT9c=;
 b=LXObhA7CkZldKpmJtEIVyeLqTUnGJJ+OV4THrg0bz4HYxjLuVoytkNE4rj6N2ZGsmx
 z+KkPM7bpnuzFWFnOx5Kq5F1NEA5HIITJDNABELF3rZ6bHYoxb22vk/u8KLV5lCERQF9
 SkPCUHCmgZZkbAj1yX308h9fjCJdnpdqE2VXJpTbOgft5k/eMUXmMf17ya07Q203ZABn
 ggEyEKW/AZ0drKaLAiLhi/6HBgHGhALQdspsRMCBd2ZMhkXpGbIjjtNP+KLOpZvcJQYa
 3CDUYeFLx+C015uvwo4tVLa/VbaJ5npsh/NA3JbCn23fqGSmNWtGNiHDgxdplgX7LzJ0
 QfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q2xtWcTzY3fGlUDVCwgpXaikGTqqdVJF0/bajHnvT9c=;
 b=5MVFUTs40D599GSJR2AyIXPtDmY6iArNtpJqBpUfDEU+xC494sOZp9W8KCBLKvr3LE
 pZ7GYZ4+HgC22Fh8npbFEJrh9iWo/DtDdIJ8UA2vzFPY96VnDdEHQFbFBGa5CO80sEyq
 L9MbV46b5j5pGfEHl1rB1KthDL5fTeAxQn/rKtg4RTAPqlu3aQTeLx5ty2k7qWR57zSH
 6YfXKHzCxFWz5a3zbwdxEXwT9zL/nOIGVGW7DwLUY9XmuWFbNQ3pJXSO70dsCc3HLVUd
 Joag6SsInTm4kXln4XeoBwiOSQ+0CvWKA/eiN0LsO/yTXp5WDIc1W2Xn6XtW6EHv/8vq
 KBGA==
X-Gm-Message-State: AOAM533+/8BTgqKu/MmNhF+eiWCmBbrE+xJ6TCY1IaDHNXncCTb/NXzB
 b1f9vQyqlazChxCM8tVw9CIE3A==
X-Google-Smtp-Source: ABdhPJz6XTNaTVeZypQMsL8H4LbZtEGF7tz7EdWyK1/Em9NjbpCUd9iH/ks8ltgR5rz3uSVfJn1YSw==
X-Received: by 2002:a1c:f309:: with SMTP id q9mr11290076wmq.173.1644845977531; 
 Mon, 14 Feb 2022 05:39:37 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id az21sm11878848wmb.11.2022.02.14.05.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:39:37 -0800 (PST)
Date: Mon, 14 Feb 2022 13:39:35 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: robh+dt@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/4] mfd: Add support for the MediaTek MT6366 PMIC
Message-ID: <Ygpbl/pxEVAug6jl@google.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-2-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106065407.16036-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_053940_055296_B5C2DD48 
X-CRM114-Status: GOOD (  12.95  )
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

T24gVGh1LCAwNiBKYW4gMjAyMiwgSm9obnNvbiBXYW5nIHdyb3RlOgoKPiBUaGlzIGFkZHMgc3Vw
cG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UNjM2NiBQTUlDLiBUaGlzIGlzIGEKPiBtdWx0aWZ1bmN0
aW9uIGRldmljZSB3aXRoIHRoZSBmb2xsb3dpbmcgc3ViIG1vZHVsZXM6Cj4gCj4gLSBSZWd1bGF0
b3IKPiAtIFJUQwo+IC0gQ29kZWMKPiAtIEludGVycnVwdAo+IAo+IEl0IGlzIGludGVyZmFjZWQg
dG8gdGhlIGhvc3QgY29udHJvbGxlciB1c2luZyBTUEkgaW50ZXJmYWNlCj4gYnkgYSBwcm9wcmll
dGFyeSBoYXJkd2FyZSBjYWxsZWQgUE1JQyB3cmFwcGVyIG9yIHB3cmFwLgo+IE1UNjM2NiBNRkQg
aXMgYSBjaGlsZCBkZXZpY2Ugb2YgdGhlIHB3cmFwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvaG5z
b24gV2FuZyA8am9obnNvbi53YW5nQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQv
bXQ2MzU4LWlycS5jICAgICAgICAgICAgIHwgMSArCj4gIGluY2x1ZGUvbGludXgvbWZkL210NjM1
OC9yZWdpc3RlcnMuaCB8IDcgKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvY29y
ZS5oICAgICAgfCAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCkFwcGxp
ZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KUHJpbmNpcGFsIFRlY2huaWNh
bCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
