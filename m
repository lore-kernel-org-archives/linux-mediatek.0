Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7379CC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:06:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED724610CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED724610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k7f/sAg5cO2pDEAlfBmTtDDrPb8kBcDtn6yVfCHO/pU=; b=m875vXxAota5xOj5rLDaG03Kx
	dZP/ufo91wh/wOfFYqEz2BJktP8YtcPdJ1WbQb8FhFHsUqqcWzCZK69jI/P/CwEIhBVP21+GYgpbQ
	96oizbmr67sBmy7AvCP3b+DCKD9jjTcq07uf45PNjmbKzLcEPycY376u3RZ5AaFB0wzapz2zkq9ue
	TTxNXKVVXgk5EzNIh1NCpL9DN45SdRTgQd7Kdcf3hYjinxOyyIIegA3ZJyp9ELEca/p+2hDv3zUJn
	YTIA12YS23rkLF7jMR0ANJe+VOumbVrnRYTIiwhE+sh+8bzpQbm3g0YnL8X9mXmTBy2VGNHFlOvn2
	NTBc2SHsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHc1-000x7C-O6; Fri, 16 Apr 2021 06:05:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHUc-000vt6-5o; Fri, 16 Apr 2021 05:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Ze0E4HckaFH5mJg66hViAQBt3akuirU2NsikBcdw7Ls=; b=MLPH2JnQbLJeEKIoXo5275wiFr
 bSh03wyIyD4qIsHCJWDfbTuXcq8R3MySU5dzv2h1IB4Zt1g3pKVeih9XzC/qO/RCSJ6V2qCfCLn5P
 oPbaDe7MtjR/v9ZdMbEykWZ032/jtAxnpnQl9gafVdGyogVnFeLiJVmRiCICt4nI8q0mJMzqmj1q+
 23OdEewQLlSiVnM+TIIB33jzdMCSWS5nwRqyfTHxXrkHr8JM80X91MOWMsn+DUGmPeKj5RZMbgzcO
 JTxS2VKg3TamCwzKDbbQGUIc5izQ0dYK/dJscP1WPgschubW5wGPWv1OdR9hTIZGcAdv8/BE8TcPO
 zq5t+n9Q==;
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHUZ-0096Is-LY; Fri, 16 Apr 2021 05:58:13 +0000
Received: by mail-oi1-x236.google.com with SMTP id a21so13700059oib.10;
 Thu, 15 Apr 2021 22:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ze0E4HckaFH5mJg66hViAQBt3akuirU2NsikBcdw7Ls=;
 b=qJRTgttDvK9iZe0dwcrtYQMSQMFZK4D2s51cYpBDMULGJ1jtblkpfMyafwedvaarfh
 PvGjqPITGHIeajL5QUtoBWBoVK4oKJFTzQuJl0i/5GdqNd9bQ3XKGdcQx/4aq1hAqpCX
 PY7VkAV+qRiK0O9IQO1qg51+76s0AWNfmyMBDQEuQxXYYhyxnoTxE5wXdhckqS7pwkf+
 lOQ487LH59h2nv7+fk6LqTcY2it57EyAdor1Fm0vhpg1a8VUUP7obkk1NG9Hk4Zp9elu
 u2RzIsjFT/LQ1Ul0gwqczienwM7FYG3iZvjG3H29YXphJLIcL+PTMhH9qu8jqTk11HNN
 WY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ze0E4HckaFH5mJg66hViAQBt3akuirU2NsikBcdw7Ls=;
 b=bu5KbYyLJ1TmTxMhLaWnn09eaD+yrKGUqjC8f81OEk43NOSuZCY6MDIGlUGNh0XRyv
 mBE1KTk2mdMWUNr/BMaP1w2mrC/3eU6viaCxITwiCWPT3yjJCcKMOFUZuLn7HPsGuZj8
 6Ww/rMfKHZqZ8yG/WFHz9ebLEFxqQ8yw/1EqhGMEWO+4phCNviY3tCbewtX9f1mULTaa
 3qVPYStmEePmqPQN/M8jBSNDOHMKp6bzAxiQVkSDi0wTWokW+SSd7HkRrGNrS+Pww6Ad
 7O8eVSp9oWnlzleNje/F0MBMQf9MqLSn4ViTQp56SBCpN8vTcgCh5AXq0/miqrVG0HYg
 sAbw==
X-Gm-Message-State: AOAM530PIEZUZ9MWm+Tez5oqctuELMM0ilOef422mYHe5XpkzIIwbNrS
 HGBs8I5i+V7pq3l4YxwFQZYuW/D+VUpwchFb7SY=
X-Google-Smtp-Source: ABdhPJx8nO9o2WPSuUZ1vQVPGCgRInpsGr+23PnyET35hB7M1rBLSeV+ffHh6TEno7oYmmY/u4DtIRfYEvO7VCn6Cig=
X-Received: by 2002:a05:6808:bd6:: with SMTP id
 o22mr5259675oik.129.1618552690038; 
 Thu, 15 Apr 2021 22:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-4-hsinyi@chromium.org>
In-Reply-To: <20210415093519.1920877-4-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 07:58:01 +0200
Message-ID: <CAFqH_506gmouWeLRXhRbUpaQ7Xb+bOOJt_65GnPsYE4oRs05XA@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kenzo
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_225811_725590_87EB849C 
X-CRM114-Status: GOOD (  14.14  )
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

SGkgSHNpbi1ZaSwKClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4KCk1pc3NhdGdlIGRlIEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gZGVsIGRpYSBkai4sIDE1IGTigJlhYnIuCjIw
MjEgYSBsZXMgMTE6MzY6Cj4KPiBLZW56byBpcyBrbm93biBhcyBBY2VyIENocm9tZWJvb2sgMzEx
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoK
UmV2aWV3ZWQtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxh
Ym9yYS5jb20+Cgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L21lZGlhdGVrLnlhbWwgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbAo+IGluZGV4IDA4NzA0OTBhYTM1MC4uMzllNGE5
OWViYjM3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vbWVkaWF0ZWsueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vbWVkaWF0ZWsueWFtbAo+IEBAIC0xMzcsOSArMTM3LDExIEBAIHByb3BlcnRpZXM6Cj4g
ICAgICAgICAgaXRlbXM6Cj4gICAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsZGFtdQo+ICAgICAg
ICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTgzCj4gLSAgICAgIC0gZGVzY3JpcHRpb246IEdv
b2dsZSBKdW5pcGVyIChBY2VyIENocm9tZWJvb2sgU3BpbiAzMTEpCj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IEdvb2dsZSBKdW5pcGVyIChBY2VyIENocm9tZWJvb2sgU3BpbiAzMTEpIC8gS2Vuem8g
KEFjZXIgQ3Job21lYm9vayAzMTEpCj4gICAgICAgICAgaXRlbXM6Cj4gLSAgICAgICAgICAtIGNv
bnN0OiBnb29nbGUsanVuaXBlci1za3UxNgo+ICsgICAgICAgICAgLSBlbnVtOgo+ICsgICAgICAg
ICAgICAgIC0gZ29vZ2xlLGp1bmlwZXItc2t1MTYKPiArICAgICAgICAgICAgICAtIGdvb2dsZSxq
dW5pcGVyLXNrdTE3Cj4gICAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsanVuaXBlcgo+ICAgICAg
ICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTgzCj4gICAgICAgIC0gZGVzY3JpcHRpb246IEdv
b2dsZSBLYWthZHUgKEFTVVMgQ2hyb21lYm9vayBEZXRhY2hhYmxlIENNMykKPiAtLQo+IDIuMzEu
MS4yOTUuZzllYTQ1YjYxYjgtZ29vZwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
