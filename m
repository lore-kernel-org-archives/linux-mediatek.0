Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC96FC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 17:46:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA712098B
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 17:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wh5mx0vG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUV0KW2e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA712098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6dXVZ099HcA3fMX+CCrBU02owWw7ryG0nv2NOFZL+jI=; b=wh5mx0vGkIXwws9D3VTb0AWGV
	rb9Q8yiNXrzCxZcAHCPoW3Ghca8CV6Kc6z0amXFkmQCyMZga2Hd/PukdcStTPi1HirOb54PQ9ajdU
	g9XuMJCIhnQGaiLOhjlvaAkEQ1q+808ui2IkgZN8B9qcsgkFAWPdsDzeg8qFmV4+00p9tGiVEliDE
	zEq2jGflTl8g+MmSMA2oasENwBXFD3IXRPU7rZq3/no3id/jQbzqsobQMuDKiw2OrjgEH34LeMfDw
	tQ/Uv+KhV8pmjaOpaJk7+s1oQCsSuEt4Iv5+GK1bOc6NrJBUh4W7jxzQc1xdUiu/cTEoxtYPZjA3E
	Tsf3PIQpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBiS1-0001gU-Gw; Fri, 28 Aug 2020 17:46:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBiRt-0001eX-Ou; Fri, 28 Aug 2020 17:46:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id s13so9025wmh.4;
 Fri, 28 Aug 2020 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wt5rjtBjiQXgsiZyccrqBuCchJi/28V2VtauT80eDG0=;
 b=WUV0KW2evFF4RrkIwdzw/atzBtpCx0Bb/Fq48JIv2No29U8b+B8ccBfp7w6DgBRFcW
 R0kj0dc51Ov33t56Z0lM55A5yekGZfTASbVHE5yJzr0QVQ5l2qAZtYlaEfJiuQuFHTQa
 ZPdEVxkHyfz06FKxIS00G1nbTIVP6zTO/i7vu84+X007oGv2upzyt9bqrokOTNq2ppN0
 FXrPuKy4dAjZ9o4ESEF0Dx+oNTHQFNEFR2TPNt86iv/dT3cHhXD4Obew2zGKX2aAz28Y
 G1HCcV9cVAW4H9mxlJydkrRMlFNCI/+9wUxj5h9KSX4xfRuIsLHtLLai7V9dD2XakUvj
 DPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wt5rjtBjiQXgsiZyccrqBuCchJi/28V2VtauT80eDG0=;
 b=d+9g+UXqJl0O5hNxguzEugy8IicMT97vuCyQWYZDu0PTGdPK4jlJ4nK1xt5Fk78Dpo
 bLX/5EciPt/IkqF6go61onw5zjh8SRQU5TDzoNDh6DQMNfBzN6nCszjQKgZ4cVjE2dJ7
 XqPhlksoKua3+Th+qkMBiBzL7MzVuEh+j3Wbr0jSmUhM+nym8ZXaPy6ZFXIG/nRlOUXh
 oxVUWIL8k+PYXI0S0WqBoBg5Fti4aOXPkHw/MqM66L0KjTtqBVabmNaJ78Eud+Yl67h+
 kFXCYXfhihRLvGEr44ZnJI4fw1gPYgulx26ZbvnsOwWRC8W52SS0rBhMHtcS9WtqFOLb
 ATcQ==
X-Gm-Message-State: AOAM5320sJXLJhJVs0HzZUQ52mWQ88oItv9HRQpzOb4N1cL8dtb9ziNE
 D28Ov3ZD+B5D8tYq83Xv7WI=
X-Google-Smtp-Source: ABdhPJxw6H5OJA+8lnePhRZO+ExFbEMYE/vZGK7hd2gMbDXj2PKzlQ4ucdnQp3HFtU69OXUrx/mNxg==
X-Received: by 2002:a1c:3285:: with SMTP id y127mr240362wmy.104.1598636760666; 
 Fri, 28 Aug 2020 10:46:00 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id f17sm309312wru.13.2020.08.28.10.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 10:45:59 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
 <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
 <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4c929eb9-23da-3797-12e7-ffd2a9a14048@gmail.com>
Date: Fri, 28 Aug 2020 19:45:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_134601_879022_7CE5F1D4 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Frank Wunderlich <frank-w@public-files.de>,
 David Airlie <airlied@linux.ie>, chunhui dai <chunhui.dai@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyOC8wOC8yMDIwIDAxOjQ2LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBGcmFuazoK
PiAKPiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAyMOW5
tDjmnIgyN+aXpSDpgLHlm5sg5LiL5Y2IMTA6Mjjlr6vpgZPvvJoKPj4KPj4KPj4KPj4gT24gMjcv
MDgvMjAyMCAxNTo0MSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPj4+IEhpIE1hdHRoaWFzLAo+
Pj4KPj4+IGFueSBvcGluaW9ucyBhYm91dCB0aGUgZHRzLWNoYW5nZXM/Cj4+Pgo+Pgo+PiB0aGV5
IGxvb2sgZ29vZCB0byBtZS4KPj4KPj4+IG1heWJlIHNlcmllcyBleGNlcHQgdGhlIHRtZHMtUGF0
Y2ggZ2V0IG1lcmdlZC4uLnNvIGkgYWRkIGl0IG9ubHkgdG8gbXkgb3duIHJlcG8gdGlsbCB3ZSBm
aW5kIGEgYmV0dGVyIHdheT8KPj4+IGN1cnJlbnRseSBtYWlubGluZSBkb2VzIG5vdCBzdXBwb3J0
IGhkbWkgYXQgYWxsIGZvciB0aGUgYm9hcmQuIHRoZSB0bWRzLXBhdGNoIGlzIG9ubHkgYSBmaXgg
Zm9yIHNwZWNpZmljIHJlc29sdXRpb25zIHdoaWNoIGhhdmUgYSAiZmxpY2tlcmluZyIgd2l0aG91
dCB0aGlzIFBhdGNoLgo+Pj4KPj4KPj4gV2VsbCBsZXQncyBzZWUgd2hhdCBDSydzIG9waW5pb24u
Cj4+Cj4gCj4gQmVjYXVzZSBubyBvbmUgaGFzIGNvbW1lbnQgb24gdGhpcyBwYXRjaCwgSSBjb3Vs
ZCBhcHBseSB0aGlzIHBhdGNoIGJ1dAo+IEkgbmVlZCB5b3UgdG8gYWRkIG1vcmUgZXhwZXJpbWVu
dCBpbmZvcm1hdGlvbiBzbyBpZiBzb21lb25lIG1lZXRzCj4gYW5vdGhlciBidWcsIGhlIGNvdWxk
IGZpeCBoaXMgYnVnIGFuZCBjb25zaWRlciB5b3VyIHByb2JsZW0uCj4gCgpJJ20gYWRkaW5nIENo
dW5odWkgRGFpIGFzIGhlIGdvdCBkcm9wcGVkIGluIHRoZSBkaXNjdXNzaW9uLgoKQ2h1bmh1aSBj
YW4geW91IGFzIHRoZSBmaXJzdCBwYXRjaCBhdXRob3IgcHJvdmlkZSBzb21lIG1vcmUgdGVjaG5p
Y2FsIGJhY2tncm91bmQgCndoeSB0aGUgZGlzdG9ydGlvbiBoYXBwZW5zIGFuZCB3aHkgdGhpcyBw
YXRjaCBmaXhlcyBpdD8KClRoYW5rcyBhIGxvdCwKTWF0dGhpYXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
