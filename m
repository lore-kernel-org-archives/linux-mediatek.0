Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312C0C352BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 09:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0807320771
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 09:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H99WuRsC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wb/ou2IL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0807320771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQAdmu6oIrfYlQd54wD7lR1hPJSQhglrhhkq64pY1ec=; b=H99WuRsCTd/Jdd
	VE5oEdvwykg66JnpRQcS9wgwEIEq+Dy+2Lnw69V45w9xIqV0Afab4pWag/yQI+5AC7mL6HiRdfrh+
	+xMRNKNmjgT6ZCP2JxerkUPteLaFtyF+m63wTDMOZd+wlDjgzr+U9unqsF3TvJDmiR76BRpbMHt8N
	hzJt7Dcz/0zgunAGDL94YkLoZzESdKL7DN6oDOXgfML5XB1xXI1ADarzOLdFIaCnLxF8pLp3R/Asf
	OOmFBcQZyQllGCi8/26lxM3N6IrrrfTfS3x35dYW0HGoecwcVd9SllkuN1+JiqiO9SZ33THLA+IZU
	bJU8rfrVs6YBraD6DktQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP0XL-0001n5-LG; Thu, 16 Apr 2020 09:10:19 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP0Wy-0007XN-MM
 for linux-mediatek@lists.infradead.org; Thu, 16 Apr 2020 09:09:58 +0000
Received: by mail-wm1-x341.google.com with SMTP id d77so3748908wmd.3
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2020 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AkzX3Dcs3nD4u98CC4pQCRsVTQrys7ElI/8/pjZK+Ts=;
 b=wb/ou2IL7ZL03YQ8OAV+Os2euU0E17M9a0KwoQ3V3isxo7+xI1+LSfhg5vSw6QDiT5
 PsrEZIKgjxOmO31HznVmbOHJL0WiBxEdRrUVX8PGl+6aFMMKj+Ok3aE5PJnZLvTAR7uI
 vGLCAgXDlm9SWpL6LlhpelL2R0kMbpm8ccCFbNZs9pJWVok28OUT2dVDc0jLwk1ecNu2
 F3LojeUezoSXKQKiaoF94+HsBfCLyTeSTcf13SDqUTYKpELlLnEGHIWeaFAXVEXVx9Ze
 VdpFDYBagqARwZ2Txck/ZqK5qn1jwast8Gxgr8rEKOIaDNo6PJlLDAZamY6dNhxapVdn
 0hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AkzX3Dcs3nD4u98CC4pQCRsVTQrys7ElI/8/pjZK+Ts=;
 b=HCFxrfBoxy2oibB2Uza5rAnO93d60PjXii+Fo3k9nGpLSZPmFqyAelALftmK1RnyQP
 wRVVoVASCOQL9UB2biXezMEf5tuT0q0nA4B/slT+QEs4o4iGc5WbvZWcRN/gXKNoo5hH
 X73kKRgciuF7RiVr3c+MshkQqzbtdwR3Wq4/+v6BO7rUfUzcURlLGQhDn6aquAHyrdm5
 d5eN0JsEJz7Qio2mYZLZgjkzgha0xvyKeAxvsvJmf/W2XM/HbzG23JrjyO1b2udDOxzE
 aLSzPr8ddnfWf5y2IQut+gx+liLx0xe6WLANX8qm8ISSfj/8ztdGOpIFHvxvbrluy/Zh
 FJxw==
X-Gm-Message-State: AGi0PuZuAUOr46JkUiyFrTSbyUzDECrAUfwOcTiyWBnf0v9nIxCvpDaf
 /8CjCKEkolRQu0KJY5+IvcXqBQ==
X-Google-Smtp-Source: APiQypJvFDcKODT9CxRfCRMCE4sQZDVimgniJ+YY4tbASMLPFOZ6+nm+DuXIWSzcnSgUjCRLXlPPcw==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr3989576wme.126.1587028194753; 
 Thu, 16 Apr 2020 02:09:54 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id h5sm7933704wrp.97.2020.04.16.02.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 02:09:54 -0700 (PDT)
Date: Thu, 16 Apr 2020 10:10:54 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v12 4/6] mfd: Add support for the MediaTek MT6358 PMIC
Message-ID: <20200416091054.GZ2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586333531-21641-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_020956_736756_8554994A 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 linux-rtc@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwOCBBcHIgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gVGhpcyBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBNVDYzNTggUE1JQy4gVGhpcyBpcyBhCj4gbXVsdGlm
dW5jdGlvbiBkZXZpY2Ugd2l0aCB0aGUgZm9sbG93aW5nIHN1YiBtb2R1bGVzOgo+IAo+IC0gUmVn
dWxhdG9yCj4gLSBSVEMKPiAtIENvZGVjCj4gLSBJbnRlcnJ1cHQKPiAKPiBJdCBpcyBpbnRlcmZh
Y2VkIHRvIHRoZSBob3N0IGNvbnRyb2xsZXIgdXNpbmcgU1BJIGludGVyZmFjZQo+IGJ5IGEgcHJv
cHJpZXRhcnkgaGFyZHdhcmUgY2FsbGVkIFBNSUMgd3JhcHBlciBvciBwd3JhcC4KPiBNVDYzNTgg
TUZEIGlzIGEgY2hpbGQgZGV2aWNlIG9mIHRoZSBwd3JhcC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBI
c2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMv
bWZkL210NjM1OC1pcnEuYyAgICAgICAgICAgICB8IDIzNSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICBkcml2ZXJzL21mZC9tdDYzOTctY29yZS5jICAgICAgICAgICAgfCAgMzYgKysr
KysKPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU4L2NvcmUuaCAgICAgIHwgMTU4ICsrKysrKysr
KysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL210NjM1OC9yZWdpc3RlcnMuaCB8IDI4
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21m
ZC9tdDYzOTcvY29yZS5oICAgICAgfCAgIDMgKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDcxNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21m
ZC9tdDYzNTgtaXJxLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210
NjM1OC9jb3JlLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210NjM1
OC9yZWdpc3RlcnMuaAoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL210
NjM1OC9jb3JlLmggYi9pbmNsdWRlL2xpbnV4L21mZC9tdDYzNTgvY29yZS5oCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi5hMzA0YWFlCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvbWZkL210NjM1OC9jb3JlLmgKPiBAQCAtMCwwICsxLDE1OCBAQAo+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ICsvKgo+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMTkgTWVkaWFUZWsgSW5jLgoKTml0OiBUaGlzIG5lZWRzIHVwZGF0aW5nLgoK
T25jZSB1cGRhdGVkLCBwbGVhc2UgYXBwbHkgbXk6CgpGb3IgbXkgb3duIHJlZmVyZW5jZSAoYXBw
bHkgdGhpcyBhcy1pcyB0byB5b3VyIHNpZ24tb2ZmIGJsb2NrKToKCiAgQWNrZWQtZm9yLU1GRC1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
