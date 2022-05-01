Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D0DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 22:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDZ0H8YrpJTl1h2XFXJyFtAqZ5+e2II7MECLil26H/c=; b=S1I/FQ8ePajOa0
	siUaU4Dn26q2bsj3qLoHfsvl7r2bt9F76W+LWxHTl/2uT/L4jQFNDNqYlQunowXlZVVp2v0y2pG/d
	KhE5qROieYzIQ06vHJBjjTiYNxn4QXphhlT2/iG17UWUf7nfE2DHhjH6hSR3fBLmrcQhq8mA1F3WM
	SGzkX3pE0oB21F4VdyOHe4wtFOq0oyUw0AOPCU/Qv6xuMcFd2KmiOVivBeSWd8TWhUPETGWFA6DLo
	FliIoVGhgIdvIPGvhe4PaWSrCvagrLUKq48UeP2qH8z0qPJ5rSC9rzzsjzEAkaSWyEHc7JeYk82Mt
	zs7HZT82vU5Gp0sfOH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlIT2-00H4kb-CS; Sun, 01 May 2022 22:55:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlISq-00H4hc-Bc; Sun, 01 May 2022 22:54:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24A9BB8101F;
 Sun,  1 May 2022 22:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BEDC385AF;
 Sun,  1 May 2022 22:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651445687;
 bh=XYah/6Osmyojc17k6cqZ+vX1jwgljOTNKYJ/JeSQBfk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=px2suCI3Pu/bkCRbO5tygyBgCnMM71GOuMyeL9LyUC+OsRZ4FVjr/8GI6djLshrvc
 M19tpJz53lIURMRhXPy2XW85ZAeHo7k74/Oy2bhXdQVTSPw6UIEz6iBkcW0n4OEGuc
 SaRoGwLbS3qfyOEVT2ycxXzpFEqlwxiWGPFYsGEPzCagLtS4lZaENeuXI3lFeMNtS7
 Vck9W34Ic6AROOfxEwL89jMHFFypiHlT/chDQNttnQTa/mJMgZNyERq0ioqK61Lwc4
 GFuttc2DxKBcnMDQw89NpfG1DJ82UTeiCdmMi6tbiSSm5DOnpRgbA/VuH0chgtxE71
 49iYHjxXsDnog==
Received: by mail-yb1-f177.google.com with SMTP id d12so23475245ybc.4;
 Sun, 01 May 2022 15:54:47 -0700 (PDT)
X-Gm-Message-State: AOAM530bzBdTVnb/l0d2rh/dcOmVwRyhQbZvs/8GchLejgwGokOTj0L+
 l7wxQmY0uPt4y7MZRTERogxmDVJlVyt0ArBb9A==
X-Google-Smtp-Source: ABdhPJyuplDBOy1HzgzBEurySzDISvnf65i4g3J7NP8mPSls5NwNyrHXj98ge6hOrTKJlam+L9WwpviYEfc1OEFPVok=
X-Received: by 2002:a25:d194:0:b0:645:7892:43b0 with SMTP id
 i142-20020a25d194000000b00645789243b0mr8501223ybg.35.1651445686885; Sun, 01
 May 2022 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
 <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
In-Reply-To: <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 2 May 2022 06:54:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
Message-ID: <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_155452_741043_9B33C290 
X-CRM114-Status: GOOD (  17.47  )
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

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjLlubQ05pyIMjLml6Ug6YCx5LqUIOS4i+WNiDg6NDLlr6vpgZPvvJoKPgo+Cj4KPiBP
biAxOS8wNC8yMDIyIDExOjQxLCBqYXNvbi1qaC5saW4gd3JvdGU6Cj4gPiBBZnRlciBtbXN5cyBh
bmQgZHJtIGNoYW5nZSBESVRIRVIgZW51bSB0byBERFBfQ09NUE9ORU5UX0RJVEhFUjAsCj4gPiBt
bXN5cyBoZWFkZXIgY2FuIHJlbW92ZSB0aGUgdXNlbGVzcyBERFBfQ09NUE9ORU5UX0RJVEhFUiBl
bnVtLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1l
ZGlhdGVrLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+Cj4gQWNrZWQtYnk6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4KPiBDaHVuLUt1YW5nLCBJ
IHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gdGFrZSB0aGF0IHRocm91Z2ggeW91ciB0cmVl
IGFzIGl0Cj4gZGVwZW5kcyBvbiB0aGUgcHJldmlvdXMgcGF0Y2hlcy4KPgo+IEkgcHJvdmlkZSB5
b3UgYSBzdGFibGUgdGFnIHNvIHRoYXQgeW91IGNhbiB0YWtlIGl0Ogo+IHY1LjE4LW5leHQtdmRz
bzAtc3RhYmxlLXRhZwoKQWZ0ZXIgSSB0YWtlIHRoaXMgdGFnLCBJIGZpbmQgb25lIGNoZWNrcGF0
Y2ggd2FybmluZzoKCldBUk5JTkc6IERUIGNvbXBhdGlibGUgc3RyaW5nICJtZWRpYXRlayxtdDgx
OTUtbW1zeXMiIGFwcGVhcnMKdW4tZG9jdW1lbnRlZCAtLSBjaGVjayAuL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy8KIzY3MDogRklMRTogZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmM6MzkwOgorICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTk1LW1tc3lzIiwKCkkgdGhpbmsgdGhpcyB0YWcgbG9zdCBvbmUgYmluZGluZyBwYXRjaCwgaXQn
cyBiZXR0ZXIgdGhhdCB0aGlzIHRhZyBoYXMKbm8gdGhpcyB3YXJuaW5nLgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4KPiBSZWdhcmRzLAo+IE1hdHRoaWFzCj4KPiA+IC0tLQo+ID4gICBpbmNsdWRl
L2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCB8IDMgKy0tCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggYi9pbmNsdWRlL2xpbnV4L3Nv
Yy9tZWRpYXRlay9tdGstbW1zeXMuaAo+ID4gaW5kZXggNTkxMTdkOTcwZGFmLi5mYjcxOWZkMTI4
MWMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
aAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiA+IEBA
IC0xNiw4ICsxNiw3IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsKPiA+ICAgICAgIEREUF9DT01Q
T05FTlRfQ0NPUlIsCj4gPiAgICAgICBERFBfQ09NUE9ORU5UX0NPTE9SMCwKPiA+ICAgICAgIERE
UF9DT01QT05FTlRfQ09MT1IxLAo+ID4gLSAgICAgRERQX0NPTVBPTkVOVF9ESVRIRVIsCj4gPiAt
ICAgICBERFBfQ09NUE9ORU5UX0RJVEhFUjAgPSBERFBfQ09NUE9ORU5UX0RJVEhFUiwKPiA+ICsg
ICAgIEREUF9DT01QT05FTlRfRElUSEVSMCwKPiA+ICAgICAgIEREUF9DT01QT05FTlRfRElUSEVS
MSwKPiA+ICAgICAgIEREUF9DT01QT05FTlRfRFBfSU5URjAsCj4gPiAgICAgICBERFBfQ09NUE9O
RU5UX0RQX0lOVEYxLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
