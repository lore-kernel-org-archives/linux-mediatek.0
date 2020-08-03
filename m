Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24894C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:27:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C9720719
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:27:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2Y/rMAp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdX1ab29"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C9720719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oWbRjBJlWjiI0ApWU2GOJo72CeTusAvbaTUGmqnNYQU=; b=T2Y/rMApj3luBeQul2baEoUpg
	MHyl3UZRZ6B+wLKcgSqySMgdGxWZ3ls5Uju7ZT2FP2KCT4uKkHdH3PAd8+OMHZ2sS8LDh8r98tcUv
	XU8rBTJG8eYgCs0lthFzmeyafjkjg6F5crPT2C3P0BNo7EPyt2C93jXiWRaOj4BsWG5BvMTqlOGZK
	jftA2e0Tg9Ia/8RzgG1FVWN8UC+jWxepGXwdkThI0aGcHQpSDqIJ8jthn7GpESQp12aKknTElWqWB
	tk46fzZ+JG8W8T/3LgsInI8dDdBXJtGcimhNdjjstnkJ90mTvk+W82Z3er2Ka0JZ7K+1TOcG4N4dK
	GLfCvnmOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2dJ3-000142-LE; Mon, 03 Aug 2020 16:27:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2dIz-00012a-T5; Mon, 03 Aug 2020 16:27:18 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2E31207FB;
 Mon,  3 Aug 2020 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596472035;
 bh=8fGI175POQSwr9vMdcHAJq6mcS1esJVi8AWo2KENfmI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PdX1ab29lzG1sPjm+H96BcPsJTriqK7IyQxiIfS7V5jeLMaEA1FceH6auAq8Y58vC
 DpmuSPvSa9LvqkNK+ktA7f84GAI+UbcvGFa3Bbzf3LInrqFWj9+QKKylcWaPIG2bgh
 l9DrNQp5I/I92OP9QiTCZdRYabluFANNGQAI8WH4=
Received: by mail-ed1-f43.google.com with SMTP id c2so21820345edx.8;
 Mon, 03 Aug 2020 09:27:16 -0700 (PDT)
X-Gm-Message-State: AOAM531hjRxthx6jMzN6bVA3DC+ZXwnO144XAh0zkhRiJGzp42IlvaDb
 OTXEnMDjchSfwkqhI8vaCjlBjESzolmRjPQUMw==
X-Google-Smtp-Source: ABdhPJwmr26tBGfUG3yCzxB5PE+9/jAk8zYgW7Y9t7cMMsNd5KQZVjeCrjk6ur9GXKX0V1tF2H164HYtC3dGBNV7c24=
X-Received: by 2002:a50:ccd0:: with SMTP id b16mr16302641edj.148.1596472035168; 
 Mon, 03 Aug 2020 09:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
 <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
 <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
 <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
In-Reply-To: <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 00:27:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
Message-ID: <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_122718_090450_424BF446 
X-CRM114-Status: GOOD (  18.71  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0OOaciDPml6Ug6YCx5LiAIOS4i+WNiDY6NDPlr6vpgZPvvJoKPgo+IEhpCj4gPiBH
ZXNlbmRldDogTW9udGFnLCAwMy4gQXVndXN0IDIwMjAgdW0gMDE6NDcgVWhyCj4gPiBWb246ICJD
aHVuLUt1YW5nIEh1IiA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4KPiA+IE5vdyBJIGp1c3Qg
Y2FyZSBhYm91dCB0aGUgYmxzIHRvIGRwaS4gU28gaW4gbWVkaWF0ZWssZGlzcC50eHQsIHlvdQo+
ID4ganVzdCBuZWVkIHRvIGFkZCBhIE9wdGlvbmFsIHByb3BlcnRpZXMgLSBwb3J0IChpbnB1dCBh
bmQgb3V0cHV0KSwgYW5kCj4gPiBtb2RpZnkgbWVkaWF0ZWssZHBpLnR4dCBmb3IgaXRzIGlucHV0
IHBvcnQuCj4KPiB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZSB0aGlzIGlzIGVub3VnaDoKPgo+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRpc3AudHh0Cj4KPiAgICBhcmd1bWVudCwgc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS50eHQKPiAgICBmb3IgZGV0YWlscy4KPgo+ICtP
cHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIHBvcnQgKGlucHV0IGFuZCBvdXRwdXQpIHNlZSAuLi8u
Li9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAo+ICsKPiAgRXhhbXBsZXM6Cj4KPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGku
dHh0Ogo+Cj4gIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gIC0gcGluY3RybC1uYW1lczogQ29udGFp
biAiZGVmYXVsdCIgYW5kICJzbGVlcCIuCj4gKy0gcG9ydDogSW5wdXQgcG9ydCBub2RlIHdpdGgg
ZW5kcG9pbnQgZGVmaW5pdGlvbiwgdGhpcyBjYW4gYmUgY29ubmVjdGVkIHRvIDxjaGlwaWQ+LWRp
c3AtcHdtCj4KPiAgRXhhbXBsZToKPgo+IHNob3VsZCBpIGxpbmsgdG8gcHdtL3B3bS1tdGstZGlz
cC50eHQgaW4gZG9jPwo+Cj4gcmVnYXJkcyBGcmFuawoKWWVzLCB0aGlzIGlzIHdoYXQgSSBtZWFu
LCBidXQgSSB0aGluayBpdCBuZWVkIG5vdCBvdXRwdXQgdG8gcG13LgpCdXQgbm93IEkgaGF2ZSBh
IHNvbHV0aW9uIHRoYXQgeW91IG5lZWQgbm90IHRvIG1vZGlmeSBiaW5kaW5nIGRvY3VtZW50LgpC
ZWNhdXNlIG5vdyBtdDc2MjMgaGFzIGEgZGlmZmVyZW50IHJvdXRpbmcgdGhhbiBtdDI3MDEsIGFu
ZCB0aGlzCnBhdGNoJ3MgYXBwcm9hY2ggaXMgdG8gdXNlIGRpZmZlcmVudCBwb3J0IHNldHRpbmcg
aW4gZWFjaCBkZXZpY2UgdHJlZS4KTXkgc29sdXRpb24gaXMgdGhhdCB0aGVzZSB0d28gU29DIGhh
cyBkaWZmZXJlbnQgY29tcGF0aWJsZSBzdHJpbmc6CiJtZWRpYXRlayxtdDc2MjMtbW1zeXMiIGFu
ZCAibWVkaWF0ZWssbXQyNzAxLW1tc3lzIi4gRm9yIG5vdywKIm1lZGlhdGVrLG10MjcwMS1tbXN5
cyIgaGFzIGl0cyBkYXRhIGFzCgpzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJf
ZGF0YSBtdDI3MDFfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Ci5tYWluX3BhdGggPSBtdDI3MDFfbXRr
X2RkcF9tYWluLAoubWFpbl9sZW4gPSBBUlJBWV9TSVpFKG10MjcwMV9tdGtfZGRwX21haW4pLAou
ZXh0X3BhdGggPSBtdDI3MDFfbXRrX2RkcF9leHQsCi5leHRfbGVuID0gQVJSQVlfU0laRShtdDI3
MDFfbXRrX2RkcF9leHQpLAouc2hhZG93X3JlZ2lzdGVyID0gdHJ1ZSwKfTsKCkkgdGhpbmsgeW91
IGNvdWxkIGNyZWF0ZSBhIGRhdGEgZm9yICJtZWRpYXRlayxtdDc2MjMtbW1zeXMiIHdoaWNoIGhh
cwphIGRpZmZlcmVudCByb3V0aW5nLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
