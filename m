Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D319C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:30:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC18E60EFD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC18E60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1MlHBUhhjFfpvIIVYXCSCdTbdTqXdqR0fcN/p95SmY=; b=ziESS/LSbXAbus
	rd6IiUxD7w/m5qkHMxH+xJPVHGfPF5LUleT7PsEGzqSLBwC2XbogkLOLoo2yqbI08QZbjJ0/jXjy7
	D5lxDpHMv8+CFJlURdRr1o/uUpM6hU6sXhzU5P2ooaw06V19Q/MBkugSfISpAdD5b/mlTgJ1m5srL
	hXIJJrPdn4/huJ49qV2YToWQ5FxE49BK0O7ZtxKBBpV03wML4oWsBL8rHwVZPIOjciZuyqrKnBASl
	I9irKlge0AgY1/nGHLrgdV3gyAyoLDRa+vUlaACOd2Pds66EmXGAmgAxFiTPnnACL7Pp/yN90xz7e
	2dqHyuJVexYQsDEtM5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mArgR-00222U-FL; Tue, 03 Aug 2021 10:30:03 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mArdt-0020j6-9h; Tue, 03 Aug 2021 10:27:26 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id
 l12-20020a4a94cc0000b02902618ad2ea55so5087378ooi.4; 
 Tue, 03 Aug 2021 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K1otTc+SEm5XXn7ceZVlyDBrzkcVv960dGJCGU4PkuU=;
 b=okizGTvBMP1jUMm/UckZAsZv749/pUYN8j84rYLfc+imXHHyzxj1fWp2o9Cie1FMug
 BlX44fS3YypsEUsA7uT/nY+siAUhUOX1IdhSjAdkTaiOGWqMZJjMAiu5nEisFa+gSHFq
 C0QX4CTopL6oo/h2xYcbVG3niMG2k1+pf9U59TaUAcJStgt3lZrHVIAUluwFkL/Nmvsl
 wRDNzOqADCjrTskVjwaPBojGB6CYTZDO/0dO4nM1zzvYt0tZKeH1Z+lH16o/sk3O83vp
 PguHkbRGwY3jg9OElRFPM68KuFAPZVKSnIksJhpIItmjKdNktEsaxwVax5p0aFcLABxG
 Triw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K1otTc+SEm5XXn7ceZVlyDBrzkcVv960dGJCGU4PkuU=;
 b=oaP41izQzlGj777p/NpLYb2DnB6cQyLmz8lHjCHnTtK6gM8nTcDndB29RH3qRIYyBH
 9H2Lm8N3z1Nf15Oadyo4g8mj6R6Oz7i0hjI4QA1bYlzlTSQZB35HCJjEG+tkpKN2f6T/
 +pBODffXlEocYqdouof5AAPpkNe/RqIuVgC42cPw6WdZVlGALwhnqRvXw7RrlKlVo1yc
 Z/LbEggxrurrSWDmgsgZ4kUW1jAfoThaTWGZKPdrwePvYCjmPHBJHfQKv90Z0+2gg5OM
 JJ3qm6O+rPxKBDUYWPP/it1+QA05dXYmsXfUmKTuUnenYekQg1RK7durL1rcQ1U0Sszy
 KH5A==
X-Gm-Message-State: AOAM531Vn54Ifomi7MnpYPqTttKC+ERyaZpY3b+0K28bsYukb0ZyYsyQ
 p81lLg7u6Fk8CQZOasZEEmA+8SMbKr81oHrvbXw=
X-Google-Smtp-Source: ABdhPJyXx5CAuAUv/zjrCNEjoEph5Pt0bQf8TxH9Bjn9+0lI/P2uingwRi4nPXLqmIN1Mvn+m8UjiVOTu8GJOCR7Oyk=
X-Received: by 2002:a05:6820:444:: with SMTP id
 p4mr13746063oou.75.1627986444410; 
 Tue, 03 Aug 2021 03:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.8.Ib681f06d5189351b7fda0e3dcd6b15f3863a0071@changeid>
In-Reply-To: <20210802220943.v6.8.Ib681f06d5189351b7fda0e3dcd6b15f3863a0071@changeid>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 3 Aug 2021 12:27:11 +0200
Message-ID: <CAFqH_51E+93_TZ2jpdkfWxDLSaijPcj6RLs+BHkw0GpKObT75w@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] dts: mtk-mdp: remove mediatek,vpu property from
 primary MDP device
To: Eizan Miyamoto <eizan@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 Houlong Wei <houlong.wei@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_032725_374241_2C2DD596 
X-CRM114-Status: GOOD (  15.21  )
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

SGkgRWl6YW4sCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gKCk1pc3NhdGdlIGRlIEVpemFuIE1p
eWFtb3RvIDxlaXphbkBjaHJvbWl1bS5vcmc+IGRlbCBkaWEgZGwuLCAyIGTigJlhZy4KMjAyMSBh
IGxlcyAxNDoxNDoKPgo+IEl0IGlzIG5vIGxvbmdlciB1c2VkIGJ5IHRoZSBtZWRpYXRlayBNRFAg
ZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogRWl6YW4gTWl5YW1vdG8gPGVpemFuQGNocm9taXVt
Lm9yZz4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRi
b0Bjb2xsYWJvcmEuY29tPgoKCj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPgo+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpIHwgMSAtCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxNzMuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTczLmR0c2kKPiBpbmRleCBkNTAyMDczYjU1MWYuLjg3MjQyNzc0ODExMCAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpCj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQo+IEBAIC0xMDEwLDcgKzEwMTAsNiBA
QCBtZHBfcmRtYTA6IHJkbWFAMTQwMDEwMDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBv
d2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxNzNfUE9XRVJfRE9NQUlOX01NPjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBpb21tdXMgPSA8JmlvbW11IE00VV9QT1JUX01EUF9SRE1BMD47Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjA+Owo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG1lZGlhdGVrLHZwdSA9IDwmdnB1PjsKPiAgICAgICAgICAgICAgICAg
fTsKPgo+ICAgICAgICAgICAgICAgICBtZHBfcmRtYTE6IHJkbWFAMTQwMDIwMDAgewo+IC0tCj4g
Mi4zMi4wLjU1NC5nZTFiMzI3MDZkOC1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
