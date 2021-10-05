Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E38C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0329611C5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0329611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVHw2DC4c1ZCEkpxeivWxok1RPjydjF1/CEwc/b/8SA=; b=zQMZlqQFqNCI/LRIVYgQwKvnEk
	i2AgtGYlI+OD3KrwGSbwC8tmrHpGTXKe6xB2FEZjjruMiMgRFcwB29Mw/npMZg65wOjniPtyMNX6n
	qqUHnECoHxU083+SzSWWJNtbXUmXA+6losQOLrC1Yl9m4N734pulQjCRe2ikwe/RcSBxI4d245heA
	7cIfc/Z+87WcbxsR2MJjoKl3LlB8e2jau4btF8rvKZvkhzKWEs5ZagrE/IfXEdA9sOOhPNY5AZPTb
	OoQvXbn/wzayZ0DC8W92yPbOxIann6Sglngu/bM1VU0OItuVahVk9AOwcdjwO0hsjnenhYm9JPITf
	XUHufDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXqBZ-00Bf1l-E8; Tue, 05 Oct 2021 19:33:09 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXqBW-00Bf0t-KU; Tue, 05 Oct 2021 19:33:07 +0000
Received: by mail-lf1-x129.google.com with SMTP id i4so481299lfv.4;
 Tue, 05 Oct 2021 12:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mnw929F+QI2LJCOMHvncA5yXLsxHMMtEgXZ8YjCURP0=;
 b=LOkaoCOgIJr/xRS71R/aGAl16ufAufpmQ6LQa9PSMe1IkxPWbhUMT9y9KVDXPnlAlb
 g8cm0s0TzWU7cp28BV8qCiKosF0KefkIHWSLiL/YRITiXRg4ueMabBFHLdtstcelVLoV
 FfdUDXpDfSl2222FxMvvQdg3Tz84BHANry18dE/7fE+RTWh7BNFTnlAduXayKgmzL+/Q
 h/qEIgr0iMl6h5WAuiH67Vj1Hqnr8mNGo+GBi62+EU+LMhRk+hpF8l0NsHRrHmIakOSo
 WG1aRsWrdbdutuGftaTAyENWv4X6ZMn3EVcPU1IdyrZT8ClZOGUc/DF6vTVEbC+7F8AY
 BswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mnw929F+QI2LJCOMHvncA5yXLsxHMMtEgXZ8YjCURP0=;
 b=E6JHstq2xLRP8rTZ2OUWcNjFmF28pMbh4Ov5b8lmCjuonMgHw+XDVonR8xnuHD80pv
 WrceIZm33YzxsriGbrT7MkNk4H/YSvH0ow5O9OdAOckwgRjusewRdc6SupWFhztGPfZy
 Khn9Jc3psn4mbyIlVfVt07iQMQxI4JlW1AwQwZvpBFjYNB0oOAv4kHDAZ0WwdCXrkcMu
 OoJq0OGSgpRHndkdSLZ8BaFPCaAWSRUpqTQbVN8cKe0td/UHoMzkVDjay9i6vBTIaBaF
 sI78Bdy0Ba9RwWItys12wpfvdBCvvmyIr4OjmqOVw6yUOmtWPV/+Sl0KYS3clmDBDXVi
 zgfQ==
X-Gm-Message-State: AOAM5326+fnIpNNOlTRjRDsk+zD8diPl341EUURB3krA0lJSDHvNnqCW
 8w7qs2XGytTV2HC0o4H5Xfg=
X-Google-Smtp-Source: ABdhPJw6jz+UwRuXxIZNsejqH598H90/HYL7Ur7sw+6Sq7kBCBP9Q3ncqHKUUiZEMVYXyLv2v5Cp+w==
X-Received: by 2002:a19:c70b:: with SMTP id x11mr5373363lff.57.1633462384164; 
 Tue, 05 Oct 2021 12:33:04 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
 by smtp.gmail.com with ESMTPSA id e30sm122581lfc.112.2021.10.05.12.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:33:03 -0700 (PDT)
Subject: Re: [PATCH v15 0/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
 <CAE+NS34qtKgQYiCLQDupLK8L84SVS9EsztOpQFtS_CoOPzNwzQ@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <417ee2ca-daf3-3559-5ea5-7f08c655f16b@gmail.com>
Date: Tue, 5 Oct 2021 21:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS34qtKgQYiCLQDupLK8L84SVS9EsztOpQFtS_CoOPzNwzQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_123306_709756_898E7C15 
X-CRM114-Status: GOOD (  12.42  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGF2ZWwsCgpPbiAxMC81LzIxIDExOjIxIEFNLCBHZW5lIENoZW4gd3JvdGU6Cj4gR2VuZSBDaGVu
IDxnZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0N+aciDE25pelIOmAseS6
lCDkuIvljYg0OjMz5a+r6YGT77yaCj4+Cj4+Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZCBNVDYz
NjAgTEVEIHN1cHBvcnQgY29udGFpbnMgZHJpdmVyIGFuZCBiaW5kaW5nIGRvY3VtZW50Cj4+Cj4+
IEdlbmUgQ2hlbiAoMikKPj4gICBkdC1iaW5kaW5nczogbGVkczogQWRkIGJpbmRpbmdzIGZvciBN
VDYzNjAgTEVECj4+ICAgbGVkczogbXQ2MzYwOiBBZGQgTEVEIGRyaXZlciBmb3IgTVQ2MzYwCj4+
Cj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAu
eWFtbCB8ICAxNTkgKysKPj4gICBkcml2ZXJzL2xlZHMvZmxhc2gvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxMwo+PiAgIGRyaXZlcnMvbGVkcy9mbGFzaC9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxCj4+ICAgZHJpdmVycy9sZWRzL2Zs
YXNoL2xlZHMtbXQ2MzYwLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA5MTAgKysrKysrKysr
KysrKysrKwo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMTA4MyBpbnNlcnRpb25zKCspCgpEbyB5b3Ug
c2VlIEdlbmUncyBlbWFpbHMgb3IgbWF5YmUgdGhleSBsYW5kIHNvbWVob3cgaW4geW91ciBzcGFt
IGZvbGRlcj8KSXQncyBiZWVuIGZvdXIgbW9udGhzIHNpbmNlIGxhc3QgdmVyc2lvbiBhZGRyZXNz
aW5nIHlvdXIgcmVtYXJrcy4KCi0tIApCZXN0IHJlZ2FyZHMsCkphY2VrIEFuYXN6ZXdza2kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
