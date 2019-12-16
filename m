Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719BCC43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 15:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C169206E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 15:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOlf3LXD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9eRHG6c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C169206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=825Tfm7gzZGj3tOK/xPVGxACubp2SJOqiu+RrdEQrpQ=; b=tOlf3LXDV+zWmq
	dfel0Uh1S9EqBYvo6uGJtXnp7PV9RQehLKdhUpu9OCpjhQP22OYLxHuhdeSGCbIdLRJzk7i+9uQyP
	+ZA2pb3txCnGO6LbrMpaYYlgRuvQMIyXrFsGqTm5zDX05ws5PcMqtcrQ98gbRRSjJd+fcr1N3u9GH
	4eerFzSgK8D709hJOPCVcqpFUMHV89e9fRNIn0qgH1Aooowibr4PAPj8fbFQGk05rQ84iGJrOGkTk
	ITrrlUFflHlvK17O87PwUXfPpS8djQ9bFpRX6fX/YI480ZmE9FupsQ9sUHsvysl8WwWv9uBtyqzZi
	27lcyDQ3Kfyl3JDJiF0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igsBr-0005sI-1P; Mon, 16 Dec 2019 15:21:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igsBo-0005rc-Ph
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 15:21:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id c14so7758492wrn.7
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2019 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=qLW85+iCakysrIL3d9ahlxs/+0bq3c8q3dQkkBI+mAY=;
 b=l9eRHG6cELj/1PPW5EMQL8KGSpML40lgI42oonoObgVkQJpwcUpAhOzugGJ1YzDVh/
 Xn+g5HPMl+dLsYUrlg7312P/+FNbj9QEnm2kVtOKCQdPOD447fXhj6oyX5lGi6hArYGI
 ORKa/zBvvQR/ijSqhhv+sdOOlpsJpm4PmFmwb3UgJplzSokAD8u8b9pQ7kaUsCXJ9f9m
 Lv/bhO/Swr+5cFJ21U8uk/Jd33llMPn0xeTlVRk8bVjXZJZrg3/QC8m5DHrKlgB4M0QV
 osHGkfb8Z2PSqzmCGeUX3qd3TpPIq2QDjMGPHvZoY2oInrkzLxNL6LEBL8zZzqTbZKg1
 pYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qLW85+iCakysrIL3d9ahlxs/+0bq3c8q3dQkkBI+mAY=;
 b=Bt4x9kWULPeAqQkMDiuDQ2am4n1ue5beP//vyXmv33NYj2sQ6P3BHQwwRPSyqwZmt/
 N2+75EwnWTksapEldFrwIyfw1iNhRjizHKx//GNrdtqyxJsOuD8qA/oFb+yopriUpdiC
 j4RBbTOUn7kYyZas/q47MJt/ZfEPfpYAFKbMp+1VTuZ9SfilggIwzHppDdg0TT0lBKaR
 LQC+YiJuAbVGG1fB4EK47n9zIVhFwRSPDjWDIFAKsSjkIXlK5TIeBdds4d4F9lOs09oh
 87yaUCRiisNmeawDUeGt2xx27RESnyr+t8mPg6xQmmmoLuTMsWlQSeFIf+LzvPDobSnu
 pHog==
X-Gm-Message-State: APjAAAXAQ2Hb+2lbwNdOoVylSLQ5kyID3X5MK1C7PeCXPgRIup4niwGs
 dMQnDsC78jhGASmy9aNC2DJ6Vw==
X-Google-Smtp-Source: APXvYqweC7S5MEqLKn13rfYs2+xIpXzL1Op8mNT8o+RON6KKvlXrllfQ92Cbjp2t7tj6nFBRu6VFaw==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr32672267wrt.100.1576509699617; 
 Mon, 16 Dec 2019 07:21:39 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id x10sm22076901wrv.60.2019.12.16.07.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 07:21:39 -0800 (PST)
Date: Mon, 16 Dec 2019 15:21:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v7 6/6] rtc: Add support for the MediaTek MT6358 RTC
Message-ID: <20191216152138.GF2369@dell>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1576057435-3561-7-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576057435-3561-7-git-send-email-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_072140_846848_687D50EF 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCAxMSBEZWMgMjAxOSwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gRnJvbTogUmFu
IEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPgo+IAo+IFRoaXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBN
ZWRpYVRlayBNVDYzNTggUlRDLiBEcml2ZXIgdXNpbmcKPiBjb21wYXRpYmxlIGRhdGEgdG8gc3Rv
cmUgZGlmZmVyZW50IFJUQ19XUlRHUiBhZGRyZXNzIG9mZnNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSYW4gQmkgPHJhbi5iaUBtZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1
bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gQWNrZWQtYnk6IEFsZXhh
bmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ydGMvcnRjLW10NjM5Ny5jICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLS0t
Cgo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmggfCAxNiArKysrKysrKysrKysrKyst
CgpBY2tlZC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
