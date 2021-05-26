Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDCFC4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:47:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC3861430
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC3861430
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJxr+lgI7M1uYcpzj4O7kxUaiaZaa8XTgdgIh6eVdRk=; b=WgbpF50Q/jd0ag
	vRtWOKA6J/yBlV4yg3up9I5TQONCY22742glvbVwHMUSQydplaJkd7fWhqRv5znFm2bL9iKmfogdF
	l39ml7voWULlZXqd0e2W7ADXlXwTsDXokWv2hzEO18kOa32rFk7MiqcpOqYiiYME3nN6+4HKimWUi
	oJJDvE2bQViwH2H5fEaKs70kLgj1xygng5Wnglmo0GNGyqpEPc+5ucUnyyvmOohqCWX1PMOuSn2Sq
	iiulLJWeZPGbP3adc9PrAccNJW6MunafTjV31aASze6ZylsU3fho+4aXKgLXbuKXbGhZpwxbTegQL
	DSpLugxIKPZXZrev37Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llja4-00ADvB-1t; Wed, 26 May 2021 02:47:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljZp-00ADke-Mq; Wed, 26 May 2021 02:47:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41F076142D;
 Wed, 26 May 2021 02:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621997241;
 bh=sKcmWhJmVsIPdkX6fdFoAIC9r4N6jPGMkT7L2NUL4Sw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Pgk9dH1ZD5Vu8B97z4WJqYgpSwz2kzsBILrAGP4aNFWDu4IFYkHtsZIjUzunj6R0K
 6S1FoiFpLFYMO+fFxfj4JwAW34UlBxslC5d5p/uVCp3ZCH9qZN3add3eOyiar5S3mR
 AMo/SJqdpTgVGDArMwefDxbIF6+4uaIjvIw5dXCzyOBzn5zyJIgihs1xXYUhgDKKsl
 MT1Z022sEHnX3kaxMMK9ArW4LAXqgP+ggyjp4Savpd3OZMSKdrCPzwFbpTjLNUGWxf
 ON/tkUoCb2JyTILn0eT5jzEvFsZs3yaUPgX8qqYAEk0xbG0DW+IUfIuJ6ubTP2pWeI
 vHKcCPIwcl07Q==
Received: by mail-ed1-f46.google.com with SMTP id j10so21107244edw.8;
 Tue, 25 May 2021 19:47:21 -0700 (PDT)
X-Gm-Message-State: AOAM532vMwZBhg+Yagy4X0wh3Jmw2VPRN4DMxcTRln5mv9z8XCXVgtLu
 mdwwrBV+c49G1lR0nLlvIqjNX7Paemd09TaJew==
X-Google-Smtp-Source: ABdhPJwZ9qhKoR/4aN1yXlD5plSJwQb48VNfGpy4rh2cgs/Z+gzv3xIUzO+FkXgz28nH6QdNiD2ByhbTu7W1IKIoSuY=
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr35286163edt.303.1621997239928; 
 Tue, 25 May 2021 19:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210525121448.30075-1-rex-bc.chen@mediatek.com>
 <20210525121448.30075-3-rex-bc.chen@mediatek.com>
In-Reply-To: <20210525121448.30075-3-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 May 2021 10:47:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__0EU5Sjo2ygj2tXHk3VTRuyEf+q4cGh3nGN1K1vMkFMw@mail.gmail.com>
Message-ID: <CAAOTY__0EU5Sjo2ygj2tXHk3VTRuyEf+q4cGh3nGN1K1vMkFMw@mail.gmail.com>
Subject: Re: [v4,PATCH 2/3] drm/mediatek: config driver data to support dual
 edge sample
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_194721_805579_CFFF10B7 
X-CRM114-Status: GOOD (  13.89  )
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

SGksIFJleDoKClJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+IOaWvCAyMDIx
5bm0NeaciDI15pelIOmAseS6jCDkuIvljYg4OjE15a+r6YGT77yaCj4KPiBBZGQgb3V0cHV0X2Zt
dHMgYW5kIG51bV9vdXRwdXRfZm10cyB2YWx1ZSBmb3IgYWxsIGNvbmZpZ3VyYXRpb24uCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogUmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDE3ICsrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHBpLmMKPiBpbmRleCBkM2I4ODNjOTdhYWYuLmQ2YTQyMjk4NmVmYyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC02OTUsMTAgKzY5NSwyMSBAQCBzdGF0aWMg
dW5zaWduZWQgaW50IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yKGludCBjbG9jaykKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIDI7Cj4gIH0KPgo+ICtzdGF0aWMgY29uc3QgdTMyIG10ODE3M19vdXRw
dXRfZm10c1tdID0gewo+ICtNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAoKaW5kZW50LgoKPiAr
fTsKPiArCj4gK3N0YXRpYyBjb25zdCB1MzIgbXQ4MTgzX291dHB1dF9mbXRzW10gPSB7Cj4gK01F
RElBX0JVU19GTVRfUkdCODg4XzJYMTJfTEUsCj4gK01FRElBX0JVU19GTVRfUkdCODg4XzJYMTJf
QkUsCgpkaXR0by4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICt9Owo+ICsKPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2NvbmYgPSB7Cj4gICAgICAgICAuY2FsX2Zh
Y3RvciA9IG10ODE3M19jYWxjdWxhdGVfZmFjdG9yLAo+ICAgICAgICAgLnJlZ19oX2ZyZV9jb24g
PSAweGUwLAo+ICAgICAgICAgLm1heF9jbG9ja19raHogPSAzMDAwMDAsCj4gKyAgICAgICAub3V0
cHV0X2ZtdHMgPSBtdDgxNzNfb3V0cHV0X2ZtdHMsCj4gKyAgICAgICAubnVtX291dHB1dF9mbXRz
ID0gQVJSQVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ICB9Owo+Cj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10MjcwMV9jb25mID0gewo+IEBAIC03MDYsMTggKzcxNywy
NCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDI3MDFfY29uZiA9IHsKPiAg
ICAgICAgIC5yZWdfaF9mcmVfY29uID0gMHhiMCwKPiAgICAgICAgIC5lZGdlX3NlbF9lbiA9IHRy
dWUsCj4gICAgICAgICAubWF4X2Nsb2NrX2toeiA9IDE1MDAwMCwKPiArICAgICAgIC5vdXRwdXRf
Zm10cyA9IG10ODE3M19vdXRwdXRfZm10cywKPiArICAgICAgIC5udW1fb3V0cHV0X2ZtdHMgPSBB
UlJBWV9TSVpFKG10ODE3M19vdXRwdXRfZm10cyksCj4gIH07Cj4KPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTgzX2NvbmYgPSB7Cj4gICAgICAgICAuY2FsX2ZhY3RvciA9
IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yLAo+ICAgICAgICAgLnJlZ19oX2ZyZV9jb24gPSAweGUw
LAo+ICAgICAgICAgLm1heF9jbG9ja19raHogPSAxMDAwMDAsCj4gKyAgICAgICAub3V0cHV0X2Zt
dHMgPSBtdDgxODNfb3V0cHV0X2ZtdHMsCj4gKyAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJS
QVlfU0laRShtdDgxODNfb3V0cHV0X2ZtdHMpLAo+ICB9Owo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRrX2RwaV9jb25mIG10ODE5Ml9jb25mID0gewo+ICAgICAgICAgLmNhbF9mYWN0b3IgPSBt
dDgxODNfY2FsY3VsYXRlX2ZhY3RvciwKPiAgICAgICAgIC5yZWdfaF9mcmVfY29uID0gMHhlMCwK
PiAgICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTUwMDAwLAo+ICsgICAgICAgLm91dHB1dF9mbXRz
ID0gbXQ4MTczX291dHB1dF9mbXRzLAo+ICsgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZ
X1NJWkUobXQ4MTczX291dHB1dF9mbXRzKSwKPiAgfTsKPgo+ICBzdGF0aWMgaW50IG10a19kcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAtLQo+IDIuMTguMAo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
