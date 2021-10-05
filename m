Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E69C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 09:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFEA610C9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 09:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EFEA610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5ecehuF8xo28Zh/5NlbuYZvHuTZifJp3uFv4eeFSj8=; b=SCJdmGjMknk9Er
	ALKI8nRbsX/ifGa3xG5kI+KVRxPv9o8gcSiSj7pQATjVeOQ4uTXJ6H69QwOd/OBytn1zIuuX047xJ
	sY1CpYvKl47nDRCxaMHzP5v2+yN1cTO8Ize7dECSuXOpa+ekyJkDC/WJvKgLSirQpyeta7yDhXzsg
	e6Ul6AmPdyCGmoj2fOSkuFZ+alSrTFrY8ver/N/Cr6Zv3FfmGEX9mp0QYauqAK/csqwoAQDtaZ0A1
	PYigzR5qR30kfW1f7moC9I11WGoOETaIN9Zy2HlqL0+osBjubd6CiRyayEvtTls5vbA4BWaFBj4vM
	YDDnzrJ1NhySvbaEB+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgeT-009lHI-Uh; Tue, 05 Oct 2021 09:22:21 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgeE-009lB3-Ot; Tue, 05 Oct 2021 09:22:08 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so25093402otb.1; 
 Tue, 05 Oct 2021 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tWCZQD/n7Y/MgcB3b8Xhms8A/Xp3yZnIB33cQunaJpA=;
 b=DMLjnX/74Mmwlgz+PWs9+YyvNesESpEOSL+UBtJ0nZCNA/+sRYXzUC4cz6+mQ7s2jM
 3hZZRmijiO2DNDEyqWJ3DIpB7r76CI2puzWl3GsDSWwqmI1XeoM9ACCPmHxCOtW07uTP
 Q2Yalt8sxWh1miz6aAZzGoKPilA9BY3s+utTWi6CrZ/VVsOGX6idB0qO653py/zPiV4E
 utyqxxCFRTx15JcGNGES0NdhqX7rd1PfXiF3WpU3Piiq9rPLhIYEBaTmGFjn+j8G9t8Y
 3FY1M8kmD6g26Ur95pbCft9lDW5cwG4EKjZwEciUstcmoQhW2yMfXimNj/mXVDgYi2SR
 H7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tWCZQD/n7Y/MgcB3b8Xhms8A/Xp3yZnIB33cQunaJpA=;
 b=SwCdqVP0pTSC4XP7PsdpBLjASI1R7NnCifk8p3cA5ootcx5nuEBvzd+9IDMaqmveVQ
 B/ms2nbj9wCYZN4rvUlIyZM+6DT9Sy5WyQUFbpS9RPWlNw3QmgHEHAF+ye15im9y5xBw
 sJg89icACrUUJWOYUpIrR0RGS/oesLwOQmYza9+UHKemzaijdMDHKaI3bMq9DiGesBZm
 Ipqexb04vcXzWyeiOKBocANb9Ig6EYpEGR9JPdTK0b6YBiOVbVFA3jCkeg85BqVm7Xre
 KqO2QUVKVBx5LfxlEtQMoo9Lyot74xzsa4w4eZR2SaOA5ZkXRW52aZS46tNwwYfxtnxd
 VhaQ==
X-Gm-Message-State: AOAM533X5Oazh5XMBFkY9By3bQ3/F54i4fjpLzH79x6nmY1M9Ze3fBrK
 7o9KwZD1/tgQyhxBcb+I7Cyqz/IB4mQX3mNV4Ak=
X-Google-Smtp-Source: ABdhPJySkyUchFhBsS+LhyiT2FdEMBCSVCBcLM6/3/d6uMy6yPQXdSF507crN5NiDrG5e5EaH1qzyZ3n9T4+pCLI2SA=
X-Received: by 2002:a9d:3e15:: with SMTP id a21mr13699450otd.60.1633425724166; 
 Tue, 05 Oct 2021 02:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
In-Reply-To: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 5 Oct 2021 17:21:55 +0800
Message-ID: <CAE+NS34qtKgQYiCLQDupLK8L84SVS9EsztOpQFtS_CoOPzNwzQ@mail.gmail.com>
Subject: Re: [PATCH v15 0/2] leds: mt6360: Add LED driver for MT6360
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_022206_855287_C09224A6 
X-CRM114-Status: GOOD (  18.34  )
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

R2VuZSBDaGVuIDxnZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0N+aciDE2
5pelIOmAseS6lCDkuIvljYg0OjMz5a+r6YGT77yaCj4KPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFk
ZCBNVDYzNjAgTEVEIHN1cHBvcnQgY29udGFpbnMgZHJpdmVyIGFuZCBiaW5kaW5nIGRvY3VtZW50
Cj4KPiBHZW5lIENoZW4gKDIpCj4gIGR0LWJpbmRpbmdzOiBsZWRzOiBBZGQgYmluZGluZ3MgZm9y
IE1UNjM2MCBMRUQKPiAgbGVkczogbXQ2MzYwOiBBZGQgTEVEIGRyaXZlciBmb3IgTVQ2MzYwCj4K
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFt
bCB8ICAxNTkgKysKPiAgZHJpdmVycy9sZWRzL2ZsYXNoL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMTMKPiAgZHJpdmVycy9sZWRzL2ZsYXNoL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEKPiAgZHJpdmVycy9sZWRzL2ZsYXNoL2xlZHMt
bXQ2MzYwLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA5MTAgKysrKysrKysrKysrKysrKwo+
ICA0IGZpbGVzIGNoYW5nZWQsIDEwODMgaW5zZXJ0aW9ucygrKQo+Cj4gY2hhbmdlbG9ncyBiZXR3
ZWVuIHYxICYgdjIKPiAgLSBhZGQgbGVkIGRyaXZlciB3aXRoIG1mZAo+Cj4gY2hhbmdlbG9ncyBi
ZXR3ZWVuIHYyICYgdjMKPiAgLSBpbmRlcGVuZGVudCBhZGQgbGVkIGRyaXZlcgo+ICAtIGFkZCBk
dC1iaW5kaW5nIGRvY3VtZW50Cj4gIC0gcmVmYWN0b3IgbWFjcm9zIGRlZmluaXRpb24gZm9yIGVh
c3kgdG8gZGVidWcKPiAgLSBwYXJzZSBkZXZpY2UgdHJlZSBieSBmd25vZGUKPiAgLSB1c2UgZGV2
bSpleHQgdG8gcmVnaXN0ZXIgbGVkIGNsYXNzIGRldmljZQo+Cj4gY2hhbmdlbG9ncyBiZXR3ZWVu
IHYzICYgdjQKPiAgLSBmaXggYmluZGluZyBkb2N1bWVudCBkZXNjcmlwdGlvbgo+ICAtIHVzZSBH
RU5NQVNLIGFuZCBhZGQgdW5pdCBwb3N0Zml4IHRvIGRlZmluaXRpb24KPiAgLSBpc2luayByZWdp
c3RlciBsZWQgY2xhc3MgZGV2aWNlCj4KPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjQgJiB2NQo+ICAt
IGNoYW5nZSByZ2IgaXNpbmsgdG8gbXVsdGljb2xvciBjb250cm9sCj4gIC0gYWRkIGJpbmRpbmcg
cmVmZXJlbmNlIHRvIG1mZCB5YW1sCj4KPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjUgJiB2Ngo+ICAt
IFVzZSBEVCB0byBkZWNpZGUgUkdCIExFRCBpcyBtdWx0aWNvbG9yIGRldmljZSBvciBpbmRpY2F0
b3IgZGV2aWNlIG9ubHkKPgo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2NiAmIHY3Cj4gIC0gQWRkIGJp
bmRpbmcgbXVsdGljb2xvciBkZXZpY2Ugc2FtcGxlIGNvZGUKPiAgLSBBZGQgZmxhc2ggb3BzIG11
dGV4IGxvY2sKPiAgLSBSZW1vdmUgVjRMMiBpbml0IHdpdGggaW5kaWNhdG9yIGRldmljZQo+Cj4g
Y2hhbmdlbG9ncyBiZXR3ZWVuIHY3ICYgdjgKPiAgLSBBZGQgbXV0ZXggZm9yIGxlZCBmYXVsdCBn
ZXQgb3BzCj4gIC0gRml4IGZsYXNoIGFuZCBtdWx0aWNvbG9yIG5vLW9wcyByZXR1cm4gMAo+ICAt
IEFkZCBMRURfRlVOQ1RJT05fTU9PTkxJR0hUCj4KPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjggJiB2
OQo+ICAtIHJldXNlIGFwaSBpbiBmbGFzaCBhbmQgbXVsdGljb2xvciBoZWFkZXIKPgo+IGNoYW5n
ZWxvZ3MgYmV0d2VlbiB2OSAmIHYxMAo+ICAtIGFkZCBjb21tZW50IGZvciByZXVzZSByZWdpc3Ry
YXRpb24gZnVuY3Rpb25zIGluIGZsYXNoIGFuZCBtdWx0aWNvbG9yCj4KPiBjaGFuZ2Vsb2dzIGJl
dHdlZW4gdjEwICYgdjExCj4gIC0gbWF0Y2ggZHQtYmluZGluZyByZWcgcHJvcGVydHkgY29tbWVu
dCB0byB0aGUgZnVuY3Rpb25hbGl0eSBuYW1lCj4gIC0gcmVtb3ZlIGV4aXN0IHBhdGNoIGluIGxp
bnV4LW5leHQKPiAgLSBkaWNpZGUgbXVsdGljb2xvciBjaGFubmVsIGJ5IGNvbG9yIGRlZmluaXRp
aW9uCj4KPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjExICYgdjEyCj4gIC0gRml4IHByaW50IHNpemVf
dCBieSAlenUKPiAgLSBGaXggZHQtYmluZGluZyBuYW1lIHJlZ3VsYXIgZXhwZXJzc2lvbgo+Cj4g
Y2hhbmdlbG9ncyBiZXR3ZWVuIHYxMiAmIHYxMwo+ICAtIEZpeCBrYnVpbGQgdGVzdCByZWJvdCBi
dWlsZCBlcnJvcgo+Cj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHYxMyAmIHYxNAo+ICAtIE1vdmUgZHJp
dmVyIHRvIGZsYXNoIGZvbGRlcgo+ICAtIFJlbW92ZSBMRUQgRlVOQ1RJT04gTU9PTkxJR0hUCj4g
IC0gS2VlcCA4MCBjaGFyIHBlciBsaW5lCj4KPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjE0ICYgdjE1
Cj4gIC0gQWRkIGFjayBpbiBjb21taXQgbWVzc2FnZQo+CgpEZWFyIFJldmlld2VycywKClBsZWFz
ZSBsZXQgbWUga25vdyBpZiBhbnkgY29uY2Vybi4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
