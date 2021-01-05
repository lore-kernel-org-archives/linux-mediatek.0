Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BE4C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 23:10:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3C022E00
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 23:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3C022E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x2YLZYJDZPl1PMkD9TpwJH1CYkQxv8pYTIFXc5IKVCQ=; b=MmNvoeJRATEwcytp2FMFK+Wa2
	eVcWGpLLHEN1r9re+w/uDOB/rTB68w5h2HECDZo56ePUSjzL4Ywm5vsQW4oUu7Vdd8CLM003dyLFZ
	k3KpxI04hXCJ6KLyHv1lwNlgYil4zrrcZOv51hEsy+gvHSmb9qaTs5tuf29OBN//9kwTd76/fQtRO
	NzX4QZkweLlUQwmNcynBl2QNbA0Wg8DEc4hp2G2U8U6IU+6pDn3/IH3sFC3aHwkNRQeUr8hf/ZIOY
	DhWh/4Ai+czrJvAnwqkWddIvtt926d3i/kxEPF2stz/E/SrletafR3GO1PtHhglhlL6wPUaXJ4BsZ
	gWPKkHs3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwvSS-0004aG-MT; Tue, 05 Jan 2021 23:09:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwvSP-0004ZT-7u; Tue, 05 Jan 2021 23:09:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5F7722EBE;
 Tue,  5 Jan 2021 23:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609888180;
 bh=fed5XlKEYP7XWtaTDihJhGMdXSKuB5tSlmnJYeJp5tA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XTorqmmoQFo45G1nbewWbvP/CAvceHKlyXWurSrvetkZZc/6Kuavisei2FTiVpZ13
 vVx27/Msk/wjDmCKaBFSV0xmyQ1R1rqj2S7HfSDf8rBdcUKh/FQjukqWHttxrImIBq
 i7q5eRq119nsRWEku8jfaeNm38AvuH8WI7exdD4y6oWj3Ej4qsbuUfrm1RUNEA4xuv
 d0qy0RR9uo3rbPxZ46uOG2qGaE9/oRYGdygF/B5cMKUXGNBrO3woliFM7wKvJ5/D4X
 goorMZ2I8ptX/nwdRzzsyYXqV7eAxwoDems14MOxsH0kTfIanPc6Nk6EINA1WNwL93
 YLgNEr/YXSuEw==
Received: by mail-ed1-f44.google.com with SMTP id y24so2583701edt.10;
 Tue, 05 Jan 2021 15:09:39 -0800 (PST)
X-Gm-Message-State: AOAM533Elb6hQ3m7r/O9/Wts5KLgn/Ich9JYGS0IVLvFxBR8MgPlVTSU
 z4dvvQimrr3szkZbjdhnvvpv/hRFXa+J5/mVPQ==
X-Google-Smtp-Source: ABdhPJzIhUlEvoUVEDqvgDDYC9VWDoT47pLXuX5VmL//f0UtuCznywGNVW5rGOqFAhZlyQJoJHGegCDvr8Y5OwVO8xU=
X-Received: by 2002:a50:fc96:: with SMTP id f22mr2120443edq.162.1609888178364; 
 Tue, 05 Jan 2021 15:09:38 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
 <1607647514.12750.5.camel@mhfsdcap03>
 <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
 <1609828577.1574.5.camel@mhfsdcap03>
In-Reply-To: <1609828577.1574.5.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 Jan 2021 07:09:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-AGNuwwCv-A_GWy7gDO8csXenJGciLsP7mRAUuUKWUKA@mail.gmail.com>
Message-ID: <CAAOTY_-AGNuwwCv-A_GWy7gDO8csXenJGciLsP7mRAUuUKWUKA@mail.gmail.com>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_180941_427810_1ACFB6D2 
X-CRM114-Status: GOOD (  30.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIg15pelIOmAseS6jCDkuIvljYgyOjM25a+r6YGT77yaCj4KPiBPbiBN
b24sIDIwMjAtMTItMTQgYXQgMjI6NTQgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBI
aSwgWW9uZ3FpYW5nOgo+ID4KPiA+IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPiDmlrwgMjAyMOW5tDEy5pyIMTHml6Ug6YCx5LqUIOS4iuWNiDg6NDXlr6vpgZPvvJoK
PiA+ID4KPiA+ID4gT24gVGh1LCAyMDIwLTEyLTEwIGF0IDIzOjUwICswODAwLCBDaHVuLUt1YW5n
IEh1IHdyb3RlOgo+ID4gPiA+IEhpLCBZb25ncWlhbmc6Cj4gPiA+ID4KPiA+ID4gPiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQxMuaciDEw5pel
IOmAseWbmyDkuIvljYg1OjA45a+r6YGT77yaCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBwYXRj
aCBhZGQgUkRNQSBmaWZvIHNpemUgZXJyb3IgaGFuZGxlCj4gPiA+ID4gPiByZG1hIGZpZm8gc2l6
ZSB3aWxsIG5vdCBhbHdheXMgYmlnZ2VyIHRoYW4gdGhlIGNhbGN1bGF0ZWQgdGhyZXNob2xkCj4g
PiA+ID4gPiBpZiB0aGF0IGNhc2UgaGFwcGVuZWQsIHdlIG5lZWQgc2V0IGZpZm8gc2l6ZSBhcyB0
aGUgdGhyZXNob2xkCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5n
IE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIHwgNCArKysrCj4gPiA+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+ID4gPiA+ID4gaW5kZXgg
Nzk0YWNjNS4uMDUwODM5MiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiA+ID4gPiA+IEBAIC0xNTEsNiArMTUxLDEwIEBAIHN0
YXRpYyB2b2lkIG10a19yZG1hX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNp
Z25lZCBpbnQgd2lkdGgsCj4gPiA+ID4gPiAgICAgICAgICAqIGFjY291bnQgZm9yIGJsYW5raW5n
LCBhbmQgd2l0aCBhIHBpeGVsIGRlcHRoIG9mIDQgYnl0ZXM6Cj4gPiA+ID4gPiAgICAgICAgICAq
Lwo+ID4gPiA+ID4gICAgICAgICB0aHJlc2hvbGQgPSB3aWR0aCAqIGhlaWdodCAqIHZyZWZyZXNo
ICogNCAqIDcgLyAxMDAwMDAwOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBpZiAodGhy
ZXNob2xkID4gcmRtYV9maWZvX3NpemUpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgdGhyZXNo
b2xkID0gcmRtYV9maWZvX3NpemU7Cj4gPiA+ID4KPiA+ID4gPiBJZiB0aGUgZm9ybXVsYSBpcyBu
b3QgY29ycmVjdCwgeW91IHNob3VsZCBmaXggdGhlIGZvcm11bGEgbm90IHdvcmsgYXJvdW5kLgo+
ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBDaHVuLUt1YW5nLgo+ID4gPgo+ID4gPiBo
b3cgYWJvdXQgdGhpczoKPiA+ID4gdGhyZXNob2xkID0gbWF4KHdpZHRoICogaGVpZ2h0ICogdnJl
ZnJlc2ggKiA0ICogNyAvIDEwMDAwMDAsCj4gPiA+IHJkbWFfZmlmb19zaXplKTsKPiA+Cj4gPiBX
aGVuIEkgdXNlIHdpZHRoID0gMTkyMCwgaGVpZ2h0ID0gMTA4MCwgdnJlZnJlc2ggPSA2MCB0byBj
YWxjdWxhdGUsIEkKPiA+IGdldCB0aHJlc2hvbGQgPSAyOTg1Lgo+ID4gU28gSSB0aGluayBzZXQg
dGhyZXNob2xkIHRvIGhhbGYgb2YgZmlmbyBzaXplIGlzIE9LIGZvciBNQVhfV0lEVEgsCj4gPiBN
QVhfSEVJR0hULCBNQVhfVlJFRlJFU0ggKHRoZXNlIHRocmVlIG1heSBiZSBkaWZmZXJlbnQgaW4g
ZWFjaCBTb0MpCj4gPgo+ID4gdGhyZXNob2xkID0gUkRNQV9GSUZPX1BTRVVET19TSVpFKHJkbWFf
Zmlmb19zaXplKSAvIDI7Cj4gPgo+ID4gQnV0IEkgd29ycnkgaGFsZiBmaWZvIHNpemUgaXMgdG9v
IGJpZyBmb3Igc21hbGwgcmVzb2x1dGlvbiBhbmQgbGV0Cj4gPiBzbWFsbCByZXNvbHV0aW9uIHRv
byBlYXN5IHRvIHRyaWdnZXIgYnVyc3QgcmVhZCBEUkFNLiBTbyBsZXQgdGhlCj4gPiBmb3JtdWxh
IHRvIGJlIHRoaXM6Cj4gPgo+ID4gdGhyZXNob2xkID0gUkRNQV9GSUZPX1BTRVVET19TSVpFKHJk
bWFfZmlmb19zaXplKSAqIHdpZHRoICogaGVpZ2h0ICoKPiA+IHZyZWZyZXNoIC8gMiAvIE1BWF9X
SURUSCAvIE1BWF9IRUlHSFQgLyBNQVhfVlJFRlJFU0g7Cj4gPgo+ID4gSG93IGRvIHlvdSB0aGlu
ayBhYm91dCB0aGlzPwo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+Cj4gaG93IGFi
b3V0IHJlbW92ZSB0aGlzIGZvcm11bGEsIGFuZCBzZXQgdGhyZXNob2xkID0gcmRtYV9maWZvX3Np
emUKClRoaXMgbWVhbnMgdGhhdCBSRE1BIHdvdWxkIGFsd2F5cyB0cmlnZ2VyIGJ1cnN0IHJlYWQu
IEluIG5vcm1hbCBjYXNlLApJIHRoaW5rIG5vIGhhcmR3YXJlIHdvdWxkIHRyaWdnZXIgYnVyc3Qg
cmVhZC4gT25seSB0aGUgZW1lcmdlbmN5Cm9jY3VyLCB0aGUgaGFyZHdhcmUgdHJpZ2dlciBidXJz
dCByZWFkLiBSRE1BIGFsd2F5cyB0cmlnZ2VyaW5nIGJ1cnN0CnJlYWQgaXMgZ29vZCBmb3IgUkRN
QSwgYnV0IGl0IG1heSBodXJ0IG90aGVyIGhhcmR3YXJlIHRvIHJlYWQgRFJBTS4gU28KSSB0aGlu
ayBSRE1BIHNob3VsZCB0cmlnZ2VyIGJ1cnN0IHJlYWQgb25seSB3aGVuIGZpZm8gZGF0YSBpcyB1
bmRlciBhCmVtZXJnZW5jeSB0aHJlc2hvbGQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiA+Cj4g
PiA+ID4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAgICAgICAgcmVnID0gUkRNQV9GSUZPX1VOREVS
RkxPV19FTiB8Cj4gPiA+ID4gPiAgICAgICAgICAgICAgIFJETUFfRklGT19QU0VVRE9fU0laRShy
ZG1hX2ZpZm9fc2l6ZSkgfAo+ID4gPiA+ID4gICAgICAgICAgICAgICBSRE1BX09VVFBVVF9WQUxJ
RF9GSUZPX1RIUkVTSE9MRCh0aHJlc2hvbGQpOwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDEuOC4x
LjEuZGlydHkKPiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiA+ID4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gPiA+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKPiA+ID4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
