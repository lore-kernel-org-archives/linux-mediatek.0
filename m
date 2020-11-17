Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AFBC56202
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 14:05:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D96520729
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 14:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAiJNZlX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSYKIA3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D96520729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z0jKDGKy4VB8aS8NMw7RDUMbqzSKnmzjXa/ZmNc9kwg=; b=KAiJNZlX5+q1IBYafeaMu5RKE
	5kfolYS/0eNzcjTNUyrkUvLAb8f8dvv+iJUPWMfVD4Oh6biXm+Qw+oE+qwqkE6lZZHMQmWiznmtv0
	nm3xhX9Biz/iPeRm41jJeD6CFPme+2T/eMYVvT5FL5ROYC8vMEEpkoqDF336cXyeRtA8a/ldh644u
	f/u40/Zsvf9rFGoRU2qKFkaNoafBvWet+wg1dCl9bovppEwpfrbCi8VT0vN9WkGM+iTQ00FvcD1Rr
	zd+zB0EQvli0p2IJJJ/pk4JZvAxUjopm/2fI+b60yiS48w0vo/ZI/gIfdOizl5z0+xSxuSpKTRtPe
	EIR5SQosQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf1cC-0000tr-4p; Tue, 17 Nov 2020 14:05:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf1c9-0000su-Tn
 for linux-mediatek@lists.infradead.org; Tue, 17 Nov 2020 14:05:46 +0000
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2BEB22203
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2020 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605621944;
 bh=MUSMd6abJAdtwLkhDfU5Mker4vAbz8CcGo3fa144da0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VSYKIA3tpTAqnwTVirfgwxldCpS6alOHqC3N3h606v/9KSio/gNQHpAofIdAaa7u3
 aUSpRPeNaOqDT0ncZoDaDsDhvyRavghafJ8d1/E51O3fbS8QfLy48EkFol1TSTiw6p
 asMeyHLAqNStBSTPB+b8t+111C0ZebFK2IA3TEhI=
Received: by mail-wm1-f45.google.com with SMTP id s13so3328663wmh.4
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2020 06:05:43 -0800 (PST)
X-Gm-Message-State: AOAM5305tL6hLuLAvSl0UPbSraHsfXvFtSE3rPTT9ZLyFW0SB2ME1hJS
 Xv4/6WQpFlZN/xEwU4cW026T2kHo59ti8o97zA==
X-Google-Smtp-Source: ABdhPJygZ6W6WYu5uc7uhlYwgaHToMSoM6KFGBB0TcyPL934xUgi43XW1SDxnf6FiZEK2/cNMP1hOTWV5/GNpNfg+/Q=
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr4572652wmf.55.1605621942348;
 Tue, 17 Nov 2020 06:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-4-chunkuang.hu@kernel.org>
In-Reply-To: <20201116231407.94-4-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 22:05:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-0eFBVnJ3-Fcv-t9AHJMWFhvgM28cP1ksw5DZ8OKs_gg@mail.gmail.com>
Message-ID: <CAAOTY_-0eFBVnJ3-Fcv-t9AHJMWFhvgM28cP1ksw5DZ8OKs_gg@mail.gmail.com>
Subject: Re: [RESEND PATCH 3/3] MAINTAINERS: add files for Mediatek DRM drivers
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_090546_220013_74547DFC 
X-CRM114-Status: GOOD (  16.55  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFZpbm9kOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0MTHmnIgxN+aXpSDpgLHkuowg5LiK5Y2INzoxNOWvq+mBk++8mgo+Cj4gTWVkaWF0ZWsg
TUlQSSBEU0kgcGh5IGRyaXZlciBpcyBtb3ZlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ayB0bwo+IGRyaXZlcnMvcGh5L21lZGlhdGVrLCBzbyBhZGQgdGhlIG5ldyBmb2xkZXIgdG8gdGhl
IE1lZGlhdGVrIERSTSBkcml2ZXJzJwo+IGluZm9ybWF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CgpJZiB5b3UgYXBwbHkgdGhp
cyBwYXRjaCwgcGxlYXNlIGFkZCBhY2tlZC1ieSB0YWcgb2YgY2h1bmZlbmcgWzFdLCB0aGFua3Mu
CgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVr
L3BhdGNoLzIwMjAxMDI5MTUyNzAyLjUzMy00LWNodW5rdWFuZy5odUBrZXJuZWwub3JnLwoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4gLS0tCj4gIE1BSU5UQUlORVJTIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJ
TlRBSU5FUlMKPiBpbmRleCBlNzM2MzZiNzVmMjkuLjE0ZjUwMThjMDFiNiAxMDA2NDQKPiAtLS0g
YS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTU4NjcsNiArNTg2Nyw3IEBA
IFM6ICAgICAgICBTdXBwb3J0ZWQKPiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrLwo+ICBGOiAgICAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrLwo+ICBGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pKgo+ICtGOiAg
ICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpKgo+Cj4gIERSTSBEUklWRVJTIEZP
UiBOVklESUEgVEVHUkEKPiAgTTogICAgIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0Bn
bWFpbC5jb20+Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
