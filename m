Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7489C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50C9613BA
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50C9613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XZGyfDojWbyg90/OPj8eYUQjF1aqHskL86f5XTz+dg=; b=j4eIR6v3dqwLH3
	rvRNY5dKj7jEElyMLjz7+o8b6uBwoOhCUV/xjTOINhy/SUlK1yWLV8qxXx7hqJBQhEnebS9UOSlDI
	mBhZGC1X2kLxAt4/Js7nFcH1LH5k/zZCDqo98maHixo7wOEv4xFtXNtD/QN2wS19gq9Z0up+QRTVd
	wI6dE07QCU3ixpf05H88OlArpLuK749x+CzGt15Sn9c7OLEzX1XtGrv3TK1FwLFC2lI2DSl9HmM7Z
	RkYYzTdzyQixcLbQgRXWJXCtuGRJhm+QxUJBXsdFkD2no2lvWOD478L2pW1HlfysPDoPfVypRby7m
	qlkSY42X1Vt77TfqjaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llms1-00BXhB-1G; Wed, 26 May 2021 06:18:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmrP-00BXOO-Ah; Wed, 26 May 2021 06:17:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0EE0613D3;
 Wed, 26 May 2021 06:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622009862;
 bh=PsfC7MVr+2Eywp2f8VjXIEceDitx1IJHsOxTWNWKkUM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UqDSzwVIRmivXZYs8rgxA1gDI0CnYxIouBB9ViE1bvdVmFaTboTrwGaSYyMkfSKQO
 87zTAIdLfWUop/6XlB9znMEDbioAW4uvQwOpjSZOU69wY/1TCGAaMlbIO0TKbqrT3F
 5tkJzQR/ymdD6LzMjHRcvJb4ysD+T/6YwhjTZ1VUCm8nerBUR6Z0iuX45NKVTOFmAj
 VU8aNxj4ddTOVgbawT5UKNIA3WA5oiqhjMlzvRNznyQw0Kj1ce+7XJgn3x0aQqs/qV
 18i7VMNYlRjLu+14bhSJZFG0tuhM6bqqnHr2OdK7KcETudhre3P9TanqarJ2GFxzho
 dFH27Uxjxl1yQ==
Received: by mail-ed1-f50.google.com with SMTP id r11so39017378edt.13;
 Tue, 25 May 2021 23:17:42 -0700 (PDT)
X-Gm-Message-State: AOAM532S8mudrNou2D/2d2kibpZRqd95NTt+ZUjmQmNtyMxTy244AmFj
 /zQI9TXW4+Hs0rppeJjcFfpjb1Dz1ghiutSwOQ==
X-Google-Smtp-Source: ABdhPJzwemgK0Ks5mmVpZCBvWxM5hQi6ZtH0dlR0VagAuAwklTi+So046naen/mPcYKT9kzju3JtqTQd6rEfD43twa8=
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr36053931edt.303.1622009861405; 
 Tue, 25 May 2021 23:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-3-chunkuang.hu@kernel.org>
In-Reply-To: <20210314233323.23377-3-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 May 2021 14:17:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yo0oWfgaCNNvkESgnWf6cyY=1g0T82-_aTJ-d7EiUWw@mail.gmail.com>
Message-ID: <CAAOTY_-yo0oWfgaCNNvkESgnWf6cyY=1g0T82-_aTJ-d7EiUWw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mailbox: mtk-cmdq: Use mailbox rx_callback
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_231743_447822_93154A2A 
X-CRM114-Status: GOOD (  17.25  )
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
MjAyMeW5tDPmnIgxNeaXpSDpgLHkuIAg5LiK5Y2INzozM+Wvq+mBk++8mgo+Cj4gcnhfY2FsbGJh
Y2sgaXMgYSBzdGFuZGFyZCBtYWlsYm94IGNhbGxiYWNrIG1lY2hhbmlzbSBhbmQgY291bGQgY292
ZXIgdGhlCj4gZnVuY3Rpb24gb2YgcHJvcHJpZXRhcnkgY21kcV90YXNrX2NiLCBzbyB1c2UgdGhl
IHN0YW5kYXJkIG9uZSBpbnN0ZWFkIG9mCj4gdGhlIHByb3ByaWV0YXJ5IG9uZS4gQnV0IHRoZSBj
bGllbnQgZHJpdmVyIGhhcyBhbHJlYWR5IHVzZWQgY21kcV90YXNrX2NiLAo+IHNvIGtlZXAgY21k
cV90YXNrX2NiIHVudGlsIGFsbCBjbGllbnQgZHJpdmVyIHVzZSByeF9jYWxsYmFjayBpbnN0ZWFk
IG9mCj4gY21kcV90YXNrX2NiLgo+Cj4gQ2M6IEphc3NpIEJyYXIgPGphc3Npc2luZ2hicmFyQGdt
YWlsLmNvbT4KPiBDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4K
PiBDYzogSG91bG9uZyBXZWkgPGhvdWxvbmcud2VpQG1lZGlhdGVrLmNvbT4KPiBDYzogQmliYnkg
SHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiBDYzogRGVubmlzIFlDIEhzaWVoIDxk
ZW5uaXMteWMuaHNpZWhAbWVkaWF0ZWsuY29tPgo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBs
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gU2lnbmVkLW9mZi1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbWFpbGJv
eC9tdGstY21kcS1tYWlsYm94LmMgfCAxNCArKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEt
bWFpbGJveC5jCj4gaW5kZXggM2QzN2MxY2Q0MGYxLi5lZjU5ZTIyMzRmMjIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYwo+ICsrKyBiL2RyaXZlcnMvbWFp
bGJveC9tdGstY21kcS1tYWlsYm94LmMKPiBAQCAtMTg4LDcgKzE4OCwxMCBAQCBzdGF0aWMgdm9p
ZCBjbWRxX3Rhc2tfZXhlY19kb25lKHN0cnVjdCBjbWRxX3Rhc2sgKnRhc2ssIGludCBzdGEpCj4g
ICAgICAgICBXQVJOX09OKGNiLT5jYiA9PSAoY21kcV9hc3luY19mbHVzaF9jYilOVUxMKTsKPiAg
ICAgICAgIGRhdGEuc3RhID0gc3RhOwo+ICAgICAgICAgZGF0YS5kYXRhID0gY2ItPmRhdGE7Cj4g
LSAgICAgICBjYi0+Y2IoZGF0YSk7Cj4gKyAgICAgICBpZiAoY2ItPmNiKQo+ICsgICAgICAgICAg
ICAgICBjYi0+Y2IoZGF0YSk7Cj4gKwo+ICsgICAgICAgbWJveF9jaGFuX3JlY2VpdmVkX2RhdGEo
dGFzay0+dGhyZWFkLT5jaGFuLCAmZGF0YSk7Cj4KPiAgICAgICAgIGxpc3RfZGVsKCZ0YXNrLT5s
aXN0X2VudHJ5KTsKPiAgfQo+IEBAIC00NTEsMTIgKzQ1NCwxMyBAQCBzdGF0aWMgaW50IGNtZHFf
bWJveF9mbHVzaChzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLCB1bnNpZ25lZCBsb25nIHRpbWVvdXQp
Cj4KPiAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSh0YXNrLCB0bXAsICZ0aHJlYWQt
PnRhc2tfYnVzeV9saXN0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3Rf
ZW50cnkpIHsKPiArICAgICAgICAgICAgICAgZGF0YS5zdGEgPSAtRUNPTk5BQk9SVEVEOwo+ICsg
ICAgICAgICAgICAgICBkYXRhLmRhdGEgPSBjYi0+ZGF0YTsKPiAgICAgICAgICAgICAgICAgY2Ig
PSAmdGFzay0+cGt0LT5hc3luY19jYjsKPiAtICAgICAgICAgICAgICAgaWYgKGNiLT5jYikgewo+
IC0gICAgICAgICAgICAgICAgICAgICAgIGRhdGEuc3RhID0gLUVDT05OQUJPUlRFRDsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICBkYXRhLmRhdGEgPSBjYi0+ZGF0YTsKPiArICAgICAgICAgICAg
ICAgaWYgKGNiLT5jYikKPiAgICAgICAgICAgICAgICAgICAgICAgICBjYi0+Y2IoZGF0YSk7Cj4g
LSAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIG1ib3hfY2hhbl9yZWNlaXZl
ZF9kYXRhKHRhc2stPnRocmVhZC0+Y2hhbiwgJmRhdGEpOwo+ICAgICAgICAgICAgICAgICBsaXN0
X2RlbCgmdGFzay0+bGlzdF9lbnRyeSk7Cj4gICAgICAgICAgICAgICAgIGtmcmVlKHRhc2spOwo+
ICAgICAgICAgfQo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
