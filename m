Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFD5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 19:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZLe+9ALN8Nv0FxF1c3MpURPtRzhfc3wHyaxVkpFMyc=; b=Qqm+narhYurfe1
	3QTIDyErEM7j1ttRpIHH21UwwaCq0SeJYXAYrr9PpyMrZYKFj0B9NByJfGd8RMuuDj6tXcHdRltHB
	0Bnf4l2UDSc+7n50VWDveyibaxLP0gmmvPtWDBvgvn3/CqqEW46C0NLCci/yWhzkK7I5by8QECK09
	cBz2dUSBMDOo8QvNJn69KKNWIvuvqKiXr24XT+XKp/DIpO1wimHW3N78os1NN9Fjnhmudgu7VQxlm
	ENH0X+vhkUWHLelyO+6kvf++K//c2rYcs2N4vYDmGB3mzC+B1/U7jw0NIuXm5pC15Rr0dmPHAfvaQ
	Zk8h5twc/HPYiQiaE68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP7lc-000F3V-NQ; Tue, 01 Mar 2022 19:02:36 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP7lQ-000Ezs-Vh
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 19:02:26 +0000
Received: by mail-qk1-x731.google.com with SMTP id d84so13684524qke.8
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GsGl1dGldgnpdLEXcvxrxYAF/SUgWFg5pNG0AUKw04w=;
 b=v5QG28VLIZmA6C+9VU64CfSfh9FZ13n2yEH89RDA/5CBUpVZQ6ZijmlreX4/EXQMrP
 dFKg1MxqW13FfKMGIq81pTFUPEEQNIv92eat+lBY0ISh7pgFQd8V9lQrQt7Vp6SwVr0F
 P3YdCNICRmkCtBsdq2cantzryx93X8fr91clLV8S81Xs4f1eyVL1TV+Ide4FznDwmJTO
 3iXMvrZtgPOZjcPX4qKd5C0Ju4QlRA62+nmhwW0FlYQNeMzy4PYj5oS3SPKCzAW7Tsf0
 5hGvQU6x5Fd+AEaDjpN5WIb3SmB9S4DAFdcJuxbm2mmAlmRPbqRm/0e41O2jbrBmyz93
 As0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GsGl1dGldgnpdLEXcvxrxYAF/SUgWFg5pNG0AUKw04w=;
 b=F3fHxwprazd9QewklyGk4iVqytIHj4ISLMadsPvGlaTaP50vSpNs2yb024mcanEKgz
 vQiWEPOGHhYa6vTavB7+fQJ7FP/GwtXJXTQqyJAT+R2UO1008K+nBwZWZkJaU5dfM5OO
 PGG5FZxfd3IjSgPHPvVzZn2EM3d7ZTTskZCgAGVx/tSuqeq7MbX+pK/4ptTHuTfZYLNz
 m6yrlghCR9dpwfzFOyCYelybaDMli800DADCuC00s1wflXq/hvtIN7JAEOJ31WDlXlLw
 KvyoqgJubYI5f462zN776IBTqLbHNy69zMDpP2u85sO8BjsfDqiC4k+GAlbXZUo5OG9g
 7jyg==
X-Gm-Message-State: AOAM530OzdvGgFqVCxR9fpS+WmJI6lZWjiO88qnSQmuJLJYFPuXBhHQl
 ZrXz3VjCfK9OO9Pths0MO5i13g==
X-Google-Smtp-Source: ABdhPJzpmA5uFIaU8OToNP2i0XOhvtLd6r7cnQbc8qnuHs7rV4wShM354MApuOXKlSpD/7rOLJGNhg==
X-Received: by 2002:a05:620a:22a6:b0:662:e97d:c7bc with SMTP id
 p6-20020a05620a22a600b00662e97dc7bcmr6914032qkh.486.1646161343508; 
 Tue, 01 Mar 2022 11:02:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 i128-20020a378686000000b00648ddd8a5c0sm6790641qkd.100.2022.03.01.11.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 11:02:22 -0800 (PST)
Message-ID: <90c57ac742bad5cd75ae76e01e6042739b4e8012.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 09/15] media: mtk-vcodec: disable vp8 4K capability
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Tue, 01 Mar 2022 14:02:21 -0500
In-Reply-To: <20220223034008.15781-10-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-10-yunfei.dong@mediatek.com>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_110225_027554_EFE2CA0F 
X-CRM114-Status: GOOD (  15.74  )
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

TGUgbWVyY3JlZGkgMjMgZsOpdnJpZXIgMjAyMiDDoCAxMTo0MCArMDgwMCwgWXVuZmVpIERvbmcg
YSDDqWNyaXTCoDoKPiBGb3IgdnA4IG5vdCBzdXBwb3J0IDRLLCBuZWVkIHRvIGRpc2FibGUgaXQu
CgpUaGlzIHBhdGNoIHdpbGwgbmVlZCB0byBiZSBjaGFuZ2VkIGFmdGVyIHlvdSBoYXZlIG1vdmVk
IHRoaXMgY29kZSBpbnRvIHRoZQpwcm9wZXIgaW9jdGwuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFl1
bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlYy5jIHwgMyArKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWMuYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlYy5jCj4gaW5kZXgg
YmFlNDM5MzhlZTM3Li5iYTE4OGQxNmYwZmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjLmMKPiArKysgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWMuYwo+IEBAIC01MzIsNyArNTMyLDgg
QEAgc3RhdGljIGludCB2aWRpb2NfZW51bV9mcmFtZXNpemVzKHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkICpwcml2LAo+ICAJCWZzaXplLT50eXBlID0gVjRMMl9GUk1TSVpFX1RZUEVfU1RFUFdJU0U7
Cj4gIAkJZnNpemUtPnN0ZXB3aXNlID0gZGVjX3BkYXRhLT52ZGVjX2ZyYW1lc2l6ZXNbaV0uc3Rl
cHdpc2U7Cj4gIAkJaWYgKCEoY3R4LT5kZXYtPmRlY19jYXBhYmlsaXR5ICYKPiAtCQkJCVZDT0RF
Q19DQVBBQklMSVRZXzRLX0RJU0FCTEVEKSkgewo+ICsJCQkJVkNPREVDX0NBUEFCSUxJVFlfNEtf
RElTQUJMRUQpICYmCj4gKwkJCQlmc2l6ZS0+cGl4ZWxfZm9ybWF0ICE9IFY0TDJfUElYX0ZNVF9W
UDhfRlJBTUUpIHsKPiAgCQkJbXRrX3Y0bDJfZGVidWcoMywgIjRLIGlzIGVuYWJsZWQiKTsKPiAg
CQkJZnNpemUtPnN0ZXB3aXNlLm1heF93aWR0aCA9Cj4gIAkJCQkJVkNPREVDX0RFQ180S19DT0RF
RF9XSURUSDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
