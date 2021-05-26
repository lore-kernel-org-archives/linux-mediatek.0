Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEE0C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:15:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E771613C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E771613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9qwh/SKOdH6fUIRHTvZ45dwEYWWioL7QuG/wcniAGk=; b=mZZK2q/h70d4M+
	gmlp7Lv0xjrFWtkDBs8dhgar9XrDCyNcsc9Uo3+sqggoMRVKuwUpr/zh+3aRzfRtP/3/2HcuEMcxa
	7iKtPJwwSMr+adZ2u2amJcopQYQnv4exCuO4GnLFSG3ogNsJVj4dpY2O2vdHHaLgSsuOBe9XAi1lV
	mBO1Cw4la4yUHVp9pJrYkl5Rk4zP1rw6yp5i4D41U9DxSurVRjqsFCD3baihJM1n6KwwBv3D9xNz2
	4fv00GxHJhBvYnwA6b/K9pw+SkkkS5a9sJ6WynVW8k7aq2GVXOICNkoxjsRtEObowl+dTzA9JiKU1
	rNWwK0gR67aXgT+56+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmpV-00BWPb-Dc; Wed, 26 May 2021 06:15:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmp0-00BWBR-Ms; Wed, 26 May 2021 06:15:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEDF7613D6;
 Wed, 26 May 2021 06:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622009714;
 bh=K9VDx8l9Fk35dCxg8qbp0CYu7i27EvYaYxaUjqRCaGA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mNmV+Pmh7ji3r4uvBrBgSZfcRn/8g4zcc/SnfGLVqcQbKcFHUXvVpxKZsn5gkrHbT
 AcHVe5ev/MwRyG+O0zjeE4Pk3W3x50S8xp7eRqB1SrQAGWSgpclMa+C3SDa/nXVg8j
 nZEbVxt3AtNBKNrz5mJe5xYE294oailgBVEC1kMeGfXmsdJ1EjT+GL3KoHVx91g2ZT
 Ht5JFJokUyXg2uQY/dudAnn8b/CbVF2HeA9RQA2+UMTAUXPHt1fSpA3ap0ZjSeYIyQ
 ucg+2anpRy12PwlOEVeg2IK//2JxXSGjBFTjnAawtTlgfVOjsg2jHtYhYjdZiSyje7
 mBYHE07uKTaAg==
Received: by mail-ej1-f41.google.com with SMTP id ss26so319066ejb.5;
 Tue, 25 May 2021 23:15:13 -0700 (PDT)
X-Gm-Message-State: AOAM531X7Nwnl/mnbDaE6p3s+4FGaKyeMJwzRrL//DHDrwnep6Wkw0gw
 ImWsXtXF6aJ1m3aTR0mgAzQzZsDyG+xo2njcBA==
X-Google-Smtp-Source: ABdhPJyabKi0LWwM/PA6CRZRJ7yKxu8Ed2vDuD7MWKFm13lniftrSzzbsQwiHZTy3W9YN6BoLRM2MlemgaJGcuSt8JU=
X-Received: by 2002:a17:907:1ca1:: with SMTP id
 nb33mr31925940ejc.75.1622009712454; 
 Tue, 25 May 2021 23:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-2-chunkuang.hu@kernel.org>
In-Reply-To: <20210314233323.23377-2-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 May 2021 14:15:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-SdjB5yTxwABLdrYgr+PpbbCnKhTPskBYwcQDeCCxvhQ@mail.gmail.com>
Message-ID: <CAAOTY_-SdjB5yTxwABLdrYgr+PpbbCnKhTPskBYwcQDeCCxvhQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mailbox: mtk-cmdq: Remove cmdq_cb_status
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_231514_855115_00B99A57 
X-CRM114-Status: GOOD (  17.68  )
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
MjAyMeW5tDPmnIgxNeaXpSDpgLHkuIAg5LiK5Y2INzozM+Wvq+mBk++8mgo+Cj4gY21kcV9jYl9z
dGF0dXMgaXMgYW4gZXJyb3Igc3RhdHVzLiBVc2UgdGhlIHN0YW5kYXJkIGVycm9yIG51bWJlcgo+
IGluc3RlYWQgb2YgY21kcV9jYl9zdGF0dXMgdG8gcHJldmVudCBzdGF0dXMgZHVwbGljYXRpb24u
Cj4KPiBDYzogSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPgo+IENjOiBNYXR0
aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBIb3Vsb25nIFdlaSA8
aG91bG9uZy53ZWlAbWVkaWF0ZWsuY29tPgo+IENjOiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhA
bWVkaWF0ZWsuY29tPgo+IENjOiBEZW5uaXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2llaEBtZWRp
YXRlay5jb20+Cj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3gu
YyAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRx
LW1haWxib3guaCB8ICA3ICstLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmMgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gaW5k
ZXggNTY2NWI2ZWE4MTE5Li4zZDM3YzFjZDQwZjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tYWls
Ym94L210ay1jbWRxLW1haWxib3guYwo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1t
YWlsYm94LmMKPiBAQCAtMTgwLDcgKzE4MCw3IEBAIHN0YXRpYyBib29sIGNtZHFfdGhyZWFkX2lz
X2luX3dmZShzdHJ1Y3QgY21kcV90aHJlYWQgKnRocmVhZCkKPiAgICAgICAgIHJldHVybiByZWFk
bCh0aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9XQUlUX1RPS0VOKSAmIENNRFFfVEhSX0lTX1dBSVRJ
Tkc7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBjbWRxX3Rhc2tfZXhlY19kb25lKHN0cnVjdCBjbWRx
X3Rhc2sgKnRhc2ssIGVudW0gY21kcV9jYl9zdGF0dXMgc3RhKQo+ICtzdGF0aWMgdm9pZCBjbWRx
X3Rhc2tfZXhlY19kb25lKHN0cnVjdCBjbWRxX3Rhc2sgKnRhc2ssIGludCBzdGEpCj4gIHsKPiAg
ICAgICAgIHN0cnVjdCBjbWRxX3Rhc2tfY2IgKmNiID0gJnRhc2stPnBrdC0+YXN5bmNfY2I7Cj4g
ICAgICAgICBzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGE7Cj4gQEAgLTI0NCwxMCArMjQ0LDEwIEBA
IHN0YXRpYyB2b2lkIGNtZHFfdGhyZWFkX2lycV9oYW5kbGVyKHN0cnVjdCBjbWRxICpjbWRxLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGN1cnJfdGFzayA9IHRhc2s7Cj4KPiAgICAgICAgICAg
ICAgICAgaWYgKCFjdXJyX3Rhc2sgfHwgY3Vycl9wYSA9PSB0YXNrX2VuZF9wYSAtIENNRFFfSU5T
VF9TSVpFKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgY21kcV90YXNrX2V4ZWNfZG9uZSh0
YXNrLCBDTURRX0NCX05PUk1BTCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY21kcV90YXNr
X2V4ZWNfZG9uZSh0YXNrLCAwKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBrZnJlZSh0YXNr
KTsKPiAgICAgICAgICAgICAgICAgfSBlbHNlIGlmIChlcnIpIHsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBjbWRxX3Rhc2tfZXhlY19kb25lKHRhc2ssIENNRFFfQ0JfRVJST1IpOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNtZHFfdGFza19leGVjX2RvbmUodGFzaywgLUVOT0VYRUMpOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfdGFza19oYW5kbGVfZXJyb3IoY3Vycl90YXNr
KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBrZnJlZSh0YXNrKTsKPiAgICAgICAgICAgICAg
ICAgfQo+IEBAIC00MTUsNyArNDE1LDcgQEAgc3RhdGljIHZvaWQgY21kcV9tYm94X3NodXRkb3du
KHN0cnVjdCBtYm94X2NoYW4gKmNoYW4pCj4KPiAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlf
c2FmZSh0YXNrLCB0bXAsICZ0aHJlYWQtPnRhc2tfYnVzeV9saXN0LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpc3RfZW50cnkpIHsKPiAtICAgICAgICAgICAgICAgY21kcV90
YXNrX2V4ZWNfZG9uZSh0YXNrLCBDTURRX0NCX0VSUk9SKTsKPiArICAgICAgICAgICAgICAgY21k
cV90YXNrX2V4ZWNfZG9uZSh0YXNrLCAtRUNPTk5BQk9SVEVEKTsKPiAgICAgICAgICAgICAgICAg
a2ZyZWUodGFzayk7Cj4gICAgICAgICB9Cj4KPiBAQCAtNDUzLDcgKzQ1Myw3IEBAIHN0YXRpYyBp
bnQgY21kcV9tYm94X2ZsdXNoKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sIHVuc2lnbmVkIGxvbmcg
dGltZW91dCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2VudHJ5KSB7
Cj4gICAgICAgICAgICAgICAgIGNiID0gJnRhc2stPnBrdC0+YXN5bmNfY2I7Cj4gICAgICAgICAg
ICAgICAgIGlmIChjYi0+Y2IpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBkYXRhLnN0YSA9
IENNRFFfQ0JfRVJST1I7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGF0YS5zdGEgPSAtRUNP
Tk5BQk9SVEVEOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEuZGF0YSA9IGNiLT5kYXRh
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNiLT5jYihkYXRhKTsKPiAgICAgICAgICAgICAg
ICAgfQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJv
eC5oIGIvaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaAo+IGluZGV4IGQ1
YTk4M2Q2NWYwNS4uMmY3ZDlhMzdkNjExIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbWFp
bGJveC9tdGstY21kcS1tYWlsYm94LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRr
LWNtZHEtbWFpbGJveC5oCj4gQEAgLTY1LDEzICs2NSw4IEBAIGVudW0gY21kcV9jb2RlIHsKPiAg
ICAgICAgIENNRFFfQ09ERV9MT0dJQyA9IDB4YTAsCj4gIH07Cj4KPiAtZW51bSBjbWRxX2NiX3N0
YXR1cyB7Cj4gLSAgICAgICBDTURRX0NCX05PUk1BTCA9IDAsCj4gLSAgICAgICBDTURRX0NCX0VS
Uk9SCj4gLX07Cj4gLQo+ICBzdHJ1Y3QgY21kcV9jYl9kYXRhIHsKPiAtICAgICAgIGVudW0gY21k
cV9jYl9zdGF0dXMgICAgIHN0YTsKPiArICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgIHN0
YTsKPiAgICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAgICpkYXRhOwo+ICB9Owo+Cj4gLS0K
PiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
