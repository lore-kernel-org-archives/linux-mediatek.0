Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569A2C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:58:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE94C217A0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE94C217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EhCGT5DkK9QtlTnLhYfqyX59Jb8Z+jdCk8TA4dkzXvA=; b=3GjSTRri1E1uoDxrVq707vp4w
	n8fAxICDhsge9quau3hQ+WpXy+1s6orZHyxlfxWNSoJieYV8JuFOYt/kvFatn6m8uTpul6Q0WWzyZ
	EebDxOG5oqwRpXnx5BRMMWNBk1KbqZn7j5Y+HJUU4RKWKM3MbP7o4ibsWikHiiu/8QcJQA9FAg07U
	Mjh0T6ZJ0SnXaWmfGnmYEqJ0+o/qeHeOuNYQSbgDbNSQx4ig11E5+PuFcFC/xsJ4pa53ENuZZajaZ
	FKRVOvVPFkWIZPhkpbHcseMXZKNPvLcDI0K+XB2H/AJnmF5Ax28iQT8aUJ/csDIu/JmZRsw4UJmCx
	5a2VCyTHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxS3r-0005gV-E8; Thu, 07 Jan 2021 09:58:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxS3m-0005fX-FU; Thu, 07 Jan 2021 09:58:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E3F92333F;
 Thu,  7 Jan 2021 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610013505;
 bh=/IoyTbDRYdITqQ/ehLHHAr5zNu/uV79exeCn/3qbm4w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FhvFdx7YQqNX76DDQy8bm+QZG3FlLsKv+uvGJTWd+AYLs9DhEmarC2ooCBsWQoMj4
 d/ovB12fQV1lTPXUgTj82hkh4qH+KoDC8BgkjGzKR+hFWJNKdL/CfhtgcXA9RtTgf/
 f1yk/U/8+LQYLbF3rQjfmtKEuKS+p3voXHeiqfmU1LgwgqeG+g+iFrg64bjrgrCn6C
 AllCy1ilu5q5qviydFwac88yWMU4pu99tBPXhHaA4+OK0gEOLgMEJB6yYq9zvUPgKv
 UWamxX+fyPJoLqK5EAc0hjic7m0+L+B7PJDi3c6k88s/UcS2+PuJCH8l79jeiye57I
 cheAhGLJtsMBw==
Received: by mail-ed1-f46.google.com with SMTP id dk8so7242603edb.1;
 Thu, 07 Jan 2021 01:58:25 -0800 (PST)
X-Gm-Message-State: AOAM530GxAG28hfqYLwJVIENPJLnxCalwkoeltiVtYZJFwi1bV3hX4FH
 lZmqqM8WFjYrijFslA8uHoHnp66wBUVe4xEJ4A==
X-Google-Smtp-Source: ABdhPJzuagogH0mSid9kt6qBlxG0IYM9hSJgtHkS+RyfrWE+l+JBeR+fcJikBQGl7vUlVHVFXv4wKYgD3LkjJMNaChA=
X-Received: by 2002:a05:6402:3048:: with SMTP id
 bu8mr1091459edb.49.1610013503677; 
 Thu, 07 Jan 2021 01:58:23 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 17:58:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9aD1ZjVMZbQxL17HTz5fCP7-paZbx-ybMVAJ7QLrVydg@mail.gmail.com>
Message-ID: <CAAOTY_9aD1ZjVMZbQxL17HTz5fCP7-paZbx-ybMVAJ7QLrVydg@mail.gmail.com>
Subject: Re: [PATCH v9, 03/11] arm64: dts: mt8183: rename rdma fifo size
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_045826_715965_41A89D98 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMuWvq+mBk++8mgo+Cj4gcHJv
cGVydHkgbmFtZSBtdXN0IGluY2x1ZGUgb25seSBsb3dlcmNhc2UgYW5kICctJwoKUmV2aWV3ZWQt
Ynk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIHwgNCArKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKPiBpbmRleCA1Yjc4MmE0Li42Yzg0Y2Ni
NyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNp
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQo+IEBAIC0x
MDExLDcgKzEwMTEsNyBAQAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmbW1z
eXMgQ0xLX01NX0RJU1BfUkRNQTA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlvbW11cyA9
IDwmaW9tbXUgTTRVX1BPUlRfRElTUF9SRE1BMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
bWVkaWF0ZWssbGFyYiA9IDwmbGFyYjA+Owo+IC0gICAgICAgICAgICAgICAgICAgICAgIG1lZGlh
dGVrLHJkbWFfZmlmb19zaXplID0gPDUxMjA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIG1l
ZGlhdGVrLHJkbWEtZmlmby1zaXplID0gPDUxMjA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAg
IG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UgU1VCU1lTXzE0MDBYWFhYIDB4YjAwMCAw
eDEwMDA+Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gQEAgLTEwMjMsNyArMTAyMyw3IEBACj4g
ICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRElTUF9SRE1B
MT47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW9tbXVzID0gPCZpb21tdSBNNFVfUE9SVF9E
SVNQX1JETUExPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxsYXJiID0gPCZs
YXJiMD47Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWsscmRtYV9maWZvX3NpemUg
PSA8MjA0OD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWsscmRtYS1maWZvLXNp
emUgPSA8MjA0OD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVu
dC1yZWcgPSA8JmdjZSBTVUJTWVNfMTQwMFhYWFggMHhjMDAwIDB4MTAwMD47Cj4gICAgICAgICAg
ICAgICAgIH07Cj4KPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
