Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AEDC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 10:32:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD52207D0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 10:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sblq+ZcK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLlypJ/C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD52207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXlpqeXudnLeDuRaPs0ra/CVXC9jrC00GVCpiPYEDv4=; b=Sblq+ZcKRFLaFp
	ubg07G5FG42pdG4iiyMJm7NIUAfZ0pwOtSYnwujBBgPTz0RCmFYAk4XKmONtBdTdiPllj4k4iDvXw
	0qFKQoAzLPO+VXnXHvQvYrosxFeTxI+zV1Hh7QXPvrk4MxnXTwK0cHURCeG68uIbE2FGEYRkD+UoX
	BKv3wvh+cHF98UVUuFn9Wmgb2d3po7VckIKEyCi2xu72pLVBERGkP8egCf3izwjpHYVzmvNQQOnMW
	Jw0HD5NZCIU1pqNGenQdYFKciw6DW4SyBDlkJGrE3z7EnP3QNLYQkX84ZfVg48FqbHGCuWa/nyPF/
	BELsOac9g3AzlgqDln1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg4DN-0006bw-GF; Tue, 02 Jun 2020 10:32:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg4DG-0006U6-F2
 for linux-mediatek@lists.infradead.org; Tue, 02 Jun 2020 10:32:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id x6so2798724wrm.13
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Jun 2020 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KlmfffW2XSbkYvsmOsNbcsmnYUo/y3iq5oHmPHdTHaQ=;
 b=ZLlypJ/CuFsSyNV3DN2Ha4SZkMHS0N96qwx4Z0cqHcCC80a08KrXccPQwaKNTCewK/
 RE71Wz6C4rgZLQKM7/9kHctlMJvVXEGDf9dUKeNKSNWbHjUWvVaWUPMdFVGqE8vkP+uI
 hgZ3N+OKKn4TXeaEKmJgQ4AXdQS3+WpwtfMNVwaPqtzomZNZzFm2bFlQKBDnvta+sXZr
 Dfm7LE3j/ujA0UsLldLyz8i7+XdWCTuNtt2KBsHjm+4a62hTTI7hUiiQpciyGLA7VGmP
 E31at6jtNLz8/Q4WAh2OZHkHFHoTIRCK9KohU0sVdPgeP2WRv+LTCZB4bytSO8azymqJ
 f9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KlmfffW2XSbkYvsmOsNbcsmnYUo/y3iq5oHmPHdTHaQ=;
 b=XF2jSH5to6cFIveK9R2mUPXdIMU680nvZrmxphHfIEFdqXo0AAMN0hBO5W/jn6AmGf
 u6/rXS7FLGrAwma15IcRYNXhjE2DuQ3dW6JqJl6uPxuQM39bBn0H70jbSK7aG2DaSVSC
 ETKRmrcBACX0NHk8xsYtaVIAuIlRFY2hlyC2CjvtkRMxP7MxC8Vty1iYqQN7oIc5SDI5
 q4wRfJ36fMd0UhzpAXz2TbRFeDb/v6t2sqc1VhrgMqO7IUZUnTvFpG34XgBavcsGGWMs
 ZpFIKGU4rYEit0V6pUWYRgfoel6VIdQm7YmPr0UY2nQuXKpt5x5NyOX39ce/JkrFqaP2
 ayRg==
X-Gm-Message-State: AOAM5305EiFvq/fELv7dqtPnpCpgHqNSBEdIZPEQ7ETbinrOwNkX95JF
 61wL/IGyryVrdIns+d8xzy6wkQ==
X-Google-Smtp-Source: ABdhPJxpOB9vo7otdW0hRZv3RvFPnuX5BR632FsJOEUd2/IuCmF0m4pQLOBikVssca89fSeFvE3hIw==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr26141358wrt.341.1591093924698; 
 Tue, 02 Jun 2020 03:32:04 -0700 (PDT)
Received: from dell ([95.147.198.92])
 by smtp.gmail.com with ESMTPSA id r7sm2886185wmb.32.2020.06.02.03.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 03:32:03 -0700 (PDT)
Date: Tue, 2 Jun 2020 11:32:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v10] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20200602103202.GE3714@dell>
References: <1591070142-7653-1-git-send-email-gene.chen.richtek@gmail.com>
 <20200602082816.GC3714@dell>
 <2231bffe-27d1-6aee-4699-77d2f754beef@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2231bffe-27d1-6aee-4699-77d2f754beef@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_033206_507878_14EECCD3 
X-CRM114-Status: GOOD (  10.92  )
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
 linux-mediatek@lists.infradead.org, Gene Chen <gene.chen.richtek@gmail.com>,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwMiBKdW4gMjAyMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKCj4gCj4gCj4gT24g
MDIvMDYvMjAyMCAxMDoyOCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gVHVlLCAwMiBKdW4gMjAy
MCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gCj4gPj4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5A
cmljaHRlay5jb20+Cj4gPj4KPiA+PiBBZGQgTUZEIGRyaXZlciBmb3IgbXQ2MzYwIHBtaWMgY2hp
cCBpbmNsdWRlIEJhdHRlcnkgQ2hhcmdlci8KPiA+PiBVU0JfUEQvRmxhc2gsIExFRC9SR0IgYW5k
IExFRC9MRE8vQnVjawo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2No
ZW5AcmljaHRlay5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KPiA+IAo+ID4gSSBkaWQgbm90IHNpZ24gdGhpcyBvZmYuCj4gPiAKPiAKPiBZ
b3UgYXJlIHJpZ2h0LCB5b3UgcHJvdmlkZWQgeW91ciBBY2tlZC1mb3ItTUZELWJ5IGFuZCB0b29r
IGFuIGVhcmxpZXIgdmVyc2lvbiBvZgo+IHRoZSBwYXRjaCBbMV0uIEJ1dCBhcyB0aGlzIGRpZG4n
dCBzaG93IHVwIGluIGxpbnV4LW5leHQgSSBzdXBwb3NlIHlvdSBkcm9wcGVkIGl0Cj4gYWZ0ZXJ3
YXJkcyBiZWNhdXNlIG9mIGtidWlsZCB0ZXN0IGVycm9ycyAoZGVkdWNpbmcgZnJvbSB0aGUgY2hh
bmdlcyBsb2cpLgoKSWYgdGhlIGJ1aWxkZXJzIGNhbiBzZWUgaXQsIC1uZXh0IGNhbiBwdWxsIGZy
b20gaXQuCgpJdCB3YXMgbmV2ZXIgZHJvcHBlZC4KCj4gSSBzdXBwb3NlIGlmIHRoaXMgZXJyb3Jz
IGFyZSBmaXhlZCBub3csIHdlIHNob3VsZCBiZSBmaW5lIDopCgpJbmRlZWQuICBObyBtb3JlIGJ1
aWxkIGVycm9ycy4gOikKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2Vz
IFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
Uk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
