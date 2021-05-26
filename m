Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979E0C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA38613D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA38613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P26wxwbAi6euS6sv/1BuDMt/25YzUr04EQlLUOnZXDs=; b=0bc+wUSzMWBT8E
	gYAI7NeU7Tz4yWDIu5Jh/PNxpSk+dgR9p8NjNCNpa9ulIfFDgYT0uSLfe8zOCCpsrAxDyHJqJNAr8
	gwcxk4JNcd4HRDgpJGMR5MkkeyQZO4f2sicEP4DYaHdFxh4hn0v8hv61H9t9moXjJp/M6bQGNaZ2A
	VmkuEFQHEIhV7kvYSzVoti87z8xNj1lWUrSlHWMygE+BBVbE+3/2Y6pg9v5iXuOU21Qcq7rcesdr2
	eInQy/WBd+TEjBN0O/lpjTepIn5CBLir9d7GywjpAbZvh1WBG1ZVCUoue6diNA6li+uyUU3TjRE7B
	zi2LAiWMzkW0VneWdIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmss-00BY6m-1f; Wed, 26 May 2021 06:19:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llms4-00BXiW-4a; Wed, 26 May 2021 06:18:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84BF6613D6;
 Wed, 26 May 2021 06:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622009903;
 bh=qRZywFAIS8OG9QveAM/amHgYEO4sE+tckC4V3AGxm88=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P120oTMgalXw4yYHrH5iquo7LDfRNNEgmX/+/gaWZdr/K0lBmUTsgvJ2HpaZx9xa3
 IYsT5WaILFpwCCSqjr7e7yfvac7NoMTpujpj21Lo9vftykBEs7H4HABpatjwDyhqLb
 WmGzDxP2757/VqAVqOEk+jHey5Dg7iffrEO74hsq6uDsRM1wCN2d0hp1hOVpAYQujH
 nXQ21yVJQ0zRMSlny4zkjbCyvXCaGsJUroqsumGS/zVuPONFjDYBwwA0LukmzyVtrE
 Rz2Is4YPzm39Zu4ib2ClOtL4WgcHJNfmpYL19bnrCxODppP/5ceSNhwFB8Ww/TnF4L
 4ZpxI+oreSVzA==
Received: by mail-ej1-f44.google.com with SMTP id et19so589947ejc.4;
 Tue, 25 May 2021 23:18:23 -0700 (PDT)
X-Gm-Message-State: AOAM532POiVMZdWPqkydkvM/raJCR9S46SXgrTzK2S7UZQPoNBBxUOi/
 ROtGEBRX/KsNXJAV2//uN0+273QlXbeRXJMe8w==
X-Google-Smtp-Source: ABdhPJxQRgDV8LFOf1AQsXJIXTlfjg4Ec/JLjUGKbtsJXWp5lXf9l3goBntr+bCxj9zUO4SL9qOy7gQzLtsZDx8Rn3A=
X-Received: by 2002:a17:906:b0cb:: with SMTP id
 bk11mr32710935ejb.310.1622009902111; 
 Tue, 25 May 2021 23:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-4-chunkuang.hu@kernel.org>
In-Reply-To: <20210314233323.23377-4-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 May 2021 14:18:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-L1URHwkiCQv5Z0sF_caWTkU7_2+jw=9DLfCyPyhfT+Q@mail.gmail.com>
Message-ID: <CAAOTY_-L1URHwkiCQv5Z0sF_caWTkU7_2+jw=9DLfCyPyhfT+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] mailbox: mtk-cmdq: Add struct cmdq_pkt in struct
 cmdq_cb_data
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_231824_269179_976F5581 
X-CRM114-Status: GOOD (  14.53  )
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

KyBZb25ncWlhbmcKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwg
MjAyMeW5tDPmnIgxNeaXpSDpgLHkuIAg5LiK5Y2INzozM+Wvq+mBk++8mgo+Cj4gQ3VycmVudCBj
bGllbnQgdXNlICdzdHJ1Y3QgY21kcV9wa3QnIGFzIGNhbGxiYWNrIGRhdGEsIHNvCj4gY2hhbmdl
ICd2b2lkICpkYXRhJyB0byAnc3RydWN0IGNtZHFfcGt0ICpwa3QnLiBLZWVwIGRhdGEKPiB1bnRp
bCBjbGllbnQgdXNlIHBrdCBpbnN0ZWFkIG9mIGRhdGEuCj4KPiBDYzogSmFzc2kgQnJhciA8amFz
c2lzaW5naGJyYXJAZ21haWwuY29tPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5i
Z2dAZ21haWwuY29tPgo+IENjOiBIb3Vsb25nIFdlaSA8aG91bG9uZy53ZWlAbWVkaWF0ZWsuY29t
Pgo+IENjOiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tPgo+IENjOiBEZW5u
aXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2llaEBtZWRpYXRlay5jb20+Cj4gQ2M6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiAtLS0KPiAg
ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyAgICAgICB8IDIgKysKPiAgaW5jbHVk
ZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaCB8IDEgKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmMgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gaW5k
ZXggZWY1OWUyMjM0ZjIyLi45OWE5ZTA3ODc1MDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tYWls
Ym94L210ay1jbWRxLW1haWxib3guYwo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1t
YWlsYm94LmMKPiBAQCAtMTg4LDYgKzE4OCw3IEBAIHN0YXRpYyB2b2lkIGNtZHFfdGFza19leGVj
X2RvbmUoc3RydWN0IGNtZHFfdGFzayAqdGFzaywgaW50IHN0YSkKPiAgICAgICAgIFdBUk5fT04o
Y2ItPmNiID09IChjbWRxX2FzeW5jX2ZsdXNoX2NiKU5VTEwpOwo+ICAgICAgICAgZGF0YS5zdGEg
PSBzdGE7Cj4gICAgICAgICBkYXRhLmRhdGEgPSBjYi0+ZGF0YTsKPiArICAgICAgIGRhdGEucGt0
ID0gdGFzay0+cGt0Owo+ICAgICAgICAgaWYgKGNiLT5jYikKPiAgICAgICAgICAgICAgICAgY2It
PmNiKGRhdGEpOwo+Cj4gQEAgLTQ1Niw2ICs0NTcsNyBAQCBzdGF0aWMgaW50IGNtZHFfbWJveF9m
bHVzaChzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLCB1bnNpZ25lZCBsb25nIHRpbWVvdXQpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlzdF9lbnRyeSkgewo+ICAgICAgICAgICAg
ICAgICBkYXRhLnN0YSA9IC1FQ09OTkFCT1JURUQ7Cj4gICAgICAgICAgICAgICAgIGRhdGEuZGF0
YSA9IGNiLT5kYXRhOwo+ICsgICAgICAgICAgICAgICBkYXRhLnBrdCA9IHRhc2stPnBrdDsKPiAg
ICAgICAgICAgICAgICAgY2IgPSAmdGFzay0+cGt0LT5hc3luY19jYjsKPiAgICAgICAgICAgICAg
ICAgaWYgKGNiLT5jYikKPiAgICAgICAgICAgICAgICAgICAgICAgICBjYi0+Y2IoZGF0YSk7Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggYi9p
bmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oCj4gaW5kZXggMmY3ZDlhMzdk
NjExLi40NDM2NWFhYjA0M2MgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tYWlsYm94L210
ay1jbWRxLW1haWxib3guaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1t
YWlsYm94LmgKPiBAQCAtNjgsNiArNjgsNyBAQCBlbnVtIGNtZHFfY29kZSB7Cj4gIHN0cnVjdCBj
bWRxX2NiX2RhdGEgewo+ICAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgc3RhOwo+ICAg
ICAgICAgdm9pZCAgICAgICAgICAgICAgICAgICAgKmRhdGE7Cj4gKyAgICAgICBzdHJ1Y3QgY21k
cV9wa3QgICAgICAgICAqcGt0Owo+ICB9Owo+Cj4gIHR5cGVkZWYgdm9pZCAoKmNtZHFfYXN5bmNf
Zmx1c2hfY2IpKHN0cnVjdCBjbWRxX2NiX2RhdGEgZGF0YSk7Cj4gLS0KPiAyLjE3LjEKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
