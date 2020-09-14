Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194B7C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:37:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD28820897
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZiXOfxT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Is2F32TU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD28820897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6+j2pm18Qf9TuXOn1FKUyA7lzda3CrQFOf4BmekOQes=; b=rZiXOfxTIbHDqvadqF+NQ63Cv
	zUgFDGDClA6guYVGlqry4NRDv7/+fv9ALy7tStkh6kfCbuTMZc+LY1UXmrp3IQOq4b5KWgA54pEZt
	g0UlsEYWWHmw5C2qVKKwp7a+gY0wKBltMZVcYzBVEGlnMapHI7wJBlAvi+4ma7Vg2w51wdZYgPyva
	w65RN5tGhITvEsXI67ZUn3UOZ6WzUkmgc6OTnm3sA7imz1CmZ34D6BAMBMsYWTO/ZfyqGaIcl/3Lj
	ffJhd1VBb6cRFbJ5VqDYDPLg1vr+PkLNpWs/qx2It3T6vW6wy90oNz79rn+SUo2fAMeRLORlallpe
	f6rLC1oPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHy2e-0002g6-3H; Mon, 14 Sep 2020 23:37:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHy2Z-0002eg-Fy; Mon, 14 Sep 2020 23:37:44 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A51921D43;
 Mon, 14 Sep 2020 23:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600126662;
 bh=g2lsFfYhlO0VEH/BabeBJeUV+CvFozoYV2u4w8DDEBQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Is2F32TUQz6dAc2CCZZJbm2PVGfeKFWGtc8X3UHHkFTabwzkYsfVtwx+Z5/4eYyZ6
 5p1HC3vfP/d9JAlvYrRjHyJJ3Tu6Glimmyv6DKj7IPBdaCQFMZrd4WQE3jVpCaU7W+
 9Z+5ch+Q60DGp6haUsuN+RdUQVqSNkckOwja6/6c=
Received: by mail-ej1-f47.google.com with SMTP id q13so2328235ejo.9;
 Mon, 14 Sep 2020 16:37:42 -0700 (PDT)
X-Gm-Message-State: AOAM530e/9bSCiK8+IKl80LO0/qIW0WOCKOCUpq9t0UIwzaz4cfFD2Fm
 +ZEA3Cl0i27OVmpbc4maTsX8bqzPoz75vQ5r9Q==
X-Google-Smtp-Source: ABdhPJz3pRz8YQcV+pGBgT3eFAaWdp/Z0XMG/X4qOIDHhb5dqpyLXgI9VzxaDFsYQAz61P2dQ2J7GOroEgLbbm8g8bg=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr17632462ejd.7.1600126660682; 
 Mon, 14 Sep 2020 16:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200905083058.1631726-1-yukuai3@huawei.com>
In-Reply-To: <20200905083058.1631726-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:37:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9JA-+Rwiwnwp-tYEhmLKpHs-zkDD-FL31oYrYFeYe3xA@mail.gmail.com>
Message-ID: <CAAOTY_9JA-+Rwiwnwp-tYEhmLKpHs-zkDD-FL31oYrYFeYe3xA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_ddp_comp_init()
To: Yu Kuai <yukuai3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_193743_587204_52E8F0F1 
X-CRM114-Status: GOOD (  18.57  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDXml6Ug6YCx5YWtIOS4i+WNiDQ6MzHlr6vpgZPvvJoKPgo+IGlmIG9mX2ZpbmRfZGV2aWNlX2J5
X25vZGUoKSBzdWNjZWVkLCBtdGtfZGRwX2NvbXBfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+IGEgY29y
cmVzcG9uZGluZyBwdXRfZGV2aWNlKCkuIFRodXMgYWRkIHB1dF9kZXZpY2UoKSB0byBmaXggdGhl
IGV4Y2VwdGlvbgo+IGhhbmRsaW5nIGZvciB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLgo+
CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+
IEZpeGVzOiBkMGFmZTM3ZjUyMDkgKCJkcm0vbWVkaWF0ZWs6IHN1cHBvcnQgQ01EUSBpbnRlcmZh
Y2UgaW4gZGRwIGNvbXBvbmVudCIpCj4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0Bo
dWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggNTdjODhkZTlh
MzI5Li41MjY2NDg4ODViOTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmMKPiBAQCAtNDk2LDYgKzQ5Niw3IEBAIGludCBtdGtfZGRwX2NvbXBfaW5p
dChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgI2lmIElT
X1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gICAgICAgICBpZiAob2ZfYWRkcmVzc190b19y
ZXNvdXJjZShub2RlLCAwLCAmcmVzKSAhPSAwKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiTWlzc2luZyByZWcgaW4gJXMgbm9kZVxuIiwgbm9kZS0+ZnVsbF9uYW1lKTsKPiArICAg
ICAgICAgICAgICAgcHV0X2RldmljZSgmbGFyYl9wZGV2LT5kZXYpOwo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiAgICAgICAgIH0KPiAgICAgICAgIGNvbXAtPnJlZ3NfcGEgPSBy
ZXMuc3RhcnQ7Cj4gLS0KPiAyLjI1LjQKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
