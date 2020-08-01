Return-Path: <SRS0=bqbO=BL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B1DC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 23:51:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847C020691
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 23:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHmGBjvo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKa0b1n+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847C020691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l+IgoTLHBsc2nSV2BS6TVgC2rWV/dGtlBuWXAvnZEVw=; b=hHmGBjvoBuZ/2uvlxoxX/zohw
	xE8+sx59clz6CDKusdaZ089FDGDgxJx05lFJjHmP4C5CLkKVbRPiELp5KnHhG5fufgiyU6JKaXKqV
	A0umdPd+mwCGen60JljlCwS+xvL2ulSMnzhm723AfRYWtTgfvldH3QU/MEXiY6CCVvRja+Q8e3WDQ
	TfrvEv9WAAf/WXGYH6TyyhBRxckwguVcK7kpJNnvMDeQKD6Z99Af9GM3aZf85bf0b5MDizfDxRkOx
	i33lPg3iyQlpfies0VDjlA7DrKbQO20/SmKwEag3h9fR0wJ6wfSExXlE5BWxx7XLLNDeeWjr3nGaM
	LNDZdrFRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k21HN-0004nj-8s; Sat, 01 Aug 2020 23:51:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k21HF-0004mk-Po; Sat, 01 Aug 2020 23:50:58 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6C60207BB;
 Sat,  1 Aug 2020 23:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596325855;
 bh=/RTX0rVm2iLBMlRdDM24nNOFTPRHcYFdhTxisdSjWDM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GKa0b1n++JBbGlBkW2Q8zcKWc/8G5g2kRJ1hJfSjcl0x25nRnPleix94G6SZQBMQf
 CQBVbFMYm+Bwo6LXpkuUFdKiPhsXf5MRx+q682XvJ9JLGD6PVliYxMZVYv37rXZsGT
 SRG9c33TAZhWB2sOk3/rPYxvyyMkSdpNP5xIvKPQ=
Received: by mail-ed1-f52.google.com with SMTP id c2so18945454edx.8;
 Sat, 01 Aug 2020 16:50:54 -0700 (PDT)
X-Gm-Message-State: AOAM530GKIh0ByQ/DVo2SORuzXxkDxBNeZNBmVHuDlPNXkCSzobplEpo
 esmQmayAEdHUH9CdWgcPbM1uOU5JNbKdjO16XQ==
X-Google-Smtp-Source: ABdhPJzQmcCCQwR67S6JChR4X8UlBaNrr/6FEYSwtL2uZyPlHYYi1Y8yC31MEt19hcsQnLvDj3qLleKurtzHXUqlyw8=
X-Received: by 2002:a50:d2c7:: with SMTP id q7mr5358828edg.61.1596325853405;
 Sat, 01 Aug 2020 16:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Aug 2020 07:50:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-RMT-1+-5aPxqhgLbk74j0MH8U78mibBZppt_OPPQrJA@mail.gmail.com>
Message-ID: <CAAOTY_-RMT-1+-5aPxqhgLbk74j0MH8U78mibBZppt_OPPQrJA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_195057_930546_55AA3AE1 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyOeaXpSDpgLHkuIkg5LiL5Y2INDoyOeWvq+mBk++8mgo+Cj4gTWVkaWFUZWsgYnVzIGZhYnJp
YyBwcm92aWRlcyBUcnVzdFpvbmUgc2VjdXJpdHkgc3VwcG9ydCBhbmQgZGF0YQo+IHByb3RlY3Rp
b24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4g
bWFzdGVycy4KPiBUaGUgc2VjdXJpdHkgdmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0
aGUgcHJvY2Vzc29yIGZvcgo+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLgo+
Cj4gQW55IG9jY3VycmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGlu
dGVycnVwdCwgYW5kCj4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBU
aGUgdmlvbGF0aW9uCj4gaW5mb3JtYXRpb24gaXMgcHJpbnRlZCBpbiBvcmRlciB0byBmaW5kIHRo
ZSBtdXJkZXJlci4KPgo+IFNpZ25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRl
ay5jb20+Cj4gLS0tCgpbc25pcF0KCj4gKwo+ICtzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0IHsK
PiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiArICAgICAgIHUzMiB2aW9faWR4X251bTsK
PiArICAgICAgIHZvaWQgX19pb21lbSAqZGV2YXBjX3BkX2Jhc2U7CgpUaGlzIGlzIGRldmFwYyBj
b250ZXh0LCBzbyBwcmVmaXggJ2RldmFwYycgaXMgcmVkdW5kYW50LgpBbmQsIHdoYXQgZG9lcyAn
cGQnIG1lYW4/CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArICAgICAgIHN0cnVjdCBtdGtfZGV2
YXBjX3Zpb19pbmZvICp2aW9faW5mbzsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBj
X3BkX29mZnNldCAqb2Zmc2V0Owo+ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNfdmlv
X2RiZ3MgKnZpb19kYmdzOwo+ICt9Owo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
