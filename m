Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70BEC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 02:16:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7387220759
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 02:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnPAOtzm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFRv66x+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7387220759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KeiAPHdpRGX8KKZhfwkAZ4LDTTfvgkNBbo3/3DUIF6o=; b=pnPAOtzmoyXAd1J8UGAxBjqIb
	1TYUKYFkJS2NMh6gYkznqCfmKAtxkauafnsFkIokm51Tji92xtGJb+01wuhaXUI0TWH/d90Zqsk0h
	ZSEyMOQA4mCENXkidtGYD9VwccfA5HL9fKVHAPmLFKPU/Di8Xf6UXT8nrfNUFZ/AU8ULWX3p85HdX
	jrIE5C0Ic2F2+cFWYM/5RYa4cgdbrTD2KLmhhoO8jjA9fsTmW3QsVP0p33mzDnMy2vbZycpH+3ukK
	HSEvtV2K6pKFx1nl1/uYs+PdQe2g9ssYVGqJGEmUHHGuNe/Vr5Y0y73ogY4+ER28Ai2N2yDX4osIO
	WFBJW0BCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0FAT-0006sx-QY; Tue, 28 Jul 2020 02:16:37 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0FAP-0006s9-TV; Tue, 28 Jul 2020 02:16:34 +0000
Received: by mail-il1-x142.google.com with SMTP id r13so7812515ilt.6;
 Mon, 27 Jul 2020 19:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+qhhZcvnd3RwCE+F+SIU+6bIz1sPCtUPTyz82YandFo=;
 b=qFRv66x+Edw1E+2euA44W6pSi/QdRSgRAuqJr5j87nkElpfIJYd0Ulo2oMb7qvFS2A
 1YaugNbwMsygktYgyYSotHWs4z+QeIc4BhbLPLluw85gbbpJuGg27/hfsTBCSOTN0c2Z
 KnxSpb8uZRn6vzvEns12aizFTS7X0H+TBuwNMbRq4TlHww/GMpfSlMIibX8M90RvvCDp
 EDzsLb2qVJsm6OzyV7+I3s7OWTKed8CL5ua+kpiVkdWF7wwShVUtGYBpMn4pSdXYA/Pm
 kYNgKfMX5KIi1KMlmP+h0paxQXYe6dVD28DGHha+CjQ+G8vdC25H2tmEkd17vauWmGg5
 rcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+qhhZcvnd3RwCE+F+SIU+6bIz1sPCtUPTyz82YandFo=;
 b=eskSeZT8QcsaVXHEY8GvN/ag97X/841SDcuZmVPs/5d3B7M6p+6dGDmkVf8fNu3Pi7
 l40FJaMHPX4uqR+yBMey/gYMl26rm8E/sZhuTvGhiU1sVOmTtOGwtckF+5YQC9ywEYsq
 9yjYwK5wytTDmWApk4SlhGAdAasHgCT0de/Z/iofDoEhL/EIyWj0wbOClzvntfALbtqA
 YWVwDl679MoGR0qVKRIxhlA/f0vpAQcxjSuI8DfAPddnEcn9uW/D220Tt+JzGRWOSZC7
 sWHFDzJng+FQDJya7Fy962kSJSMsZxq75Dtq8wE4qwfjfZS7WxDjjzW+Vf0ECH5ktUEU
 eOpA==
X-Gm-Message-State: AOAM531w3uqXW+fvO5D6l1wcSHMmExgGQSf8Tsu02CblbGURedPFMIPM
 NU2YgJ3MMuSEkgl7ScqDbIR9eh8O2C/rjL1y6Xg=
X-Google-Smtp-Source: ABdhPJyRGZ6wDA+UhVMRrrMpC3VXX10f0UdEKy2RU3tRJYFS731AYHP3Mobcvf9npHHHyQCtFPwo1Fi6FOVbF+R/H0c=
X-Received: by 2002:a92:9f96:: with SMTP id z22mr27481140ilk.266.1595902589613; 
 Mon, 27 Jul 2020 19:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200727110821.GH1850026@dell>
In-Reply-To: <20200727110821.GH1850026@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 28 Jul 2020 02:16:15 +0800
Message-ID: <CAE+NS34FexE-LwbzkOLepKytKCbKm3RowPQKqROR_a6wCrVLLA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] mfd: mt6360: Rearrange include file
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_221633_961092_5179AB37 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ35pyIMjfml6Ug6YCx
5LiAIOS4i+WNiDc6MDjlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMTcgSnVsIDIwMjAsIEdlbmUgQ2hl
biB3cm90ZToKPgo+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4g
Pgo+ID4gUmVhcnJhbmdlIGluY2x1ZGUgZmlsZSB3aXRob3V0IHNvcnRpbmcgYnkgYWxwaGFiZXQu
Cj4KPiBXaHkgYXJlIHlvdSBtYWtpbmcgdGhpcyBjaGFuZ2U/Cj4KClBlcnNvbmFsIGNvZGluZyBz
dHlsZSByZWZlcmVuY2VzIGZyb20gdXBzdHJlYW0gY29kZS4KSSBjYW4gZGlzY2FyZCB0aGlzIGNo
YW5nZSBpZiBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UuCgo+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBD
aGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL21mZC9tdDYz
NjAtY29yZS5jIHwgMTEgKysrKystLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9t
dDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gaW5kZXggZTljYWNj
Mi4uZGY0NTA2ZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+
ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+IEBAIC01LDE1ICs1LDE0IEBACj4g
PiAgICogQXV0aG9yOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ICAgKi8K
PiA+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4
L2luaXQuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvY3JjOC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ID4gICNpbmNsdWRlIDxs
aW51eC9pbnRlcnJ1cHQuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L21mZC9jb3JlLmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+
ID4gLSNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgvb2ZfcGxh
dGZvcm0uaD4KPiA+IC0jaW5jbHVkZSA8bGludXgvdmVyc2lvbi5oPgo+ID4KPiA+ICAjaW5jbHVk
ZSA8bGludXgvbWZkL210NjM2MC5oPgo+ID4KPgo+IC0tCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9d
Cj4gU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCj4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCj4gRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
