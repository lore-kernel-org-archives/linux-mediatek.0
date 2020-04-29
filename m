Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205B3C83000
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 14:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E802220B80
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 14:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FbJw3j1U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2JQJ8fp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E802220B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpEJmFPYAlNw3L78YtE8OiLCZ9LzRvChl6VHeSCwtSs=; b=FbJw3j1UdhG/I0
	oeO5OFunlSWH/f6qzc5KgkADvLH90iBXXuRBi5l6qrPJjcRV+Oq25dZ2G7NxMBINV2uL1sDuLPlPP
	3wnJGSCrBE5911Dp261RWNv25+2JyXS9hpR/dhn53WWfAPmZimWNRroM9OmVEt0U3+LT90Cs6vTiY
	TiMWyRpMCXwfVYbpa8pVBzyABSuyCf7W0s1af1UEyMjSuDrLxGWLnBBLW6cZfvBLWiUmpHunCMdPW
	DV+QSIup8WqkXCcG2kO0Msa49ryWuUif2t/YK9Y+0mYQyKutQfMpAcO5da2+2LrtcYdYAYIFApI+8
	5jxAM57Kta9IH4xB91dA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTnVo-0001LZ-Nn; Wed, 29 Apr 2020 14:16:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTnVW-00017z-Sx; Wed, 29 Apr 2020 14:16:16 +0000
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74B332186A;
 Wed, 29 Apr 2020 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588169772;
 bh=RTEeKjUF1paJxifL2yr5+8cCDLpxaByH64rNDTnk/74=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k2JQJ8fpMdmxLGcpMg47+0e4J+hktbo4FqU0UFKJ4IbHu6TLTZ9vHZMac3cIZyjBS
 bqTFMJrMFH/92PkZFdiLNCU5Ck/JVhKH2Bls7kkThGiWwWTG18q1neQ95aatEkGcVZ
 ETk250WB2U1zIwmtoNRomh7rVskItnXAz4fJCy+8=
Received: by mail-ed1-f46.google.com with SMTP id d16so1645517edv.8;
 Wed, 29 Apr 2020 07:16:12 -0700 (PDT)
X-Gm-Message-State: AGi0PubkKiZE36Mt4gidmXi1tV7KIg3VZDjgyyBnIwfWCjhyD5RFhzcv
 xZP0sQIjNaGO1Z4e1ESxkI2zri6qJwyFW4XPkQ==
X-Google-Smtp-Source: APiQypItwtCq5f4ckv/WzvZKMkryr9MF+5+w+xUswDZzzQpddnaUOnlv7PJd7bxb8Txbi68jXzKqiS8LDs7q6NzaYYQ=
X-Received: by 2002:aa7:dd95:: with SMTP id g21mr2635984edv.148.1588169770819; 
 Wed, 29 Apr 2020 07:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200420135045.27984-1-yuehaibing@huawei.com>
 <20200429071337.49528-1-yuehaibing@huawei.com>
In-Reply-To: <20200429071337.49528-1-yuehaibing@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Apr 2020 22:15:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__5rwRQhuy4vT8OiAKMM2bQtCb7w5AW9B5rqL+UVdVpsg@mail.gmail.com>
Message-ID: <CAAOTY__5rwRQhuy4vT8OiAKMM2bQtCb7w5AW9B5rqL+UVdVpsg@mail.gmail.com>
Subject: Re: [PATCH v3 -next] drm/mediatek: Fix Kconfig warning
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_071614_963328_75A4F944 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.orc, linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFl1ZUhhaWJpbmc6CgpZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IOaWvCAy
MDIw5bm0NOaciDI55pelIOmAseS4iSDkuIvljYgzOjE05a+r6YGT77yaCj4KPiBXQVJOSU5HOiB1
bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBNVEtfTU1TWVMKPiAgIERlcGVu
ZHMgb24gW25dOiAoQVJDSF9NRURJQVRFSyBbPXldIHx8IENPTVBJTEVfVEVTVCBbPW5dKSAmJiBD
T01NT05fQ0xLX01UODE3M19NTVNZUyBbPW5dCj4gICBTZWxlY3RlZCBieSBbeV06Cj4gICAtIERS
TV9NRURJQVRFSyBbPXldICYmIEhBU19JT01FTSBbPXldICYmIERSTSBbPXldICYmIChBUkNIX01F
RElBVEVLIFs9eV0gfHwgQVJNICYmIENPTVBJTEVfVEVTVCBbPW5dKSAmJiBDT01NT05fQ0xLIFs9
eV0gJiYgSEFWRV9BUk1fU01DQ0MgWz15XSAmJiBPRiBbPXldCj4KPiBNYWtlIERSTV9NRURJQVRF
SyBkZXBlbmQgb24gTVRLX01NU1lTIHRvIGZpeCB0aGlzLgoKUmV2aWV3ZWQtYnk6IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IEZpeGVzOiAyYzc1OGUzMDFlZDkg
KCJzb2MgLyBkcm06IG1lZGlhdGVrOiBNb3ZlIHJvdXRpbmcgY29udHJvbCB0byBtbXN5cyBkZXZp
Y2UiKQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4K
PiAtLS0KPiB2MzogbWFrZSBEUk1fTUVESUFURUsgZGVwZW5kcyBvbiBNVEtfTU1TWVMKPiB2Mjog
c2VsZWN0IENPTU1PTl9DTEtfTVQ4MTczX01NU1lTIGluc3RlYWQgb2YgYWRkaW5nIERSTV9NRURJ
QVRFSyBkZXBlbmRlbmN5Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gaW5kZXggYzQyMGY1YTNkMzNiLi5hYTc0YWFj
M2NiY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZwo+IEBAIC02LDEyICs2LDEyIEBA
IGNvbmZpZyBEUk1fTUVESUFURUsKPiAgICAgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+ICAg
ICAgICAgZGVwZW5kcyBvbiBIQVZFX0FSTV9TTUNDQwo+ICAgICAgICAgZGVwZW5kcyBvbiBPRgo+
ICsgICAgICAgZGVwZW5kcyBvbiBNVEtfTU1TWVMKPiAgICAgICAgIHNlbGVjdCBEUk1fR0VNX0NN
QV9IRUxQRVIKPiAgICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ICAgICAgICAgc2VsZWN0
IERSTV9NSVBJX0RTSQo+ICAgICAgICAgc2VsZWN0IERSTV9QQU5FTAo+ICAgICAgICAgc2VsZWN0
IE1FTU9SWQo+IC0gICAgICAgc2VsZWN0IE1US19NTVNZUwo+ICAgICAgICAgc2VsZWN0IE1US19T
TUkKPiAgICAgICAgIHNlbGVjdCBWSURFT01PREVfSEVMUEVSUwo+ICAgICAgICAgaGVscAo+IC0t
Cj4gMi4xNy4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
