Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EA7C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 15:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D8D206E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 15:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cLvljlw9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GW+qXcq4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6D8D206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6m4ejz8H1nGljWNSLOCa7T3VmfgLqeRLgxgabNn8me8=; b=cLvljlw9jLeyM1
	JTJ94YF8r6un0TTntLH4hbedmn0Fw6Ig36OzOexLrbrEavbPb2zSMh89HELPGz/AGP8moweBKAxmr
	iGvgrRgOryriivCAfVg97j7oDd5wNcDHVga0F9muP5H1jmcz9xTykd+yUX6atEJmjYyrihFMVEZfD
	Z7AKlPEvZOXXRZ5xLxiZ6Ix6iX74UFCdjEYRQ/CI57ZIaH6JiFCF4+GY/KoG+GEkmEUb8jZLEjLy5
	+pn4R8SNf6CF1Yg3iQHolBPmpNv6YPcQ1NXfF6HwyQ56QFR7t1kQTxw72+Z9O6D8jp/fJq8sQO2bP
	Rmz41cq4AhlNvflc+Aew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igsAd-0005VL-Ef; Mon, 16 Dec 2019 15:20:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igsAZ-0005U6-Tq
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 15:20:25 +0000
Received: by mail-wr1-x443.google.com with SMTP id z3so212565wru.3
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2019 07:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=yKFHERdNdPN6Ex8JOu2in3qBAjlasmuEZDq7sRDudK0=;
 b=GW+qXcq4BZ5dkIThObt2lOqawmLIk3OWXTb/8HhvjYhT072tqZEPE5CZw2zJVCuca6
 97PO7Bucb15eOo9VR5dF8osj4RSOlIeLX8dELi2xEhj+uiMZIrr8ldSDwNd26lrbapFG
 U1/x43PLG29ouKCNZ63dCgsxfaGOPqSYNesWjbPMg/tsXCHHgFF/MvK7b8gFdVfJK0T6
 qT3lq19j8new3QRUhZc03HP3qQq3iq4uRkcCSV+0ZY0/4+lYd+tXPuRysNY3gX2QKAG/
 WVORCiSTVnvWKKlgh3q6OmERq1GOtnmorsvYfRGuN6kVfxIsC+TiIb91EkGIxzLdXHTM
 aIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=yKFHERdNdPN6Ex8JOu2in3qBAjlasmuEZDq7sRDudK0=;
 b=m7Lpf5S3Gr+yQDr/hRs2SMcl5vBRvXIcJhyXesh4lFpO1WVsXyx/0GCtqeOjQoWaIJ
 O5oFFZN6DONhKhYfF9hc+NPV8iOKaQB+mZYCAXXFuW67iaLkE0vAy7G4XqrPNGs1PwyT
 h2h38yexW0a+K/E4TkIsasRDuWSakzfJdzFT81rxZYT2IoFzKyFqjOoQUEke6QWTEDOY
 n0MNSOD3JLdJACbbMM0BByQJ1/6JYLQ2Zm83c6H9jC5tL5FSKeQykeNJKVWRRkDiZeAP
 u7IFlHkWEyNy2RPwrxdOQ5jr/RWAI0deRVIrOj2vjPwltmETVWT7QE1SkyNKmMcTE7wx
 izqA==
X-Gm-Message-State: APjAAAU80bxI1ACplPU5G97U2losE/UQzeytsnczTogzEZMEpEzGEbfZ
 ER9bjVSJxaKXAt5e0L62j7GbvA==
X-Google-Smtp-Source: APXvYqy1jbVR7FkN0kaR1W+4ZJ9ENvko5dMwnYV5wp0d91OQNJTU1+OxRy+dD9MAF1z6WCEDFVuptw==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr31600584wru.170.1576509621307; 
 Mon, 16 Dec 2019 07:20:21 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id l2sm20713536wmi.5.2019.12.16.07.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 07:20:20 -0800 (PST)
Date: Mon, 16 Dec 2019 15:20:19 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v7 1/6] mfd: mt6397: modify suspend/resume behavior
Message-ID: <20191216152019.GE2369@dell>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1576057435-3561-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576057435-3561-2-git-send-email-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_072023_976423_77B4996D 
X-CRM114-Status: GOOD (  10.38  )
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

T24gV2VkLCAxMSBEZWMgMjAxOSwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gU29tZSBwbWlj
cyBkb24ndCBuZWVkIGJhY2t1cCBpbnRlcnJ1cHQgc2V0dGluZ3MsIHNvIHdlIGNoYW5nZSB0byB1
c2UKPiBwbSBub3RpZmllciBmb3IgdGhlIHBtaWNzIHdoaWNoIGFyZSBuZWNlc3NhcnkgdG8gc3Rv
cmUgc2V0dGluZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1o
c2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM5Ny1jb3Jl
LmMgICAgICAgfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9t
ZmQvbXQ2Mzk3LWlycS5jICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvY29yZS5oIHwgIDIgKysKPiAgMyBmaWxl
cyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCkZvciBteSBvd24g
cmVmZXJlbmNlOgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmlj
YWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
