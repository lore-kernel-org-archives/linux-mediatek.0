Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11659C49EA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 08:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD92061151
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 08:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD92061151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYHIv7zrb/AFpo8WNxo6C9hRYOaDgseU3zYptE9Kytg=; b=Pmjfrb7x7nf2WI
	rcHHjO7Ih/VfTjouctcDeDK+x5X9Tjyr5YcIUXyo+5b1/PCd7uHhVnbi/Vlq8NC7QqJhEe5Sk8Wo8
	ykk5FWCDcuB3S9gRuyydlb3cea1wh3K+jCCoNQAqEhWw8sWxZ2vKiKVaQx+NQMuK9c+x9g9iTC8N+
	PaKQMdtwrrC/DHmYPgIAjt2Gt5sG42W0aRzRu9BWSalKeuDX3iaIHIy0CEhc4BImgluFmgfMH9mdB
	9Q4lUVZ3t6BlEYsagH3xCh4xC74sBYhAZ//qee3/Z2jcYhi4ZFnpGzg7OOc1lFLWo6/xQ4vdIr81L
	+zgPnlTyv7KfKmo2RUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvFKq-002hAd-Ar; Mon, 21 Jun 2021 08:31:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvFKc-002h5o-II; Mon, 21 Jun 2021 08:30:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4443461206;
 Mon, 21 Jun 2021 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624264258;
 bh=Pcp9QiM+wz7CqD5bvb3BMwJt+gIRXZRnTztLDJ83g+w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QHSxNvauWjwV7G/MVQCUFDF4AEQQxLF+0R7Xab0uLxKtcbFyoJFSahAm7ZnQELhpj
 UoHMAo+cJSsWyj2PAj88Ev1g1nJZB/gRPwwekwBvYOn+MGzEOj238IZ6TiU6LQT/ot
 PNGM/Rwx9wwORH9PYFs1AiM+LeHqwEFQyDoVvueUkyxkhwIseMGsOJAGu+MhGdZwbt
 /vfQc6GNgi/YFLDESSULQLas3Dl0Ex1W2R/SdmNHmANFMmz7VSPItrqakLvecHzB1Z
 2Q9zFCRPBB4QU2RrA4aSXaReL3fRIqhirpge5uwJdStnaHNyiVUTJOWva99iwB/Xu+
 XcvRQcu6kUP6g==
Received: by mail-ej1-f51.google.com with SMTP id gb32so19246837ejc.2;
 Mon, 21 Jun 2021 01:30:58 -0700 (PDT)
X-Gm-Message-State: AOAM530jWfUc0xPh12pyyLpVf8g0XxzpWnxnYv/tQIBpmKQkfDTf2T5W
 wWHTeOZv7MlIfwcJo18w3hQQdobBUh0siOD+AA==
X-Google-Smtp-Source: ABdhPJxibsmUgw7bInJG+XOFJhr1Nt7qCfnwC1CYZF9N3JnhGELXNshHIqQDQ+WlAFaPaLzrPKSpgopFFw64Q3Y4LO0=
X-Received: by 2002:a17:906:dbcd:: with SMTP id
 yc13mr23909438ejb.267.1624264256796; 
 Mon, 21 Jun 2021 01:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <1624187698-29040-1-git-send-email-yongqiang.niu@mediatek.com>
 <1624187698-29040-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1624187698-29040-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Jun 2021 16:30:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-UJ0N7pzASDMS3ca4xf9HFpi9ZN_hTx2ND2WZk3ddz+A@mail.gmail.com>
Message-ID: <CAAOTY_-UJ0N7pzASDMS3ca4xf9HFpi9ZN_hTx2ND2WZk3ddz+A@mail.gmail.com>
Subject: Re: [PATCH v6,
 1/2] soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_013058_711223_A9AB7F0F 
X-CRM114-Status: GOOD (  12.65  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDbmnIgyMOaXpSDpgLHml6Ug5LiL5Y2INzoxNeWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgc29tZSBtb3JlIGRkcCBjb21wb25lbnQKPiBPVkxfMkwyIGlzIG92bCB3aGlj
aCBpbmNsdWRlIDIgbGF5ZXJzIG92ZXJsYXkKPiBQT1NUTUFTSyBjb250cm9sIHJvdW5kIGNvcm5l
ciBmb3IgZGlzcGxheSBmcmFtZQo+IFJETUE0IHJlYWQgZG1hIGJ1ZmZlcgo+Cj4gQ2hhbmdlLUlk
OiBJNDY0ZWEyZGNlNmEzMTJkZThmYWQyY2RiZDk0YTRjNzFhYjQ1YWY4ZgoKUmVtb3ZlIHRoaXMu
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5
b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEVucmljIEJhbGxldGJvIGkg
U2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGluY2x1ZGUv
bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29jL21lZGlh
dGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgK
PiBpbmRleCAyMjI4YmY2Li40YmJhMjc1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvc29j
L21lZGlhdGVrL210ay1tbXN5cy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmgKPiBAQCAtMjksMTMgKzI5LDE2IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsK
PiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZM
XzJMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMXzJMMSwKPiArICAgICAgIEREUF9DT01Q
T05FTlRfT1ZMXzJMMiwKPiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMMSwKPiArICAgICAgIERE
UF9DT01QT05FTlRfUE9TVE1BU0swLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00wLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9QV00xLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00yLAo+
ICAgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfUkRN
QTEsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX1JETUEyLAo+ICsgICAgICAgRERQX0NPTVBPTkVO
VF9SRE1BNCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfVUZPRSwKPiAgICAgICAgIEREUF9DT01Q
T05FTlRfV0RNQTAsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX1dETUExLAo+IC0tCj4gMS44LjEu
MS5kaXJ0eQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
