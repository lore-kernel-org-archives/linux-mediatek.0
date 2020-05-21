Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCD7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B297D2072C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdTxLFfs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lilzUBMV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B297D2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pARZIBCjaINnOvF133F0jZjxcw3sG4f8Xp8jjC+wMGA=; b=WdTxLFfss27mtG
	zLDPcI4djgYpwO0SVLRHAWy3SSaEiAQwcS+nWdyPVD7YYnDcGynMnDCxkiOXMXx/3QG0kBqxOxb3S
	7ckf3cwRscYo66Xf3eIdnm2lEpI+KmixtHCxM/dAS3gu9mcBdqmUSrZ92QaUBBIoSASfQI9PPnZv1
	bsEhlYTtpjN2Xkbl/v3M6txWCNJEawyHQTGcYRuw/jeX0y22vK7c49BqVXXcsaxchtckg48ZbKJ40
	vyj5ZzqdOIXc8zoB2tT5lPAA/Qt5FCFG5VDaFQACf4+uFq6aZpMBhATM68TiH4n7Q8saLIpTdm9jM
	Q/TA25qwsqMKTn3d3tLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbnXu-0002SN-Uq; Thu, 21 May 2020 15:55:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbnXs-0002IU-FB
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 15:55:45 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD61920829
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590076544;
 bh=Nwfyrjzw3eHOJz/N8y9KOakdxCd8FqvuJvr/rkzBgQQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lilzUBMVFh14+1UPTVw9J58DlIQFSqz2emNpx55gubmLpJ17WE7hJbl6sINOFSmgc
 FdBUkXbKtJv45aTgqeeQShTMgUEoLiHczASD4p+3sCqboAAalOSBMbhsBIGZ3h/632
 GFAqwn+tlE+W1xL2Eq1W3UwnqN2ruV45SDscBhPk=
Received: by mail-ej1-f49.google.com with SMTP id d7so9415086eja.7
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 08:55:43 -0700 (PDT)
X-Gm-Message-State: AOAM533fgvtq/vS1qW4a1yDhK4fN+Q1AQpNZBL41HhDmrhKJAVTEN2KZ
 DtiPEhhpm0/lW2/WJ9gwyjodUEqGd9318+RyPQ==
X-Google-Smtp-Source: ABdhPJxRIuX15IPjbuCXCvearEzPPxB5aYhyYlLzyIzznR7ehqGz824vvlNt2bKNL1jahLDGjQPuOJJq0988E4Wy8Qo=
X-Received: by 2002:a17:906:ce36:: with SMTP id
 sd22mr4100770ejb.94.1590076542259; 
 Thu, 21 May 2020 08:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
 <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
 <CAPM=9tzqQ5G82mSACX5speUF2j-8vz7SrOcj7XLsKCjhe3GT6A@mail.gmail.com>
In-Reply-To: <CAPM=9tzqQ5G82mSACX5speUF2j-8vz7SrOcj7XLsKCjhe3GT6A@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 21 May 2020 23:55:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY__9bnTkQd5VFemrK3bVDMzf6AttssuZgXecO+_t9MMmaA@mail.gmail.com>
Message-ID: <CAAOTY__9bnTkQd5VFemrK3bVDMzf6AttssuZgXecO+_t9MMmaA@mail.gmail.com>
Subject: Re: [GIT PULL v2] mediatek drm next for 5.8
To: Dave Airlie <airlied@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_085544_546726_7A74CD77 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERhdmU6CgpEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IOaWvCAyMDIw5bm0Neac
iDIw5pelIOmAseS4iSDkuIvljYgxOjQ35a+r6YGT77yaCj4KPiBPbiBXZWQsIDIwIE1heSAyMDIw
IGF0IDE1OjQ0LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIE1vbiwgMTggTWF5IDIwMjAgYXQgMTA6MDYsIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGksIERhdmUgJiBEYW5pZWw6Cj4gPiA+
Cj4gPiA+IFRoaXMgaW5jbHVkZSBkcGkgcGluIG1vZGUgc3dhcCwgY29uZmlnIG1pcGlfdHggY3Vy
cmVudCBhbmQgaW1wZWRhbmNlLAo+ID4gPiBhbmQgc29tZSBmaXh1cC4gSSBkcm9wIGRybV9icmlk
Z2UgcGF0Y2hlcyBpbiB0aGlzIHZlcnNpb24uCj4gPiA+Cj4gPiA+IFRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgOGYzZDlmMzU0Mjg2NzQ1Yzc1MTM3NGY1ZjFmY2FmZWU2YjNmMzEz
NjoKPiA+ID4gICBMaW51eCA1LjctcmMxICgyMDIwLTA0LTEyIDEyOjM1OjU1IC0wNzAwKQo+ID4g
PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+ID4gICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0Cj4gPiA+IHRhZ3MvbWVkaWF0ZWstZHJtLW5leHQtNS44Cj4gPiA+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byAwMDdkMjc0YTAxN2JiNGUyZWY3YjkyMmMyZjU0ZjQwY2YyMDcz
NjY0Ogo+ID4KPiA+IERpZCB5b3UgZWRpdCB0aGlzIGJ5IGhhbmQgb3IgcGFzcyBpdCB0aHJvdWdo
IHNvbWUgbWFpbHNlcnZlciB0aGF0Cj4gPiBjaGV3ZWQgaXQgdXAsIEkgaGFkIHRvIHJlY29uc3Ry
dWN0IHRoaXMgcHVsbCBmcm9tIHRoZSBhYm92ZSBiaXRzLCBJJ3ZlCj4gPiBubyBpZGVhIHdoeSBp
dCdzIHNvIG1lc3NlZCB1cCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPiBhbmQgd2h5IGRvZXMgaXQg
Y29udGFpbiBhbiB1bmV4cGxhaW5lZCBiYWNrbWVyZ2U/Cj4KPiAgTWVyZ2UgdGFnICd2NS43LW5l
eHQtZHJtLXN0YWJsZScgb2YKPiBzc2g6Ly9naXRvbGl0ZS5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9tYXR0aGlhcy5iZ2cvbGludXgKPiBpbnRvIG1lZGlhdGVrLWRybS1uZXh0
Cj4KPiBQbGVhc2UgZG9uJ3QgZXZlciBiYWNrbWVyZ2UgZml4ZXMgaW50byBuZXh0IHB1bGwsIHdp
dGhvdXQgYSBsb25nCj4gZXhwbGFpbmF0aW9uIG9yIGlmIHlvdSByZWFsbHkgbmVlZCBpdCBhc2sg
dXMgZmlyc3QsCj4KPiBQbGVhc2UgcmVzZW5kIHRoaXMgYWdhaW4gY2xlYW5lZCB1cC4KCk9LLCB0
byBtYWtlIHRoaW5ncyBlYXNpZXIsIEkganVzdCByZXNlbmQgYW5kIGNsZWFuZWQgdXAuCklmIG9u
ZSBkYXkgSSBuZWVkIGEgYmFja21lcmdlIGZpeGVzLCBJIHdvdWxkIGFzayB5b3UgZmlyc3QuCgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IERhdmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
