Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF70EC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 00:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB4A6109E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 00:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FB4A6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1cbPb6uhxJ0A/n5pKlWW8c3UDkvz+Fatb41VXi6wg8=; b=UiFCMn2+jFH9gV
	0dkalfct3bd4unc20ye+o9YqVYCvcL4DV24aslMztpnfXhmwnpzORNPyokzLdOHBalumBqEeV3qGZ
	viOSx+lzzdLsWL++SX+v0v5C7jVUvjeIoLkxt0/vOwo3WOhd6/Yu6wqZCTPU766tuRNKqL82wqGrw
	WyyKTZNp1ScEbeU8zcxRNEv7K11fSQxojuAilAovJx+JxbXFAWzR+Nxb8Nd6GdNtn/wIYEdxrvBrZ
	iE9STT7DaYRy3wXPESnRLAuMnUewFhxD/GcEtZqkcskkkl6NxSeaYG8I7/bbE+A4Rj5XJgaOyKHO2
	HYifsOh9TKvXIMNmsZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDyLd-008M5Q-Sr; Thu, 12 Aug 2021 00:13:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDyLa-008M4w-Pu
 for linux-mediatek@lists.infradead.org; Thu, 12 Aug 2021 00:13:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B5C06104F
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Aug 2021 00:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628727202;
 bh=SvqZXrT6raLFkVVxSV1Rme6HepTUUscOCyV5xTdrWSw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B6KSggAEUigQ5ARvSFSmuLugF8pCl74OazxBj93wNoETjxYTmQjhtadx5Dr7K0VNR
 Ydechf2VxRHirK2RzLK5oJoTMzEKPX+afgHXXaNQGaraSNd/3TyKPA9ftTP0+0vbI5
 W0IITElFrQwFhplnriCy6VOXAaaJgFIhUU7ia/Q02VWxlOOYO8nzsZuWH34a7y2NlS
 XqkJ79J35xvvE7pzcnLyjmugFMEWymrq5g+cZNJBDEM/jx40ofqZ5IvWghL6YBMaa6
 76n/rxGGaUGOCypVNNbej8QynIFtZmPqNwv1JuR7JlRcSUEgwyCMgt7g48BokrRsyy
 cGtZJnDHEWTWg==
Received: by mail-ed1-f53.google.com with SMTP id by4so6670853edb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 17:13:22 -0700 (PDT)
X-Gm-Message-State: AOAM5322Wi5VjD1ZH9Zl8uXzHIWlGG6fQp42vignt33NEjv/Y0b3kgPw
 hRufWQltRbEFrrFXYTim/WJ1lBKcAJe/qX3FMw==
X-Google-Smtp-Source: ABdhPJyQ8kt15E+5zz4pGcu5BjWx3XvQp7ecCpdQWAw9XtUggxnZaJHQrXUdbE/deXKJx/q6khdVJ2sSNurzzj/izb8=
X-Received: by 2002:a50:9fc2:: with SMTP id c60mr1984780edf.49.1628727200855; 
 Wed, 11 Aug 2021 17:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210808234733.14782-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 12 Aug 2021 08:13:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
Message-ID: <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_171322_902056_852673FB 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0OOaciDnm
l6Ug6YCx5LiAIOS4iuWNiDc6NDflr6vpgZPvvJoKPgo+IFRoZXNlIHJlZmluZW1lbnRzIGluY2x1
ZGUgdXNpbmcgc3RhbmRhcmQgbWFpbGJveCBjYWxsYmFjayBpbnRlcmZhY2UsCj4gdGltZW91dCBk
ZXRlY3Rpb24sIGFuZCBhIGZpeGVkIGNtZHFfaGFuZGxlLgoKRm9yIHRoaXMgc2VyaWVzLCBhcHBs
aWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXS4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1t
ZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBDaGFuZ2VzIGluIHYy
Ogo+IDEuIERlZmluZSBtdGtfZHJtX2NtZHFfcGt0X2NyZWF0ZSgpIGFuZCBtdGtfZHJtX2NtZHFf
cGt0X2Rlc3Ryb3koKQo+ICAgIHdoZW4gQ09ORklHX01US19DTURRIGlzIHJlYWNoYWJsZS4KPgo+
IENodW4tS3VhbmcgSHUgKDQpOgo+ICAgZHJtL21lZGlhdGVrOiBVc2UgbWFpbGJveCByeF9jYWxs
YmFjayBpbnN0ZWFkIG9mIGNtZHFfdGFza19jYgo+ICAgZHJtL21lZGlhdGVrOiBSZW1vdmUgc3Ry
dWN0IGNtZHFfY2xpZW50Cj4gICBkcm0vbWVkaWF0ZWs6IERldGVjdCBDTURRIGV4ZWN1dGlvbiB0
aW1lb3V0Cj4gICBkcm0vbWVkaWF0ZWs6IEFkZCBjbWRxX2hhbmRsZSBpbiBtdGtfY3J0Ywo+Cj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDExMCArKysrKysrKysr
KysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQo+Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
