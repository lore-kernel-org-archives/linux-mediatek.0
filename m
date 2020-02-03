Return-Path: <SRS0=RqDu=3X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5574C3524D
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 07:46:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A871E20658
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 07:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4Wgl821";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mBsWaIqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A871E20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPx4koJf38UIgbJ3GZnteEKBc8DofXf77CWY62WtCl0=; b=o4Wgl821bDH0el
	OSj7dEBNwP7ge3utCzWU5g0f2TecpDYeaEyRjvUhl9ME5yUl3iu0VooIMQvWg/VgoRtZuAoOr1w11
	LTPas4k+tfpfdguVT/Cldzl7yMAlyH+q8rljwx28nbPcxEB6/4AAEG1WIi6AzUor4GvCmUmpEgR0x
	yhcdgs/tfceFl6wWJG8c9+Pk84BDWw1316kd+IrR8l2kTXMhe528TgH61jn4WXKRC+EF4XzJPQLSm
	YksKFY+JHCotZThbWB3i1Gqyymi1Y42q3Q3179bMQ5rug2mR7EqSFVQSiG+FZhUYajp/aQ7VQhSM8
	Ll5NdV2SBFSqi+Ukz6BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyWR4-0001NN-MJ; Mon, 03 Feb 2020 07:46:22 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyWQw-0001Gm-Mv
 for linux-mediatek@lists.infradead.org; Mon, 03 Feb 2020 07:46:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id z9so4374770wrs.10
 for <linux-mediatek@lists.infradead.org>; Sun, 02 Feb 2020 23:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=3nucfqlZlbS9OuDGzb3kixq1Br5Ct5yP/xRIMcpGX3I=;
 b=mBsWaIqgxBm8aCgBacUzTG7hSSBWgBjHas+8ae87Zzr33BdDyOswJQPMH3FbJ0eOhD
 kCtZzepzkXSgXl+4F+CLOPlJ2CvCSbzSqx6sjQkzOq07TkagOaHfhR+5rwpkRwIaqwId
 NP6ltWCKqca7ky9ktf/JB9p3Hk1x+Ose9hDG1Xj1/MSitC77bKNotLaD8fVh0j4eFcS5
 DkJ8biOJMNn0LjxriM/OkD9IKdQVbi1l8TpOLPLF9LRFHPSvk6Cn1ueXhjy5n5Rcm996
 1c2z9DchENiRTvTIUJwHx6nLH8QULbKfTRr/dIGYh5UjzbVJFs+TN4awtfXJuOGZ+p9Y
 969g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3nucfqlZlbS9OuDGzb3kixq1Br5Ct5yP/xRIMcpGX3I=;
 b=GHTl3QLOyjmO0D/ujNIzmxZQNDVaxSZfsq2hcJFJC4kF2/iKXAPbl/A9S4cQWAGvU+
 z9ELQnTliQUaxjS0Uqfsd0ZU3vbe8MknIU+lGRx/e7NzOlaln3ORdwBAzI53E4XfdHC+
 GQsTi3BklFf+m1dz9Z+xdJizLT5QTca5iTquhF4yPxr9VufhS4kOeLZlPfRrdyksTKyY
 lovLucPoVRgprUEBjFusmnV8Z2eRSIBLnmYYF/jZNVZRYRl0FT1ODMk3ykQeNG+69p0z
 RW9K21vzU6bzgnMiBbDGYFkq5ztKYRHx5wz9MEBlpkcY0lDGbgL9DUFgl8te/8XcU4V1
 8L2w==
X-Gm-Message-State: APjAAAUwNSsleO/Vqj/FlQY9s6swqEReY1wuEIZ+jqiGGYVzMYkTWStv
 3WuKeQVmv50v78W/x6/3n3pENw==
X-Google-Smtp-Source: APXvYqwUM3eHfQyl0jYk2jMIm1HD6qhbHIGYlpCQN5vKCDU4ZGIkG0S0TmUkq8oDkZb8nAkfD69J1A==
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr13424029wrs.159.1580715972793; 
 Sun, 02 Feb 2020 23:46:12 -0800 (PST)
Received: from dell ([2.27.35.227])
 by smtp.gmail.com with ESMTPSA id r15sm21991157wmh.21.2020.02.02.23.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 23:46:12 -0800 (PST)
Date: Mon, 3 Feb 2020 07:46:21 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v7 3/6] mfd: Add support for the MediaTek MT6358 PMIC
Message-ID: <20200203074621.GB13919@dell>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1576057435-3561-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20191216151735.GD2369@dell> <1579664886.6399.24.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579664886.6399.24.camel@mtksdaap41>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_234614_853173_2F544FA9 
X-CRM114-Status: GOOD (  18.42  )
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
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream@mediatek.com, Frank Wunderlich <frank-w@public-files.de>,
 Ran Bi <ran.bi@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMiBKYW4gMjAyMCwgSHNpbi1oc2l1bmcgV2FuZyB3cm90ZToKCj4gSGksCj4gCj4g
T24gTW9uLCAyMDE5LTEyLTE2IGF0IDE1OjE3ICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBP
biBXZWQsIDExIERlYyAyMDE5LCBIc2luLUhzaXVuZyBXYW5nIHdyb3RlOgo+ID4gCj4gPiA+IFRo
aXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgTWVkaWFUZWsgTVQ2MzU4IFBNSUMuIFRoaXMgaXMgYQo+
ID4gPiBtdWx0aWZ1bmN0aW9uIGRldmljZSB3aXRoIHRoZSBmb2xsb3dpbmcgc3ViIG1vZHVsZXM6
Cj4gPiA+IAo+ID4gPiAtIFJlZ3VsYXRvcgo+ID4gPiAtIFJUQwo+ID4gPiAtIENvZGVjCj4gPiA+
IC0gSW50ZXJydXB0Cj4gPiA+IAo+ID4gPiBJdCBpcyBpbnRlcmZhY2VkIHRvIHRoZSBob3N0IGNv
bnRyb2xsZXIgdXNpbmcgU1BJIGludGVyZmFjZQo+ID4gPiBieSBhIHByb3ByaWV0YXJ5IGhhcmR3
YXJlIGNhbGxlZCBQTUlDIHdyYXBwZXIgb3IgcHdyYXAuCj4gPiA+IE1UNjM1OCBNRkQgaXMgYSBj
aGlsZCBkZXZpY2Ugb2YgdGhlIHB3cmFwLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSHNp
bi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAyICstCj4gPiA+
ICBkcml2ZXJzL21mZC9tdDYzNTgtaXJxLmMgICAgICAgICAgICAgfCAyMjQgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gPiAgZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYyAgICAgICAg
ICAgIHwgIDQ1ICsrKysrLQo+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU4L2NvcmUuaCAg
ICAgIHwgMTU4ICsrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9t
dDYzNTgvcmVnaXN0ZXJzLmggfCAyODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiA+ID4gIGluY2x1ZGUvbGludXgvbWZkL210NjM5Ny9jb3JlLmggICAgICB8ICAgMyArCj4g
PiA+ICA2IGZpbGVzIGNoYW5nZWQsIDcxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL210NjM1OC1pcnEuYwo+ID4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210NjM1OC9jb3JlLmgKPiA+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTgvcmVnaXN0ZXJzLmgK
ClsuLi5dCgo+ID4gPiAraW50IG10NjM1OF9pcnFfaW5pdChzdHJ1Y3QgbXQ2Mzk3X2NoaXAgKmNo
aXApCj4gPiA+ICt7Cj4gPiA+ICsJaW50IGksIGosIHJldDsKPiA+ID4gKwlzdHJ1Y3QgcG1pY19p
cnFfZGF0YSAqaXJxZDsKPiA+ID4gKwo+ID4gPiArCWlycWQgPSBkZXZtX2t6YWxsb2MoY2hpcC0+
ZGV2LCBzaXplb2Yoc3RydWN0IHBtaWNfaXJxX2RhdGEgKiksCj4gPiA+ICsJCQkgICAgR0ZQX0tF
Uk5FTCk7Cj4gPiA+ICsJaWYgKCFpcnFkKQo+ID4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ID4g
Kwo+ID4gPiArCWNoaXAtPmlycV9kYXRhID0gaXJxZDsKPiA+ID4gKwo+ID4gPiArCW11dGV4X2lu
aXQoJmNoaXAtPmlycWxvY2spOwo+ID4gPiArCWlycWQtPnRvcF9pbnRfc3RhdHVzX3JlZyA9IE1U
NjM1OF9UT1BfSU5UX1NUQVRVUzA7Cj4gPiA+ICsJaXJxZC0+bnVtX3BtaWNfaXJxcyA9IE1UNjM1
OF9JUlFfTlI7Cj4gPiA+ICsJaXJxZC0+bnVtX3RvcCA9IEFSUkFZX1NJWkUobXQ2MzU4X2ludHMp
Owo+ID4gPiArCj4gPiA+ICsJaXJxZC0+ZW5hYmxlX2h3aXJxID0gZGV2bV9rY2FsbG9jKGNoaXAt
PmRldiwKPiA+ID4gKwkJCQkJICBpcnFkLT5udW1fcG1pY19pcnFzLAo+ID4gPiArCQkJCQkgIHNp
emVvZihib29sKSwKPiA+IAo+ID4gVGhpcyBpcyBmcmFnaWxlLiAgV2hhdCBpZiB0aGUgdHlwZSBj
aGFuZ2VzIGVsc2V3aGVyZT8KPiA+IAo+IAo+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50Lgo+IERv
IHlvdSBtZWFuIHVzaW5nICdzaXplb2YoKmlycWQtPmVuYWJsZV9od2lycSknIGluc3RlYWQgb2YK
PiAnc2l6ZW9mKGJvb2wpJz8KClllcyBwbGVhc2UuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
CkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
