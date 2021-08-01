Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C24C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 00:00:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C65C610A1
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 00:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C65C610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6B7oGKTLe/OpCC2sYKNDQ00+16QAN4TBHXYHqCvthlM=; b=0818IHqDHgL3RV
	/HsrfY/s2McQy+IlbJJQFCynNh3vFPh19oXLxjbhoN46wfNix6t2bNQMVGlkuwfjS36vaJGC5Qhpa
	htBKW62cAPrDeTlG1PncPdkE7Km5M/EqFlt4+pGcvAhShVVdJhi8w9F6SIXOrcakbEIj6cj5Xez4Z
	TXF5OUo3gDOUVhWqBWNO0WNK95FdXc+DW+Ye/LmyEk3ddnJFI12vMsAVkhzMPOGCaHlFhNQnQn8Uq
	reUdZGbjqOC9DBECBfhLi2C/PltqfLq2pFdsrKsZDLaOS35MUiDxZo/CNnqe2uQolbVMZ+y0175Np
	Igi0uklH0ORJsUoLGqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mALNQ-00ES0I-T0; Mon, 02 Aug 2021 00:00:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mALNE-00ERym-2f; Mon, 02 Aug 2021 00:00:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67310610D1;
 Mon,  2 Aug 2021 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627862403;
 bh=5P5WW6486esvrl1w9nWW3mnfsqIMCtE21IsdFLyNPYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t4ZOjcCZSnjTqCdQGSSfU7kK7YClQbaDDzdogAaA35ze3fzNsvDpJ7voEtTOTdF1i
 FEDwXA0Oq6tHu7G5YevSF+HJkJBdfTWIAq4HRSMoF0A47t0Vf74RR2fNBg5oRxVa3B
 AOfs0fQi2j6GzZ3qsL2lqGHfNofBtmsI8sH1UuWHD34FuF7Nd+2Cfl0xErHggh0mYj
 ulbesmXAqR7eTHPwELWzdiGdruUfn01AqWLsqhaVkcxcAlgB3AAqFww4v6/sqCoZPM
 6rcDHmn0Rjjz4EdM+v09cjcPqcFGnn0CWjUgOyIG0ftvH6Id/lLGeVQRAxe2CW396h
 lScQpUFkEz2XA==
Received: by mail-ej1-f49.google.com with SMTP id h9so12504203ejs.4;
 Sun, 01 Aug 2021 17:00:03 -0700 (PDT)
X-Gm-Message-State: AOAM531IKAeDpeSOlcuG6sXuXNw8eY42zlfYNEe4qkKH/Q6i7Vd+FQeQ
 JpmXDv73l4SdhJy4ciAj8dF/f1WInmLrRRPmLg==
X-Google-Smtp-Source: ABdhPJwLhvPNChdJl+3BZnur1WssTSiE+2mRYb40oKWRSxPub5BYLVF5/p5xkaBqtwjxWpIMXY0t7uFUGmSnYhh7o/k=
X-Received: by 2002:a17:906:3707:: with SMTP id
 d7mr13160933ejc.127.1627862401906; 
 Sun, 01 Aug 2021 17:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210801040544.104135-1-jitao.shi@mediatek.com>
 <20210801040544.104135-2-jitao.shi@mediatek.com>
In-Reply-To: <20210801040544.104135-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 2 Aug 2021 07:59:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-KORHyePSbDSmc6Tdk=GpbTWewYmg9Q1ebQ0PgKADSug@mail.gmail.com>
Message-ID: <CAAOTY_-KORHyePSbDSmc6Tdk=GpbTWewYmg9Q1ebQ0PgKADSug@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mediatek: add
 force_dsi_end_without_null
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com, 
 Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_170004_191401_05EBB298 
X-CRM114-Status: GOOD (  15.50  )
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDjmnIgx5pelIOmAseaXpSDkuIvljYgxMjowNuWvq+mBk++8mgoKTW92ZSB0aGlzIHBhdGNoIGJl
Zm9yZSB0aGUgcGF0Y2ggImRybS9tZWRpYXRlazogZm9yY2UgaHNhIGhicCBoZnAKcGFja2V0cyBt
dWx0aXBsZSBvZiBsYW5lbnVtIHRvIGF2b2lkIHNjcmVlbiBzaGlmdCIsCmFuZCB0aGlzIHBhdGNo
J3MgdGl0bGUgc2hvdWxkIGJlICJkdC1iaW5kaW5nczogZHJtL2JyaWRnZTogYW54NzYyNToKYWRk
IGZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsIgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBU
aGUgZm9yY2VfZHNpX2VuZF93aXRob3V0X251bGwgcmVxdWlyZXMgdGhlIGRzaSBob3N0IGVudCBh
dAo+IHRoZSBzYW1lIHRpbWUgaW4gbGluZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8
aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2FuYWxvZ2l4LGFueDc2MjUueWFtbCAgICAgICAgICAgfCA2ICsrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4LGFueDc2MjUueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbmFsb2dp
eCxhbng3NjI1LnlhbWwKPiBpbmRleCBhYjQ4YWIyZjQyNDAuLjhiODY4YTZhM2Q2MCAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
YW5hbG9naXgsYW54NzYyNS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4LGFueDc2MjUueWFtbAo+IEBAIC00Myw2ICs0
MywxMSBAQCBwcm9wZXJ0aWVzOgo+ICAgIHZkZDMzLXN1cHBseToKPiAgICAgIGRlc2NyaXB0aW9u
OiBSZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUgc3VwcGx5IDMuM1YgcG93ZXIuCj4KPiArICBm
b3JjZV9kc2lfZW5kX3dpdGhvdXRfbnVsbDoKPiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gKyAgICAg
IFJlcXVpcmVzIHRoZSBkc2kgaG9zdCBzZW5kIHRoZSBkc2kgcGFja2V0cyBvbiBhbGwgbGFuZXMg
YWxpZ25lZAo+ICsgICAgICBhdCB0aGUgZW5kLgo+ICsKPiAgICBwb3J0czoKPiAgICAgICRyZWY6
IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydHMKPgo+IEBAIC04Nyw2ICs5Miw3
IEBAIGV4YW1wbGVzOgo+ICAgICAgICAgICAgICB2ZGQxMC1zdXBwbHkgPSA8JnBwMTAwMF9taXBp
YnJkZz47Cj4gICAgICAgICAgICAgIHZkZDE4LXN1cHBseSA9IDwmcHAxODAwX21pcGlicmRnPjsK
PiAgICAgICAgICAgICAgdmRkMzMtc3VwcGx5ID0gPCZwcDMzMDBfbWlwaWJyZGc+Owo+ICsgICAg
ICAgICAgICBmb3JjZV9kc2lfZW5kX3dpdGhvdXRfbnVsbDsKPgo+ICAgICAgICAgICAgICBwb3J0
cyB7Cj4gICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAtLQo+IDIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
