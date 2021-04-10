Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6220EC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:26:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF2BF610CD
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF2BF610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MydjiRgGkPt05oB/F001k6a7AYNjMmWrz1JgyrX7rIM=; b=UJdE2bZ/CaHSar8dayqtKUOUf
	Gp44/mbyobdqtAB2+AR2fqG91KC+p0xldcYfyAVH9TD3Asx4A/8rtvDCe/bL3U5+GheIdPxbJWJ32
	v3B/vyIuLjyuSLUsNjFc226wnKAgXplZCvMvgBpidyIkvy28VSkeaX9bygfxrjU5Ilb5Dod3oktC1
	KA5vhyl2ugythGGZZCAtdlm3B6P4jtl4YtUJIesgL3GzAmFkPyCnMeGlmkvt4zT0QnZx5jnhMwehL
	yjhZyBuIjkRnouDvO772tWGk2d5H1TxBVG2aD8ug1nRXo4Mr5wU1YO7teILje27++YUOEsxcXC2Oa
	4Yf/1u7yA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV681-002EdA-AH; Sat, 10 Apr 2021 05:25:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV67u-002EVl-OG
 for linux-mediatek@desiato.infradead.org; Sat, 10 Apr 2021 05:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=rN8uPmHgYp+HYktaVED9qkx5irVyPn+XQ+GV3auP+g0=; b=g3LHtOc3VTl7ERfgY+0Wm56Sml
 UmULEV80QRHGSv7/L3VcdV9bTmTIm047ca7dP/z26t1AFXrLHqPZRIfzl3xwCW6ICT8zPFpAfMPUT
 ud5wp+nxRitdSJHm8XNCPDvFayDL2BpUlw0V1vuWxo4WhEWdWiwfS0Pn4TsgTWXeigiIq4YmriDFB
 JIjFQzI6sayXs4tr0kAU9gjt0OXutZHTErWKSD9+ff4iZAaP8527jnibGfve0EAa5qxAuQPa3wpRq
 K6FWtAqWaEAV3BWTGgx+ERS+Oh19y9/0o0d0DypbyQJYbXmd0M9OdjyPn9gsxZCR/RS5XnmPeZshp
 I499sWAQ==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV67r-004wTb-Uz
 for linux-mediatek@lists.infradead.org; Sat, 10 Apr 2021 05:25:45 +0000
Received: by mail-lj1-x232.google.com with SMTP id u9so8868093ljd.11
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Apr 2021 22:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rN8uPmHgYp+HYktaVED9qkx5irVyPn+XQ+GV3auP+g0=;
 b=Q7A+mvW5T7Io1MJ0BNeghz8UFKw+G2eDgEO0DQhPkizFVHaXWm68NB+sOLkZdA1NsP
 7L0XF9gJADvwK3xMf5I+VSfA15B3kVTHejwHyvDGl2KQZolff7le3Pn6JFCXXQsP4Tmb
 XM9cxzqhSihbNOa9zyQpLNGEgsTykAVkWzpeFaweN1zmvKSfHBs2rNWesOOqwdvxP5me
 IlzNOAJVI+GWA4z4wVkZr4TxGBIUcIhbcGLgI7N+nqCHo81OUoenBXtNnYbnfc/lfpMf
 vywRyAijQrBN3JjGrcCoN7A1QjlsrbLtyrHdufaCeEbMdqGDVejBnUcbx/wBom6QKPqH
 hKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rN8uPmHgYp+HYktaVED9qkx5irVyPn+XQ+GV3auP+g0=;
 b=AnBbDpzVds/qTzBDCplkPBvaZLlinpgb4j+H5Cc4n1078Q3qp4BieObKysIGfQEXxi
 Pb17H2B+hWiAs6wmu1FNPjzejKmhbXlPz2Z6wX8RbwUpBAafAcNUQ4bVf8GXJhBjBTG5
 yXKJGdpg7hAI4y9ECElv/OVtkvI9XbTDjXgX4afklwmJwdt9MQbgKEEgSITqf+MdjHce
 1CQaaXDEmMJ/q4eGkcuyxTmjqj3irBGzfsACkJMDvp7I02ZM9Ot/71ADVTGsrJM/p52Z
 O3c9ZehuTfbbYXPODvwzAM/FsAy6GioMNR9AnyL/eU1AiA64owxbIDP508IyOobgq8Q8
 Zemg==
X-Gm-Message-State: AOAM530l9VNvSb0Tiab0DQz/9ExUJTGra9Gw1sbx8YTQZHRnsAuDIx8e
 JSofNaR5KlWqtelE96oVPMrBmTsbbJjOH9y3mJw=
X-Google-Smtp-Source: ABdhPJyo+Hn11Im3Z2Ay5kJFufoe86GK/lQJ5Sg7VNdeD8K27/RKfqnL99XhKbdssnvHeaERQBUBG5gRDeMgBc/nPyw=
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr10833172ljl.457.1618032341292; 
 Fri, 09 Apr 2021 22:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210409225346.432312-1-opensource@vdorst.com>
In-Reply-To: <20210409225346.432312-1-opensource@vdorst.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Sat, 10 Apr 2021 13:25:31 +0800
Message-ID: <CALW65jZRs4DBOpWiY+CxWZmX9wXhSP1cM-qeftC=xY2=Tr+HoA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add support for EEE features
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Sean Wang <sean.wang@mediatek.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_222544_018153_D2063C67 
X-CRM114-Status: GOOD (  15.10  )
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

SGkgUmVuw6ksCgpPbiBTYXQsIEFwciAxMCwgMjAyMSBhdCA2OjU0IEFNIFJlbsOpIHZhbiBEb3Jz
dCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPiB3cm90ZToKPiAtLS0gYS9kcml2ZXJzL25ldC9kc2Ev
bXQ3NTMwLmMKPiArKysgYi9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKPiBAQCAtMjU2OCw2ICsy
NTY4LDExIEBAIHN0YXRpYyB2b2lkIG10NzUzeF9waHlsaW5rX21hY19saW5rX3VwKHN0cnVjdCBk
c2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgbWNyIHw9
IFBNQ1JfVFhfRkNfRU47Cj4gICAgICAgICAgICAgICAgIGlmIChyeF9wYXVzZSkKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBtY3IgfD0gUE1DUl9SWF9GQ19FTjsKPiArCj4gKyAgICAgICAgICAg
ICAgIGlmIChtb2RlID09IE1MT19BTl9QSFkgJiYgcGh5ZGV2ICYmCj4gKyAgICAgICAgICAgICAg
ICAgICAhKHByaXYtPmVlZV9kaXNhYmxlZCAmIEJJVChwb3J0KSkgJiYKPiArICAgICAgICAgICAg
ICAgICAgIHBoeV9pbml0X2VlZShwaHlkZXYsIDApID49IDApCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbWNyIHw9IFBNQ1JfRk9SQ0VfRUVFMUcgfCBQTUNSX0ZPUkNFX0VFRTEwMDsKCllvdSBz
aG91bGQgYWRqdXN0IHRoaXMgYWNjb3JkaW5nIHRvIGUtPmFkdmVydGlzZWQuCgo+ICAgICAgICAg
fQo+Cj4gICAgICAgICBtdDc1MzBfc2V0KHByaXYsIE1UNzUzMF9QTUNSX1AocG9ydCksIG1jcik7
Cj4gQEAgLTI4MDAsNiArMjgwNSw0OSBAQCBtdDc1M3hfcGh5X3dyaXRlKHN0cnVjdCBkc2Ffc3dp
dGNoICpkcywgaW50IHBvcnQsIGludCByZWdudW0sIHUxNiB2YWwpCj4gICAgICAgICByZXR1cm4g
cHJpdi0+aW5mby0+cGh5X3dyaXRlKGRzLCBwb3J0LCByZWdudW0sIHZhbCk7Cj4gIH0KPgo+ICtz
dGF0aWMgaW50IG10NzUzeF9nZXRfbWFjX2VlZShzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBw
b3J0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBldGh0b29sX2VlZSAq
ZSkKPiArewo+ICsgICAgICAgc3RydWN0IG10NzUzMF9wcml2ICpwcml2ID0gZHMtPnByaXY7Cj4g
KyAgICAgICB1MzIgZWVlY3IsIHBtc3I7Cj4gKwo+ICsgICAgICAgZS0+ZWVlX2VuYWJsZWQgPSAh
KHByaXYtPmVlZV9kaXNhYmxlZCAmIEJJVChwb3J0KSk7Cj4gKwo+ICsgICAgICAgaWYgKGUtPmVl
ZV9lbmFibGVkKSB7Cj4gKyAgICAgICAgICAgICAgIGVlZWNyID0gbXQ3NTMwX3JlYWQocHJpdiwg
TVQ3NTMwX1BNRUVFQ1JfUChwb3J0KSk7Cj4gKyAgICAgICAgICAgICAgIGUtPnR4X2xwaV9lbmFi
bGVkID0gIShlZWVjciAmIExQSV9NT0RFX0VOKTsKPiArICAgICAgICAgICAgICAgZS0+dHhfbHBp
X3RpbWVyID0gR0VUX0xQSV9USFJFU0goZWVlY3IpOwo+ICsgICAgICAgICAgICAgICBwbXNyID0g
bXQ3NTMwX3JlYWQocHJpdiwgTVQ3NTMwX1BNU1JfUChwb3J0KSk7Cj4gKyAgICAgICAgICAgICAg
IGUtPmVlZV9hY3RpdmUgPSBlLT5lZWVfZW5hYmxlZCAmJiAhIShwbXNyICYgUE1TUl9FRUUxRyk7
CgplZWVfZW5hYmxlZCBhbmQgZWVlX2FjdGl2ZSB3aWxsIGJlIHNldCBpbiBwaHlfZXRodG9vbF9n
ZXRfZWVlLCBubyBuZWVkCnRvIHNldCB0aGVtIGhlcmUuCgo+ICsgICAgICAgfQo+ICsKPiArICAg
ICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IG10NzUzeF9zZXRfbWFjX2VlZShz
dHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBwb3J0LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBldGh0b29sX2VlZSAqZSkKPiArewo+ICsgICAgICAgc3RydWN0IG10NzUz
MF9wcml2ICpwcml2ID0gZHMtPnByaXY7Cj4gKyAgICAgICB1MzIgZWVlY3I7Cj4gKwo+ICsgICAg
ICAgaWYgKGUtPmVlZV9lbmFibGVkKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChlLT50eF9scGlf
dGltZXIgPiAweEZGRikKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiArICAgICAgICAgICAgICAgcHJpdi0+ZWVlX2Rpc2FibGVkICY9IH5CSVQocG9ydCk7Cj4gKyAg
ICAgICAgICAgICAgIGVlZWNyID0gbXQ3NTMwX3JlYWQocHJpdiwgTVQ3NTMwX1BNRUVFQ1JfUChw
b3J0KSk7Cj4gKyAgICAgICAgICAgICAgIGVlZWNyICY9IH4oTFBJX1RIUkVTSF9NQVNLIHwgTFBJ
X01PREVfRU4pOwo+ICsgICAgICAgICAgICAgICBpZiAoIWUtPnR4X2xwaV9lbmFibGVkKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIC8qIEZvcmNlIExQSSBNb2RlIHdpdGhvdXQgYSBkZWxheSAq
Lwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVlZWNyIHw9IExQSV9NT0RFX0VOOwo+ICsgICAg
ICAgICAgICAgICBlZWVjciB8PSBTRVRfTFBJX1RIUkVTSChlLT50eF9scGlfdGltZXIpOwo+ICsg
ICAgICAgICAgICAgICBtdDc1MzBfd3JpdGUocHJpdiwgTVQ3NTMwX1BNRUVFQ1JfUChwb3J0KSwg
ZWVlY3IpOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgcHJpdi0+ZWVlX2Rp
c2FibGVkIHw9IEJJVChwb3J0KTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsK
PiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
