Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3750C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:45:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E8946101D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E8946101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfsFJNCRIBrZkUNHocsXMQ7cEkg96wJ550GdJGnfYT0=; b=UeUXkXtYh6Dqum
	VKfh4tVKVSLcxiQpahbZrdEq23CvjjcOrprbh9IFgRRa0aQiTdSezLKlz0Xed0c3u4+Bzd7Td1l7s
	iZyFGiH1AnqcRBFomfOrJtUsvsJytzqkR9PWQ4bkBtfLO8WI92nzJfzlU3F+OrPMxKgG0v6QjVWv+
	JhO8eldtAMX+C/arOv8CMMC4Qrk9AJ5ALbHqJ7BTV2w4rC+SfV4jAKS0yBY2hERc7CBlBd/bXpJ0m
	UGQ/DXh/sJDpfCVkBbtUk665es1DiP3Hy4djYsTqSac71qMS9Perp95vsev2NAaSNpTHfpZFpJUdG
	xebR7m4Vf00u5zFuxePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD6Wj-000wl7-1A; Mon, 09 Aug 2021 14:45:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD6WW-000wj8-VY; Mon, 09 Aug 2021 14:45:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97DF86101E;
 Mon,  9 Aug 2021 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628520304;
 bh=95QsABHXN+pKNxd1hFR4tyhFhuhVRX4HItHjBlDAOAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZHHc2tqQt4FtLxY3aH4lGfE3tn50kdJD0e6njJSMxYHMB/2u1a150CuHr67VD3wfG
 CgAcy29+9FWnwthQBGb1NuD5jcOC21zUsG3dPdQmSNiYLWBb2uYi6cIIPMiFOXtpls
 OhI09RLY5jwhcvlbdbxP69f3Fk8voUeu+3X+EHhHiS3J88UDQFa0Zg6JT+JztDLHUE
 GwYqvqGQUlmFEPlv5wB3ZvWNCuD5YoGoWaI69DkgujioU5euX/MKOdbsQp+7HZr/w7
 NZUhExbNiy1LJ//dVeUhOhmpI3ubH+pJFcns5NlPqxRN1EDOuQp7K65K6LeeaPiO0k
 dacPEHNlPdsQw==
Received: by mail-ej1-f49.google.com with SMTP id z20so6647762ejf.5;
 Mon, 09 Aug 2021 07:45:04 -0700 (PDT)
X-Gm-Message-State: AOAM531CqBD+8B9iAJsZScr5MXCN09GQ7UFguNr6quoNegSTA8mpECE3
 EcX+qxLhQDsnJBokJQ6XjwV4HUWWrrh7Yfbvhw==
X-Google-Smtp-Source: ABdhPJzN+KSXTc2XGkL/912N2+WxTOmmqX40r8nDWbVnU03DlFFuQZ0jsZTTmMWJ4Ylfu7wo2OO4OoF580G8wMPF7Kw=
X-Received: by 2002:a17:907:98fb:: with SMTP id
 ke27mr1266398ejc.303.1628520303167; 
 Mon, 09 Aug 2021 07:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210808134117.66798-1-jitao.shi@mediatek.com>
 <20210808134117.66798-2-jitao.shi@mediatek.com>
In-Reply-To: <20210808134117.66798-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 22:44:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_90UteUjOgJ5w7vKW6amXCfps7=SennwYYk2=TUrr6aYA@mail.gmail.com>
Message-ID: <CAAOTY_90UteUjOgJ5w7vKW6amXCfps7=SennwYYk2=TUrr6aYA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] drm/mediatek: force hsa hbp hfp packets multiple
 of lanenum to avoid screen shift
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
X-CRM114-CacheID: sfid-20210809_074505_091407_C057365F 
X-CRM114-Status: GOOD (  18.28  )
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
tDjmnIg45pelIOmAseaXpSDkuIvljYg5OjQx5a+r6YGT77yaCj4KPiBUaGUgYnJpZGdlIGNoaXAg
QU5YNzYyNSByZXF1aXJlcyB0aGUgcGFja2V0cyBvbiBsYW5lcyBhbGlnbmVkIGF0IHRoZSBlbmQs
Cj4gb3IgQU5YNzYyNSB3aWxsIHNoaWZ0IHRoZSBzY3JlZW4uCgpJbiBhbng3NjI1X2F0dGFjaF9k
c2koKSwgaXQgY2FsbCBtaXBpX2RzaV9hdHRhY2goKSwgYW5kIGl0IGNhbGwgaW50bwptdGtfZHNp
X2hvc3RfYXR0YWNoKCkuCkkgd291bGQgbGlrZSB0byBwYXNzIHRoaXMgaW5mb3JtYXRpb24gZnJv
bSBhbng3NjIzIGRyaXZlciB0byBtdGtfZHNpCmRyaXZlciB3aGVuIGF0dGFjaC4KClJlZ2FyZHMs
CkNodW4tS3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwg
MTMgKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggYWU0MDNjNjdjYmQ5Li4wMzMyMzRk
NTFlODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtMTk0LDYgKzE5
NCw4IEBAIHN0cnVjdCBtdGtfZHNpIHsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmhzX2NsazsKPgo+
ICAgICAgICAgdTMyIGRhdGFfcmF0ZTsKPiArICAgICAgIC8qIGZvcmNlIGRzaSBsaW5lIGVuZCB3
aXRob3V0IGRzaV9udWxsIGRhdGEgKi8KPiArICAgICAgIGJvb2wgZm9yY2VfZHNpX2VuZF93aXRo
b3V0X251bGw7Cj4KPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbW9kZV9mbGFnczsKPiAgICAgICAg
IGVudW0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0IGZvcm1hdDsKPiBAQCAtNDk5LDYgKzUwMSwxMyBA
QCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdCBtdGtfZHNpICpk
c2kpCj4gICAgICAgICAgICAgICAgIERSTV9XQVJOKCJIRlAgKyBIQlAgbGVzcyB0aGFuIGQtcGh5
LCBGUFMgd2lsbCB1bmRlciA2MEh6XG4iKTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgaWYgKGRz
aS0+Zm9yY2VfZHNpX2VuZF93aXRob3V0X251bGwpIHsKPiArICAgICAgICAgICAgICAgaG9yaXpv
bnRhbF9zeW5jX2FjdGl2ZV9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5
dGUsIGRzaS0+bGFuZXMpIC0gMjsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBv
cmNoX2J5dGUgPSByb3VuZHVwKGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlLCBkc2ktPmxhbmVz
KSAtIDI7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSByb3Vu
ZHVwKGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUsIGRzaS0+bGFuZXMpIC0gMjsKPiArICAgICAg
ICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSAtPSAodm0tPmhhY3RpdmUgKiBkc2lf
dG1wX2J1Zl9icHAgKyAyKSAlIGRzaS0+bGFuZXM7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAg
d3JpdGVsKGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hTQV9X
Qyk7Cj4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSwgZHNpLT5yZWdz
ICsgRFNJX0hCUF9XQyk7Cj4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5
dGUsIGRzaS0+cmVncyArIERTSV9IRlBfV0MpOwo+IEBAIC0xMDk1LDYgKzExMDQsMTAgQEAgc3Rh
dGljIGludCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAg
ICAgICBkc2ktPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwo+ICAgICAgICAgZHNpLT5i
cmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EU0k7Cj4KPiArICAgICAgIGlmIChkc2kt
Pm5leHRfYnJpZGdlKQo+ICsgICAgICAgICAgICAgICBkc2ktPmZvcmNlX2RzaV9lbmRfd2l0aG91
dF9udWxsID0gb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZHNpLT5uZXh0X2JyaWRnZS0+b2Zfbm9k
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJhbmFsb2dpeCxhbng3NjI1Iik7Cj4gKwo+ICAgICAgICAg
ZHJtX2JyaWRnZV9hZGQoJmRzaS0+YnJpZGdlKTsKPgo+ICAgICAgICAgcmV0ID0gY29tcG9uZW50
X2FkZCgmcGRldi0+ZGV2LCAmbXRrX2RzaV9jb21wb25lbnRfb3BzKTsKPiAtLQo+IDIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
